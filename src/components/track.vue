<template>
  <div class="track inner-border">
    <router-link class="list-header" to="/mooTrack">
      <span class="my-title">MOO Track_新歌</span>
      <img src="images/ic_round_arrow_back_ios_white_24px.png" alt />
    </router-link>
    <song-item v-for="(elem,i) of list" :key="i" :obj="elem" @play="play"></song-item>
    <button @click="testfn">点击播放</button>
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
    testfn(){
      // this.test();
      // console.log(this.$store.getters.setSingobj)
      // console.log(this.$store.getters.getSingObj);
      var audio=this.$store.getters.getSingObj;
      // console.log(audio);
      audio.play();
      // console.log(this.$store.getters.singobj)
    },
    play(){
			// console.log("传到了index面板");
			this.$emit("play");
		},
    get_list(){
      this.axios.get("/newsong").then(result=>{
        this.list=result.data.slice(0,5);
        // console.log()
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