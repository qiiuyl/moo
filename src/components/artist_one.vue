<!-- 收藏页 -->
<template>
  <div class="inner-border">
    <div class="artist-span">
      <span>2</span>
      <img src="images/ic_list_operation_batch_white_30dp.png" alt="" @click="changeShow">
    </div>
    <div class="t-img">
      <div class="song-checked" v-show="is_select" :style="is_select?'width:10%':'width:0'">
      <input type="checkbox"/>
      </div>
      <img src="images/dddac9796296000d11b1a5dbf51c36c.jpg" alt="" class="top-img">
      <img src="images/album_vinyl.png" alt="" class="bottom-img">
      <div class="tizzy-t">
        <h4>你的男孩</h4>
        <p>8首 • Tizzy T(T-T)</p>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data(){
    return{
      is_select:false
    }
  },
  methods:{
    changeShow(){
      this.is_select=!this.is_select;
    }
  },
}
</script>
<style scoped>
  .artist-span{
    display: flex;
    margin-top:1.25rem;
    margin-bottom:1.5rem;
    justify-content: space-between;
  }
  span{
    font-size:1.06rem;
    font-family: "PaulGroteskSoft";
    color: #d3d3d3;
    line-height:1.87rem;
  }
  .artist-span img{
    width:2rem;
  }
  .t-img{
    display:flex;
  }
  .top-img{
    width:6.25rem;
  }
  .bottom-img{
    width:0.87rem;
  }
  .t-img p{
    margin: 0;
  }
  .tizzy-t{
    display: flex;
    flex-direction:column;
    justify-content:center;
    margin-left:2rem;
  }
  .song-checked{
    margin:0.62rem;
    display:flex;
    align-items: center;
  }
  .song-checked input{
    /* display:flex; */
    width:20px;
    height:20px;
    background-color: transparent;
    border: 1px solid #c9c9c9;
    -webkit-appearance: none;
    border-radius: 50%;
    outline: none;
  }
  .song-checked input[type="checkbox"]:checked {
    background: url("../../public/images/scan_finish_icon.png") no-repeat center
      center;
    background-size: cover;
    border: 0;
}
</style>