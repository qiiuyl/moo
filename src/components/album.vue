<template>
  <div class="album inner-border">
    <router-link class="list-header" to="/album_one">
      <span class="my-title">MOO Album_专辑</span>
      <img src="images/ic_round_arrow_back_ios_white_24px.png" alt />
    </router-link>
    <album-item :obj="list[1]"></album-item>
    <span
      class="first-text"
    >文字，是一个汉语词汇，拼音为wén zì，基本意思是记录思想、交流思想或承载语言的图像或符号。该词出自《史记·秦始皇本纪》：“一法度衡石丈尺，车同轨，书同文字。”</span>
    <album-item :obj="obj"></album-item>
    <album-item :obj="obj"></album-item>
  </div>
</template>

<script>
import albumItem from "./albumItem";
export default {
  data() {
    return {
      obj: {
        img: "http://176.122.14.69:8080/carousel/timg01.jpg",
        l_describe: "达哥最爱",
        l_img: "http://176.122.14.69:8080/list/timg08.jpg",
        l_tag: "1",
        l_title: "另类的歌单标题求推荐",
        l_video: "http://176.122.14.69:8080/list/x.mp4",
        lid: 1,
        listID: 1,
        t_id: 1,
        t_name: "#Moo指南",
        type: "album"
      }
    };
  },
  components: {
    albumItem
  }
};
</script>

<style scoped>
.first-text {
  display: block;
  color: #999;
  font-size: 0.8rem;
  margin: 0.5rem 0 1rem 0;
}
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