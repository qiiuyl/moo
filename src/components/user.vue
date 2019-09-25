<template>
  <div class="inner-border">
    <div class="user">
      <!-- 头部 -->
      <div class="user-header">
        <img class="header01" src="images/ic_round_arrow_back_ios_white_24px.png" alt="" @click="back">
        <div>我的音乐</div>
        <img class="header02" src="images/set.png" alt="">
      </div>
      <!-- 用户详情 -->
      <div class="user-details">
        <div class="call">
          <img src="images/tup01.jpg" alt="">
          <div>戒酒的李白#</div>
        </div>
        <div class="man">
          <div>关注<span>0</span></div>
          <div class="man-01">粉丝<span>20</span></div>
          <div class="man-02">VIP</div>
        </div>
      </div>
      <!-- 收藏 歌单 本地歌曲 最近播放 -->
      <div class="user-collect">
        <div class="collect-1">
            <img src="images/user.jpg" alt="">
            <img src="images/user.jpg" alt="">
            <img src="images/user.jpg" alt="">
            <div class="list">
              <div class="list01">收藏</div>
              <div class="list02">0</div>
            </div>
        </div>
        <div class="collect-2">
            <img src="images/tup01.jpg" alt="">
            <img src="images/tup01.jpg" alt="">
            <img src="images/tup01.jpg" alt="">
            <div class="list">
              <div class="list01">歌单</div>
              <div class="list02">3</div>
            </div>
        </div>
        <div class="collect-3">
            <img src="images/tup01.jpg" alt="">
            <img src="images/tup01.jpg" alt="">
            <img src="images/tup01.jpg" alt="">
            <div class="list">
              <div class="list01">本地歌曲</div>
              <div class="list02">100</div>
            </div>
        </div>
        <div class="collect-4">
            <img src="images/tup01.jpg" alt="">
            <img src="images/tup01.jpg" alt="">
            <img src="images/tup01.jpg" alt="">
            <div class="list">
              <div class="list01">最近播放</div>
              <div class="list02">10</div>
            </div>
        </div>
      </div>
      <!-- 消息栏 -->
      <div class="user-news">
        <img class="news02" src="images/news.png" alt="">
        <div>消息</div>
        <img class="news01" src="images/ic_round_arrow_back_ios_white_24px.png" alt="">
      </div>
      <!-- 按钮框 -->
      <mt-button>
        <img class="button01" src="images/tup05.jpg" height="20" width="20" slot="icon">
        导入其他APP的歌单
      </mt-button>
    </div>
  </div>
</template>
<script>
export default {
  methods:{
    back(){
      this.$router.go(-1);
    }
  }
}
</script>
<style>
  .user-header{
    display: flex;
    justify-content: space-between;
    height: 2rem;
    margin-top: 1rem;
  }
  .user-header .header01{
    width: 2.5rem;
    height: 2.5rem;
    transform: rotateY(180deg);
  }
  .user-header .header02{
    width: 1.7rem;
    height: 1.7rem;
    position: relative;
    top: 8%;
  }
  .user-header div{
    font-size: 1rem;
    line-height: 2rem;
  }
  .user-details{
    background-color:#000000;
    border-radius: 1rem;
    margin-top:1.5rem; 
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
    font-size: 0.9rem;
    margin-top: 2rem;
  }
  .user-details .man div>span{
    margin-left: 0.7rem;
    font-size: 1.2rem;
    font-weight: bold;
  }
  .user-details .man .man-01{
    position: absolute;
    left: 7rem;
  }
  .user-details .man .man-02{
    width: 2.5rem;
    height: 1.3rem;
    font-size: 1rem;
    font-weight: 900;
    color: #000000;
    background: #b5a6a6;
    border-radius: 4rem;
    text-align: center;
  }
  .user-collect{
    width: 100%;
    display: inline-block;
    margin-top: 1.5rem;
  }
  .user-collect div{
    float: left;
    width: 48%;
    height: 8rem;
    position: relative;
  }
  .user-collect :nth-child(2n){
    float: right;
  }
  .user-collect div img{
    width: 3rem;
    height: 3rem;
    border-radius:0.2rem;
    box-shadow: 1px 0 7px #333; 
    overflow: hidden;
  }
  .user-collect div :first-child{
    width: 4rem;
    height:4rem;
    border-radius:0.2rem;
    position: absolute;
    top: 10%;
    left: 10%;
    z-index: 2;
  }
  .user-collect div :nth-child(2){
    position: absolute;
    top:23%;
    left:45%;
    z-index: 1;
  }
  .user-collect div :nth-child(3){
    position: absolute;
    top:23%;
    left:63%;
    z-index: 0;
  }
  .user-collect div .list{
    width: 100%;
    height: 1.8rem;
    border-radius: 2rem;
    background: #000000;
    position: absolute;
    top:66%;
    text-align: left;
  }
  .user-collect div .list .list01{
    position:absolute;
    top: 16%;
    left: 6%;
  }
  .user-collect div .list .list02{
    position:absolute;
    width: 2rem;
    top: 14%;
    left: 80%;
    font-size: 1.2rem;
    font-weight: 900;
    color: #63635b;
  }
  .user-news{
    display: flex;
    justify-content: space-between;
    height: 1.5rem;
    margin-top: 1rem;
    position: relative;
  }
  .user-news .news02{
    width: 1.5rem;
    height: 1.5rem;
    margin-left: 3%;
  }
  .user-news div{
    font-size: 1rem;
    line-height: 1.5rem;
    margin-right: 12.5rem;
  }
  .user-news .news01{
    width: 2rem;
    height: 2rem;
    position: relative;
    top:-19%;
  }
  .mint-button{
    width: 16rem;
    background-color: #000000 !important;
    height: 2.5rem !important; 
    border-radius: 2rem !important;
    position: relative;
    margin: 2.4rem 3.5rem;
    overflow: visible !important;
  }
  .mint-button-icon{
    position: absolute;
    left: 13%;
    top:-14%;
  }
  .mint-button-icon img{
    border-radius: 0px;
    width: 2.6rem;
    height: 2.6rem;
  }
  .mint-button-text{
    font-size: 1rem !important;
    color: #fafafa !important;
    position: absolute;
    left: 5.4rem;
    top:0.7rem;
  }
</style>
