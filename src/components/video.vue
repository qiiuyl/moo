<template>
  <div class="video">
    <router-link class="list-header" to="/">
      <span class="my-title">MOO Video_视频</span>
      <img src="images/ic_round_arrow_back_ios_white_24px.png" alt />
    </router-link>
    <video-item></video-item>
    <video-item></video-item>
    <video-item></video-item>
  </div>
</template>

<script>
import videoItem from './videoItem'
export default {
  components:{
    videoItem
  }
};
</script>

<style scoped>
.list-header {
  padding: 0.5rem 0;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.list-header img {
  width: 2rem;
  height: 2rem;
}
</style>