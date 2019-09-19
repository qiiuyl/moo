<template>
  <div class="inner-border">
    <mt-header title="">
      <router-link to="/" slot="left">
        <img src="images/ic_round_arrow_back_ios_white_24px.png" alt="">
        <mt-button></mt-button>
        <mt-button></mt-button>
      </router-link>
        <mt-button icon="" slot="right"></mt-button>
    </mt-header>
    <play-list></play-list>
    <play-list></play-list>
    <play-list></play-list>
    <play-list></play-list>
  </div>
</template>
<script>
import playList from "../components/playList";
export default {
  components:{playList}
}
</script>
<style scoped>
  .mint-header{
    background:#1a1a1a;
    padding:0px;
  }
  img{
    width:32px;
    transform: rotateY(180deg);
    position:relative;
    left:-8px;
  }
</style>