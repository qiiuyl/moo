<template>
  <div>
    <mt-header title="歌单">
      <router-link to="/" slot="left">
        <mt-button icon="back"></mt-button>
      </router-link>
      <mt-button icon slot="right"></mt-button>
    </mt-header>
    <div>
      <mt-navbar v-model="selected">
        <mt-tab-item id="1">自建</mt-tab-item>
        <mt-tab-item id="2">收藏</mt-tab-item>
      </mt-navbar>
      <mt-tab-container v-model="selected">
        <mt-tab-container-item id="1">
          <collection></collection>
        </mt-tab-container-item>
        <mt-tab-container-item id="2">
          <songItem></songItem>
          <songItem></songItem>
          <songItem></songItem>
          <songItem></songItem>
        </mt-tab-container-item>
      </mt-tab-container>
    </div>
  </div>
</template>
<script>
import collection_songlistone from "./collection_songlistone";
import songItem from "./songItem";
export default {
  data(){
    return{
      selected:"1",
    }
  },
  components:{
    "collection":collection_songlistone,
    "songItem":songItem
  }
}
</script>
<style scoped>
  .mint-header /deep/ h1{
  font-size:16px;
}
.mint-header {
  background-color: #1a1a1a;
}
.mint-navbar {
  background: #1a1a1a;
  width:240px;
}
.mint-navbar .mint-tab-item.is-selected {
  border-bottom: 3px solid #fff;
  color: #fff;
  margin-bottom: -3px;
}
.mint-tab-item /deep/.mint-tab-item-label {
  color: inherit;
  font-size:16px;
}
.mint-navbar .mint-tab-item.is-selected:hover{
  background-color:#242323;
}
</style>