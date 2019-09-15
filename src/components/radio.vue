<template>
  <div class="radio">
    <div class="img-group">
      <img src="images/taoze.jpg" alt/>
      <div class="big-img">
        <div class="radio-date">{{`${month}/${radioDate}`}}</div>
        <div class="mask"></div>
        <img src="images/jielun.jpg" alt />
      </div>
      <img src="images/jj.jpg" alt class="right-img"/>    
    </div>
    <div class="radio-info" @click="playMusic">
      <div class="info-title">
        <p class="my-title">MOO Radio</p>
        <span class="my-small">个性好歌推荐</span>
      </div>
      <div class="play-btn">
        <img :src="is_play?'images/radio_play.png':'images/radio_paused.png'" alt="">
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      radioDate: "",
      month: "",
      is_play:true
    };
  },
  methods: {
    getDate() {//获取时间函数
      var time = new Date();
      this.radioDate = time.getDate();
      this.month = time.getMonth() + 1;
    },
    playMusic(){//切换播放暂停
      // console.log(123);
      this.is_play=!this.is_play;
    }
  },
  created() {
    this.getDate();
    // console.log(this.radioDate);
    // console.log(this.month);
  }
};
</script>

<style scoped>
.right-img{
  position: absolute;
  left: 50%;
}
.play-btn img{
  width: 1.3rem;
}
.play-btn{
  width: 2.5rem;
  height: 2.5rem;
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: 50%;
  background: #ffe133;
}
.info-title p{
  margin: 0;
}
.radio{
  display: flex;
  align-items: center;
  margin-top:1.7rem;
  justify-content: space-between;
}
.radio-info{
  display: flex;
  background: #000;
  width: 61%;
  height: 4.5rem;
  align-items: center;
  justify-content: space-between;
  padding: 0 0.7rem;
  box-sizing: border-box;
  border-top-right-radius: 2.5rem;
  border-bottom-right-radius: 2.5rem;
}
.mask{
  width: 100%;
  height: 100%;
  background: #000;
  opacity: 0.2;
  position: absolute;
  top: 0;
  left: 0;
  z-index: 1;
}
.radio-date {
  position: absolute;
  font-size: 1rem;
  top: 50%;
  left: 50%;
  margin-left: -1rem;
  margin-top: -0.5rem;
  font-family: 'Kastelov';
  z-index: 2;
}
.img-group {
  width: 30%;
  position: relative;
  display: flex;
  align-items: flex-end;
  /* justify-content: flex-end; */
}
.img-group img {
  width: 79%;
  border-radius: 0.5rem;
}
.big-img {
  width: 84%;
  position: absolute;
  bottom: 0;
  left: 23%;
  z-index: 2
}
.big-img img {
  width: 100%;
}
</style>