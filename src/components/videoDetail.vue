<template>
  <div class="video-detail">
    <mt-header fixed class="inner-border">
      <router-link to="/" slot="left">
        <mt-button>
          <img src="images/ic_round_arrow_back_ios_white_24px.png" alt class="backicon" />
        </mt-button>
      </router-link>
    </mt-header>
    <div class="fill"></div>
    <video src="video/x.mp4" controls></video>
    <div class="list-info inner-border">
      <div class="title">
        <span>音乐让贫穷的我精神富足够起来</span>
        <img src="images/ic_user_profile_favor.png" alt />
        <img src="images/ic_bk_more_horizontal_fat_white_48dp.png" alt />
      </div>
      <div class="user">
        <img src="images/album_vinyl_full.png" alt />
        <span class="username my-small">用户名123456</span>
      </div>
      <div
        class="my-small subtitle"
      >我也不知道写些什么就随便vi按撒犯得上广泛受到我也不知道写就随便vi按撒犯得上广泛受到我也不知道写就随便vi按撒犯得上广泛受到我也不知道写些什么就随便vi按撒犯得上广泛受到</div>
    </div>
    <div class="tag-box inner-border">
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
    <div class="content-box inner-border">
      <span class="title">关联歌曲</span>
      <song-item></song-item>
    </div>
    <div class="content-box inner-border">
      <span class="title">接下来播放</span>
      <!-- <song-item></song-item> -->
      <ul class="next-play">
        <li>
          <img src="images/video.jpg" alt />
          <span class="play-title">小威的第一部视频第一部视频第一部视频第一部视频部视频第一部视频第一部视频第一部视频</span>
          <span class="play-subtitle">某丽的第一部视频第一部视频第一部视频第一部视频</span>
        </li>
        <li>
          <img src="images/video.jpg" alt />
          <span class="play-title">小威的第一部视频第一部视频第一部视频第一部视频部视频第一部视频第一部视频第一部视频</span>
          <span class="play-subtitle">某丽的第一部视频第一部视频第一部视频第一部视频</span>
        </li>
        <li>
          <img src="images/video.jpg" alt />
          <span class="play-title">小威的第一部视频第一部视频第一部视频第一部视频部视频第一部视频第一部视频第一部视频</span>
          <span class="play-subtitle">某丽的第一部视频第一部视频第一部视频第一部视频</span>
        </li>
      </ul>
    </div>
    <div class="content-box inner-border">
      <span class="title">评论</span>
      <comment></comment>
    </div>
  </div>
  
</template>

<script>
import search from "./search";
import musicIcon from "./musicIcon";
import tag from "./tag";
import songItem from "./songItem";
import comment from "./comment";
export default {
  data() {
    return {
      width: 0,
      show_select: false,
      select_list: []
    };
  },
  components: {
    search,
    musicIcon,
    tag,
    songItem,
    comment
  },
  methods: {
    change_select() {
      this.show_select = !this.show_select;
      // console.log(this.select_list)
    },
    S_width() {
      var swipe = document.getElementById("swipe");
      //  swipe.children
      // console.log(swipe.children);
      var swipeChild = swipe.children;
      var sum = 0;
      for (var elem of swipeChild) {
        sum += elem.offsetWidth;
        // console.log(elem.offsetWidth)
      }
      //  this.width = (swipe.offsetWidth / window.innerWidth) * 100;
      //  console.log(swipe.offsetWidth);
      var sumWidth = sum + 16 * (swipeChild.length - 1);
      //  console.log(sumWidth);
      this.width = (sumWidth / window.innerWidth) * 100;
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
  created() {},
  mounted() {
    this.S_width();
    this.swipeX(this.width);
  }
};
</script>

<style scoped>

.play-title {
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 2;
  overflow: hidden;
  margin:0.5rem 0;
  font-size: 0.9rem;
}
.play-subtitle {
  font-size: 0.8rem;
  opacity: 0.6;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  display: block;
}
.next-play {
  display: flex;
  flex-wrap: wrap;
}
.next-play li {
  margin-bottom: 1rem;
  width: 49%;
}
.next-play li img {
  width: 100%;
}
.next-play li:nth-child(2n){
  margin-left:2%;
}
.content-box {
  margin-top: 2rem;
}
.content-box .title {
  opacity: 0.7;
  margin-bottom: 1rem;
}
.video-detail video {
  /* margin:0 -3%; */
  width: 100%;
}
.fill {
  width: 100%;
  height: 3.7rem;
}
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
  width: 8%;
  opacity: 0.8;
  margin-left: 0.5rem;
}
</style>