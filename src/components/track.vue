<template>
  <div class="track inner-border">
    <router-link class="list-header" to="/">
      <span class="my-title">MOO Track_新歌</span>
      <img src="images/ic_round_arrow_back_ios_white_24px.png" alt />
    </router-link>
    <song-item v-for="(elem,i) of list" :key="i" :obj="elem"></song-item>
  </div>
</template>

<script>
import songItem from './songItem' 
export default {
  data(){
    return {
      list:[]
    }
  },
  methods:{
    get_list(){
      this.axios.get("/newsong").then(result=>{
        this.list=result.data.slice(0,5);
        // console.log(this.list)
      })
    }
  },
  components:{
    songItem
  },
  created(){
    this.get_list();
  }
};
</script>

<style scoped>
.track{
  margin-top:1rem; 
}
.list-header {
  /* padding: 0.5rem 0; */
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.list-header img {
  width: 2rem;
  height: 2rem;
}
</style>