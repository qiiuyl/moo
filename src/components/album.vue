<template>
	<div class="album inner-border">
		<router-link class="list-header" to="/">
      <span class="my-title">MOO Album_专辑</span>
      <img src="images/ic_round_arrow_back_ios_white_24px.png" alt />
    </router-link>
		<album-item></album-item>
    <span class="first-text">文字，是一个汉语词汇，拼音为wén zì，基本意思是记录思想、交流思想或承载语言的图像或符号。该词出自《史记·秦始皇本纪》：“一法度衡石丈尺，车同轨，书同文字。”</span>
		<album-item></album-item>
		<album-item></album-item>
	</div>
</template>

<script>
import albumItem from "./albumItem";
export default {
	components:{
		albumItem
	}
}
</script>

<style scoped>
.first-text{
  display: block;
  color:#999;
  font-size: 0.8rem;
  margin: 0.5rem 0 1rem 0;
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
</style>