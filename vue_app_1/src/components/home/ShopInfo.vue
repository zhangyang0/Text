<template>
  <div class="app-shopinfo">
    <div class="mui-card">
        <div class="mui-card-content">
            <div class="mui-card-content-inner">
              <shop-swiper :list="rows"></shop-swiper>
            </div>
        </div>
    </div>
    <div class="mui-card">
        <div class="mui-card-header">{{info.title}}</div>
        <div class="mui-card-content">
            <div class="mui-card-content-inner">
                <p>售价:{{info.price}}</p>
                购买数量:
                <div class="mui-numbox">
					<button class="mui-btn mui-btn-numbox-minus" type="button" @click="sub">-</button>
					<input class="mui-input-numbox" type="number" value="1" v-model="val"/>
					<button class="mui-btn mui-btn-numbox-plus" type="button" @click="add">+</button>
				</div>
            </div>
        </div>
        <div class="mui-card-footer"><mt-button type="danger" size="small" @click="addCart">加入购物车</mt-button></div>
    </div>
  </div>
</template>
<script>
    import ShopSwiper from '../sub/ShopSwiper.vue'
    import {Toast} from "mint-ui"
    export default{
        data(){
            return{
                rows:[],
                info:{},
                pid:this.$route.query.pid,
                val:1,
            }
        },
        created() {
            this.getImages();
            this.findShopInfo();
        },
        methods:{
            add(){
                this.val++;
            },
            sub(){
                if(this.val>1){
                this.val--;
                }
            },
            findShopInfo(){
                var url = "http://127.0.0.1:3000/findProduct?pid="+this.pid;
                this.axios.get(url).then(result=>{
                    this.info=result.data.data[0];
                    //console.log(this.info);
                });
            },
            getImages(){
                var url = "http://127.0.0.1:3000/imglist";
                this.axios.get(url).then(result=>{
                    this.rows = result.data;
                })
            },
            addCart(){
                var pid = this.pid;
                var price = this.info.price;
                var uid = 1;
                var url = "http://127.0.0.1:3000/";
                url+="addCart?pid="+pid;
                url+="&price="+price;
                url+="&uid="+uid
                this.axios.get(url).then(result=>{
                    if(result.data.code==1){
                        Toast("添加成功")
                    }else{
                        Toast("添加失败")
                    }
                });
            }
        },
        components:{
            "shop-swiper":ShopSwiper
        }
    }
</script>
<style>
    .app-shopinfo{
        padding-top:11px;
    }
</style>