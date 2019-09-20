<template>
  <div class="inner-border">
    <mt-header title="MOO Track 新歌" style="font-size:16px;" fixed>
      <router-link to="/" slot="left">
        <img src="images/ic_round_arrow_back_ios_white_24px.png" alt />
      </router-link>
      <mt-button icon slot="right"></mt-button>
    </mt-header>
    <!-- 头部背景图 -->
      <div class="bg-image">
        <div></div>
        <h5>09/18</h5>
        <h4>MOO Track 新歌</h4>
      </div>
    <!-- 按钮+图片 -->
    <div class="disflex">
      <div>
        <mt-button>
          <img src="images/radio_play.png" class="btn" />
        </mt-button>
        <span>20</span>
      </div>
      <!-- 完成图片 -->
      <div class="distwo">
        <div @click="changeShow"><img src="images/ic_list_operation_batch_white_30dp.png" class="Finished" /></div>
      </div>
    </div>
    <song-item :is_select="showSelect"></song-item>
    <song-item :is_select="showSelect"></song-item>
    <song-item :is_select="showSelect"></song-item>
    <song-item :is_select="showSelect"></song-item>
    <song-item :is_select="showSelect"></song-item>
    <song-item :is_select="showSelect"></song-item>
  </div>
</template>
<script>
import songItem from './songItem'
export default {
  data(){
    return {
      showSelect:false
    }
  },
  methods:{
    changeShow(){
      this.showSelect=!this.showSelect;
    }
  },
  components:{
    songItem
  }
};
</script>
<style scoped>
.bg-image{
  margin: 0 -3%;
}
.bg-image div{
  height:15rem;
  background:url("../../public/images/detail_moo_track_header_bg.png") no-repeat;
  background-size:contain;
  position: relative;
}
.bg-image h5,h4{
  margin-top:0px;
  margin-bottom: 0px;
  margin-left:0.62rem;
}
.bg-image h5{
  position:absolute;
  top:10.31rem;
}
.bg-image h4{
  font-family: "PaulGroteskSoft";
  position:absolute;
  top:11.56rem;
}
.mint-header {
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
}
span {
  margin-left: 0.625rem;
  font-size: 1rem;
  font-family: "PaulGroteskSoft";
  color: #d3d3d3;
}
.Finished {
  width:1.8rem;
  transform: rotateY(360deg);
}
.disflex {
  align-items: center;
  display: flex;
  justify-content: space-between;
  margin-top:1.25rem;
  margin-bottom:1.25rem;
}
.distwo {
  display: flex;
}
</style>