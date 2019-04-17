<template>
  <div class="app-login">
  <div class="mui-card">
    <div class="mui-card-content">
        <div class="mui-card-content-inner">
        <form>
            账户:<input type="text" name="uname" v-model="uname">
            密码:<input type="password" name="upwd" v-model="upwd">
            <input type="button" value="登录" @click="btnLogin">
        </form>
        </div>
    </div>
  </div>
  </div>
</template>
<script>
  //引入Toast
  import {Toast} from "mint-ui";
  export default {
      data(){
          return{uname:"",upwd:""}
      },
      methods:{
          btnLogin(){
               var u = this.uname;
               var p = this.upwd;
               var reg = /^[a-z0-9]{3,12}$/i;
               if(!reg.test(u)){
                   Toast("用户名格式不正确,请重新输入");
                   return;
               }
               if(!reg.test(p)){
                   Toast("密码不正确,请重新输入");
                   return;
               }
               var url = "http://127.0.0.1:3000/";
               url +="login?uname="+u+"&upwd="+p;
               this.axios.get(url).then(result=>{
                   console.log(result.data.code)
                   if(result.data.code==1){
                       this.$router.push("/Home")
                   }else{
                       Toast("用户名或密码有误");
                   }
               });
          }
      }
  }  
</script>
<style>
.app-login{
    padding-top:35px;
}
</style>