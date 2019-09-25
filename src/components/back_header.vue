<template>
  <div :class="backcolor?'bg':'bgno'" class="back-header">
    <div class="title">{{title}}</div>
		<div class="icon">
			<div @click="back" class="left">
      <img src="images/ic_round_arrow_back_ios_white_24px.png" alt class="backicon" />
    </div>
    <div class="right">
      <div v-show="share">
        <img src="images/ic_bk_share_story.png" alt />
      </div>
      <div v-show="more">
        <img src="images/ic_bk_more_horizontal_fat_white_48dp.png" alt />
      </div>
    </div>
		</div>
  </div>
  <!-- <div><h1>1</h1></div> -->
</template>

<script>
export default {
  data() {
    return {};
  },
  props: ["backcolor","title","more","share"],
  methods: {
    back() {
      this.$router.go(-1);
    }
  },
  created(){
   
  }
};
</script>

<style scoped>
.icon {
	display: flex;
	align-items: center;
	justify-content: space-between;
}
.back-header img {
  width: 2.5rem;
}
#app .bg {
  position: fixed;
  width: 100%;
  left: 0;
  top: 0;
  background-color: #1a1a1a;
  z-index: 5;
  height: 3.7rem;
}
#app .bgno {
  position: absolute;
  width: 100%;
  background-color: transparent;
  z-index: 5;
  height: 3.7rem;
  left: 0;
  top: 0;
}
.backicon{
	transform: rotate(180deg)
}
.title {
	position: absolute;
	line-height: 3.7rem;
	text-align: center;
	width: 100%;
}
.right{
	align-self: flex-end;
	display: flex;
	align-items: center;
	height: 3.7rem;
}


/* 头部组件  
参数
title  头部中间的标题
share true/false  是否需要分享按钮
more true/false  是否需要更多按钮
bocolor true/false  头部是非需要定位与背景   有背景有定位  无背景有定位 */
</style>
