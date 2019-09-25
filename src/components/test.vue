<template>
  <div class="test">
    <!-- <button @click="open">开启</button> -->
    <van-swipe :show-indicators="false" :initial-swipe="0" vertical>
      <van-swipe-item><play></play></van-swipe-item>
      <van-swipe-item><play></play></van-swipe-item>
      <van-swipe-item><play></play></van-swipe-item>
      <van-swipe-item><play></play></van-swipe-item>
    </van-swipe>
    <div class="mask" ref="mask">
      <button @click="close">关闭</button>
    </div>
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
    return {};
  },
  methods: {
    open() {
      document.addEventListener("touchmove", bodyScroll, {
        passive: false
      });
      this.$refs.mask.style.display = "block";
    },
    close() {
      document.removeEventListener("touchmove", bodyScroll, {
        passive: false
      });
      this.$refs.mask.style.display = "none";
    }
  },
  components:{
    play
  }
};
</script>

<style scoped>
.van-swipe{
  height: 100%;
}
h1{
  width: 100%;
  height: 100%;
  background: #fff;
  margin: 0;
  color: #000;
}
h2{
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