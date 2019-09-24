<template>
  <div class="inner-border">
    <div class="artist-span">
      <span>2</span>
    </div>
    <div class="aritst-border">
      <img src="images/01artist.jpg" alt="">
      <h4>Tizzy T</h4>
    </div>
    <div class="aritst-img">
      <img src="images/02artist.jpg" alt="">
      <h4>周杰伦</h4>
    </div>
  </div>
</template>

<script>
export default {

}
</script>

<style scoped>
  .artist-span{
    margin-top:1.25rem;
    margin-bottom:1.5rem;
  }
  span{
    font-size:1.06rem;
    font-family: "PaulGroteskSoft";
    color: #d3d3d3;
  }
  .aritst-border{
    display:flex;
    margin-bottom:1.25rem;
  }
  h4{
    position: relative;
    left:2.18rem;
  }
  img{
    width:16%;
    border-radius: 50%;
    vertical-align: middle;
  }
  .aritst-img{
    display:flex;
    margin-bottom:1.25rem;
  }
</style>