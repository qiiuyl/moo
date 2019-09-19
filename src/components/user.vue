<template>
  <div class="inner-border">
    <div class="user">
      <!-- 头部 -->
      <div class="user-header">
        <img src="images/return01.png" alt="">
        <div>我的音乐</div>
        <img src="images/set.png" alt="">
      </div>
      <!-- 用户详情 -->
      <div class="user-details">
        <div class="call">
          <img src="images/tup01.jpg" alt="">
          <div>戒酒的李白#</div>
        </div>
        <div class="man">
          <div>关注<span>0</span></div>
          <div class="man-01">粉丝<span>0</span></div>
          <div>abc</div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  
}
</script>
<style>
  .user{
    border: 1px solid red;
  }
  .user-header{
    display: flex;
    justify-content: space-between;
  }
  .user-header img{
    width: 2rem;
    height: 2rem;
  }
  .user-header div{
    font-size: 1rem;
  }
  .user-details{
    background-color:#000000;
    border-radius: 1rem;
    padding: 1.6rem 1rem;
  }
  .user-details .call{
    display: flex;
  }
  .user-details .call img{
    width: 3.6rem;
    height: 3.6rem;
    border-radius:50%;
    overflow: hidden; 
  }
  .user-details .call div{
    padding: 0.4rem 0 0 2rem;
    font-size: 1.2rem;
  }
  .user-details .man{
    display: flex;
    justify-content: space-between;
    color: #ccc;
  }
</style>
