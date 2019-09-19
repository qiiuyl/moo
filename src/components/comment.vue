<template>
  <div class="comment position" ref="comment">
    <span class="new-comment">最新评论</span>
    <ul class="comment-list inner-border">
      <li class="comment-item">
        <div class="ueseinfo">
          <div class="left">
            <img src="images/user.jpg" alt />
            <div class="left-info">
              <span class="username">小脑斧</span>
              <span class="time my-small">30分钟前</span>
            </div>
          </div>
          <div class="right">
            <span class="comment-count">0</span>
            <img src="images/good.png" alt />
          </div>
        </div>
				<div class="comment-main">
					这是一条评论的评论这是一条评论的评论这是一条评论的评论这是一条评论的评论这是一条评论的评论这是一条评论的评论这是一条评论的评论
				</div>
      </li>
			<li class="comment-item">
        <div class="ueseinfo">
          <div class="left">
            <img src="images/user.jpg" alt />
            <div class="left-info">
              <span class="username">小脑斧</span>
              <span class="time my-small">30分钟前</span>
            </div>
          </div>
          <div class="right">
            <span class="comment-count">0</span>
            <img src="images/good.png" alt />
          </div>
        </div>
				<div class="comment-main">
					这是一条评论的评论这是一条评论的评论这是一条评论的评论这是一条评论的评论这是一条评论的评论这是一条评论的评论这是一条评论的评论
				</div>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
	data(){
		return {
			open:true
		}
	},
	methods:{
		
	}
};
</script>

<style scoped>
.comment{
	overflow: hidden;
	width: 0;
	transition: width 1s linear;
}
.position{
	position: fixed;
	/* width: 100%; */
	/* padding: 0; */
	height: 100%;
	left: 0;
	top: 0;
	background: #1a1a1a;
}
.comment-item {
  margin-top: 1rem;
	border-bottom: 1px solid #171717;
}
.left img {
  width: 2.5rem;
  border-radius: 50%;
}
.right img {
  width: 1.2rem;
  border-radius: 0;
}
.right span {
  margin-right: 0.5rem;
  opacity: 0.6;
}
.username {
  font-size: 0.9rem;
  display: block;
	
}
.ueseinfo {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.left {
  display: flex;
	align-items: center;
}
.left-info {
  /* display: flex; */
	margin-left:0.5rem;
}
.comment-main{
	padding-left:2.5rem; 
	margin: 0.5rem 0;
}
</style>