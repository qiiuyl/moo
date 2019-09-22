<template>
	<div class="album-item">
		<div class="album-img">
			<img :src="obj.l_img" alt="" class="main-img">
			<img src="images\album_vinyl_full.png" alt="" class="bg-img">
		</div>
		<div class="album-info">
			<span class="album-name" v-text="obj.l_title">我想要的(I,Me,Mine)</span>
			<span class="album-author" v-text="obj.l_describe"></span>
			<tag :place="false" :tagName="obj.t_name"></tag>
		</div>
	</div>
</template>

<script>
import tag from "./tag";
export default {
	data(){
		return {
		}
	},
	components:{
		tag
	},
	props:["obj"]
}
</script>

<style scoped>
.album-author{
	margin: 0.5rem 0;
	font-size: 0.8rem;
}
.album-info{
	display: flex;
	flex-direction: column;
	justify-content: center;
	margin-left:1rem; 
}
.album-img{
	position: relative;
	margin-left:1.2rem; 
	width: 42%;
}
.album-img img{
	width: 100%;
}
.main-img{
	position: absolute;
	left: -1.2rem;
	top: 0;
}
.album-item{
	display: flex;
	margin-bottom: 1rem;
}
.album-name{
	font-size: 1rem;
}

</style>