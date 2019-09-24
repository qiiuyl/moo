<template>
  <div id="app">
    <router-view @play="play"></router-view>
    <div class="player">
      <img src="images/vinyl_disk_60dp.png" alt="" class="rotate-img" :class="rotatestyle">
      <div class="player-info">
        <span class="time" ref="time">{{`0${Math.floor(playTime/60)}:${playTime%60>10?playTime%60:'0'+playTime%60}`}}</span>
        <button class="player-btn" @click="changeplay">
          <img src="images/ic_notification_play.png" alt="" ref="btn">
        </button>
      </div>
    </div>
    <audio id="audio" src="http://192.168.1.104:5050/%E6%97%A0%E8%B5%96/%E6%97%A0%E8%B5%96.MP3"></audio>
    <!-- <h1>{{play}}</h1> -->
    <!-- <h1>{{$store.getters.getPlay}}</h1> -->
    <!-- <input type="text" v-model="play" id="test" style="background:#000"> -->
  </div>
</template>
<script>
export default {
  data(){
    return {
      // play:'',
      rotatestyle:{
        runing:false,
        paused:true
      },
      playTime:0
    }
  },
  methods:{
    play(){
      this.changeplay();
    },

    // playsong(){
    //   // console.log("触发change事件");
    //    var audio=document.getElementById("audio");
    //    var status=e.target.getAttribute("data-play");
    //    if(status){
    //      audio.play();
    //    }else{
    //      audio.pause();
    //    }
    //  },
  changeplay(){
    var audio=document.getElementById("audio");
    // 播放时间的定时函数
    var totalTime=audio.duration;
      // var time=setInterval(() => {
      //   this.playTime=parseInt(audio.currentTime);
      //   console.log(123);
      // }, 1000);
      // 判断是否在播放
      if(this.rotatestyle.runing){
        audio.pause();
        // clearInterval(timer);
        this.$store.commit("changeplay",false);
        this.$refs.btn.src='images/ic_notification_play.png';
        this.$refs.btn.style.opacity=0.5;
        this.$refs.time.style.opacity=0.5;
      }else{
        audio.play();
        this.$store.commit("changeplay",true);
        var timer=setInterval(() => {
        this.playTime=parseInt(audio.currentTime);
      }, 1000);      
        this.$refs.btn.src='images/ic_notification_pause.png';
        this.$refs.btn.style.opacity=1;
        this.$refs.time.style.opacity=1;
      }
      var bool;
      bool=this.rotatestyle.runing;
      this.rotatestyle.runing=this.rotatestyle.paused;
      this.rotatestyle.paused=bool;
      // console.log(!this.rotatestyle.rotate)
      // var totalTime=audio.duration;
      // setInterval(() => {
      //   this.playTime=parseInt(audio.currentTime);
      //   console.log(123);
      // }, 1000);
    }
  },
  created(){ 
    },
  watch:{

  },
  mounted(){
  }
}
</script>
<style scoped>
@keyframes disk{
  0%{
    transform: rotate(0);
  }
  100%{
    transform: rotate(360deg);
  }
}
.player-btn{
  border: 0;
  outline: 0;
  background: transparent;
}
.player-btn img{
  width: 2rem;
  margin-right: 0.5rem;
  opacity: 0.5;
}
.time{
  opacity: 0.5;
  font-size: 1.7rem;
  font-family: 'PaulGroteskSoft';
}
.player-info{
  background: #000;
  border-radius: 2rem;
  display: flex;
  justify-content: flex-end;
  align-items: center;
  width: 12rem;
  height: 3rem;
}
  .rotate-img{
    position: absolute;
    width: 4rem;
    height: 4rem;
    animation: disk 3s linear infinite;
  }
  .runing{
    animation-play-state: running;    
  }
  .paused{
    animation-play-state: paused;
  }
  .player{
    position: fixed;
    bottom: 2rem;
    left: 1rem;
    z-index: 100;
    display: flex;
    /* display: none; */
    align-items: center
  }
</style>
