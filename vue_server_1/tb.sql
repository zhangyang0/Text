#设置客户端编码为UTF8
SET NAMES UTF8;
#创建数据库表mq
DROP DATABASE IF EXISTS mq;
CREATE DATABASE mq CHARSET=UTF8;
USE mq;
#咨询表
CREATE TABLE mq_news(
    id     INT PRIMARY KEY AUTO_INCREMENT,
    title  VARCHAR(255),
    img_url  VARCHAR(255),
    ctime    DATETIME,
    point    INT,
    content  VARCHAR(2000)
);
INSERT INTO mq_news VALUES(null,'三亚湾-温如春熙','http://127.0.0.1:3000/img/now1.jpg',now(),0,'婚照和情侣照最大的差别，相比就是在服装了。我们在平时的时候，选择服装都是有一个适合自己的身材的服装');
INSERT INTO mq_news VALUES(null,'三亚湾-海风森意','http://127.0.0.1:3000/img/now2.jpg',now(),0,'婚照和情侣照最大的差别，相比就是在服装了。我们在平时的时候，选择服装都是有一个适合自己的身材的服装');
INSERT INTO mq_news VALUES(null,'三亚湾-两个人的旅行','http://127.0.0.1:3000/img/now3.jpg',now(),0,'婚照和情侣照最大的差别，相比就是在服装了。我们在平时的时候，选择服装都是有一个适合自己的身材的服装');
INSERT INTO mq_news VALUES(null,'三亚湾-一往情深','http://127.0.0.1:3000/img/now4.jpg',now(),0,'婚照和情侣照最大的差别，相比就是在服装了。我们在平时的时候，选择服装都是有一个适合自己的身材的服装');
INSERT INTO mq_news VALUES(null,'三亚湾-网红民宿','http://127.0.0.1:3000/img/now5.jpg',now(),0,'婚照和情侣照最大的差别，相比就是在服装了。我们在平时的时候，选择服装都是有一个适合自己的身材的服装');
INSERT INTO mq_news VALUES(null,'三亚湾-静舞海岸','http://127.0.0.1:3000/img/now6.jpg',now(),0,'婚照和情侣照最大的差别，相比就是在服装了。我们在平时的时候，选择服装都是有一个适合自己的身材的服装');
INSERT INTO mq_news VALUES(null,'青岛-漫步街道','http://127.0.0.1:3000/img/now7.jpg',now(),0,'婚照和情侣照最大的差别，相比就是在服装了。我们在平时的时候，选择服装都是有一个适合自己的身材的服装');
INSERT INTO mq_news VALUES(null,'青岛-海堤柔情','http://127.0.0.1:3000/img/now8.jpg',now(),0,'婚照和情侣照最大的差别，相比就是在服装了。我们在平时的时候，选择服装都是有一个适合自己的身材的服装');
INSERT INTO mq_news VALUES(null,'丽江-风情月意','http://127.0.0.1:3000/img/now9.jpg',now(),0,'婚照和情侣照最大的差别，相比就是在服装了。我们在平时的时候，选择服装都是有一个适合自己的身材的服装');
INSERT INTO mq_news VALUES(null,'丽江-相濡以沫','http://127.0.0.1:3000/img/now10.jpg',now(),0,'婚照和情侣照最大的差别，相比就是在服装了。我们在平时的时候，选择服装都是有一个适合自己的身材的服装');
INSERT INTO mq_news VALUES(null,'大理-洱恋物语','http://127.0.0.1:3000/img/now11.jpg',now(),0,'婚照和情侣照最大的差别，相比就是在服装了。我们在平时的时候，选择服装都是有一个适合自己的身材的服装');
INSERT INTO mq_news VALUES(null,'大理-风熏草暖','http://127.0.0.1:3000/img/now12.jpg',now(),0,'婚照和情侣照最大的差别，相比就是在服装了。我们在平时的时候，选择服装都是有一个适合自己的身材的服装');
INSERT INTO mq_news VALUES(null,'大理-洱边时光','http://127.0.0.1:3000/img/now13.jpg',now(),0,'婚照和情侣照最大的差别，相比就是在服装了。我们在平时的时候，选择服装都是有一个适合自己的身材的服装');
INSERT INTO mq_news VALUES(null,'大理-浅凝夏烟','http://127.0.0.1:3000/img/now14.jpg',now(),0,'婚照和情侣照最大的差别，相比就是在服装了。我们在平时的时候，选择服装都是有一个适合自己的身材的服装');
INSERT INTO mq_news VALUES(null,'大理-碧色诗情','http://127.0.0.1:3000/img/now15.jpg',now(),0,'婚照和情侣照最大的差别，相比就是在服装了。我们在平时的时候，选择服装都是有一个适合自己的身材的服装');
INSERT INTO mq_news VALUES(null,'温州-紫陌花开','http://127.0.0.1:3000/img/now16.jpg',now(),0,'婚照和情侣照最大的差别，相比就是在服装了。我们在平时的时候，选择服装都是有一个适合自己的身材的服装');
INSERT INTO mq_news VALUES(null,'温州-甜筒沙滩','http://127.0.0.1:3000/img/now17.jpg',now(),0,'婚照和情侣照最大的差别，相比就是在服装了。我们在平时的时候，选择服装都是有一个适合自己的身材的服装');
INSERT INTO mq_news VALUES(null,'温州-恋人码头','http://127.0.0.1:3000/img/now18.jpg',now(),0,'婚照和情侣照最大的差别，相比就是在服装了。我们在平时的时候，选择服装都是有一个适合自己的身材的服装');

