<template>
  <div class="song-item">
    <div class="song-info"></div>
    <div class="more">
      <button @click="changeAction">展开</button>
      <mt-actionsheet :actions="actions" v-model="sheetVisible"></mt-actionsheet>
    </div>
  </div>
</template>

<script>
export default {
  data(){
    return {
      sheetVisible:false,
      actions:[
        {name:`下一首播放`,method(){console.log(123)}},
        {name:'下一首播放',method(){console.log(123)}},
        {name:'下一首播放',method(){console.log(123)}},
        {name:'下一首播放',method(){console.log(123)}},
        {name:'下一首播放',method(){console.log(123)}},
        {name:'下一首播放',method(){console.log(123)}},
        {name:'下一首播放',method(){console.log(123)}},
        {name:'下一首播放',method(){console.log(123)}},
        {name:'下一首播放',method(){console.log(123)}},
        {name:'下一首播放',method(){console.log(123)}},
        ]
    }
  },
  methods:{
    changeAction(){
      this.sheetVisible=true;
    }
  }
};
</script>

<style scoped>
</style>