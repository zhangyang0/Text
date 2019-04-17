//app.js
//1:加载模块 express pool.js
const express = require("express");
const pool = require("./pool");
//2:创建服务器端对象
var app = express();
//3:监听 3000
app.listen(3000);
//4:指定静态目录  public 
app.use(express.static("public"));
//5:加载跨域访问模块
const cors = require("cors");
//6:配置跨域访问模块 那个域名跨域访问允许
//  脚手架8080允许
//origin      允许跨域访问域名列表
//credentials 跨域访问保存session id
app.use(cors({
  origin:["http://127.0.0.1:8080","http://localhost:8080"],
  credentials:true
}))
//6.1:下载 express-session 并且配置
const session = require("express-session");
app.use(session({
  secret:"128位随机字符",
  resave:false,
  saveUninitialized:true,
  cookie:{
    maxAge:1000 * 60 * 60 * 8
  }
}));


//7:加载第三方模块 body-parser
//body-parser 针对post请求处理请求参数
//如果配置成功 req.body..
const bodyParser = require("body-parser");
//8:配置对特殊 json是否是自动转换 不转换
app.use(bodyParser.urlencoded({extended:false}))

//轮播图
app.get("/imglist",(req,res)=>{
  //轮播图所需图片
  var list = [
    {id:1,img_url:"http://127.0.0.1:3000/img/image1.jpg"},
    {id:2,img_url:"http://127.0.0.1:3000/img/image2.jpg"},
    {id:3,img_url:"http://127.0.0.1:3000/img/image5.jpg"},
    {id:4,img_url:"http://127.0.0.1:3000/img/image4.jpg"}
  ];
  res.send(list);
});

//最新咨询
app.get("/newsList",(req,res)=>{
  //获取参数 pno pageSize
  var pno =req.query.pno;
  var pageSize = req.query.pageSize;
  //设置默认值
  if(!pno){
    pno = 1;
  }
  if(!pageSize){
    pageSize = 2;
  }
  //创建sql语句
  var sql =" SELECT id,title,img_url";
  sql +=" ,ctime,point";
  sql +=" FROM mq_news";
  sql +=" LIMIT ?,?";
  var ps = parseInt(pageSize);
  var offset = (pno-1)*pageSize;
  pool.query(sql,[offset,ps],(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result});
  })
  //返回
})

//评论列表
app.get("/getComment",(req,res)=>{
  var nid = req.query.nid;
  var pno = req.query.pno;
  var pageSize = req.query.pageSize;
  if(!pno){pno=1}
  if(!pageSize){pageSize=1}
  var sql = " SELECT id,content,ctime,nid";
  sql +=" FROM mq_comment";
  sql +=" WHERE nid = ?";
  sql +=" LIMIT ?,?";
  var offset = (pno-1)*pageSize;
  pageSize = parseInt(pageSize);
  pool.query(sql,[nid,offset,pageSize],(err,result)=>{
    if(err)throw err;
    res.send({code:1,data:result});
  });
})

//商品列表
app.get("/products",(req,res)=>{
  var pno = req.query.pno;
  var pageSize = req.query.pageSize;
  if(!pno){pno=1}
  if(!pageSize){pageSize=4}
  var sql = "SELECT lid,title,price,img";
  sql+=" FROM mq_laptop";
  sql+=" GROUP BY lid";
  sql+=" LIMIT ?,?";
  var offset = (pno-1)*pageSize;
  var ps = parseInt(pageSize);
  pool.query(sql,[offset,ps],(err,result)=>{
    if(err)throw err;
    res.send({code:1,data:result})
  })
});

//商品的详细信息
app.get("/findProduct",(req,res)=>{
  var pid = req.query.pid;
  var sql = " SELECT title,price FROM mq_laptop";
  sql+=" WHERE lid = ?";
  pool.query(sql,[pid],(err,result)=>{
    if(err)throw err;
    res.send({code:1,data:result});
  })
});

//用户登录
app.get("/login",(req,res)=>{
  var uname = req.query.uname;
  var upwd = req.query.upwd;
  var sql = " SELECT id FROM mq_login";
  sql+=" WHERE uname = ? AND upwd = ?";
  pool.query(sql,[uname,upwd],(err,result)=>{
    if(err)throw err;
    if(result.length==0){
      res.send({code:-1,msg:"用户名或密码错误!"});
    }else{
      var id = result[0].id;
      req.session.uid = id;
      res.send({code:1,msh:"登录成功!"});
    }
  })
});
//添加购物车
app.get("/addCart",(req,res)=>{
  var pid = parseInt(req.query.pid);
  var count = 1;
  var uid = req.session.uid;
  var price = parseInt(req.query.price);
  var sql = " SELECT id FROM mq_cart";
  sql +=" WHERE uid = ? AND pid = ?";
  pool.query(sql,[uid,pid],(err,result)=>{
    if(err)throw err;
    if(result.length==0){
      var sql = ` INSERT INTO mq_cart`;
      sql+=` VALUES(null,1,${price},${pid},${uid})`;
    }else{
      var sql = ` UPDATE mq_cart`;
      sql+=` SET count=count+1 WHERE pid=${pid}`;
      sql+=` AND uid = ${uid}`;
    }
    pool.query(sql,(err,result)=>{
      if(err)throw err
      if(result.affectedRows>0){
        res.send({code:1,msg:"添加成功"});
      }else{
        res.send({code:-1,msg:"添加失败"});
      }
    })
  })
});

//购物车列表

app.get("/cartlist",(req,res)=>{
  var uid = req.session.uid;
  var sql = " SELECT m.id,m.count,m.price,";
  sql+=" m.uid,m.pid,l.title,l.lid";
  sql+=" FROM mq_cart m,mq_laptop l";
  sql+=" WHERE m.pid = l.lid";
  sql+=" AND m.uid = ?";
  pool.query(sql,[uid],(err,result)=>{
    if(err)throw err;
    res.send({code:1,data:result})
  })
});

//删除购物车一项
app.get("/delCartItem",(req,res)=>{
  var id = req.query.id;
  var sql = "DELETE FROM mq_cart WHERE id = ?";
  pool.query(sql,[id],(err,result)=>{
    if(err)throw err;
    if(result.affectedRows>0){
      res.send({code:1,msg:"删除成功"});
    }else{
      res.send({code:-1,msg:"删除失败"})
    }
  });
});

//删除多个商品
app.get("/removeItem",(req,res)=>{
  var ids = req.query.ids;
  var sql = "DELETE FROM  mq_cart WHERE id IN ("+ids+")";
  pool.query(sql,(err,result)=>{
    if(err)throw err;
    if(result.affectedRows>0){
      res.send({code:1,msg:"删除成功"})
    }else{
      res.send({code:-1,msg:"删除失败"})
    }
  });
});