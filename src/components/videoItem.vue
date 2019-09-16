<template>
  <div class="video-item">
    <div class="video-top">
      <img src="images\video.jpg" alt />
      <router-link class="mask" to="/">
        <!-- <img src="images/ic_round_drop_down_24dp_white.png" alt=""> -->
      </router-link>
      <tag :place="true"></tag>
      <div class="video-time">
        <span>03:04</span>
        <img src="images/ic_video_list_icon_white_24dp.png" alt />
      </div>
    </div>
    <span
      class="video-title"
    >我多想每天早上醒来，就看到你和阳光。然后你会揉着我的头发说，宝贝起床吧，我做了早餐。我多想和你一起逛街走累时，你说，宝贝我背你。其实，即使这些你通通都不做，只要你在我身边，我就已经足够。只是，我总是忘了，你已经离开。</span>
    <span class="video-subtitle">宝贝起床吧，我做了早餐。我多想和你一起逛街走累时</span>
  </div>
</template>

<script>
import tag from "./tag";
export default {
  components: {
    tag
  }
};
</script>

<style scoped>
.video-subtitle {
	margin-top:0.5rem; 
	display: block;
  color: #999;
  font-size: 0.8rem;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
.video-title {
	margin-top:0.5rem; 
  font-size: 0.8rem;
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 2;
  overflow: hidden;
  line-height: 1.2rem;
}
.video-item {
  margin-bottom: 1rem;
}
.video-top {
  position: relative;
}
.video-top img {
  width: 100%;
}
.mask {
  position: absolute;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.3)
    url("../../public/images/ic_round_drop_down_24dp_white.png") no-repeat
    center center;
		background-size: 4rem 4rem;
  left: 0;
  top: 0;
}
.mask img {
  width: 4rem;
  position: absolute;
  transform: rotate(-90deg);
  left: 50%;
  top: 50%;
  margin-left: -2rem;
  margin-top: -2rem;
}
.video-time {
  position: absolute;
  right: 0.2rem;
  bottom: 0.2rem;
  display: flex;
  align-items: center;
}
.video-time img {
  width: 1.5rem;
  margin-left: 0.2rem;
}
</style>