<template>
    <div id="bg-blur" :style="Height">

    <div id="bg" :style="Height">
      <div id="title">
        <h2>Because of you(因为你)-Kelly Clarkson(凯丽.克拉克森)</h2>
      </div>
      <div id="song-play">
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
          <h3>Because Of YouBecause Of YouBecause Of</h3>
          <p>
            <img src="../../public/images/unzan.png" />
          </p>
        </div>
        <div id="bottom_bottom">
          <p id="user">
            <router-link to="singer"><span></span>Kelly Clarkson</router-link>
          </p>
          <p>
            <img src="../../public/images/more.png" />
          </p>
        </div>
      </div>
    </div>

    </div>
</template>
<style scoped>
#bg-blur{
  background:yellow;
  width:100%;
  z-index:80;
}

#bg {
  width: 100%;
  background: url("../../public/images/bg.jpeg") no-repeat;
  background-size: cover;
  position: relative;
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
  margin-top:10%;
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
export default {
  components: { tag },
  data() {
    return {
      Height: { height: "0px" }
    };
  },
  methods: {
    getH() {
      var h = window.innerHeight;
      this.Height.height = h + "px";
    }
  },
  created() {
    this.getH();
  }
};
</script>