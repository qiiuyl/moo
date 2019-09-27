<template>
  <div class="video inner-border">
    <div class="list-header">
      <span class="my-title">MOO Video_视频</span>
      <img src="images/ic_round_arrow_back_ios_white_24px.png" alt />
    </div>
    <video-item v-for="(elem,i) of list" :key="i" :obj="elem" id="video"></video-item>
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
      // console.log(this.$refs.video);
      this.axios.get("/hotVideo").then(result=>{
        this.list=result.data.splice(0,3);
        console.log(this.list)
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