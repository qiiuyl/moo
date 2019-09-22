<template>
  <div class="inner-border">
      <back-header :bgcolor="true"></back-header>
      <div class="top-fill"></div>
      <album></album>
      <album></album>
  </div>
</template>
<script>
import album from "./album";
import backHeader from "./back_header";
export default {
  components:{
    "album":album,
    backHeader
  }
}
</script>
<style scoped>
  .mint-header{
    background-color:#1a1a1a;
  }
</style>