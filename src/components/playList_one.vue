<template>
  <div class="inner-border">
    <back-header :bgcolor="true"></back-header>
    <div class="top-fill"></div>
    <play-list></play-list>
    <play-list></play-list>
    <play-list></play-list>
    <play-list></play-list>
  </div>
</template>
<script>
import playList from "../components/playList";
import backHeader from "../components/back_header";
export default {
  components:{playList,backHeader}
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