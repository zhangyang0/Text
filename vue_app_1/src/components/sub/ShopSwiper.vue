<template>
  <div class="app-swiper">
    <mt-swipe :auto="3000">
      <mt-swipe-item v-for="item in list" :key="item.id">
        <img :src="item.img_url" />
      </mt-swipe-item>
    </mt-swipe>
  </div>
</template>
<script>
  export default{
    data(){
      return{}
    },
    props:["list"]
  }
</script>
<style>
.app-swiper .mint-swipe{height:200px;}
.app-swiper .mint-swipe img{width:100%}
.mint-swipe .mint-swipe-indicators{
  bottom:-6px;
}
</style>