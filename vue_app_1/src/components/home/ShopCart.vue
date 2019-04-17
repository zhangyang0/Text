<template>
    <div class="app-shop">
      <div class="goods-item" v-for="item in list" ::key="item.lid">
        <img :src="item.img" @click="jumpShopInfo" :data-lid="item.lid"/>
        <h5>{{item.title}}</h5>
        <div class="info">
          <span class="now">¥ {{item.price}}</span>
        </div>
      </div>
      <mt-button type="primary" size="large" @click="getMore">加载更多...</mt-button>
    </div>
</template>
<script>
    export default{
        data(){
            return{pno:0,pageSize:4,list:[]}
        },
        created() {
            this.getMore(); 
        },
        methods:{
            jumpShopInfo(e){
                var lid = e.target.dataset.lid;
                this.$router.push("/ShopInfo?pid="+lid);
            },
            getMore(){
                this.pno++;
                var url = "http://127.0.0.1:3000";
                url+="/products?pno="+this.pno
                url+="&pageSize="+this.pageSize;
                this.axios.get(url).then(result=>{
                    var rows=this.list.concat(result.data.data);
                    this.list = rows;
                })
            }
        }
    }
</script>
<style>
    .app-shop{
        display:flex;
        flex-wrap:wrap;
        justify-content:space-between;
        padding:4px;
        padding-top:21px;
        margin-bottom:25px;
    }
    .goods-item{
        width:49%;
        border:1px solid #ccc;
        box-shadow:0 0 8px #ccc;
        margin:4px 0;
        padding:5px;
        display:flex;    /* 子元素弹性布局 */
        flex-direction:column; /* 排列方式:垂直 */
        min-height:230px;
        justify-content:space-between;
        border-radius:13px;
    }
    .app-shop .goods-item img{
        width:100%;
    }
    .app-shop .goods-item h5{
        font-size:15px;
    }
    .app-shop .goods-item .now{
        color:#f3232199;
        font-size:16px;
        font-weight:bold;
    }
</style>