<template>
  <div class="test" ref="test">
    <!-- <button @click="open">开启</button> -->
  </div>
</template>

<script>
import play from "../components/play";
function bodyScroll(e) {
  // console.log("执行了");
  e.preventDefault(); //取消事件默认动作
  e.stopPropagation(); //不再派发事件
}
export default {
  data() {
    return {
      lrc: "",
      data: 1
    };
  },
  methods: {
    getlrc() {
      // http://tingapi.ting.baidu.com/v1/restserver/ting?method=baidu.ting.song.lry&songid=877578
      this.axios
        .post(
          "/test",
          {
            data: this.data
          },
          {
            responseType: "arraybuffer"
          }
        )
        .then(res => {
          return (
            "data:image/png;base64," +
            btoa(
              new Uint8Array(res.data).reduce(
                (data, byte) => data + String.fromCharCode(byte),
                ""
              )
            )
          );
        })
        .then(data => {
          this.lrc = data.slice(22); //图片地址 <img src='data' />
          console.dir(this.lrc);
          var lrc = Base64.decode(this.lrc);
          console.log(lrc);
        });
    }
  },
  components: {
    play
  },
  created() {
    this.getlrc();
  }
};
</script>

<style scoped>
.van-swipe {
  height: 100%;
}
h1 {
  width: 100%;
  height: 100%;
  background: #fff;
  margin: 0;
  color: #000;
}
h2 {
  width: 100%;
  height: 100%;
  background: #000;
  margin: 0;
  color: #000;
}
.test {
  background: #f00;
  width: 100%;
  height: 812px;
}
.mask {
  position: fixed;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.5);
  left: 0;
  top: 0;
  display: none;
}
</style>