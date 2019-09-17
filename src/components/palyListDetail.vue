<template>
  <div class="playlist-detail inner-border">
    <mt-header :title="true?'':''">
      <router-link to="/" slot="left">
        <mt-button>
          <img src="images/ic_round_arrow_back_ios_white_24px.png" alt class="backicon" />
        </mt-button>
      </router-link>
      <mt-button slot="right">
        <img src="images/ic_bk_share_story.png" alt />
      </mt-button>
      <mt-button slot="right">
        <img src="images/ic_bk_more_horizontal_fat_white_48dp.png" alt />
      </mt-button>
    </mt-header>
    <search :place="false"></search>
    <div class="list-cover">
      <img src="images/IMG_3601.GIF" alt class="list-img" />
      <music-icon></music-icon>
    </div>
    <div class="list-info">
      <div class="title">
        <span>音乐让贫穷的我精神富足够起来</span>
        <img src="images/ic_user_profile_favor.png" alt />
      </div>
      <div class="user">
        <img src="images/album_vinyl_full.png" alt />
        <span class="username my-small">用户名123456</span>
      </div>
      <div
        class="my-small subtitle"
      >我也不知道写些什么就随便vi按撒犯得上广泛受到我也不知道写就随便vi按撒犯得上广泛受到我也不知道写就随便vi按撒犯得上广泛受到我也不知道写些什么就随便vi按撒犯得上广泛受到</div>
    </div>
    <div class="tag-box">
      <div class="tags">
        <tag :place="false"></tag>
        <tag :place="false"></tag>
        <tag :place="false"></tag>
        <tag :place="false"></tag>
        <tag :place="false"></tag>
        <tag :place="false"></tag>
        <tag :place="false"></tag>
        <tag :place="false"></tag>
      </div>
    </div>
  </div>
</template>

<script>
import search from "./search";
import musicIcon from "./musicIcon";
import tag from "./tag";
export default {
  components: {
    search,
    musicIcon,
    tag
  }
};
</script>

<style scoped>
.tag-box{
	width: 100%;
}
.tags {
  width: 500%;
  margin-top: 0.8rem;
  display: flex;
  overflow: scroll;
}
.subtitle {
  margin-top: 0.5rem;
  line-height: 1rem;
  display: -webkit-box;
  -webkit-box-orient: vertical;
  -webkit-line-clamp: 2;
  overflow: hidden;
}
.user img {
  width: 2.2rem;
  vertical-align: middle;
}
.user span {
  margin-left: 0.8rem;
}
.list-cover {
  position: relative;
  width: 60%;
  margin: 0 auto;
  margin-top: 1rem;
}
.list-cover img:first-child {
  width: 100%;
}
.backicon {
  transform: rotate(180deg);
}
.mint-button-icon {
  background-color: #fff;
}
.mint-header {
  height: 3.7rem;
  padding: 0;
  background-color: transparent;
}
.mint-button-text > img {
  vertical-align: middle;
  width: 2rem;
}
.list-info {
  margin-top: 1rem;
}
.title {
  display: flex;
}
.list-info .title span {
  width: 90%;
}
.list-info .title img {
  width: 10%;
}
</style>