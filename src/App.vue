<template>
  <div id="app">
    <router-view></router-view>
    <div class="player">
      <img src="images/vinyl_disk_60dp.png" alt="" class="rotate-img" :class="rotatestyle">
      <div class="player-info">
        <span class="time" ref="time">04:05</span>
        <button class="player-btn" @click="changeplay">
          <img src="images/ic_notification_play.png" alt="" ref="btn">
        </button>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data(){
    return {
      rotatestyle:{
        runing:false,
        paused:true
      }
    }
  },
  methods:{
    changeplay(){
      if(this.rotatestyle.runing){
        this.$refs.btn.src='images/ic_notification_play.png';
        this.$refs.btn.style.opacity=0.5;
        this.$refs.time.style.opacity=0.5;
      }else{
        this.$refs.btn.src='images/ic_notification_pause.png';
        this.$refs.btn.style.opacity=1;
        this.$refs.time.style.opacity=1;
      }
      var bool;
      bool=this.rotatestyle.runing;
      this.rotatestyle.runing=this.rotatestyle.paused;
      this.rotatestyle.paused=bool;
      // console.log(!this.rotatestyle.rotate)
    }
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
    align-items: center
  }
</style>
