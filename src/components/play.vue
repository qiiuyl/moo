<template>
  <div>
    <div :style="Height" id="bg-songword" @click="closeWord" ref="bgSongWord">
      <div id="Word-content" :style="Height" v-if="(wordStatus==true)">
        <div id="content-header">
          <p id="song_name">青花瓷</p>
          <p id="song_singer">周杰伦</p>
        </div>
        <div class="wordclear"></div>
        <div id="content-middle">
          <ul>
            <li v-for="(item,index) of word" :key="index">{{item}}</li>
          </ul>
        </div>
        <div class="wordclear"></div>
        <div id="content-bottom">
          <p>
            <span>00:00_</span>03:31
          </p>
        </div>
      </div>

      <div id="more-content" :style="moreHeight" v-if="(detailStatus==true)">
        <div id="more-header">
          <img @click="closedetail" src="../../public/images/ic_round_arrow_back_ios_white_24px.png" alt />
        </div>
        <div class="moreclear"></div>
        <div id="more-middle">
          <div class="imgs">
            <img src="../../public/images/01artist.jpg" alt class="first-img" />
            <img src="../../public/images/album_vinyl.png" alt class="last-img" />
          </div>
          <div class="text">
            <p>青花瓷</p>
            <p>周杰伦</p>
          </div>
          <div class="five-img">
            <img src="../../public/images/ic_bk_download_white_30dp.png" alt />
            <img src="../../public/images/ic_bk_share_white_30dp.png" alt />
            <img src="../../public/images/more_album.png" alt />
            <img src="../../public/images/ic_bk_comment_white_30dp.png" alt />
            <img src="../../public/images/clletion.png" alt />
          </div>
        </div>
        <div>
          <mooTrackOne></mooTrackOne>
        </div>
      </div>
      <div id="songWord" :style="Height"></div>
    </div>
    <div id="bg" :style="Height" ref="bg">
      <div id="title" @click="showWord">
        <h2>青花瓷-周杰伦(Jay)</h2>
      </div>
      <div id="song-play" @click="playsong">
        <img v-show="true" src="../../public/images/ic_round_drop_down_24dp_white.png" alt />
      </div>
      <div id="tag">
        <ul>
          <li>
            <tag :place="false"></tag>
          </li>
          <li>
            <tag :place="false"></tag>
          </li>
          <li>
            <tag :place="false"></tag>
          </li>
          <li>
            <tag :place="false"></tag>
          </li>
          <li>
            <tag :place="false"></tag>
          </li>
          <li>
            <tag :place="false"></tag>
          </li>
        </ul>
      </div>
      <div id="bottom">
        <div id="bottom_top">
          <h3>青花瓷</h3>
          <p>
            <img src="../../public/images/unzan.png" />
          </p>
        </div>
        <div id="bottom_bottom">
          <p id="user">
            <router-link to="singer">
              <span></span>周杰伦
            </router-link>
          </p>
          <p @click="showdetail">
            <img src="../../public/images/more.png" />
          </p>
        </div>
      </div>
    </div>
  </div>
</template>
<style scoped>
.playbtn{
  position: fixed;
  z-index: 1000;
  left: 50%;
  top: 50%;
}
#bg-blur{
  background:yellow;
  width:100%;
  height: 100%;
  z-index:80;
}
#bg {
  width: 100%;
  background: url("../../public/images/bg.jpeg") no-repeat;
  background-size: cover;
}
#bg-songword {
  width: 100%;
  background: none;
  position: fixed;
  display: none;
  z-index: 100;
}

#songWord {
  width: 100%;
  position: absolute;
  background: rgba(0, 0, 0, 0.5);
  /* z-index: 11; */
}
#Word-content,
#more-content {
  width: 100%;
  color: #fff;
  z-index: 200;
  position: absolute;
}
#Word-content {
  padding-left: 5%;
}
.wordclear {
  height: 15%;
}
.moreclear {
  height: 5%;
}
#more-content #more-header {
  width: 100%;
  height: 5%;
  position: fixed;
  text-align: center;
  padding: 0.5rem 0;
  box-sizing: border-box;
}
#more-content #more-header img {
  width: 8%;
  transform: rotate(90deg);
}
#more-content #more-middle {
  margin-top: 5.5rem;
}
#more-content #more-middle .imgs {
  padding-left: 1.5rem;
  display: flex;
  align-items: center;
}
#more-content #more-middle .imgs .first-img {
  width: 9rem;
}
#more-content #more-middle .imgs .last-img {
  width: 1.3rem;
}
#more-content #more-middle .text p {
  color: #fff;
  font-size: 1.1rem;
  margin-bottom: 0.2rem;
  padding-left: 1.5rem;
}
#more-content #more-middle .text p + p {
  font-size: 0.5rem;
  margin: 0;
  color: rgb(236, 236, 233);
}
#more-content #more-middle .five-img {
  width: 100%;
  display: flex;
  justify-content: space-around;
  flex-wrap: nowrap;
  margin-top: 2.5rem;
  margin-bottom: 3.5rem;
}
#more-content #more-middle .five-img img {
  width: 2rem;
  height: 2rem;
}

#Word-content #content-header,
#content-bottom {
  width: 100%;
  height: 15%;
  position: fixed;
}
#Word-content #content-header #song_name {
  font-size: 1.5rem;
  font-weight: bolder;
  margin-bottom: 0.7rem;
}
#Word-content #content-header #song_singer {
  font-weight: bolder;
  margin-top: 0;
}
#Word-content #content-bottom {
  top: 85%;
  display: flex;
  align-items: flex-end;
}
#Word-content #content-bottom p {
  font-size: 1.5rem;
}
#Word-content #content-middle {
  height: 70%;
  width: 100%;
  overflow: auto;
}
#Word-content #content-middle ul {
  height: 100%;
  width: 100%;
  overflow: auto;
}
#Word-content #content-middle ul li {
  width: 100%;
  height: 7%;
  font-size: 1rem;
}

