import Vue from "vue";
import Router from "vue-router";
import index from "./views/index"
import tagpage from "./views/tagpage"
import palyListDetail from "./components/palyListDetail";
import videoDetail from "./components/videoDetail";
import singer from "./components/singer";
Vue.use(Router);

export default new Router({
  routes: [
    { path: "/", component: index },
    { path: "/index", component: index },
    { path: "/palyListDetail", component: palyListDetail },
    { path: "/videoDetail", component: videoDetail },
    { path: "/tagpage", component: tagpage },
    { path: "/singer", component: singer },
  ]
});
