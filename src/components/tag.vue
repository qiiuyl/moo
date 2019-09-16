<template>
<div>
	<router-link to="/" class="my-small list-tag" :class="place?'place':''">#是个标签1</router-link>
</div>
</template>

<script>
export default {
  props:['place'],
  created(){
    console.log(this.place);
  }
}
</script>

<style scoped>
	.list-tag {
  display: table;
  background: #ffe133;
  border-radius: 2rem;
  color: #000;
  padding: 0.5rem 1rem;
}
.place{
  position: absolute;
  bottom: 0;
  left: 0;
  z-index: 1;
}
</style>