#评论表
CREATE TABLE mq_comment(
    id     INT PRIMARY KEY AUTO_INCREMENT,
    content VARCHAR(70),
    ctime DATETIME,
    nid   INT
);
INSERT INTO mq_comment VALUES(null,'去年5月份在幕柒店拍摄了婚纱照，朋友说今年也要在幕柒店拍，真的是好期待',now(),1);
INSERT INTO mq_comment VALUES(null,'希望幕柒经营的越来越好，是幕柒让我成为了最美的新娘，[笑][笑]',now(),2);
INSERT INTO mq_comment VALUES(null,'哇！拍摄出来的效果真的好美啊，祝福新人 也有些羡慕。。。',now(),3);
INSERT INTO mq_comment VALUES(null,'店里活动特别多，全程跟拍也非常辛苦，感谢摄影老师的耐心又为我们拍摄了这么好的作品',now(),4);
INSERT INTO mq_comment VALUES(null,'非常好评！！设计师根据个人身材选择衣服，化妆师也非常专业，哈哈哈哈',now(),5);
INSERT INTO mq_comment VALUES(null,'在等过几天的活动，和男朋友准备去进行旅拍，三亚真的非常美想在三亚穿着婚纱，吹着海风！',now(),6);
INSERT INTO mq_comment VALUES(null,'评论区暂无评论！',now(),7);
INSERT INTO mq_comment VALUES(null,'评论区暂无评论！',now(),8);

#商品类表
CREATE TABLE mq_laptop_family(
  fid INT PRIMARY KEY AUTO_INCREMENT,
  fname VARCHAR(32)
);

