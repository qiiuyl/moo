<template>
  <div class="login-img" :style=Height>
    <!-- <mt-header title="登录">
      <router-link to="/Registration" slot="right">
        <mt-button icon="">注册</mt-button>
      </router-link>
    </mt-header> -->
    <back-header :title="'登录'"></back-header>
    <div class="login-input">
      <input type="text" placeholder="用户名" v-model="uname">
      <div class="pd-top">
      <input type="password" placeholder="密码" v-model="upwd">
      </div>
    </div>
    <div class="login-btn">
      <button @click="btn">登 录</button>
    </div>
    <div class="login-font">
      <a href="#" class="login-a">忘记密码?</a>
      <div class="login-link">
        <span><router-link to="/Registration">注册</router-link></span>
      </div>
    </div>
  </div>
</template>
<script>
import backHeader from "../components/back_header"
export default {
  data(){
    return{
      Height:{height:"0px"},
      uname:"",
      upwd:""
    }
  },
  methods:{
    getH(){
      var h=window.innerHeight;
      this.Height.height=h+"px";
    },
    btn(){
      if(!this.uname){
        this.$toast({
          message:'用户名不能为空',
          position:"bottom"
        })
      }else if(!this.upwd){
        this.$toast({
          message:'密码不能为空',
          position:'bottom'
        })
      }else{
        var obj={uname:this.uname,upwd:this.upwd};
        this.axios.post("./login",
        this.qs.stringify(obj)).then(res=>{
          if(res.data.code==-2){
            this.$toast({
              message:'用户名或密码错误',
              position:'bottom'
            })
          }else if(res.data.code==2){
            this.$toast({
              message:'登录成功',
              position:'bottom'
            }).then(res=>{
              this.$router.push("/user");
            })
          }
        })
      }
    }    
  },
  created(){
    this.getH();
  },
  components:{
    backHeader
  }
}
</script>
<style scoped>
  .login-img{
    background: url("../../public/images/bglogin.jpg") no-repeat;
    width:100%;
    overflow: hidden;
    /* background-size:cover; */
    background-size:100% 100%;
  }
  .mint-header{
    background-color:rgba(248, 244, 244, 0);
  }
  .mint-header /deep/ .mint-header-title{
    font-size:16px;
  }
  .mint-header .mint-button{
    font-size:16px;
  }
  .login-input{
    display:flex;
    flex-direction: column;
    align-items: center;
    margin-top: 160px;
    margin-bottom:20px;
  }
  .login-input input{
    background:transparent;
    width:300px;
    height:35px;
    border:0;
    color:#fff;
    border-bottom:1px solid #fff;
    padding-left:5px;
    box-sizing: border-box;
  }
  .login-input input:focus{
    border: 0;
    outline: 0;
    box-shadow: none;
    cursor:text;
    color:#fff;
    border-bottom:1px solid #fff;
  }
  /* .input-one{
    border-top-left-radius:5px;
    border-top-right-radius:5px;
  }
  .input-two{
    border-bottom-left-radius:5px;
    border-bottom-right-radius:5px;
  } */
  .pd-top{
    padding-top:10px;
  }
  .login-btn{
    display:flex;
    flex-direction: column;
    align-items: center;
  }
  .login-btn button{
    width:300px;
    height:40px;
    color:#000;
    border-radius:5px;
    border:0;
    background-color: #ffe133;
    font-family:"Monospace";
  }
  .login-font{
    display: flex;
    justify-content: center;
    text-align: center;
    margin-top:25px;
  }
  .login-font /deep/ .login-a{
    padding-left:90px;
  }
  .login-link span{
    margin-left:50px;
  }
</style>