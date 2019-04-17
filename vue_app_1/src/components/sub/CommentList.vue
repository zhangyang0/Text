<template>
  <div class="app-comment">
    <div class="mui-card">
        <div class="mui-card-header"></div>
        <div class="mui-card-content">
            <div class="mui-card-content-inner">
                <textarea placeholder="评论区" maxlength="120"></textarea>
                <mt-button size="large" type="primary"></mt-button>
            </div>
        </div>
        <div class="mui-card-footer">评论列表</div>
    </div>
  </div>
</template>
<script>
    export default{
        data(){
            return{}
        }
    }
</script>
<style>
.app-comment{
    padding-top:20px;
}
</style>