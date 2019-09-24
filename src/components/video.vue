<template>
  <div class="video inner-border">
    <router-link class="list-header" to="/videoDetail">
      <span class="my-title">MOO Video_视频</span>
      <img src="images/ic_round_arrow_back_ios_white_24px.png" alt />
    </router-link>
    <video-item v-for="(elem,i) of list" :key="i" :obj="elem"></video-item>
  </div>
</template>

<script>
import videoItem from './videoItem'
export default {
  data(){
    return {
      list:[]
    }
  },
  methods:{
    getlist(){
      this.axios.get("/hotVideo").then(result=>{
        this.list=result.data.splice(0,3);
      });
    }
  },
  components:{
    videoItem
  },
  created(){
    this.getlist();
  }
};
</script>

<style scoped>
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