import Vue from "vue";
import Router from "vue-router";
import index from "./views/index"


import playListDetail from "./components/playListDetail";
import videoDetail from "./components/videoDetail";

import mooTrack from "./components/mooTrack";
import tagpage from "./views/tagpage";
import album_one from "./components/album_one";
import singer from "./components/singer";
import user from "./components/user";
import header from "./components/back_header";
import test from "./components/test";
import album from "./components/album";
import albumDetail from "./components/albumDetail";

Vue.use(Router);

export default new Router({
  routes: [
    { path: "/", component: index },
    { path: "/index", component: index },
    
    { path: "/videoDetail", component: videoDetail },
    { path: "/album", component: album },
    { path: "/album_one", component: album_one },
    { path: "/playListDetail", component: playListDetail },
    { path: "/albumDetail", component: albumDetail },

  ]
});
