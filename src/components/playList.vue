<template>
  <div class="play-list inner-border">
    <span class="list-header" v-show="one" v-text="time"></span>
    <router-link class="list-header" to="/playList_one" v-show="!one">
      <span class="my-title">MOO Playlist_歌单</span>
      <img src="images/ic_round_arrow_back_ios_white_24px.png" alt />
    </router-link>
    <div class="lists">
      <div class="first-item">
        <router-link class="list-item" to="/playDetail">
          <img :src="list[0].l_img" alt class="listimg" />
          <tag :place="true" :tagName="list[0].t_name"></tag>
          <icon></icon>
        </router-link>
        <div class="first-info">
          <img src="images/ic_bk_text_20_plus_detail.png" alt />
          <span>{{list[0].l_describe}}</span>
        </div>
      </div>
      <div class="list-item">
        <div class="list-top">
          <img :src="list[1].l_img" alt class="listimg" />
          <tag :place="true" :tagName="list[1].t_name"></tag>
          <icon></icon>          
        </div>
        <span class="list-info">{{list[1].l_title}}</span>
      </div>
       <div class="list-item">
        <div class="list-top">
          <img :src="list[2].l_img" alt class="listimg" />
          <tag :place="true" :tagName="list[2].t_name"></tag>
          <icon></icon>          
        </div>
        <span class="list-info">{{list[2].l_title}}</span>
      </div>
    </div>
  </div>
</template>

<script>
import tag from "./tag";
import icon from "./musicIcon";
export default {
  data(){
    return {
      time:'',
      list:[
        {l_img:''},{l_img:''},{l_img:''}
      ]
    }
  },
  methods:{
    get_list(){
      this.axios.get("/playlist").then(result=>{
        this.list=result.data;
        this.time=this.list[0].l_time.slice(0,10)
      })
    }
  },
  components:{
    tag,icon
  },
  props:['one'],
  created(){
    this.get_list();
  }
};
</script>

<style scoped>
.first-item {
  display: flex;
}
.first-info {
  width: 50%;
}
.first-info img {
  width: 100%;
}
.first-info span {
  display: block;
  margin-top: 0.5rem;
  padding-left: 0.8rem;
  color: #999;
  font-size: 1rem;
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 2;
  overflow: hidden;
}
.lists .list-item:last-child {
  margin-left: 2%;
}
.lists > .list-item {
  margin-top: 0.8rem;
}
.lists {
  display: flex;
  flex-wrap: wrap;
}
.listimg {
  width: 100%;
  height: 100%;
}
.list-item {
  width: 49%;
  /* overflow: visible; */
  position: relative;
}
.list-top {
  position: relative;
  display: flex;
}
.list-info{
  overflow-wrap:break-word;
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 3;
  overflow: hidden; 
  margin-top: 0.3rem;
}

span.list-header{
  font-size: 1.2rem;
  padding:1rem 0;
}
.list-header {
  padding: 0.5rem 0;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.list-header img {
  width: 2rem;
  height: 2rem;
}
.play-list {
  margin-bottom: 1rem;
}
</style>