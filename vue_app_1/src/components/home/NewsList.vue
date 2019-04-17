<template>
<div class="app-new">
<div class="mui-content">
    <div class="mui-card" v-for="item in list" :key="item.id">
        <div class="mui-card-header mui-card-media">
            <img src="../../img/p2.jpg" />

            <div class="mui-media-body">

                M-幕柒

                <p class="mui-p">发表于 2019-3-23 16:55
                </p>

            </div>
        </div>
        <div class="mui-card-content" >

            <img :src="item.img_url" width="100%"/>

        </div>
        <div class="mui-card-content">
            <div class="mui-card-content-inner">
                <p class="mui-p">Posted on {{item.ctime | datatime}}</p>
                <p style="color: #333;">这里显示文章摘要，让读者对文章内容有个粗略的概念...</p>
            </div>
        </div>
        <div class="mui-card-footer">
            <a class="mui-card-link">喜欢</a>
            <router-link to="/CommentList" class="mui-card-link">评论</router-link>
            <a class="mui-card-link">分享</a>
        </div>
    </div>
        <mt-button type="primary" size="large" @click="getMore">
            加载更多...
        </mt-button>
</div>
</div>
</template>
<script>
export default{
    data(){
        return{
          list:[],
          pno:1,
          pageSize:2
        }
    },
    methods:{
        getMore(){
            this.pno++;
            var url = "http://127.0.0.1:3000";
            url+="/newsList?pno="+this.pno;
            url+="&pageSize="+this.pageSize;
            this.axios.get(url).then(result=>{
                var rows = this.list.concat(result.data.data);
                this.list = rows;
                //this.list = result.data.data;
            });
        },
        getnewsList(){
        var url = "http://127.0.0.1:3000/newsList";
        this.axios.get(url).then(result=>{
            this.list = result.data.data;
        });
        }
    },
    created(){
        this.getnewsList();
    },
}
</script>
<style>
.app-new{
    padding-top:11px;
}
.mui-content{
    margin-bottom:35px;
}
/* 日期和次数两端对齐 */ 
.mui-card-content .mui-card-content-inner .mui-p{
    display:flex;
    justify-content:space-between;
}
</style>