<template>
  <div class="inner-border">
		<div class="div-flex">
			<span>1</span>
			<div class="div-img">
				<a href="#"><img src="images/changyongtubiao-mianxing-.png" alt=""></a>
				<img src="images/ic_list_operation_batch_white_30dp.png" alt="" @click="changeShow">
			</div>
		</div>
		<div class="Specialcolumn">
			<div class="input-border" v-show="is_select" :style="is_select?'width:10%':'width:0'">
				<input type="checkbox">
			</div>
			<img src="images/pic_default_square_dark.png" alt="">
			<div class="font-p">
				<h5>粤语歌曲专栏</h5>
        <p>1首</p>
			</div>
		</div>
	</div>
</template>
<script>
export default {
	data(){
		return{
			is_select:false
		}
	},
	methods:{
		changeShow(){
			this.is_select=!this.is_select;
		}
	}
}
</script>
<style scoped>
	.div-flex{
		display:flex;
		justify-content:space-between;
		margin-top:1.25rem;
    margin-bottom:1.5rem;
	}
	.div-flex span{
		font-size:1.06rem;
    font-family: "PaulGroteskSoft";
    color: #d3d3d3;
		line-height: 1.87rem;
	}
	.div-img{
		display:flex;
	}
	.div-img img{
		width:1.87rem;
		margin-left:0.62rem;
	}
	.Specialcolumn{
		display:flex;
	}
	.Specialcolumn img{
		width:5.25rem;
	}
	.input-border{
		margin:0.62rem;
		display:flex;
    align-items: center;
	}
	.input-border input{
		width:20px;
    height:20px;
    background-color: transparent;
    border: 1px solid #c9c9c9;
    -webkit-appearance: none;
    border-radius: 50%;
    outline: none;
	}
	.input-border input[type="checkbox"]:checked {
    background: url("../../public/images/scan_finish_icon.png") no-repeat center
      center;
    background-size: cover;
    border: 0;
	}
	.font-p{
		display:flex;
		flex-direction: column;
		justify-content: center;
		margin-left:2rem;
	}
	.font-p h5{
		margin-bottom:0.62rem;
	}
	.font-p p{
		margin:0;
		font-size:0.62rem;
		margin-bottom:1.25rem;
	}
</style>