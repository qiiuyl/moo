//app.js 服务器端项目
//将第三方模块引入到当前程序中
const express= require("express");
const session = require("express-session");
const cors = require("cors");
const bodyParser=require('body-parser');
const pool=require('./pool.js');
//创建web服务器监听 8080 端口
var server = express();
server.listen(8080);
//处理跨域cors 
server.use(cors({
  origin:["http://127.0.0.1:5050","http://localhost:5050","http://localhost:8081"],
  credentials:true
}))
//配置session,#session配置一定要在所有请求之前
server.use(session({
   secret:"128位字符串",    //#安全字符串
   resave:true,            //#每次请求保存数据 
   saveUninitialized:true  //#保存初始化数据
}));
//配置静态目录
server.use(express.static("public"));
//使用body-parser中间件
server.use(bodyParser.urlencoded({
  extended:false
}));

//测试服务器接口
server.get("/exam",(req,res)=>{
    res.send("你好");
})