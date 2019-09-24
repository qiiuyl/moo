import Vue from "vue";
import Router from "vue-router";
import index from "./views/index"
import palyListDetail from "./components/palyListDetail";
import videoDetail from "./components/videoDetail";
// import user from "./components/user";
// import set from "./components/set";
// import setData from "./components/setData";
// import setabout from "./components/setabout";
Vue.use(Router);

export default new Router({
  routes: [
    { path: "/", component: index },
    { path: "/index", component: index },
    { path: "/palyListDetail", component: palyListDetail },
    { path: "/videoDetail", component: videoDetail }
    // { path: "/user", component: user },
    // { path: "/set", component: set },
    // { path: "/setData", component: setData },
    // { path: "/setabout", component: setabout }
  ]
});
