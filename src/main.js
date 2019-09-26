import Vue from 'vue'
import Vuex from 'vuex'
import App from './App.vue'
import router from './router'
// import store from './store'
import mintUI from 'mint-ui'//配置mintui
import axios from "axios"//配置axios
import backHeader from "./components/back_header"
import { Swipe, SwipeItem } from "vant";
import { Tab, Tabs } from "vant";
import "mint-ui/lib/style.css";//引入mintui样式 
import "vant/lib/index.css";

Vue.use(Swipe).use(SwipeItem);
Vue.use(Tab).use(Tabs);
Vue.use(Vuex);

// 注册全局组件顶部返回
Vue.component("backHeader", backHeader);
Vue.config.productionTip = false
// 配置axios默认基础路径
// axios.defaults.baseURL = "http://176.122.14.69:8080";
axios.defaults.baseURL = "http://176.122.14.69:8080";
// 注册mintUI
Vue.use(mintUI);
// 注册axios
Vue.prototype.axios=axios;

var store = new Vuex.Store({
  state: {
    singobj:{},//audio对象
    play: false,//是否播放
    singUrl:"",//播放的url
    playlist:[],// 播放列表
    playindex:0// 当前播放的index
  },
  mutations: {
    setPlaylist(state,arr){
      state.playlist=arr;
    },
    setPlayindex(state){
      state.playindex+=1;
    },
    setPlay(state, st) {
      state.play = st;
    },
    setSingUrl(state, url) {
      state.singUrl = url;
      // console.log("修改了url")
    },
    setSingObj(state,obj){
      state.singobj=obj;
    }
  },
  getters: {
    getPlaylist(state){
      return state.playlist;
    },
    getPlayindex(state){
      return state.playindex;
    },
    getSingObj(state){
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
}).$mount('#app')