#商品种类
CREATE TABLE mq_laptop(
  lid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(128),         #主标题
  price DECIMAL(10,2),        #价格
  img   VARCHAR(255),         #图片
);
INSERT INTO mq_laptop VALUES(null,"三亚婚纱摄影套餐拍摄海景海南三亚旅拍结婚照三亚婚纱照",13999.00,"http://127.0.0.1:3000/img/shop1.jpg");
INSERT INTO mq_laptop VALUES(null,"普吉岛马尔代夫日本青岛西藏香格里拉旅游拍婚纱照",9999.00,"http://127.0.0.1:3000/img/shop2.jpg");
INSERT INTO mq_laptop VALUES(null,"青海深圳厦门三亚丽江日本旅拍小清新婚纱照拍摄",7699.00,"http://127.0.0.1:3000/img/shop6.jpg");
INSERT INTO mq_laptop VALUES(null,"无锡南通常州昆山园林旅游拍摄水下婚纱照团购",4888.00,"http://127.0.0.1:3000/img/shop4.jpg");
INSERT INTO mq_laptop VALUES(null,"海景跟拍工作室马尔代夫水中写真结婚",6999.00,"http://127.0.0.1:3000/img/shop5.jpg");
INSERT INTO mq_laptop VALUES(null,"云南丽江大理三亚杭州青岛昆明婚纱摄影蜜月婚纱照",7698.00,"http://127.0.0.1:3000/img/shop3.jpg");
INSERT INTO mq_laptop VALUES(null,"海外蜜月写真旅拍影楼婚纱照团购原创",4999.00,"http://127.0.0.1:3000/img/shop7.jpg");
INSERT INTO mq_laptop VALUES(null,"广州珠海东莞惠州海景旅拍婚纱照拍摄团购",5000.00,"http://127.0.0.1:3000/img/shop8.jpg");
INSERT INTO mq_laptop VALUES(null,"三亚婚纱摄影套餐拍摄海景海南三亚旅拍结婚照三亚婚纱照",13999.00,"http://127.0.0.1:3000/img/now9.jpg");
INSERT INTO mq_laptop VALUES(null,"普吉岛马尔代夫日本青岛西藏香格里拉旅游拍婚纱照",9999.00,"http://127.0.0.1:3000/img/now10.jpg");
INSERT INTO mq_laptop VALUES(null,"青海深圳厦门三亚丽江日本旅拍小清新婚纱照拍摄",7699.00,"http://127.0.0.1:3000/img/now11.jpg");
INSERT INTO mq_laptop VALUES(null,"无锡南通常州昆山园林旅游拍摄婚纱照团购",4888.00,"http://127.0.0.1:3000/img/now12.jpg");
INSERT INTO mq_laptop VALUES(null,"海景跟拍工作室马尔代夫写真结婚",6999.00,"http://127.0.0.1:3000/img/now13.jpg");
INSERT INTO mq_laptop VALUES(null,"云南丽江大理三亚杭州青岛昆明婚纱摄影蜜月婚纱照",7698.00,"http://127.0.0.1:3000/img/now14.jpg");
INSERT INTO mq_laptop VALUES(null,"海外蜜月写真旅拍影楼婚纱照团购原创",4999.00,"http://127.0.0.1:3000/img/now15.jpg");
INSERT INTO mq_laptop VALUES(null,"广州珠海东莞惠州海景旅拍婚纱照拍摄团购",5000.00,"http://127.0.0.1:3000/img/now16.jpg");
INSERT INTO mq_laptop VALUES(null,"三亚婚纱摄影套餐拍摄海景海南三亚旅拍结婚照三亚婚纱照",13999.00,"http://127.0.0.1:3000/img/now8.jpg");
INSERT INTO mq_laptop VALUES(null,"普吉岛马尔代夫日本青岛西藏香格里拉旅游拍婚纱照",9999.00,"http://127.0.0.1:3000/img/now7.jpg");
INSERT INTO mq_laptop VALUES(null,"青海深圳厦门三亚丽江日本旅拍小清新婚纱照拍摄",7699.00,"http://127.0.0.1:3000/img/now6.jpg");
INSERT INTO mq_laptop VALUES(null,"无锡南通常州昆山园林旅游拍摄婚纱照团购",4888.00,"http://127.0.0.1:3000/img/now5.jpg");
INSERT INTO mq_laptop VALUES(null,"海景跟拍工作室马尔代夫写真结婚",6999.00,"http://127.0.0.1:3000/img/now4.jpg");
INSERT INTO mq_laptop VALUES(null,"云南丽江大理三亚杭州青岛昆明婚纱摄影蜜月婚纱照",7698.00,"http://127.0.0.1:3000/img/now3.jpg");
INSERT INTO mq_laptop VALUES(null,"海外蜜月写真旅拍影楼婚纱照团购原创",4999.00,"http://127.0.0.1:3000/img/now2.jpg");
INSERT INTO mq_laptop VALUES(null,"广州珠海东莞惠州海景旅拍婚纱照拍摄团购",5000.00,"http://127.0.0.1:3000/img/now1.jpg");
INSERT INTO mq_laptop VALUES(null,"三亚婚纱摄影套餐拍摄海景海南三亚旅拍结婚照三亚婚纱照",13999.00,"http://127.0.0.1:3000/img/shop9.jpg");
INSERT INTO mq_laptop VALUES(null,"普吉岛马尔代夫日本青岛西藏香格里拉旅游拍婚纱照",9999.00,"http://127.0.0.1:3000/img/shop10.jpg");
INSERT INTO mq_laptop VALUES(null,"青海深圳厦门三亚丽江日本旅拍小清新婚纱照拍摄",7699.00,"http://127.0.0.1:3000/img/shop11.jpg");
INSERT INTO mq_laptop VALUES(null,"无锡南通常州昆山园林旅游拍摄婚纱照团购",4888.00,"http://127.0.0.1:3000/img/shop12.jpg");
INSERT INTO mq_laptop VALUES(null,"海景跟拍工作室马尔代夫写真结婚",6999.00,"http://127.0.0.1:3000/img/shop13.jpg");
INSERT INTO mq_laptop VALUES(null,"云南丽江大理三亚杭州青岛昆明婚纱摄影蜜月婚纱照",7698.00,"http://127.0.0.1:3000/img/shop14.jpg");
INSERT INTO mq_laptop VALUES(null,"海外蜜月写真旅拍影楼婚纱照团购原创",4999.00,"http://127.0.0.1:3000/img/shop15.jpg");
INSERT INTO mq_laptop VALUES(null,"广州珠海东莞惠州海景旅拍婚纱照拍摄团购",5000.00,"http://127.0.0.1:3000/img/shop16.jpg");

#用户登录表
CREATE TABLE mq_login(
  id      INT  PRIMARY  KEY AUTO_INCREMENT,
  uname   VARCHAR(25),
  upwd    VARCHAR(32)
);
INSERT INTO mq_login VALUES(null,'tom','123');
INSERT INTO mq_login VALUES(null,'jerry','123');

#购物车表
CREATE TABLE mq_cart(
  id      INT  PRIMARY  KEY AUTO_INCREMENT,
  count   INT,
  price   DECIMAL(10,2),
  pid     INT,
  uid     INT
);