<template>
  <div id="album">
    <div class="album-img">
      <img class="bg-img" src="../../public/images/album_vinyl_full.png" alt="">
      <img class="top-img" src="../../public/images/playlist.jpg" alt="">
    </div>
    <p>健康歌曲</p>
    <p>2017-10-06</p>
  </div>
</template>
<style scoped>
  #album{
    width:45%;
    height:12rem;
    position: relative;
    margin:0.5rem 0;
    overflow:hidden;
  }
  .album-img{
    position: relative;
    width:100%;
  }
  .album-img img{
    width:80%;
    position:absolute;
  }
  .album-img .bg-img{
    left:1.5rem;
  }
  .album p{
    position:absolute;
    top:8rem;
    font-weight:400;
  }
  .album p+p{
    top:9.5rem;
    color:#666;
    font-size:10pt;
  }
</style>