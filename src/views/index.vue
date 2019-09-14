<template>
  <div class="index inner-border">
		<div class="index-header">
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
			<router-link to="/my">
				<div class="myimg">
					<img src="http://m.360buyimg.com/mobilecms/s120x120_jfs/t17725/156/1767366877/17404/f45d418b/5ad87bf0N66c5db7c.png" alt="">
				</div>
			</router-link>
		</div>
		<!-- 上方脱离了文本流加个占位标签 -->
		<div class="top-fill"></div>
    <!-- 面板组件 -->
    <mt-tab-container v-model="active" swipeable>
      <mt-tab-container-item id="play">
				<!-- play面板组件 -->
      </mt-tab-container-item>
      <mt-tab-container-item id="discover">
				<!-- discover面板组件 -->
				<search></search>
				<div class="search-fill"></div>
				<carousel></carousel>
				<radio></radio>
				<h4>车是买那不能大苏打</h4>
      </mt-tab-container-item>
				<h4>面板1</h4>
    </mt-tab-container>
  </div>
</template>
<script>
import search from "../components/search";
import carousel from "../components/carousel";
import radio from "../components/radio";
export default {
  data() {
    return {
      active: "discover"
    };
  },
	components:{
		search,carousel,radio
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
 .index-header{
	 box-sizing: border-box;
	 align-items: center;
	 display: flex;
	 justify-content: space-between;
	 background-color: #1a1a1a;
	 padding: 0 3%;
	 position: fixed;
	 width: 100%;
	 height: 3.7rem;
	 left: 0;
	 top: 0;
	 border-bottom:2px solid #fff; 
	 z-index: 1;
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
