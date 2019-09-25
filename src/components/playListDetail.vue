<template>
  <div class="playlist-detail inner-border">
    <back-header :title="'视频标题'" :backcolor="true" :more="true" :share="true"></back-header>
    <div class="top-fill"></div>
    <search :place="false"></search>
    <div class="list-cover">
      <img src="images/IMG_3601.GIF" alt class="list-img" />
      <music-icon></music-icon>
    </div>
    <div class="list-info">
      <div class="title">
        <span>音乐让贫穷的我精神富足够起来</span>
        <img src="images/ic_user_profile_favor.png" alt />
      </div>
      <div class="user">
        <img src="images/album_vinyl_full.png" alt />
        <span class="username my-small">用户名123456</span>
      </div>
      <div
        class="my-small subtitle"
      >我也不知道写些什么就随便vi按撒犯得上广泛受到我也不知道写就随便vi按撒犯得上广泛受到我也不知道写就随便vi按撒犯得上广泛受到我也不知道写些什么就随便vi按撒犯得上广泛受到</div>
    </div>
    <div class="tag-box">
      <div class="tags" id="swipe" :style="`width:${width}%`">
        <tag></tag>
        <tag></tag>
        <tag></tag>
        <tag></tag>
        <tag></tag>
        <tag></tag>
        <tag></tag>
        <tag></tag>
        <tag></tag>
      </div>
    </div>
    <song-list :songlist="list"></song-list>
  </div>
</template>

<script>
import search from "./search";
import musicIcon from "./musicIcon";
import tag from "./tag";
import songList from "./mooTrack_one";
export default {
  data() {
    return {
      width:0,
      show_select:false,
      select_list:[],
      list:[]
    };
  },
  components: {
    search,
    musicIcon,
    tag,
    songList
  },
  methods: {
  get_list() {
      this.axios.get("/newsong").then(result => {
        this.list = result.data;
      });
    },
  change_select(){
    this.show_select=!this.show_select;
    // console.log(this.select_list)
  },
    S_width() {
     var swipe = document.getElementById("swipe");
    //  swipe.children
      // console.log(swipe.children);
      var swipeChild=swipe.children;
      var sum=0;
      for(var elem of swipeChild){
        sum+=elem.offsetWidth;
        // console.log(elem.offsetWidth)
      }
      //  this.width = (swipe.offsetWidth / window.innerWidth) * 100;
      //  console.log(swipe.offsetWidth);
       var sumWidth=sum+16*(swipeChild.length-1);
      //  console.log(sumWidth);
       this.width=sumWidth/window.innerWidth*100;
      // console.log(this.width);
      // console.log(sumWidth);
     },
    swipeX(w) {
      //创建一个函数swipeX传入一个参数w  是你这个列表长度的百分比  就比如500% 传入500
      var swipe = document.getElementById("swipe"); //获取id为swipe的元素
      var start = 0; //用来保存刚开始触摸时触摸点距离屏幕左边原点的X轴距离
      var end = 0; //用来保存刚结束触摸时触摸点距离屏幕左边原点的X轴距离
      var add = 0; //用来保存每次滑动的累加值
      var len = 0; //用来保存每次滑动的长度
      swipe.addEventListener("touchstart", function(e) {
        start = e.touches[0].pageX;
      }); //绑定触摸开始事件  获取X的值
      swipe.addEventListener("touchmove", function(e) {
        len = e.touches[0].pageX - start; //滑动的长度等于此时的X值减去开始的X值
        end = add; //把之前滑动的累加值给到end
        swipe.style.transform = `translateX(${end + len}px)`; //最有滑动的值为之前的累加值end加上本次滑动的值len
      }); //绑定在屏幕的滑动事件
      swipe.addEventListener("touchend", function(e) {
        var width = (-swipe.offsetWidth / w) * 100; //计算一个屏幕的长度 // console.log(width);
        if (end + len > 0) {
          //如果end+len此次滑动的值>0  就是向右滑最边  将值拉回为0
          swipe.style.transform = `translateX(0px)`;
          return; //拉回之后马上跳出函数  不做累加
        } else if (end + len + width < -swipe.offsetWidth) {
          //如果end+len+width的值大于当前滑动元素的总长度  就是向左滑最边
          //将值拉回为滑动元素宽度减去一个屏幕长度的值
          swipe.style.transform = `translateX(${-swipe.offsetWidth - width}px)`;
          return;
        }
        add += len;
      }); //绑定触控结束事件  手指离开屏幕时触发
    }
  },
  created() {
    this.get_list();
    },
  mounted() {
    this.S_width();
    this.swipeX(this.width);
  }
};
</script>

<style scoped>
.tag-box {
  width: 100%;
  overflow: hidden;
}
.tags {
   /* width: 500%; */
  margin-top: 0.8rem;
  display: flex;
}
.tags > div {
  margin-left: 0.5rem;
}
.subtitle {
  margin-top: 0.5rem;
  line-height: 1rem;
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 2;
  overflow: hidden;
}
.user img {
  width: 2.2rem;
  vertical-align: middle;
}
.user span {
  margin-left: 0.8rem;
}
.list-cover {
  position: relative;
  width: 60%;
  margin: 0 auto;
  margin-top: 1rem;
}
.list-cover img:first-child {
  width: 100%;
}
.backicon {
  transform: rotate(180deg);
}
.mint-button-icon {
  background-color: #fff;
}
.mint-header {
  height: 3.7rem;
  padding: 0;
  background-color: transparent;
}
.mint-button-text > img {
  vertical-align: middle;
  width: 2rem;
}
.list-info {
  margin-top: 1rem;
}
.title {
  display: flex;
}
.list-info .title span {
  width: 90%;
}
.list-info .title img {
  width: 10%;
}
</style>