import Vue from "vue";
import Router from "vue-router";
import index from "./views/index"
import playListDetail from "./components/playListDetail";
import videoDetail from "./components/videoDetail";
import playList_one from "./components/playList_one";
import mooTrack from "./components/mooTrack";
import tagpage from "./views/tagpage";
import album_one from "./components/album_one";
import singer from "./components/singer";
import user from "./components/user";
import header from "./components/back_header";
import test from "./components/test";

Vue.use(Router);

export default new Router({
  routes: [
    { path: "/", component: index },
    { path: "/index", component: index },
    { path: "/videoDetail", component: videoDetail },
    { path: "/videoDetail", component: videoDetail }
  ]
});
