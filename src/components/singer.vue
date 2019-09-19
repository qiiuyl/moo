<template>
  <div class="inner-border">
    <div id="header">
      <mt-header>
        <router-link to="/" slot="left">
          <mt-button>
            <img class="return-img" src="../../public/images/ic_round_arrow_back_ios_white_24px.png"/>
          </mt-button>
        </router-link>
        <mt-button slot="right">
          <img src="../../public/images/ic_bk_share_white_30dp.png" alt />
        </mt-button>
        <mt-button slot="right">
          <img src="../../public/images/ic_bk_more_horizontal_fat_white_48dp.png" alt />
        </mt-button>
      </mt-header>
    </div>
    <div class="clear"></div>
    <!-- 清除固定定位的影响 -->
    <div id="singer_img">
      <div></div>
    </div>
    <div id="content">
      <div id="title">
        <p>Foals(小马乐团)</p>
        <div id="fllow">
          <img src="../../public/images/fllow.png" alt />
          <p>16</p>
        </div>
      </div>
      <div
        class="singer_describe my-small"
      >我不认识小马乐团我不认识小马乐团我不认识小马乐团我不认识小马乐团我不认识小马乐团我不认识小马乐团我不认识小马乐团我不认识小马乐团我不认识小马乐团我不认识小马乐团我不认识小马乐团我不认识小马乐团</div>
    </div>

    <div id="main-list">
      <div id="singer-song" v-for="(item,index) of list" :key="index">
        <div class="track">
          <router-link class="list-header" to="/">
            <span class="my-title">{{item.name}}</span>
            <img src="images/ic_round_arrow_back_ios_white_24px.png" alt />
          </router-link>
        </div>
        <div v-if="item.id=='singer-song'">
          <song-item></song-item>
          <song-item></song-item>
          <song-item></song-item>
          <song-item></song-item>
          <song-item></song-item>
        </div>
        <div v-if="item.id=='album'">
          <div class="album">
            <div class="album_content">
              <albumSinger></albumSinger>
              <albumSinger></albumSinger>
              <albumSinger></albumSinger>
              <albumSinger></albumSinger>
            </div>
          </div>
        </div>
        <div v-if="item.id=='singer-video'" :id=item.id>
          <ul>
            <li class="video-list">
              <img src="images/video.jpg" alt />
              <p>Who You Love</p>
            </li>
            <li class="video-list">
              <img src="images/video.jpg" alt />
              <p>Who You Love</p>
            </li>
            <li class="video-list">
              <img src="images/video.jpg" alt />
              <p>Who You Love</p>
            </li>
            <li class="video-list">
              <img src="images/video.jpg" alt />
              <p>Who You Love</p>
            </li>
          </ul>
        </div>
        <div v-if="item.id=='affect-singer'" :id=item.id>
          <ul>
            <li>
              <img src="../../public/images/jielun.jpg" alt />
              <p class="my-small">Boy Dylan</p>
            </li>
            <li>
              <img src="../../public/images/jielun.jpg" alt />
              <p class="my-small">Boy Dylan</p>
            </li>
            <li>
              <img src="../../public/images/jielun.jpg" alt />
              <p class="my-small">Boy Dylan</p>
            </li>
            <li>
              <img src="../../public/images/jielun.jpg" alt />
              <p class="my-small">Boy Dylan</p>
            </li>
          </ul>
        </div>
    </div>
  </div>
  </div>
</template>
<script>
import songItem from "./songItem";
import albumSinger from "./albumSinger";
export default {
  data() {
    return {
      header_imgs:[
        "../../public/images/ic_bk_share_white_30dp.png",
        "../../public/images/ic_bk_more_horizontal_fat_white_48dp.png"
      ],
      list:[
        {id:"singer-song",name:"歌曲"},
        {id:"album",name:"专辑"},
        {id:"album",name:"EP/Single"},
        {id:"singer-video",name:"视频"},
        {id:"affect-singer",name:"影响TA的人"},
        {id:"affect-singer",name:"TA影响的人"},
        {id:"affect-singer",name:"相似艺人"},
      ],
    };
  },
  components: {
    songItem,
    albumSinger
  }
};
</script>
<style scoped>
.my-title {
  font-size: 1rem;
  color: #999;
}
#header {
  width: 100%;
  height: 5rem;
  position: fixed;
  z-index: 1;
}
#header /deep/ .mint-header {
  background: #1a1a1a;
  height: 100%;
}
#header /deep/ .mint-header img {
  width: 1.8rem;
  height: 1.8rem;
  padding-right: 1rem;
}
#header /deep/ .mint-header .return-img {
  width: 2.5rem;
  height: 2.5rem;
  transform: rotateY(180deg);
  margin-left: -1rem;
  padding: 0;
}
.clear {
  height: 5rem;
}
#singer_img {
  width: 100%;
  height: 15rem;
  display: flex;
  align-items: center;
  justify-content: center;
}
#singer_img > div {
  height: 12.5rem;
  width: 12.5rem;
  background: url("../../public/images/jielun.jpg");
  border-radius: 6.25rem;
  background-size: cover;
}
#content #title {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  margin-top: 2rem;
}
#content #title #fllow {
  display: flex;
  flex-direction: column;
  align-items: center;
}
#content #title img {
  width: 1.5rem;
  height: 1.5rem;
  margin-bottom: 0.2rem;
}
#content #title p {
  margin: 0;
}
#content #title > p {
  font-size: 18pt;
}
#content .singer_describe {
  margin-top: 1rem;
  height: 1.6rem;
  overflow: hidden; /*超出部分隐藏*/
  text-overflow: ellipsis; /*显示省略号来代表被修剪的文本*/
  display: -webkit-box; /**对象作为伸缩盒子模型展示**/
  -webkit-box-orient: vertical; /**设置或检索伸缩盒子对象的子元素的排列方式**/
  -webkit-line-clamp: 2; /**显示的行数**/
}
#singer-song .list-header {
  margin: 1.5rem 0;
}
#singer-song .song-item {
  margin: 1.5rem 0;
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
.first-text {
  display: block;
  color: #999;
  font-size: 0.8rem;
  margin: 0.5rem 0 1rem 0;
}
.list-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.list-header img {
  width: 2rem;
  height: 2rem;
}
.album .album_content {
  display: flex;
  justify-content: space-between;
  flex-wrap: wrap;
}
#singer-video ul {
  display: flex;
  justify-content: space-around;
  flex-wrap: wrap;
}
#singer-video .video-list {
  width: 45%;
  margin: 0.5rem 0;
}
#singer-video .video-list img {
  width: 100%;
}
#singer-video .video-list p {
  font-size: 0.8rem;
}
#affect-singer{
  margin-bottom:1.5rem;
}
#affect-singer ul {
  display: flex;
  justify-content: space-between;
  flex-wrap: wrap;
}
#affect-singer ul li {
  width: 30%;
  display: flex;
  flex-direction: column;
  align-items: center;
}
#affect-singer ul li img {
  width: 75%;
  border-radius: 50%;
}
</style>