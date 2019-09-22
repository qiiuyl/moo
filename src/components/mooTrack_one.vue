<template>
  <div class="inner-border">
    <!-- yellow小按钮 -->
    <back-header></back-header>
    <div class="top-fill"></div>
    <div class="disflex">
      <div>
        <mt-button>
          <img src="images/radio_play.png" class="btn" />
        </mt-button>
        <span>20</span>
      </div>
      <!-- 完成按钮 点开 -->
      <div class="distwo">
        <img src="images/ic_list_operation_more_white_30dp.png" class="Finished" @click="open" />
      </div>
    </div>
    <song-item :obj="list"></song-item>
    <song-item :obj="list"></song-item>
    <song-item :obj="list"></song-item>
    <song-item :obj="list"></song-item>
    <song-item :obj="list"></song-item>
    <song-item :obj="list"></song-item>
    <song-item :obj="list"></song-item>
    <div class="more-list" ref="list">
      <div class="more-box" ref="box">
        <div class="box-top">
          <!-- 交叉按钮 -->
          <div class="close" ref="close">
            <img src="images/hwpush_ic_cancel.png" alt @click="close" />
          </div>
        </div>
        <ul class="more-ul">
          <li class="more-li">
            <router-link to="/">
              <img src="images/ic_list_operation_batch_white_30dp.png" alt />
              <span>批量操作</span>
            </router-link>
          </li>
          <li class="more-li">
            <router-link to="/">
              <img src="images\icon_paixu.png" alt />
              <span>排序</span>
            </router-link>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>
<script>
import songItem from "./songItem";
import backHeader from './back_header' 
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
    songItem,backHeader
  },
  methods: {
    close() {
      this.$refs.box.style.height="0rem";
      setTimeout(()=>{
        this.$refs.list.style.display="none";
      },500);
    },
    open(){
      this.$refs.list.style.display="flex";
      this.$refs.box.style.height="10.5rem";
    }
  }
};
</script>
<style scoped>
.mint-button--default {
  background-color: #fff133;
  width: 3.75rem;
  height: 1.875rem;
  border-radius: 1.25rem;
}
.mint-button-text .btn {
  transform: rotateY(360deg);
  width: 1.25rem;
  position: relative;
  left: 0px;
}
span {
  margin-left: 0.625rem;
  font-size: 1rem;
  font-family: "PaulGroteskSoft";
  color: #d3d3d3;
}
.Finished {
  width: 1.8rem;
  margin-right: 0.6rem;
  /* transform: rotateY(360deg); */
}
.disflex {
  align-items: center;
  display: flex;
  justify-content: space-between;
  margin-top: 1.25rem;
  margin-bottom: 1.25rem;
}
.distwo {
  display: flex;
}
.close {
  text-align: right;
  width: 100%;
}
.close img {
  width: 2rem;
  margin-right: 1.37rem;
}
.more-ul {
  text-align: left;
}
.more-ul .more-li img {
  width: 2rem;
  padding: 0.2rem 0;
  margin-left: 1.25rem;
}
.router-link-active span {
  position: relative;
  top: -0.8rem;
}
.more-list {
  position: absolute;
  background: rgba(0, 0, 0, 0.5);
  width: 100%;
  height: 100%;
  left: 0;
  top: 0;
  display: none;
  align-items: flex-end;
}
.more-box {
  background-color: #1a1a1a;
  width: 100%;
  transition: height 0.5s linear;
  overflow: hidden;
}
</style>