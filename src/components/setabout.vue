<template>
  <div class="inner-border">
    <div class="about-header">
      <img class="set01" src="images/ic_round_arrow_back_ios_white_24px.png" alt="">
      <div>关于MOO音乐</div>
    </div>
    <div class="about-cell">
      <img src="images/ic_about_app_logo.png" alt="">
      <div>版本号 1.5.0.6</div>
    </div>
    <div class="about-up">
      <mt-cell title="检查更新" is-link value="已是最新"></mt-cell>
    </div>
    <div class="about-foor">
      <div>歌曲版权来自QQ音乐</div>
      <div id="foor">
        <a href="javascript:;">服务条款</a>
        <a href="javascript:;">许可协议</a>
        <a href="javascript:;">隐私保护指引</a>
        <a href="javascript:;">权利声明</a>
      </div>
      <div>
        <div>腾讯公司 版权所有</div>
        <div>Copyright™ 2018-2019 Tencent.All Rights Reserved</div>
      </div>
    </div>
  </div>
</template>
<style>
  .about-header{
    height: 2rem;
    margin: 1rem 0 2rem;
    display: flex;
    justify-content: space-between;
    position: relative; 
  }
  .about-header .set01{
    width: 2.5rem;
    height: 2.5rem;
    transform: rotateY(180deg);
  }
  .about-header div{
    font-size: 1rem;
    color: rgb(255, 255, 255);
    line-height: 2rem;
    position: absolute;
    left: 38%;
    top:10%;
  }
  .about-cell{
    width: 100%;
    height: 12.5rem;
    background: #000000;
    border-radius:0.5rem; 
    display: flex;
    position: relative;
  }
  .about-cell img{
    width: 38%;
    height: 3rem;
    /* display: block; */
    margin: auto;
    
  }
  .about-cell div{
    position: absolute;
    font-size: 0.1rem;
    color: #999999;
    top: 80%;
    left: 39%;
  }
  .about-up{
    margin-top: 1rem;
  }
  .about-up .mint-cell{
    background: #1a1a1a;
    color: #ffffff;
  }
  .about-up .mint-cell-value{
    font-size: 1%;
  }
  .about-foor{
    width: 100%;
    /* height: 4rem; */
    font-size: 1%;
    font-weight: lighter;
    font-family: "微软雅黑";
    color: #999999;
    position: fixed;
    bottom: 0;
    right: 0;
  }
  .about-foor div{
    text-align: center;
    margin: 1.4rem 0;
  }
  .about-foor #foor{
    display: flex;
    justify-content: space-around;
  }
  .about-foor #foor a{
    font-family: "微软雅黑";
  }
  .about-foor :nth-child(3) :nth-child(2){
     margin-top: -4%;
  }
</style>