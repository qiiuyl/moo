<template>
  <div class="video-item">
    <div class="video-top">
      <img :src="obj.v_img" alt />
      <router-link class="mask" to="/">
        <!-- <img src="images/ic_round_drop_down_24dp_white.png" alt=""> -->
      </router-link>
      <tag :place="true" :tagName="obj.t_name"></tag>
      <div class="video-time">
        <span>03:04</span>
        <img src="images/ic_video_list_icon_white_24dp.png" alt />
      </div>
    </div>
    <span class="video-title" v-text="obj.v_name"></span>
    <span class="video-subtitle" v-text="obj.v_describe"></span>
  </div>
</template>

<script>
import tag from "./tag";
export default {
  components: {
    tag
  },
  props:["obj"]
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