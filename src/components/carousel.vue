<template>
  <div class="carousel inner-border" :style="`height:${carouselHeight}px`">
    <mt-swipe :auto="140000">
      <mt-swipe-item v-for="(elem,i) of list" :key="i">
        <div class="songlist" v-if="elem.type=='album'">
          <album-item :obj="elem"></album-item>
        </div>
        <div class="bgb" v-else>123</div>
        <!-- <div class="ablum">123465</div>
        <div class="video">123465</div> -->
      </mt-swipe-item>
    </mt-swipe>
  </div>
</template>

<script>
import albumItem from "./albumItem"
export default {
  components:{
    albumItem
  },
  data() {
    return {
      carouselHeight:0,
      list:[]
    }
  },
  methods:{
    getlist(){
      this.axios.get('/carousel').then(result=>{
        for(var elem of result.data[0]){
          elem.type='album';
        }
        result.data[1].type="songlist";
        for(var elem of result.data[2]){
          elem.type='video';
        }
        var order=[0,4,5,1,2,6,3]
        var arr=this.list.concat(result.data[0],result.data[1],result.data[2]);
        for(var elem of order){
          this.list.push(arr[elem]);
        }
        console.log(this.list);
      });
    },
    getWidth(){
      this.carouselHeight=window.innerWidth/2;
    }
  },
  created(){
    this.getWidth();
    this.getlist();
    // console.log(this.carouselHeight);
  }
};
</script>

<style scoped>
.bgb{
  width: 100%;
  height: 100%;
  background: #8c8c8c;
}
.songlist .album-item ..album-info .album-author{
  color: #fff !important;
  opacity: 1;
  background: red;
}
.songlist .album-item{
  width: 100%;
  margin-bottom:0; 
  margin-left: 1.5rem;
}
.songlist .album-img{
  width: auto;
}
.songlist{
  background: #8c8c8c;
  display: flex;
  align-items: center;
  justify-content: center;
  width: 100%;
  height: 100%;
}
  .mint-swipe-item{
    overflow: hidden;
    border-radius:1.5rem;
  }
 .carousel-img{
   width: 100%;
   height: 100%;
 }
</style>