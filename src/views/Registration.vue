<template>
  <div class="login-img" :style=Height>
    <mt-header title="注册账号">
      <router-link to="/" slot="left">
        <mt-button icon="back"></mt-button>
      </router-link>
    </mt-header>
    <div class="login-input">
      <input type="text" placeholder="手机号" v-model="phone">
      <div class="input-user">
        <input type="text" placeholder="用户名" v-model="uname">
      </div>
      <div class="pd-top">
      <input type="password" placeholder="密码" v-model="upwd">
      </div>
    </div>
    <!-- <div class="login-code">
      <input type="text"><button>获取验证码</button>
    </div> -->
    <div class="login-btn" >
      <mt-button @click="reg">确 定</mt-button>
    </div>
  </div>
</template>
<script>
export default {
  data(){
    return{
      Height:{height:"0px"},
      phone:"",
      uname:"",
      upwd:""
    }
  },
  methods:{
    getH(){
      var h=window.innerHeight;
      this.Height.height=h+"px";
    },
    reg(){
      if(!this.phone){
        this.$toast({
          message: '手机号不能为空!',
          position: 'bottom',
          // className:'toasts'
        });
      }else if(!this.uname){
        this.$toast({
          message: '用户名不能为空!',
          position: 'bottom',
        })
      }else if(!this.upwd){
        this.$toast({
          message: '密码不能为空!',
          position: 'bottom',
        })
      }else{
        var obj={phone:this.phone,uname:this.uname,upwd:this.upwd}
        //ajax请求
        this.axios.post("/register",
          this.qs.stringify(obj)
        ).then(res=>{
          if(res.data.code==-1){
            this.$toast({
              message:'用户已存在',
              position:'bottom',
              // iconClass:'../../public/images/ic_selected_tick_form.png'
            })
          }else if(res.data.code==1){
            this.$toast({
              message:'注册成功',
              position:'bottom',
            })
          }
        })
        // this.axios.get(res=>{}).then(res=>{}).catch(err=>{})
      }
    }
  },
  created(){
    this.getH();
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
    /* background-color:#1a1a1a; */
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
    padding:5px;
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
  /* .login-code{
    display:flex;
    justify-content: center;
  }
  .login-code button{
    width:100px;
    color:#000;
    border-top-left-radius:5px;
    border-top-right-radius:5px;
    border:0;
    background-color: #ffe133;
    font-family:"Monospace";
  }
  .login-code input{
    width:200px;
  } */
  .input-user,.pd-top{
    padding-top:10px;
  }
  .login-btn{
    display:flex;
    flex-direction: column;
    align-items: center;
    margin-top:10px;
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
  /* .toasts{
    transform: scale(4) !important;
  } */
</style>