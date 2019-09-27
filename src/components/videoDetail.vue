<template>
  <div class="video-detail pb">
    <back-header :title="'视频详情'" :bgcolor="true"></back-header>
    <div class="fill"></div>
    <video :src="name.v_origin" :poster="name.v_img" controls></video>
    <div class="list-info inner-border">
      <div class="title">
        <span v-text="name.v_Subheading"></span>
        <img src="images/ic_user_profile_favor.png" alt />
        <img src="images/ic_bk_more_horizontal_fat_white_48dp.png" alt />
      </div>
      <div class="user">
        <img :src="singer.singer_img" alt />
        <span class="username my-small">丘某丽</span>
      </div>
      <div
        class="my-small subtitle" v-text="name.v_describe"></div>
    </div>
    <div class="tag-box inner-border">
      <div class="tags" id="swipe" :style="`width:${width}%`">
        <tag v-for="(elem,i) of tag" :key="i" :tagName="elem.t_name"></tag>
      </div>
    </div>
    <!-- <div class="content-box inner-border">
      <span class="title">关联歌曲</span>
      <song-item :al="'1'"></song-item>
    </div> -->
    <div class="content-box inner-border">
      <span class="title">接下来播放</span>
      <!-- <song-item></song-item> -->
      <ul class="next-play">
        <li v-for="(elem,i) of video_list" :key="i">
          <img :src="elem.v_img" alt />
          <span class="play-title" v-text="elem.v_name"></span>
          <span class="play-subtitle" v-text="elem.v_describe"></span>
        </li>
      </ul>
    </div>
    <div class="content-box inner-border">
      <span class="title">评论</span>
      <comment :open="show_comment" :position="show_comment"></comment>
    </div>
  </div>
  
</template>

<script>
import search from "./search";
import musicIcon from "./musicIcon";
import tag from "./tag";
import songItem from "./songItem";
import comment from "./comment";
import backHeader from "./back_header";
export default {
  data() {
    return {
      width: 0,
      show_select: false,
      select_list: [],
      show_comment:false,
      tag:[],
      name:[],
      singer:[],
      video_list:[]
    };
  },
  components: {
    search,
    musicIcon,
    tag,
    songItem,
    comment,
    backHeader
  },
  props:['vid'],
  methods: {
    get_video(){
      this.axios.get("./video?vid="+this.vid).then(result=>{
        console.log(result.data);
        this.tag=result.data[2];
        this.name=result.data[0][0];
        this.singer=result.data[1][0];
        this.video_list=result.data[3];
      })
    },
    open(){
      this.show_comment=!this.show_comment;
      // console.log(this.show_comment);
    },
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
  created() {
    this.get_video();
  },
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