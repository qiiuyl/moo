<template>
  <div class="search inner-border" ref="sc">
      <input type="text" v-model="value" class="search-input">
  </div>
</template>
<script>
export default {
  data(){
    return {
      value:""
    }
  },
  methods:{
   scoll(){
    //  注意此处内this只想window  想指向vue则需要用箭头函数
     window.onscroll=()=>{
      //  兼容写法
      var scrollTop=document.documentElement.scrollTop||document.body.scrollTop;
      // 如果滑动距离大于100则搜索框高度为0
      if(scrollTop>=200){
        this.$refs.sc.style.height=0;
      }else{//否则为3rem;
        this.$refs.sc.style.height='3rem';
      }
    }
   } 
  },
  created(){
    this.scoll();
  }
}
</script>
<style scoped>
  .search{
    /* background: #fff; */
    height: 3rem;
    display: flex;
    align-items: center; 
    /* border: 1px solid #fff; */
    position: fixed;
    z-index: 1;
    width: 100%;
    left: 0;
    top: 3.7rem;
    background: #1a1a1a;
    transition: height 0.3s linear;
  }
  .search-input{
    width: 100%;
    height: 50%;
    border-radius:1.5rem; 
    border: 0;
    background:url("../../public/images/ic_search_white_30dp.png") #000 no-repeat 0.5rem;
    background-size: 1.6rem;
    color: #fff;
    padding: 0;
    padding-left: 2.5rem;
  }
  .search-input:focus{
    outline: 0;
  }
</style>