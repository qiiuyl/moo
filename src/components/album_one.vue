<template>
  <div class="inner-border">
    <mt-header title="">
      <router-link to="/" slot="left">
        <mt-button icon="back"></mt-button>
      </router-link>
    <mt-button icon="" slot="right"></mt-button>
    </mt-header>
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