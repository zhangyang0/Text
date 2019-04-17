import Vue from 'vue'
import App from './App.vue'
import router from './router'
import'mint-ui/lib/style.css'
//引入Vuex
import Vuex from "vuex";
//0.2注册Vuex组件
Vue.use(Vuex)
//0.3创建store
var store=new Vuex.Store({
  state:{
    cartCount:sessionStorage.getItem("cartCount")||0
  },
  mutations:{
    //购物车中数据+1 点击商品详情【加入购物车】
    increment(state){
      state.cartCount++;
    },
    //显示购物车列表时
    updateCount(state,count){
      state.cartCount=count;
      sessionStorage.setItem("cartCount",count);
    }
  },
  getters:{
    optCartCount:function(state){
      return state.cartCount;
    }
  }
})
//1:引入mint-ui 样式文件
import'mint-ui/lib/style.css'
Vue.config.productionTip = false
//2:引入 mui库样式文件
import './lib/mui/css/mui.css'
import './lib/mui/css/icons-extra.css'
//3:引入mint-ui 组件 Header
import {Header,Swipe,SwipeItem,Button} from "mint-ui"
//4:注册Header组件
Vue.component(Header.name,Header);
Vue.component(Swipe.name,Swipe);
Vue.component(SwipeItem.name,SwipeItem);
Vue.component(Button.name,Button);

//引入axios库
import axios from "axios"
//配置跨域访问保存session
axios.defaults.withCredentials=true;
//将axios库配置Vue实例对象中 
Vue.prototype.axios = axios;

//创建时间过滤器
Vue.filter("datatime",function(val){
  var data = new Date(val);
  var y=data.getFullYear();
  var m=data.getMonth()+1;
  var d=data.getDate();
  return `${y}-${m}-${d}`;
});

new Vue({
  router,
  render: h => h(App),
  store
}).$mount('#app')