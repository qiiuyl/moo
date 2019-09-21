<template>
  <div class="inner-border">
    <div class="artist-span">
      <span>2</span>
    </div>
    <div class="aritst-border">
      <img src="images/01artist.jpg" alt=""><h4>Tizzy T</h4>
      <!-- <img src="images/02artist.jpg" alt=""><h4>周杰伦</h4> -->
    </div>
  </div>
</template>

<script>
export default {

}
</script>

<style scoped>
  span{
    font-size:2rem;
    font-family: "PaulGroteskSoft";
    color: #d3d3d3;
  }
  .aritst-boredr{
    display: flex;
  }
  h4{
    margin-top:0rem;
    margin-bottom:0rem;
  }
  .aritst-border img{
    width:50px;
    border-radius: 50%;
    display:flex;
    vertical-align: middle;
  }
</style>