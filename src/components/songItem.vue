<template>
  <div class="song-item">
    <div class="song-checked" v-show="is_select" :style="is_select?'width:10%':'width:0'">
      <input type="checkbox"/>
    </div>
    <div class="song-info" @click="switchSing">
      <img :src="obj.a_img" alt />
      <div class="info">
        <h4>{{obj.s_name}}</h4>
        <span class="my-small">{{obj.singer_name}}</span>
      </div>
    </div>
    <div class="more" @click="open" v-show="!is_select">
      <img src="images/ic_bk_more_horizontal_fat_white_48dp.png" alt />
    </div>
    <div class="more-list" ref="list">
      <div class="more-box" ref="box">
        <div class="box-top">
          <span class="song-name">{{obj.s_name}}</span>
          <div class="close" @click="close">
            <img src="images/hwpush_ic_cancel.png" alt />
          </div>
        </div>
        <ul class="more-ul">
          <li class="more-li">
            <router-link to="/">
              <img src="images/ic_bk_add_to_next_white_30dp.png" alt />
              <span>下一首播放</span>
            </router-link>
          </li>
          <li class="more-li">
            <router-link to="/">
              <img src="images\ic_bk_comment_white_30dp.png" alt />
              <span>评论</span>
            </router-link>
          </li>
          <li class="more-li">
            <router-link to="/">
              <img src="images\ic_bk_share_white_30dp.png" alt />
              <span>分享</span>
            </router-link>
          </li>
          <li class="more-li">
            <router-link to="/">
              <img src="images\ic_round_add_folder_white_30dp.png" alt />
              <span>添加到</span>
            </router-link>
          </li>
          <li class="more-li">
            <router-link to="/">
              <img src="images\ic_bk_download_white_30dp.png" alt />
              <span>下载</span>
            </router-link>
          </li>
          <li class="more-li">
            <router-link to="/">
              <img src="images\ic_bk_artist_white_30dp.png" alt />
              <span>歌手:{{obj.singer_name}}</span>
            </router-link>
          </li>
          <li class="more-li">
            <router-link to="/">
              <img src="images/more_album.png" alt />
              <span>专辑</span>
            </router-link>
          </li>
          <li class="more-li">
            <router-link to="/">
              <img src="images/ic_bk_report_white_48dp.png" alt />
              <span>举报</span>
            </router-link>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
function bodyScorll(e) 
   {
      e.preventDefault();   //取消事件默认动作
      e.stopPropagation();  //不再派发事件
    }

export default {
  data() {
    return {};
  },
  props: ["is_select",'obj'],
  methods: {
    switchSing(){
      var audio = this.$store.getters.getSingObj;
      this.$store.commit("setSingUrl",this.obj.s_video);
      this.$store.commit("setPlay",true);
        setTimeout(() => {
          audio.play();
        }, 100);
    },
    close() {
      document.removeEventListener("touchmove",bodyScorll,{ passive: false });
      this.$refs.box.style.height = 0;
      setTimeout(() => {
        this.$refs.list.style.display = "none";
      }, 200);
    },
    open() {
      document.addEventListener("touchmove",bodyScorll,{ passive: false });
      this.$refs.list.style.display = "flex";
      setTimeout(() => {
        this.$refs.box.style.height = "auto";
      }, 100);
    }
  },
  created() {
    // console.log(this.obj);
  }
};
</script>

<style scoped>
.box-top {
  margin-top: 1rem;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.song-checked {
  width: 5%;
}
.song-checked input[type="checkbox"] {
  /* transition:all 1s linear; */
  width: 1rem;
  height: 1rem;
  background-color: transparent;
  -webkit-appearance: none;
  border: 1px solid #c9c9c9;
  border-radius: 50%;
  outline: none;
}
.song-checked input[type="checkbox"]:checked {
  background: url("../../public/images/scan_finish_icon.png") no-repeat center
    center;
  background-size: cover;
  border: 0;
}
.song-info {
  width: 90%;
  display: flex;
  align-items: center;
  overflow: hidden;
}
.song-info img {
  width: 20%;
  height: 100%;
}
.info {
  margin-left: 1rem;
}
.info h4 {
  margin: 0;
  font-size: 1rem;
  font-weight: 400;
}
.info span {
  font-size: 0.8rem;
}
.close {
  text-align: center;
  margin-right: 1rem;
}
.close img {
  width: 2rem;
}
.song-name {
  display: block;
  font-size: 1rem;
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
  height: 0;
  background: #1a1a1a;
  border-top-left-radius: 1rem;
  border-top-right-radius: 1rem;
  overflow: hidden;
  transition: height 0.2s linear;
}
.more-ul {
  width: 100%;
  height: 100%;
  overflow: scroll;
  margin: 1rem 0;
}
.more-li {
  /* border: 1px solid #fff; */
  text-align: left;
  padding: 0.5rem 0 0.5rem 1rem;
}
.more-li a {
  display: block;
  width: 100%;
}
.more-li img {
  width: 2rem;
  vertical-align: middle;
}
.more-li span {
  font-size: 0.8rem;
  margin-left: 1rem;
}
.song-item {
  display: flex;
  justify-content: flex-start;
  align-items: center;
  margin-bottom: 1rem;
}
.more img {
  width: 1.8rem;
  opacity: 0.7;
}
</style>