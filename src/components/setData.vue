<template>
  <div class="inner-border">
    <!-- 头部 -->
    <div class="setdata-header">
        <img class="set01" src="images/ic_round_arrow_back_ios_white_24px.png" alt="">
    </div>
    <div class="setdata-head">
      <div>
        <img src="images/tup01.jpg" alt="">
      </div>
    </div>
    <div class="setdata-details">
      <div class="p">
        <div class="cell">昵称</div>
        <div class="name">
          <span>戒酒的李白#</span>
          <div>6/20</div>
        </div>
      </div>
      <div  class="p">
        <div class="cell">性别</div>
        <div class="name">
          <span>男</span>
        </div>
      </div>
      <div class="p">
        <div class="cell">生日</div>
        <div class="name">
          <span>1995-01-01</span>
        </div>
      </div>
      <div class="p">
        <div class="cell">签名</div>
        <div class="name">
          <span></span>
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
  .setdata-header{
    height: 2rem;
    margin: 1rem 0 2rem;
  }
  .setdata-header .set01{
     width: 2.5rem;
    height: 2.5rem;
    transform: rotateY(180deg);
  }
  .setdata-head{
    width: 100%;
  }
  .setdata-head div{
    width: 4rem;
    height: 4rem;
    margin: 0 auto;
  }
  .setdata-head div img{
    width: 4rem;
    height: 4rem;
    border-radius: 50%;
    overflow: hidden;
  }
  .setdata-details{
    margin-top: 1.5rem;
  }
  .setdata-details .p{
    margin-top: 1.5rem;
  }
  .setdata-details div .cell{
    color: #ccc;
    font-size: 0.9rem;
    margin-bottom: 0.8rem;
  }
  .setdata-details div .name{
    width: 100%;
    height: 1.9rem;
    background-color: #312d2d;
    color: #ffffff;
    border-radius: 0.1rem;
    line-height: 1.9rem;
    text-align: center;
  }
  .setdata-details div .name :nth-child(2){
    position: relative;
    top:-100%;
    left: 43%;
    font-size: 0.9rem;
  }
</style>