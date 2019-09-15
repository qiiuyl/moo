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
          <router-link to="/" class="my-small list-tag">#是个标签</router-link>
          <img src="images/ic_bk_music_note_with_circle_white.png" alt class="list-icon" />
        </div>
        <div class="first-info">
          <img src="images/ic_bk_text_20_plus_detail.png" alt />
          <span>我也不知道写些什么就随便vi按撒犯得上广泛受到</span>
        </div>
      </div>
      <div class="list-item">
        <div class="list-top">
          <img src="images/playlist.jpg" alt class="listimg" />
          <router-link to="/" class="my-small list-tag">#是个标签</router-link>
          <img src="images/ic_bk_music_note_with_circle_white.png" alt class="list-icon" />
        </div>
        <span class="list-info">45gd4g65fddsadasdasd4g3</span>
      </div>
    </div>
  </div>
</template>

<script>
export default {};
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
}
.list-top {
  position: relative;
  display: flex;
}
.list-info{
  display: block;
  width: 100%;
  font-size: 1.3rem;
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 3;
  overflow: hidden;
}
.list-tag {
  position: absolute;
  bottom: 0;
  left: 0;
  z-index: 1;
  padding: 0.5rem 1rem;
  display: block;
  background: #ffe133;
  border-radius: 2rem;
  color: #000;
}
.list-icon {
  position: absolute;
  bottom: 0.4rem;
  right: 0.4rem;
  width: 1.3rem;
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