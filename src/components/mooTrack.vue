<template>
  <div class="inner-border">
    <mt-header title="MOO Track 新歌" style="font-size:16px;">
      <router-link to="/" slot="left">
        <img src="images/ic_round_arrow_back_ios_white_24px.png" alt="">
      </router-link>
        <mt-button icon="" slot="right"></mt-button>
    </mt-header>
    <div class="disflex">
      <mt-button><img src="images/radio_play.png" class="btn"></mt-button>
      <span>20</span>
    </div>
    <div class="distwo">
      <img src="images/f49cdfc7769937323ef2873df0f293d.png" class="Finished">
    </div>
  </div>
</template>
<script>
export default {
  
}
</script>
<style scoped>
  .mint-header{
    background:#1a1a1a;
    padding:0px;
  }
  img{
    width:2rem;
    transform: rotateY(180deg);
    position:relative;
    left:-0.5rem;
  }
  .mint-button-text .btn{
    transform:rotateY(360deg);
    width:1.25rem;
    position:relative;
    left:0px;
  }
 .mint-button--default{
    background-color:#fff133;
    width:3.75rem;
    height:1.875rem;
    border-radius:1.25rem; 
  }
  span{
    margin-left:0.625rem;
    font-size:1rem;
    font-family: "PaulGroteskSoft";
    color:#d3d3d3;
  }
  .Finished{
    transform:rotateY(360deg);
  }
  .disflex{
    align-items: center;
    display:flex;
    /* justify-content:space-between; */
  }
  .distwo{
    display:flex;
  }
</style>