<template>
	<mt-header :class="bgcolor?'bg':'bgno'" :title="title">
      <mt-button to="/" slot="left" @click="back">
        <mt-button>
          <img src="images/ic_round_arrow_back_ios_white_24px.png" alt class="backicon" />
        </mt-button>
      </mt-button>
			<div>视频</div>
      <mt-button slot="right" v-show="share">
        <img src="images/ic_bk_share_story.png" alt />
      </mt-button>
      <mt-button slot="right" v-show="more">
        <img src="images/ic_bk_more_horizontal_fat_white_48dp.png" alt />
      </mt-button>
    </mt-header>
</template>

<script>
export default {
	data(){
		return {

		}
	},
	props:[
		'bgcolor',
		'title',
		'more',
		'share'
	],
	methods:{
		back(){
			this.$router.go(-1);
		}
	}
}
</script>

<style scoped>
#app .bg{
	position: fixed;
	width: 100%;
	left: 0;
	top:0;
	background-color: #1a1a1a;
	z-index: 5;
}
#app .bgno{
	position: absolute;
	width: 100%;
	background-color:transparent;
	z-index: 5;
}
.backicon {
  transform: rotate(180deg);
}
.mint-button-icon {
  background-color: #fff;
}
.mint-header {
  height: 3.7rem;
  padding: 0;
  background-color: transparent;
}
.mint-button-text > img {
  vertical-align: middle;
  width: 2rem;
}
/* 头部组件  
参数
title  头部中间的标题
share true/false  是否需要分享按钮
more true/false  是否需要更多按钮
bocolor true/false  头部是非需要定位与背景   有背景有定位  无背景有定位 */
</style>
