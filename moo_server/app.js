//app.js 服务器端项目
//将第三方模块引入到当前程序中
const express = require("express");
const session = require("express-session");
const cors = require("cors");
const bodyParser = require('body-parser');
const pool = require('./pool.js');
//创建web服务器监听 8080 端口
var server = express();
server.listen(8080);
//处理跨域cors 
server.use(cors({
  origin: ["http://127.0.0.1:5050", "http://localhost:5050", "http://localhost:8081","http://176.122.14.70:8080"],
  credentials: true
}))
//配置session,#session配置一定要在所有请求之前
server.use(session({
  secret: "128位字符串",    //#安全字符串
  resave: true,            //#每次请求保存数据 
  saveUninitialized: true  //#保存初始化数据
}));
//配置静态目录
server.use(express.static("public"));
//使用body-parser中间件
server.use(bodyParser.urlencoded({
  extended: false
}));

//测试服务器接口
server.get("/exam", (req, res) => {
  res.send("你好");
})

// 轮播图接口
server.get("/carousel", (req, res) => {
  var sql = "SELECT img,listID,l_tag,l_describe,lid,l_img,l_video,l_title FROM carousel,list WHERE listID=lid";
  pool.query(sql, (err, result) => {
    if (err) throw err;
    var obj = result;
    for (var i = 0, a = []; i < result.length; i++) {
      a.push(parseInt(result[i]["l_tag"]))
    }
    var sql1 = "SELECT t_id,t_name FROM tag WHERE t_id IN (?,?,?,?)";
    pool.query(sql1, a, (err, result) => {
      if (err) throw err;
      for (n = 0, obj1 = []; n < result.length; n++) {
        obj1.push({ ...obj[n], ...result[n] })//歌单的轮播图接口
      }
      var sql2 = "SELECT img,c_status,st_id,s_id,s_name,s_video,s_tag,s_describe,s_AlbumID,a_name,a_id,a_describe,a_singer,a_time FROM carousel,status,song,album WHERE c_status=st_id=s_status AND c_status=1 AND s_tag='2' AND s_AlbumID=a_id"
      pool.query(sql2, (err, result) => {
        if (err) throw err;
        var obj2 = result;
        var sql3 = "SELECT t_id,t_name FROM tag WHERE t_id=2"
        pool.query(sql3, (err, result) => {
          if (err) throw err;
          obj2.push({ ...obj2[0], ...result[0] });
          var sql4 = "SELECT v_id,v_name,v_describe,v_tag,v_singer,v_img FROM hotVideo WHERE v_tag='6'"
          pool.query(sql4, (err, result) => {
            if (err) throw err;
            var obj4 = result;
            var sql5 = "SELECT t_id,t_name FROM tag WHERE t_id=6"
            pool.query(sql5, (err, result) => {
              if (err) throw err;
              obj4.push(result)
              res.send([obj1, obj2[1], obj4]);//歌单的轮播图接口+新歌的专辑轮播图接口+视频接口
            })
          })
        })
      })
    })
  })
})

//个性好歌接口
server.get("/Recommend",(req,res)=>{
  var sql="SELECT s_id,s_status,s_name,s_video,st_name, s_img FROM song,status WHERE s_status=st_id AND st_id=2 ORDER BY s_id DESC"
  pool.query(sql,(err,result)=>{
    res.send(result)
  })
})

//dis页面歌单的接口点进去这个歌单的详情
server.get("/playlist",(req,res)=>{
  var sql="SELECT lid,l_describe,l_time,l_Fabulous,l_play,l_Collection,l_tag,l_img,l_video,l_title,l_comment FROM list WHERE l_ishot=1"
  pool.query(sql,(err,result)=>{
    var obj=result;
    for(var i=0,arr=[];i<result.length;i++){
      arr.push(parseInt(result[i]["l_tag"]))
    }
    var sql1="SELECT t_id,t_name FROM tag WHERE t_id IN (?,?,?)"
    pool.query(sql1,arr,(err,result)=>{
      for(var n=0,obj1=[];n<result.length;n++){
        obj1.push({...obj[n],...result[n]})
      }
      res.send(obj1)
    })
  })
})

//新歌列表的接口
server.get("/newsong",(req,res)=>{
  var sql="SELECT s_id,s_name,s_video,s_singerID,singer_name,s_img,s_status FROM song,singer WHERE s_singerID=singer_id AND s_status=1"
  pool.query(sql,(err,result)=>{
    res.send(result)
  })
})

// 歌手的接口
server.get("/singer",(req,res)=>{
  var sql="SELECT singer_id,singer_name,singer_intr,singer_fans,singer_video,singer_affect,singer_beaffected,likeSinger FROM singer WHERE singer_id=1"
  pool.query(sql,(err,result)=>{
    var arr1=result[0]["singer_affect"];
    arr1=arr1.split("/");
    var arr2=result[0]["singer_beaffected"];
    arr2=arr2.split("/");
    var arr3=result[0]["likeSinger"];
    arr3=arr3.split("/");
    var arr4=[];
    arr4.concat(arr1,arr2,arr3)
    res.send(arr4);
    // var sql2="SELECT singer_id,singer_img,singer_name FROM singer WHERE singer_id IN ()"
  })
})

//热度视频的接口
server.get("/hotVideo",(req,res)=>{
  var sql="SELECT v_id,v_name,v_describe,v_tag,v_img,v_Subheading FROM hotVideo"
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    var obj=result;
    for(var i=0,arr=[];i<result.length;i++){
      arr.push(parseInt(result[i]["v_tag"]));
    }
    var sql1="SELECT t_id,t_name FROM tag WHERE t_id IN (?,?,?,?,?,?,?)"
    pool.query(sql1,arr,(err,result)=>{
      if(err) throw err;
      for(var n=0,obj1=[];n<result.length;n++){
        obj1.push({...obj[n],...result[n]})
      }
      res.send(obj1)
    })
  })
})