#title {
  width: 100%;
  height: 20%;
  color: #fff;
}
#title h2 {
  width: 100%;
  height: 100%;
  text-align: left;
  margin: 0;
  padding: 25% 3%;
  box-sizing: border-box;
}
#song-play {
  height: 40%;
  display: flex;
  align-items: flex-end;
  justify-content: center;
  z-index: 0;
  box-sizing: border-box;
  padding: 0 3%;
}
#song-play img {
  width: 25%;
  height: 25%;
}
#tag {
  width: 100%;
  height: 10%;
  display: flex;
  align-items: flex-end;
  z-index: 1;
  padding: 0 3%;
  box-sizing: border-box;
  margin-top: 10%;
}
#tag ul {
  width: 90%;
  margin: 0;
  padding: 0;
  list-style: none;
  display: flex;
  flex-wrap: wrap;
}
#tag ul li {
  height: 10%;
  margin-top: 0.5rem;
  margin-right: 0.5rem;
}
#bottom p,
h2 {
  padding: 0;
  margin: 0;
}
#bottom {
  width: 100%;
  height: 20%;
  box-sizing: border-box;
  padding: 0 3%;
}
#bottom #bottom_top,
#bottom_bottom {
  display: flex;
  justify-content: space-between;
}
#bottom #bottom_top h2,
#bottom #bottom_top p {
  margin-top: 0.8rem;
}
#bottom #bottom_top p {
  display: flex;
  align-items: center;
}
#bottom #bottom_top h2 {
  width: 80%;
}
#bottom #bottom_bottom {
  margin-top: 0.8rem;
}
#bottom #bottom_bottom p {
  display: flex;
  align-items: center;
}
#bottom_bottom p#user span {
  width: 30px;
  height: 30px;
  border-radius: 15px;
  display: inline-block;
  border: 1px;
  background: url("../../public/images/user.jpg") no-repeat;
  background-size: cover;
  margin-right: 0.5rem;
}
</style>
<script>
import tag from "./tag";
import mooTrackOne from "./mooTrack_one";
export default {
  components: { tag, mooTrackOne },
  data() {
    return {
      Height: { height: "0px" },
      word: [
        "填词：方文山",
        "谱曲：周杰伦",
        "歌曲原唱：周杰伦",
        "素胚勾勒出青花笔锋浓转淡",
        "瓶身描绘的牡丹一如你初妆",
        "冉冉檀香透过窗心事我了然",
        "宣纸上走笔至此搁一半",
        "釉色渲染仕女图韵味被私藏",
        "而你嫣然的一笑如含苞待放",
        "你的美一缕飘散",
        "去到我去不了的地方",
        "天青色等烟雨，而我在等你",
        "炊烟袅袅升起，隔江千万里",
        "在瓶底书刻隶仿前朝的飘逸",
        "就当我为遇见你伏笔",
        "天青色等烟雨，而我在等你",
        "月色被打捞起，晕开了结局",
        "如传世的青花瓷自顾自美丽",
        "你眼带笑意",
        "色白花青的锦鲤跃然于碗底",
        "临摹宋体落款时却惦记着你",
        "你隐藏在窑烧里千年的秘密",
        "极细腻犹如绣花针落地"
      ],
      wordStatus:false,
      detailStatus:false,
      moreHeight: {
        height: "0px"
      }
    };
  },
  methods: {
    playsong(){
      this.$emit("play");
    },
    getH() {
      var h = window.innerHeight;
      this.Height.height = h + "px";
    },
    showWord() {
      this.$emit("show",true);
      this.$refs.bg.style.filter = "blur(0.7rem)";
      this.$refs.bgSongWord.style.display = "block";
      this.wordStatus=true;
      e.stopPropagation();
    },
    closeWord() {
      this.$emit("show",false);
      if(this.wordStatus==true){
        this.$refs.bg.style.filter = "";
        this.$refs.bgSongWord.style.display = "none";
        this.wordStatus=false;
      }else if(this.detailStatus==true){
      }
    },
    showdetail() {
      // console.log(123);
      this.$emit("show",true);
      this.detailStatus=true;
      var h = window.innerHeight;
      var i = h*0.1;
      var time=setInterval(()=>{
        if(h>0){
          h-=i;
          this.$refs.bg.style.filter = "blur(0.7rem)";
          this.$refs.bgSongWord.style.display = "block";
          var bgSongword=document.getElementById("bg-songword");
          bgSongword.style.transform ='translateY(' + h + 'px)';
          // console.log(h);
        }else if(h<=0){
          window.clearInterval(time);
        }
      },10)
    },
    closedetail() {
      this.$emit("show",false);
      var h = window.innerHeight;
      var i = h*0.1;
      var height = 0;
      this.$refs.bg.style.filter = "";
      var time=setInterval(()=>{
        if(height<h){
          height+=i;
          this.$refs.bgSongWord.style.display = "block";
          var bgSongword=document.getElementById("bg-songword");
          bgSongword.style.transform ='translateY(' + height + 'px)';
          // console.log(h);
        }else if(height>=h){
          var bgSongword=document.getElementById("bg-songword");
          bgSongword.style.transform ='none';
          this.$refs.bgSongWord.style.display = "none";
          window.clearInterval(time);
        }
      },10)
      this.detailStatus=false;
    },
  },
  created() {
    this.getH();
  },
  mounted(){
  }
};
</script>