<template>
  <div class="app-pay">
    <div class="mui-card">
        <div class="mui-card-header"><h3> 购物车 </h3>
        <h4>
        全选 <input type="checkbox" @click="selectAll" :checked="allcb">
        </h4>
        </div>
        <div class="mui-card-content">
            <div class="mui-card-content-inner">
            <ul class="mui-table-view">
				<li class="mui-table-view-cell mui-media" v-for="(item,i) in list" :key="item.id">
					<a href="javascript:;">
						<img class="mui-media-object mui-pull-left" src="">
						<div class="mui-media-body">
							<p class='mui-ellipsis'>
                              <input type="checkbox" :checked="item.cb" :data-i="i" @click="modifyItem">
							  <span>{{item.title}}</span>
                              <div class="d1"><p class="aaa">¥{{item.price}}</p></div>
                            </p>
                            <div class="btn1">
                            <button @click="delItem" :data-id="item.id" :data-idx="i">删除</button>
                            </div>
						</div>
					</a>
				</li>
            </ul>
            </div>
        </div>
        <div class="mui-card-footer">
        <button @click="removeItem">删除选中的商品</button>
        小计：¥{{total}}
        <div><button>购买商品</button></div>
        </div>
    </div>
  </div>
</template>
<script>
import {Toast} from 'mint-ui';
    export default{
        data(){
            return{
                list:[],
                total:"",
                cb:false,
                allcb:false
            }
        },
        methods:{
            delItem(e){
                var id=e.target.dataset.id;
                var idx = e.target.dataset.idx;
                var url = "http://127.0.0.1:3000/";
                url+="delCartItem?id="+id;
                this.axios.get(url).then(result=>{
                    if(result.data.code==1){
                        Toast("删除成功");
                        this.list.splice(idx,1);
                    }
                });
            },
            loadMore(){
                var url = "http://127.0.0.1:3000/";
                url+="cartlist?uid=1";
                this.axios.get(url).then(result=>{
                    var rows=result.data.data;
                    this.$store.commit("updateCount",rows.length);
                    for(var item of rows){
                        item.cb = false;
                    }
                    this.list=rows;
                });
            },
            selectAll(e){
                var cb = e.target.checked;
                this.allcb = cb;
                for(var item of this.list){
                    item.cb=cb;
                }
            },
            modifyItem(e){
                var idx=e.target.dataset.i;
                var checked = e.target.checked;
                this.list[idx].cb = checked;
                var count=0;
                for(var item of this.list){
                    if(item.cb){
                        count++;
                    }
                }
                if(count==this.list.length){
                    this.allcb = true;
                }else{
                    this.allcb = false;
                }

            },
            removeItem(){
                var html = "";
                for(var item of this.list){
                    if(item.cb){
                        html+=item.id+",";
                    }
                }
                html = html.substring(0,html.length-1);
                var url = "http://127.0.0.1:3000/";
                url+="removeItem?ids="+html;
                this.axios.get(url).then(result=>{
                    if(result.data.code==1){
                        Toast("删除成功");
                        this.loadMore();
                    }
                });
            }
        },
        created() {
            this.loadMore();
        },
        /*
        beforeRouteEnter(to,from,next) {
           var prices=document.getElementsByClassName("aaa");
                console.log(prices)
                console.log(prices.length)
               for(var  i=0,count=0;i<prices.length;i++){
                    var a=parseInt(prices[i].innerHTML.substring(1));
                    count+=a;
                    this.total=count;
            }
            next()
        }*/
    }
</script>
<style>
.app-pay{
   padding-top:20px;
}
.mui-media-body .btn1,.d1{
    width:100%;
    text-align:right;
}
</style>