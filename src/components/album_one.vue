<template>
  <div class="inner-border">
      <back-header :bcolor="true"></back-header>
      <div class="top-fill"></div>
      <album></album>
      <album></album>
  </div>
</template>
<script>
import album from "./album";
export default {
  components:{
    "album":album
  }
}
</script>
<style scoped>
  .mint-header{
    background-color:#1a1a1a;
  }
</style>