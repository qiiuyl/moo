<template>
  <div class="song-item">
    <div class="song-info">
      <img src="images/jielun.jpg" alt="">
      <div class="info">
        <h4>范特西</h4>
        <span class="my-small">周杰伦</span>
      </div>
    </div>
    <div class="more" @click="open">
      <img src="images/ic_bk_more_horizontal_fat_white_48dp.png" alt="">
    </div>
    <div class="more-list" ref="list">
      <div class="more-box" ref="box">
        <ul class="more-ul">
          <span class="song-name">小苹果</span>
          <li class="more-li">
            <router-link to="/">
              <img src="images/ic_bk_add_to_next_white_30dp.png" alt="">
              <span>下一首播放</span>
            </router-link>
          </li>
          <li class="more-li">
            <router-link to="/">
              <img src="images\ic_bk_comment_white_30dp.png" alt="">
              <span>评论</span>
            </router-link>
          </li>
          <li class="more-li">
            <router-link to="/">
              <img src="images\ic_bk_share_white_30dp.png" alt="">
              <span>分享</span>
            </router-link>
          </li>
          <li class="more-li">
            <router-link to="/">
              <img src="images\ic_round_add_folder_white_30dp.png" alt="">
              <span>添加到</span>
            </router-link>
          </li>
          <li class="more-li">
            <router-link to="/">
              <img src="images\ic_bk_download_white_30dp.png" alt="">
              <span>下载</span>
            </router-link>
          </li>
          <li class="more-li">
            <router-link to="/">
              <img src="images\ic_bk_artist_white_30dp.png" alt="">
              <span>歌手</span>
            </router-link>
          </li>
          <li class="more-li">
            <router-link to="/">
              <img src="images/more_album.png" alt="">
              <span>专辑</span>
            </router-link>
          </li>
          <li class="more-li">
            <router-link to="/">
              <img src="images/ic_bk_report_white_48dp.png" alt="">
              <span>举报</span>
            </router-link>
          </li>         
        </ul>
        <div class="close" @click="close">
          <img src="images/hwpush_ic_cancel.png" alt="">
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {};
  },
  methods: {
    close(){
      this.$refs.box.style.height=0;
      setTimeout(()=>{
        this.$refs.list.style.display='none';
      },200)
    },
    open(){
      this.$refs.list.style.display='flex';
      setTimeout(()=>{
        this.$refs.box.style.height='82%';
      },100)
    }
  }
};
</script>

<style scoped>
.song-info{
  width: 80%;
  display: flex;
}
.song-info img{
  width: 23%;
  height: 100%;
}
.info{
  margin-left:1rem;
}
.info h4{
  margin:0.5rem 0;
  font-size: 1.2rem;
  font-weight: 400;
}
.info span{
  font-size: 1rem;
}
.close{
  text-align: center
}
.close img{
  width: 3rem;
}
.song-name{
  display: block;
  font-size: 1.2rem;
  margin: 0.5rem;
}
.more-list {
  position: fixed;
  background: rgba(0, 0, 0, 0.5);
  width: 100%;
  height: 100%;
  left: 0;
  bottom: 0;
  z-index: 100;
  display: none;
  align-items: flex-end;
}
.more-box {
  width: 100%;
  background: #1a1a1a;
  border-top-left-radius: 2rem;
  border-top-right-radius: 2rem;
  overflow: hidden;
  transition: height 0.2s linear;
}
.more-ul{
  width: 100%;
  height: 75%;
  overflow: scroll;
  margin: 2rem 0;
}
.more-li{
  /* border: 1px solid #fff; */
  text-align: left;
  padding: 0.5rem 0 0.5rem 1rem;
}
.more-li img{
  width: 2rem;
  vertical-align: middle;
}
.more-li span{
  font-size: 1rem;
  margin-left:1rem;
}
.song-item{
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-top:1rem; 
}
.more img{
  width: 2.5rem;
}
</style>