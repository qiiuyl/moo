<template>
  <div class="playlist-detail inner-border">
    <back-header :backcolor="true" :more="true" :share="true"></back-header>
    <div class="top-fill"></div>
    <search :place="false"></search>
    <div class="list-cover">
      <img :src="album.a_img" alt class="list-img" />
      <music-icon></music-icon>
    </div>
    <div class="list-info">                            <!-- slice 截取 -->
        <span class="my-small bold" v-text="album.a_time.slice(0,10)"></span>
      <!-- <div class="title">
        <span v-text="album.a_name"></span>
        <img src="images/ic_user_profile_favor.png" alt />
      </div> -->
      <div class="user">
        <img :src="singer.singer_img" alt />
        <span class="username my-small" v-text="singer.singer_name"></span>
      </div>
      <div class="my-small size">114播放 2收藏</div>
      <div class="my-small subtitle" v-text="album.a_describe"></div>
    </div>
    <song-list :songlist="sing" :hiddenimg="true"></song-list>
  </div>
</template>

<script>
import search from "./search";
import musicIcon from "./musicIcon";
import tag from "./tag";
import songList from "./mooTrack_one";
export default {
  data() {
    return {
      width: 0,
      show_select: false,
      select_list: [],
      album:{
        a_time:''
      },
      singer:{},
      sing:[]
    };
  },
  components: {
    search,
    musicIcon,
    tag,
    songList
  },
  props:['aid'],
  methods: {
    get_list() {
      this.axios.get("/albumDetail?aid="+this.aid).then(result => {
        // console.log(result.data);
        this.album=result.data[0][0];
        this.singer=result.data[1][0];
        this.sing=result.data[2];
        // console.log(this.album);
        // console.log(this.singer);
        // console.log(this.sing);
      });
    },
    change_select() {
      this.show_select = !this.show_select;
      // console.log(this.select_list)
    }
  },
  created() {
    this.get_list();
  },
  mounted() {
    
  }
};
</script>

<style scoped>
.playlist-detail{
  padding-bottom: 5rem;
}
.tag-box {
  width: 100%;
  overflow: hidden;
}
.tags {
  /* width: 500%; */
  margin-top: 0.8rem;
  display: flex;
}
.tags > div {
  margin-left: 0.5rem;
}
.subtitle {
  margin-top: 0.5rem;
  line-height: 1rem;
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 2;
  overflow: hidden;
}
.user img {
  width: 2.2rem;
  vertical-align: middle;
  border-radius: 50%;
}
.user span {
  margin-left: 0.8rem;
}
.list-cover {
  position: relative;
  width: 60%;
  margin: 0 auto;
  margin-top: 1rem;
}
.list-cover img:first-child {
  width: 100%;
}
.backicon {
  transform: rotate(180deg);
}
.mint-button-icon {
  background-color: #fff;
}
.mint-header {
  height: 3.7rem;
  padding: 0;
  background-color: transparent;
}
.mint-button-text > img {
  vertical-align: middle;
  width: 2rem;
}
.list-info {
  margin-top: 1rem;
}
.title {
  display: flex;
}
.list-info .title span {
  width: 90%;
}
.list-info .title img {
  width: 10%;
}
.bold{
  font-weight:800;
  font-size:0.87rem;
}
.size{
  margin-top:0.93rem;
  margin-bottom:0.93rem;
  font-size:0.75rem;
}
</style>