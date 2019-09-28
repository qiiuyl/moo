<template>
  <div class="inner-border">
    <!-- 按钮+图片 -->
    <div class="disflex">
      <div class="left">
        <button class="playbtn">
          <img src="images/radio_play.png" class="btn" />
        </button>
        <span v-text="songlist.length"></span>
      </div>
      <!-- 完成图片 -->
      <div class="distwo">
        <div @click="changeShow">
          <img src="images/ic_list_operation_batch_white_30dp.png" class="Finished" />
        </div>
      </div>
    </div>
    <song-item v-for="(elem,i) of songlist" :key="i" :is_select="showSelect" :obj="elem" :hiddenimg="hiddenimg"></song-item>
  </div>
</template>
<script>
import songItem from "./songItem";
export default {
  data() {
    return {
      showSelect: false,
      time: ""
    };
  },
  props:[
    'songlist',
    'hiddenimg'
  ],
  methods: {
    get_time() {
      this.time = new Date().toLocaleDateString();
      // console.log(this.songlist)
    },
    changeShow() {
      this.showSelect = !this.showSelect;
    }
  },
  components: {
    songItem
  },
  created() {
    this.get_time();
  }
};
</script>
<style scoped>
.playbtn{
  border: 0;
  outline: 0;
  background:#ffe133;
  border-radius: 1rem;
  padding:0 1rem;
}
.playbtn img{
  width: 1.5rem;
}
.bg-image {
  margin: 0 -3%;
}
.bg-image div {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  justify-content: flex-end;
  height: 15rem;
  background: url("../../public/images/detail_moo_track_header_bg.png")
    no-repeat;
  background-size: cover;
}

.bg-image h3,h5 {
  margin:0 0 0.5rem 1rem; 
}
.bg-image h3 {
  font-family: "PaulGroteskSoft";
}
/* .mint-header {
  background: transparent;
  padding: 0px;
}
.router-link-active img {
  width: 2rem;
  transform: rotateY(180deg);
  position: relative;
}
.mint-button-text .btn {
  transform: rotateY(360deg);
  width: 1.25rem;
  position: relative;
  left: 0px;
}
.mint-button--default {
  background-color: #fff133;
  width: 3.75rem;
  height: 1.875rem;
  border-radius: 1.25rem;
} */
span {
  margin-left: 0.625rem;
  font-size: 1rem;
  font-family: "PaulGroteskSoft";
  color: #d3d3d3;
}
.Finished {
  width: 1.8rem;
  transform: rotateY(360deg);
}
.disflex {
  align-items: center;
  display: flex;
  justify-content: space-between;
  margin-top: 1.25rem;
  margin-bottom: 1.25rem;
}
.left{
  display: flex;
  align-items: center;
}
.distwo {
  display: flex;
}
</style>