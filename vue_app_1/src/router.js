import Vue from 'vue'
import Router from 'vue-router'
import Home from './components/Home.vue'
import NewsList from "./components/home/NewsList.vue"
import ShopCart from "./components/home/ShopCart.vue"
import ShopInfo from "./components/home/ShopInfo"
import GoodsList from "./components/goods/GoodsList.vue"
import Login from "./components/home/Login.vue"
import ShopPay from "./components/home/ShopPay.vue"
import CommentList from "./components/sub/CommentList.vue"
import cs from "./components/cs.vue"

Vue.use(Router)

export default new Router({
  routes: [
    {path: '/',redirect:"/Home"},
    {path:"/Home",component:Home},
    {path:"/NewsList",component:NewsList},
    {path:"/CommentList",component:CommentList},
    {path:"/ShopCart",component:ShopCart},
    {path:"/ShopInfo",component:ShopInfo},
    {path:"/GoodsList",component:GoodsList},
    {path:"/Login",component:Login},
    {path:"/ShopPay",component:ShopPay},
    {path:"/cs",component:cs}
  ]
})
