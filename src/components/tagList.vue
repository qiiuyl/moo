<template>
	<div class="tag-list inner-border">
		 <router-link class="list-header" to="/tagpage">
      <span class="my-title">MOO Tag_探索标签</span>
      <img src="images/ic_round_arrow_back_ios_white_24px.png" alt />
    </router-link>
		<div class="tags">
			<tag :place="false" class="tag" v-for="(elem,i) of list" :key="i" :tagName="elem.t_name"></tag>
		</div>
	</div>
</template>

<script>
import tag from "./tag";
export default {
	data(){
		return{
			list:[]
		}
	},
	components:{
		tag
	},
	methods:{
		getTag(){
			this.axios.get("./mootag").then(res=>{
				this.list=res.data;
			})
		}
	},
	created(){
		this.getTag();
	}
}
</script>

<style scoped>
.tag-list{
	margin-bottom: 3rem;
}
.tags{
	display: flex;
	flex-wrap: wrap;
}
.tag{
	margin-top: 0.5rem;
	margin-left: 0.5rem;
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