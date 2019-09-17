<template>
  <div class="play-list">
    <router-link class="list-header" to="/">
      <span class="my-title">MOO Playlist_歌单</span>
      <img src="images/ic_round_arrow_back_ios_white_24px.png" alt />
    </router-link>
    <div class="lists">
      <div class="first-item">
        <div class="list-item">
          <img src="images/playlist.jpg" alt class="listimg" />
          <tag :place="true"></tag>
          <icon></icon>
        </div>
        <div class="first-info">
          <img src="images/ic_bk_text_20_plus_detail.png" alt />
          <span>我也不知道写些什么就随便vi按撒犯得上广泛受到</span>
        </div>
      </div>
      <div class="list-item">
        <div class="list-top">
          <img src="images/playlist.jpg" alt class="listimg" />
          <tag :place="true"></tag>
          <icon></icon>          
        </div>
        <span class="list-info">刘耀威的第一张专辑</span>
      </div>
       <div class="list-item">
        <div class="list-top">
          <img src="images/playlist.jpg" alt class="listimg" />
          <tag :place="true"></tag>
          <icon></icon>          
        </div>
        <span class="list-info">邱玉丽的第一张专辑</span>
      </div>
    </div>
  </div>
</template>
<script>
import tag from "./tag";
import icon from "./musicIcon";
export default {
  components:{
    tag,icon
  }
};
</script>

<style scoped>
.first-item {
  display: flex;
}
.first-info {
  width: 50%;
}
.first-info img {
  width: 100%;
}
.first-info span {
  display: block;
  margin-top: 0.5rem;
  padding-left: 0.8rem;
  color: #999;
  font-size: 1rem;
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 2;
  overflow: hidden;
}
.lists .list-item:last-child {
  margin-left: 2%;
}
.lists > .list-item {
  margin-top: 0.8rem;
}
.lists {
  display: flex;
  flex-wrap: wrap;
}
.listimg {
  width: 100%;
  height: 100%;
}
.list-item {
  width: 49%;
  /* overflow: visible; */
  position: relative;
}
.list-top {
  position: relative;
  display: flex;
}
.list-info{
  overflow-wrap:break-word;
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 3;
  overflow: hidden; 
  margin-top: 0.3rem;
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
.play-list {
  margin-top: 1rem;
}
</style>