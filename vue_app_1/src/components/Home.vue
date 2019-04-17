<template>
   <div class="app-first">
   <mt-swipe>
       <mt-swipe-item v-for="item in list" :key="item.id">
          <img :src="item.img_url">
       </mt-swipe-item>
   </mt-swipe>
   <!--九宫格-->
<ul class="mui-table-view mui-grid-view mui-grid-9">
 <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
  <router-link to="/NewsList"> 
   <img src="../img/logo1.png" />
   <div class="mui-media-body">最新咨讯</div>
  </router-link>
</li>
<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
<router-link to="/ShopCart">
<img src="../img/logo2.png" />
<div class="mui-media-body">服饰控</div>
</router-link>
</li>
<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
<router-link to="/GoodsList">
<img src="../img/logo4.png" />
<div class="mui-media-body">客片欣赏</div>
</router-link>
</li>
<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
<router-link to="/ShopPay">
<img src="../img/logo3.png" />
<div class="mui-media-body">支付</div>
</router-link>
</li>
<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3">
<a href="#">
<img src="../img/logo5.png" />
<div class="mui-media-body">搜索</div></a></li>
<li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><a href="#">
<img src="../img/logo6.png" />
<div class="mui-media-body">更多</div></a></li>
</ul>
<!--body-->
    <div class="title">
        了解不一样的 '婚摄'
    </div>
    <div class="mui-card" style="margin-bottom: 35px;">
        <ul class="mui-table-view">
            <li class="mui-table-view-cell mui-media">
                <a href="javascript:;">
                    <img class="mui-media-object mui-pull-right" src="../img/i1.jpg">
                    <div class="mui-media-body">
                        ☆童话.森林
                        <p class='mui-ellipsis'>三月的海南比其他地方多了几分炎热，夕阳的余晖在你的侧脸，童话里面的森林，是你们的爱情.</p>
                    </div>
                </a>
            </li>
            <li class="mui-table-view-cell mui-media">
                <a href="javascript:;">
                    <img class="mui-media-object mui-pull-right" src="../img/i2.jpg">
                    <div class="mui-media-body">
                        ☆关于你温柔的名字
                        <p class='mui-ellipsis'>你说你喜欢大海的蔚蓝，我说我喜欢你的名字，看着你的眼睛，我感觉过了一个世纪.</p>
                    </div>
                </a>
            </li>
            <li class="mui-table-view-cell mui-media">
                <a href="javascript:;">
                    <img class="mui-media-object mui-pull-right" src="../img/i3.jpg">
                    <div class="mui-media-body">
                        ☆如约，而至
                        <p class='mui-ellipsis'>"翩翩佳公子，陌上人如玉."那场初遇的伊始，我的脑海里浮起的便是这样美好句子</p>
                    </div>
                </a>
            </li>
        </ul>
    </div>
<!---->
<ul class="mui-table-view mui-grid-view">
    <li class="mui-table-view-cell mui-media mui-col-xs-6">
        <a href="#">
            <img class="mui-media-object" src="../img/p1.jpg">
            <div class="mui-media-body" style="color:#faa">幸福就是可以跟你在一起</div></a></li>
    <li class="mui-table-view-cell mui-media mui-col-xs-6">
        <a href="#">
            <img class="mui-media-object" src="../img/p2.jpg">
            <div class="mui-media-body" style="color:#faa;font-size:17px;">Simple happiness</div></a></li>
    <li class="mui-table-view-cell mui-media mui-col-xs-6">
        <a href="#"><img class="mui-media-object" src="../img/p3.jpg">
            <div class="mui-media-body" style="color:#faa">Color of SIP CBD</div></a></li>
    <li class="mui-table-view-cell mui-media mui-col-xs-6">
        <a href="#">
            <img class="mui-media-object" src="../img/p4.jpg">
            <div class="mui-media-body" style="color:#faa">静静看这世界</div></a></li>
</ul>
<!--tabbar-->

   </div>
</template>
<script>
    export default{
        data(){
            return {
                list:[]
            }
        },
        methods:{
            handleImage(){
                //发送ajax请求给服务器
                var url = "http://127.0.0.1:3000/imglist";
                this.axios.get(url).then(result=>{
                    this.list = result.data;
                });
                //接收服务器返回结果
                //将结果保存list
            }
        },
        //生命周期
        created() {
            this.handleImage();
        },
    }
</script>
<style>
.app-first{
    padding-top:20px;
    padding-bottom:20px;
    overflow-x:hidden;
}
.app-first .mint-swipe{
    height:200px;
}
.app-first .mint-swipe img{
    width:100%;
}
/* 九宫格 */
.app-first .mui-grid-9 img{
    width:60px;
    height:60px;
}
/* 九宫格背景颜色 */
.app-first .mui-grid-view.mui-grid-9{
    background: #fff;
}
.title {
    margin: 20px 15px 10px;
    color: #6d6d72;
    font-size: 15px;
    text-align:left;
}
</style>