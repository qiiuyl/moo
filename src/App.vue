<template>
  <div id="app">
    <router-view></router-view>
    <div class="player">
      <img src="images/vinyl_disk_60dp.png" alt class="rotate-img" :class="$store.getters.getPlay?'runing':'paused'" />
      <div class="player-info">
        <span
          class="time"
          ref="time" 
          :class="$store.getters.getPlay?'opacity1':'opacity2'"
        >{{`0${Math.floor(playTime/60)}:${playTime%60>=10?playTime%60:'0'+playTime%60}`}}</span>
        <button class="player-btn" @click="changeplay">
          <img 
          :src="$store.getters.getPlay?'images/ic_notification_pause.png':'images/ic_notification_play.png'" 
          :class="$store.getters.getPlay?'opacity1':'opacity2'"
          alt/>
        </button>
      </div>
    </div>
    <audio id="audio" :src="$store.getters.getSingUrl"></audio>
  </div>
</template>
<script>
import { setTimeout } from 'timers';
export default {
  data() {
    return {
      // play:'',
      rotatestyle: {
        runing: false,
        paused: true
      },
      playTime: 0,
      list:[]
    };
  },
  methods: {
    getnewsong(){
      this.axios.get("/newsong").then(res=>{
        this.$store.commit('setPlaylist',res.data);
        var list=this.$store.getters.getPlaylist;
        console.log(list);
        this.$store.commit('setSingUrl',list[0].s_video);
        // console.log(res.data);
      });
    },
    palysing(){//播放歌曲函数
      var audio=document.getElementById("audio");
      audio.play();
      this.$store.commit("setPlay", true);
    },
    pausesing(){//暂停歌曲函数
      var audio=document.getElementById("audio");
      audio.pause();
      this.$store.commit("setPlay", false);
    },
    listSwitch(){//切换下一首歌曲函数
      var audio=document.getElementById("audio");
      var list=this.$store.getters.getPlaylist;
      var index=this.$store.getters.getPlayindex;
      if(index<list.length-1){
        this.$store.commit("setPlayindex",1);
        this.$store.commit("setSingUrl",list[index].s_video);
      setTimeout(()=>{
          this.palysing();
        },100)
      }else{
        this.pausesing();
        this.playTime=0;
      }
    },
    changeplay() {
      var audio = this.$store.getters.getSingObj;
      var totalTime = audio.duration;
      if(this.$store.getters.getPlay){
        this.pausesing();
      }else{
        this.palysing();
      }
    }
  },
  created() {
    // console.log(this.$refs);
  },
  watch: {},
  mounted() {
    this.getnewsong();
    var audio=document.getElementById("audio");
    this.$store.commit("setSingObj", audio);
    var time=setInterval(() => {
      this.playTime = parseInt(audio.currentTime);
      if(audio.ended){
        var i=this.$store.getters.getPlayindex;
        var list=this.$store.getters.getPlaylist;
        this.listSwitch();
        // console.log("调用一次");
      }
    }, 1000);
    // console.dir(audio);
  }
};
</script>
<style scoped>
@keyframes disk {
  0% {
    transform: rotate(0);
  }
  100% {
    transform: rotate(360deg);
  }
}
.player-btn {
  border: 0;
  outline: 0;
  background: transparent;
}
.player-btn img {
  width: 2rem;
  margin-right: 0.5rem;
  /* opacity: 0.5; */
}
.time {
  opacity: 0.5;
  font-size: 1.7rem;
  font-family: "PaulGroteskSoft";
}
.player-info {
  background: #000;
  border-radius: 2rem;
  display: flex;
  justify-content: flex-end;
  align-items: center;
  width: 12rem;
  height: 3rem;
}
.rotate-img {
  position: absolute;
  width: 4rem;
  height: 4rem;
  animation: disk 3s linear infinite;
}
.runing {
  animation-play-state: running;
}
.paused {
  animation-play-state: paused;
}
.opacity2{
  opacity :0.5; 
}
.opacity1{
  opacity: 1;
}
.player {
  position: fixed;
  bottom: 2rem;
  left: 1rem;
  z-index: 100;
  display: flex;
  /* display: none; */
  align-items: center;
}
</style>
