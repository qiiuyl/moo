<template>
  <div class="inner-border">
    <back-header :backcolor="true" :title="'MOO新歌'"></back-header>
    <div class="top-fill"></div>
    <play-list :one="true"></play-list>
    <play-list :one="true"></play-list>
  </div>
</template>
<script>
import playList from "../components/playList";
export default {
  data(){
    return {
      list:[]
    }
  },
  methods:{
    get_list(){
      this.axios.get("/playlist").then(result=>{
        this.list=result.data;
        console.log(this.list);
      })
    }
  },
  components:{playList}
}
</script>
<style scoped>
  .mint-header{
    background:#1a1a1a;
    padding:0px;
  }
  img{
    width:32px;
    transform: rotateY(180deg);
    position:relative;
    left:-8px;
  }
</style>