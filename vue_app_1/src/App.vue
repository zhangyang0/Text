<template>
  <div class="app">
    <mt-header fixed title="幕柒 婚摄店" class="head"></mt-header>
    <router-view></router-view>
    <nav class="mui-bar mui-bar-tab">
      <router-link to="/Home" class="mui-tab-item mui-active">
      <span class="mui-icon mui-icon-home"></span>
      <span class="mui-tab-label">首页</span>
      </router-link>
      <router-link to="/ShopCart" class="mui-tab-item">
      <span class="mui-icon mui-icon-search"></span>
      <span class="mui-tab-label">活动</span>
      </router-link>
      <router-link to="/ShopPay" class="mui-tab-item">
      <span class="mui-icon mui-icon-extra mui-icon-extra-cart">
      <span class="mui-badge">{{$store.getters.optCartCount}}</span>
      </span>
      <span class="mui-tab-label">支付</span>
      </router-link>
      <router-link to="/Login" class="mui-tab-item">
      <span class="mui-icon mui-icon-contact"></span>
      <span class="mui-tab-label">登录</span>
      </router-link>
    </nav> 
  </div>
</template>
<style>
.app{
    padding-top:20px;
    padding-bottom:20px;
    overflow-x:hidden;
}
</style>