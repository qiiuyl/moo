<template>
  <div class="tag-page">
    <back-header :share="true" :title="'长江后浪'"></back-header>
    <div class="top-img">
      <img src="images/pic_default_wide_dark.png" alt />
			<span class="top-img-span">#这是个标签</span>
    </div>
    <div class="content-box inner-border">
      <router-link to="/" class="title">
        <span>相关歌手</span>
        <img src="images/ic_round_arrow_back_ios_white_24px.png" alt />
      </router-link>
      <ul class="singer-list">
        <li class="singer-item">
          <img src="images/user.jpg" alt />
          <span>小威与某丽的爱恨情仇,生离死别,棒打鸳鸯,命途多舛</span>
        </li>
        <li class="singer-item">
          <img src="images/user.jpg" alt />
          <span>123</span>
        </li>
        <li class="singer-item">
          <img src="images/user.jpg" alt />
          <span>123</span>
        </li>
        <li class="singer-item">
          <img src="images/user.jpg" alt />
          <span>123</span>
        </li>
        <li class="singer-item">
          <img src="images/user.jpg" alt />
          <span>123</span>
        </li>
        <li class="singer-item">
          <img src="images/user.jpg" alt />
          <span>123</span>
        </li>
        <li class="singer-item">
          <img src="images/user.jpg" alt />
          <span>13</span>
        </li>
      </ul>
    </div>
    <div class="content-box inner-border">
      <router-link to="/" class="title">
        <span>相关歌曲</span>
        <img src="images/ic_round_arrow_back_ios_white_24px.png" alt />
      </router-link>
      <song-item :obj="list"></song-item>
      <song-item :obj="list"></song-item>
      <song-item :obj="list"></song-item>
      <song-item :obj="list"></song-item>
      <song-item :obj="list"></song-item>
    </div>
    <div class="content-box inner-border">
      <router-link to="/" class="title">
        <span>相关专辑</span>
        <img src="images/ic_round_arrow_back_ios_white_24px.png" alt />
      </router-link>
      <div class="album">
        <div class="album_content">
          <album-singer></album-singer>
          <album-singer></album-singer>
          <album-singer></album-singer>
          <album-singer></album-singer>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import backHeader from "../components/back_header";
import songItem from "../components/songItem";
import albumSinger from "../components/albumSinger";
export default {
  data(){
    return {
       list:{s_id: 1
      ,s_img: "http://176.122.14.69:8080/songimgs/01.jpg"
      ,s_name: "青花瓷"
      ,s_singerID: 1
      ,s_status: 1
      ,s_video: "http://176.122.14.69:8080/青花瓷/青花瓷.mp3"
      ,singer_name: "周杰伦"}
    }
    
  },
  components: {
    backHeader,
    songItem,
    albumSinger
  }
};
</script>

<style scoped>
.top-img-span{
	position: absolute;
	left: 1rem;
	bottom: 1rem;
}
.album .album_content {
  display: flex;
  justify-content: space-between;
  flex-wrap: wrap;
}
.album-box {
  position: relative;
  display: flex;
  flex-wrap: wrap;
}
.title {
  padding: 0.5rem 0;
}
.singer-list .singer-item:first-child {
  width: 48%;
}
.singer-list {
  display: flex;
  flex-wrap: wrap;
}
.singer-item {
  margin-top: 0.5rem;
  width: 23%;
  margin-left: 2%;
  align-self: flex-end;
  text-align: center;
}
.singer-item span {
  opacity: 0.6;
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 2;
  overflow: hidden;
  height: 2.4rem;
}
.singer-item img {
  width: 100%;
  border-radius: 50%;
}
.top-img{
	position: relative;

}
.top-img img {  width: 100%;
}
.content-box .title {
  display: flex;
  justify-content: space-between;
  align-items: center;
  opacity: 0.6;
}
.content-box .title img {
  width: 2rem;
}
.content-box {
  margin-top: 1rem;
}
</style>