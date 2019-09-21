<template>
  <div class="carousel inner-border" :style="`height:${carouselHeight}px`">
    <mt-swipe :auto="3000">
      <mt-swipe-item>
        <img src="images/showimg.jpg" alt="" class="carousel-img">
      </mt-swipe-item>
      <mt-swipe-item>
        <img src="images/showimg2.jpg" alt="" class="carousel-img">
      </mt-swipe-item>
      <mt-swipe-item>
        <img src="images/showimg.jpg" alt="" class="carousel-img">
      </mt-swipe-item>
    </mt-swipe>
  </div>
</template>

<script>
export default {
  data() {
    return {
      carouselHeight:0  
    }
  },
  methods:{
    getlist(){
      this.axios.get('/carousel').then(result=>{
        console.log(result.data);
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
  .mint-swipe-item{
    overflow: hidden;
    border-radius:1.5rem;
  }
 .carousel-img{
   width: 100%;
   height: 100%;
 }
</style>