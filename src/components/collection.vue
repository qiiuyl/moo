<template>
  <div>
    <mt-header title="收藏">
      <router-link to="/" slot="left">
        <mt-button icon="back"></mt-button>
      </router-link>
      <mt-button icon slot="right"></mt-button>
    </mt-header>
    <div>
      <mt-navbar v-model="selected">
        <mt-tab-item id="1">歌曲</mt-tab-item>
        <mt-tab-item id="2">艺人</mt-tab-item>
        <mt-tab-item id="3">专辑</mt-tab-item>
      </mt-navbar>
      <mt-tab-container v-model="selected">
        <mt-tab-container-item id="1">
          <mooTrack></mooTrack>
        </mt-tab-container-item>
        <mt-tab-container-item id="2">
          <artist></artist>
        </mt-tab-container-item>
        <mt-tab-container-item id="3">
          <artistone></artistone>
        </mt-tab-container-item>
      </mt-tab-container>
    </div>
  </div>
</template>
<script>
import artist_one from "./artist_one";
import artist from "./artist";
import mooTrack_one from "./mooTrack_one";
export default {
  components:{
      "mooTrack":mooTrack_one,
      "artist":artist,
      "artistone":artist_one
  },
  data(){
    return {
      selected:"1",
    }
  } 
};
</script>
<style scoped>
.mint-header /deep/ h1{
  font-size:1rem;
}
.mint-header {
  background-color: #1a1a1a;
}
.mint-navbar {
  background: #1a1a1a;
}
.mint-navbar .mint-tab-item.is-selected {
  border-bottom: 3px solid #fff;
  color: #fff;
  margin-bottom: 0.18rem;
}
.mint-tab-item /deep/.mint-tab-item-label {
  color: inherit;
  font-size:1rem;
}
</style>