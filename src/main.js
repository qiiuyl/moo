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
import "vant/lib/index.css";

Vue.use(Swipe).use(SwipeItem);
Vue.use(Tab).use(Tabs);
Vue.use(Vuex);

// 注册全局组件顶部返回
Vue.component("backHeader", backHeader);
Vue.config.productionTip = false
import "mint-ui/lib/style.css";//引入mintui样式 
// 配置axios默认基础路径
axios.defaults.baseURL = "http://176.122.14.69:8080";
// 注册mintUI
Vue.use(mintUI);
// 注册axios
Vue.prototype.axios=axios;

var store = new Vuex.Store({
  state: {
    play: false
  },
  mutations: {
    changeplay(state,st) {
      state.play = st;
      // console.log(123);
      // console.log(state.play);
    }
  },
  getters: {
    getPlay(state) {
      return state.play;
    }
  }
});

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
