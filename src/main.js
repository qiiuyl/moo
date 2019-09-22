import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import mintUI from 'mint-ui'//配置mintui
import axios from "axios"//配置axios

Vue.config.productionTip = false
import "mint-ui/lib/style.css";//引入mintui样式 
// 配置axios默认基础路径
axios.defaults.baseURL = "http://192.168.1.104:5050";
// 注册mintUI
Vue.use(mintUI);
// 注册axios
Vue.prototype.axios=axios;

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
