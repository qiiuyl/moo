<template>
  <div class="carousel inner-border">
    <van-swipe :auto="140000">
      <van-swipe-item v-for="(elem,i) of list" :key="i" :style="`height:${carouselHeight}px`">
        <div class="album" v-if="elem.type=='album'">
          <album-item :obj="elem"></album-item>
        </div>
        <div class="songlist" v-else-if="elem.type=='songlist'" :style="`background-image:url(${elem.img})`">
          <div class="info">
            <tag :tagName="elem.t_name"></tag>
            <span v-text="elem.l_title"></span>
          </div>
        </div>
        <div class="video" v-else :style="`background-image:url(${elem.v_img})`">
          <router-link to="/" class="playicon">
            <img src="images/ic_round_drop_down_24dp_white.png" alt />
          </router-link>
          <div class="info v">
            <tag :tagName="'123456'"></tag>
            <span v-text="elem.v_name"></span>
          </div>
        </div>
        <!-- <div class="test" v-else><h1>123456</h1></div> -->
      </van-swipe-item>
    </van-swipe>
  </div>
</template>

<script>
import albumItem from "./albumItem";
import tag from "./tag";
export default {
  components: {
    albumItem,
    tag
  },
  data() {
    return {
      carouselHeight: 0,
      list:[]
    };
  },
  methods: {
    getlist(){
      this.axios.get("/carousel").then(result => {
        for (var elem of result.data[0]) {
          elem.type = "songlist";
        }
        for (var elem of result.data[1]) {
          elem.type = "album";
        }
        // result.data[1].type = "album";
        for (var elem of result.data[2]) {
          elem.type = "video";
        }
        var order = [0, 4, 5, 1, 2, 6, 3];
        var arr = this.list.concat(
          result.data[0],
          result.data[1],
          result.data[2]
        );
        this.list=[];
        for (var elem of order) {
          this.list.push(arr[elem]);
        }
        // console.log(this.list);
        // for(var i=0;i<order.length;i++){
        //   this.list[i]=arr[order[i]];
        // }
        // console.log(this.list);
        
      })
    },
    getWidth() {
      this.carouselHeight = window.innerWidth / 2;
    }
  },
  created() {
    this.getWidth();
    this.getlist();
    // console.log(this.$refs);
// console.log(this.carouselHeight);
  }
};
</script>

<style scoped>
.test{
  width: 100%;
  height: 160px;
  background: #f00;
}
.video {
  position: relative;
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: column;
  justify-content: flex-end;
}
.playicon {
  width: 100%;
  height: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
}
.playicon img {
  width: 5rem;
}
.songlist {
  display: flex;
  flex-direction: column;
  justify-content: flex-end;
  width: 100%;
  height: 100%;
  background-size: cover;
}
.v {
  position: absolute;
}
.info {
  margin: 0 0 0.5rem 0.5rem;
}
.info span {
  width: 94%;
  display: block;
  margin: 0.2rem 0;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
.bgb {
  width: 100%;
  height: 100%;
  background: #d09daf;
}
.album .album-item {
  width: 100%;
  margin-bottom: 0;
  margin-left: 1.5rem;
}
.album .album-img {
  width: auto;
}
.album {
  background: #8c8c8c;
  display: flex;
  align-items: center;
  justify-content: center;
  width: 100%;
  height: 100%;
}
.van-swipe-item {
  overflow: hidden;
  border-radius: 1.5rem;
}
.carousel-img {
  width: 100%;
  height: 100%;
}
</style>