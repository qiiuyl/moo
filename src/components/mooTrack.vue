<template>
  <div class="inner-border">
    <back-header :title="'歌单列表'"></back-header>
    <!-- 头部背景图 -->
    <div class="bg-image">
      <div>
        <h5>{{time}}</h5>
        <h3>MOO Track 新歌</h3>
      </div>
    </div>
    <!-- 按钮+图片 -->
    <song-list :songlist="list"></song-list>
  </div>
</template>
<script>
import songList from "./mooTrack_one";
export default {
  data() {
    return {
      showSelect: false,
      list: [],
      time: ""
    };
  },
  methods: {
    get_time() {
      this.time = new Date().toLocaleDateString();
      
    },
    get_list() {
      this.axios.get("/newsong").then(result => {
        this.list = result.data;
      });
    },
    changeShow() {
      this.showSelect = !this.showSelect;
    }
  },
  components: {
    songList
  },
  created() {
    this.get_list();
    this.get_time();
  }
};
</script>
<style scoped>
.playbtn{
  border: 0;
  outline: 0;
  background:#ffe133;
  border-radius: 1rem;
  padding:0 1rem;
}
.playbtn img{
  width: 1.5rem;
}
.bg-image {
  margin: 0 -3%;
}
.bg-image div {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  justify-content: flex-end;
  height: 15rem;
  background: url("../../public/images/detail_moo_track_header_bg.png")
    no-repeat;
  background-size: cover;
}

.bg-image h3,h5 {
  margin:0 0 0.5rem 1rem; 
}
.bg-image h3 {
  font-family: "PaulGroteskSoft";
}
/* .mint-header {
  background: transparent;
  padding: 0px;
}
.router-link-active img {
  width: 2rem;
  transform: rotateY(180deg);
  position: relative;
}
.mint-button-text .btn {
  transform: rotateY(360deg);
  width: 1.25rem;
  position: relative;
  left: 0px;
}
.mint-button--default {
  background-color: #fff133;
  width: 3.75rem;
  height: 1.875rem;
  border-radius: 1.25rem;
} */
span {
  margin-left: 0.625rem;
  font-size: 1rem;
  font-family: "PaulGroteskSoft";
  color: #d3d3d3;
}
.Finished {
  width: 1.8rem;
  transform: rotateY(360deg);
}
.disflex {
  align-items: center;
  display: flex;
  justify-content: space-between;
  margin-top: 1.25rem;
  margin-bottom: 1.25rem;
}
.left{
  display: flex;
  align-items: center;
}
.distwo {
  display: flex;
}
</style>