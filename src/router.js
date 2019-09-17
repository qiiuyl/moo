import Vue from "vue";
import Router from "vue-router";
import index from "./views/index";
import mooTrack from "./components/mooTrack";

Vue.use(Router);

export default new Router({
  routes: [
    {path: "/",component: index},
    {path: "/index",component: index},
    {path: "/mooTrack",component:mooTrack}
  ]
});
