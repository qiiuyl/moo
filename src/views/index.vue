<template>
  <div class="index">
		<div class="index-header" :class="active=='discover'?'bg':''">
			<div class="navbar-title">
				<div >
					<span v-show="active=='play'">PLAY</span>
					<span v-show="active=='discover'">DISCOVER</span>
				</div>
				<div class="navbar-icon">
					<i :class="active=='play'?'icon-active':''"></i>
					<i :class="active=='discover'?'icon-active':''"></i>
				</div>
			</div>
			<router-link to="/user">
				<div class="myimg">
					<img src="../../public/images/user.jpg" alt="">
				</div>
			</router-link>
		</div>
		<!-- 上方脱离了文本流加个占位标签 -->
		<div class="top-fill" v-if="active=='discover'"></div>
    <!-- 面板组件 -->
    <mt-tab-container v-model="active" swipeable>
      <mt-tab-container-item id="play">
				<!-- play面板组件 -->
				<play></play>
      </mt-tab-container-item>
      <mt-tab-container-item id="discover">
				<!-- discover面板组件 -->
				<search :place="true"></search>
				<div class="search-fill"></div>
				<carousel></carousel>
				<radio></radio>
				<play-list></play-list>
				<moo-track></moo-track>
				<album></album>
				<moo-video></moo-video>
				<tag-list></tag-list>
				<!-- <h4>车是买那不能大苏打</h4> -->
      </mt-tab-container-item>
    </mt-tab-container>
  </div>
</template>
<script>
import search from "../components/search";
import carousel from "../components/carousel";
import radio from "../components/radio";
import playList from "../components/playList";
import mooTrack from "../components/track";
import album from "../components/album";
import mooVideo from "../components/video";
import tagList from "../components/tagList";
import play from "../components/play";
export default {
  data() {
    return {
      active: "discover"
    };
  },
	components:{
		search,carousel,radio,playList,mooTrack,album,mooVideo,tagList,play
	}
};
</script>
<style scoped>
.search-fill{
    width: 100%;
    height:3rem;
  }
.top-fill{
		width: 100%;
		height: 3.5rem;
	}
.myimg{
	width: 2.5rem;
}
.myimg img{
	border-radius:50%; 
	width: 100%;
}
.bg{
	background-color: #1a1a1a;
}
 .index-header{
	 box-sizing: border-box;
	 align-items: center;
	 display: flex;
	 justify-content: space-between;
	 /* background-color: #1a1a1a; */
	 padding: 0 3%;
	 position: fixed;
	 width: 100%;
	 height: 3.7rem;
	 left: 0;
	 top: 0;
	 /* border-bottom:2px solid #fff;  */
	 z-index: 10;
 }
 .navbar-title span{
	 font-size: 1.8rem;
	 font-family:"PaulGroteskSoft";
 }
 .navbar-title{
	 display: flex;
	 flex-direction: column;
	 justify-content: center;
	 width: 100%;
 }
 .navbar-icon{
	 display: flex;
 }
 .navbar-title i{
	 display: block;
	 width: 0.375rem;
	 height: 0.375rem;
	 background: #fff;
	 border-radius:50%; 
	 opacity: 0.8;
	 transition: width 0.1s linear;
 }
 .navbar-title i:last-child{
	 margin-left:0.4rem; 
 }
 i.icon-active{
	 width: 1rem;
	 border-radius:0.375rem;
	 opacity: 1;
 }
</style>
