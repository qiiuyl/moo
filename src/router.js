import Vue from "vue";
import Router from "vue-router";



import index from "./views/index"
import mooTrack from "./components/mooTrack";
import collection from "./components/collection";
import artist from "./components/artist";
import songItem from "./components/songItem.vue";


Vue.use(Router);

export default new Router({
  routes: [
    { path: "/", component: index },
    { path: "/index", component: index },

    { path: "/mooTrack", component: mooTrack },
    { path: "/collection", component: collection },
    { path: "/artist", component: artist },
    { path: "/songItem", component: songItem },
  ]
});
