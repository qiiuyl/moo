import Vue from "vue";
import Vuex from "vuex";
import App from "./App.vue";
import router from "./router";
// import store from './store'
import mintUI from "mint-ui"; //配置mintui
import axios from "axios"; //配置axios
import backHeader from "./components/back_header";
import { Swipe, SwipeItem } from "vant";
import { Tab, Tabs } from "vant";
import "mint-ui/lib/style.css"; //引入mintui样式
import "vant/lib/index.css";
import lyric from "lyric-parser";
import {Base64} from 'js-base64';

Vue.use(Base64);
Vue.use(Swipe).use(SwipeItem);
Vue.use(Tab).use(Tabs);
Vue.use(Vuex);

// 注册全局组件顶部返回
Vue.component("backHeader", backHeader);
Vue.config.productionTip = false;
// 配置axios默认基础路径
// axios.defaults.baseURL = "http://192.168.1.104:5050";
axios.defaults.baseURL = "http://176.122.14.69:8080";
// 注册mintUI
Vue.use(mintUI);
// 注册axios
Vue.prototype.axios = axios;
Vue.prototype.lyric = lyric;

var store = new Vuex.Store({
  state: {
    singobj: {}, //audio对象
    play: false, //是否播放
    singUrl: "", //播放的url
    playlist: [], // 播放列表
    playindex: 0 // 当前播放的index
  },
  mutations: {
    setPlaylist(state, arr) {
      state.playlist = arr;
    },
    setPlayindex(state, i) {
      state.playindex += i;
    },
    initIndex(state) {
      if (state.playindex == 0) {
        state.playindex = state.playlist.length-1;
        console.log("已将index置于最后")
      }else{
        state.playindex=0;
      }
    },
    setPlay(state, st) {
      state.play = st;
    },
    setSingUrl(state, url) {
      state.singUrl = url;
      // console.log("修改了url")
    },
    setSingObj(state, obj) {
      state.singobj = obj;
    }
  },
  getters: {
    //获取当前播放歌曲对象
    getsingObj(state) {
      var i = state.playindex;
      var arr = state.playlist;
      // console.log(arr[i].s_name);
      return arr[i];
    },
    //获取歌手名
    getPlaylist(state) {
      return state.playlist;
    },
    getPlayindex(state) {
      return state.playindex;
    },
    getSingObj(state) {
      return state.singobj;
    },
    getPlay(state) {
      return state.play;
    },
    getSingUrl(state) {
      return state.singUrl;
    }
  }
});

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount("#app");
