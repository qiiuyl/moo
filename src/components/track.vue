<template>
  <div class="track">
    <router-link class="list-header" to="/">
      <span class="my-title">MOO Track_歌单</span>
      <img src="images/ic_round_arrow_back_ios_white_24px.png" alt />
    </router-link>
    <song-item></song-item>
    <song-item></song-item>
    <song-item></song-item>
    <song-item></song-item>
    <song-item></song-item>
  </div>
</template>

<script>
import songItem from './songItem' 
export default {
  components:{
    songItem
  }
};
</script>

<style scoped>
.track{
  margin-top:1rem; 
}
.list-header {
  /* padding: 0.5rem 0; */
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.list-header img {
  width: 2rem;
  height: 2rem;
}
</style>