<template>
  <div class="album inner-border">
    <!-- <h1>123456</h1> -->
    <router-link class="list-header" to="/album_one">
      <span class="my-title">MOO Album_专辑</span>
      <img src="images/ic_round_arrow_back_ios_white_24px.png" alt />
    </router-link>
    <album-item :obj="list[0]"></album-item>
    <span class="first-text" v-text="list[0].a_describe"></span>
    <album-item :obj="list[1]"></album-item>
    <album-item :obj="list[2]"></album-item>
  </div>
</template>

<script>
import albumItem from "./albumItem";
export default {

  data() {
    return {
      list:[
        {a_describe:''},{a_describe:''},{a_describe:''}
      ]
    };
  },
  methods: {
    getlist(){
      this.axios.get("/hotAlbum").then(res=>{
        this.list=res.data;
        console.log(res.data);
      });
    }
  },
  components: {
    albumItem
  },
  created() {
    this.getlist()
  }
};
</script>

<style scoped>
.first-text {
  display: block;
  color: #999;
  font-size: 0.8rem;
  margin: 0.5rem 0 1rem 0;
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
</style>