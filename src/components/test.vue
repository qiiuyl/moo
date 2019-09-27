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
    utf16to8(str) {
      var out, i, len, c;
      out = "";
      len = str.length;
      for (i = 0; i < len; i++) {
        c = str.charCodeAt(i);
        if (c >= 0x0001 && c <= 0x007f) {
          out += str.charAt(i);
        } else if (c > 0x07ff) {
          out += String.fromCharCode(0xe0 | ((c >> 12) & 0x0f));
          out += String.fromCharCode(0x80 | ((c >> 6) & 0x3f));
          out += String.fromCharCode(0x80 | ((c >> 0) & 0x3f));
        } else {
          out += String.fromCharCode(0xc0 | ((c >> 6) & 0x1f));
          out += String.fromCharCode(0x80 | ((c >> 0) & 0x3f));
        }
      }
      return out;
    },
    utf8to16(str) {
      var out, i, len, c;
      var char2, char3;
      out = "";
      len = str.length;
      i = 0;
      while (i < len) {
        c = str.charCodeAt(i++);
        switch (c >> 4) {
          case 0:
          case 1:
          case 2:
          case 3:
          case 4:
          case 5:
          case 6:
            // 0xxxxxxx
            case7: out += str.charAt(i - 1);
            break;
          case 12:
          case 13:
            // 110x xxxx 10xx xxxx
            char2 = str.charCodeAt(i++);
            out += String.fromCharCode(((c & 0x1f) << 6) | (char2 & 0x3f));
            break;
          case 14:
            // 1110 xxxx 10xx xxxx 10xx xxxx
            char2 = str.charCodeAt(i++);
            char3 = str.charCodeAt(i++);
            out += String.fromCharCode(
              ((c & 0x0f) << 12) | ((char2 & 0x3f) << 6) | ((char3 & 0x3f) << 0)
            );
            break;
        }
      }
      return out;
    },
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
          // var str = Base64.encode("我是谁");
          // console.log(str);
          var lrc = Base64.decode(this.lrc);
          console.log(lrc);
          // var lrc16=this.utf8to16(lrc);
          // console.log(lrc);
          // console.log(lrc16);
          // this.$refs.test.innerHTML=lrc;
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