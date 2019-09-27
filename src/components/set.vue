<template>
  <div class="inner-border">
    <!-- 头部 -->
    <back-header :title="'设置'"></back-header>
    <div class="top-fill"></div>
    <div class="set-whole">
    <mt-cell title="个人资料" is-link></mt-cell>
    <mt-cell title="风格" value="BLACK"></mt-cell>
    <mt-cell title="PLAY页" value="默认"></mt-cell>
    <mt-cell title="通知栏样式" value="MOO音乐通知栏"></mt-cell>
    <mt-cell title="试听和下载音质">
      <a><img slot="icon" src="images/user.jpg" width="28" height="24" style="border-radius:0.1rem"></a>
    </mt-cell>
    <mt-cell title="流量提醒">
      <mt-switch v-model="value"></mt-switch>
    </mt-cell>
    <mt-cell title="定时关闭" is-link></mt-cell>
    <mt-cell title="清除缓存" value="41.3M"></mt-cell>
    <mt-cell title="反馈" is-link></mt-cell>
    <mt-cell title="关于" is-link></mt-cell>
    </div>
    <!-- 底部 -->
    <div class="set-login">
      <button class="login">退出登录</button>
    </div>
  </div>
</template>
<script>
export default {
  // 没写
}
</script>
<style>
  .set-header{
    height: 2rem;
    margin: 1rem 0 2rem;
    display: flex;
    justify-content: space-between;
    position: relative; 
  }
  .set-header .set01{
    width: 2.5rem;
    height: 2.5rem;
    transform: rotateY(180deg);
  }
  .set-header div{
    font-size: 1rem;
    line-height: 2rem;
    position: absolute;
    left: 45%;
  }
  .set-whole .mint-cell{
    background-color: #1a1a1a;
  }
  .mint-switch-input:checked + .mint-switch-core{
    width: 2.3rem;
    height: 1.2rem;
  }
  .mint-switch-core::after{
    width: 0.8rem !important;
    height: 0.8rem !important;
    background-color:yellow !important;
    top:15% !important; 
  }
  .mint-switch-core::before{
    background-color:#000 !important;
  }
  .mint-switch-core{
    background: #000 !important;
    border:none !important;
  }
  .set-login{
    width: 100%;
    height: 4rem;
    font-size: 0.9rem;
    position: fixed;
    bottom: 0;
    right:0px; 
  }
  .set-login .login{
    width: 100%;
    height: 100%;
    background-color: #000;
    color: #ccc;
    border: none;
  }
</style>