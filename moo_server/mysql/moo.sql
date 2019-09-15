SET NAMES UTF8;
DROP DATABASE IF EXISTS moo;
CREATE DATABASE moo CHARSET=UTF8;
USE moo;

/**轮播图表**/
CREATE TABLE carousel(
  cid      INT  PRIMARY KEY AUTO_INCREMENT,   #轮播图图片id
  img      VARCHAR(128),                      #轮播图路径
  title    VARCHAR(30),                       #轮播图图片的名称
  listID   INT                                #对应的歌单(外键歌单表)
);

/**歌曲大全表**/
CREATE TABLE song(
  s_id         INT PRIMARY KEY AUTO_INCREMENT,   #歌曲id
  s_name       VARCHAR(30),      #歌曲名字
  s_video      VARCHAR(200),     #歌曲对应的音频
  s_word       VARCHAR(600),     #歌曲对应的歌词
  s_lyricist   VARCHAR(10),      #歌曲的作词者
  s_Composer   VARCHAR(10),      #歌曲的作曲者
  s_singerID   INT,              #歌曲的演奏者(外键歌手表)
  s_AlbumID    INT,              #歌曲所在的专辑(外键专辑表)
  s_mv         VARCHAR(128),     #歌曲所对应的MV
  s_tag        VARCHAR(200),     #歌曲所对应的标签(得到标签的id,然后去标签表查询)
  s_status     INT,              #歌曲所对应的状态(外键状态表)
  s_describe   VARCHAR(180),     #歌曲的描述
  s_Fabulous   INT,              #歌曲所收获的赞
  s_comment    INT,              #歌曲的点评(外键用户表，说明是谁点评的)
  s_play       INT,              #歌曲的播放次数
  s_Collection INT,              #歌曲的收藏人数
  s_list       VARCHAR(200)      #歌曲所属的歌单(得到歌单的id,然后去歌单表查询)
);

/**专辑表**/
CREATE TABLE album(
  a_id         INT PRIMARY KEY AUTO_INCREMENT, #专辑的id
  a_name       VARCHAR(60),   #专辑的名称
  a_describe   VARCHAR(300),  #专辑的描述
  a_singer     INT,           #专辑的作者(外键歌手表)
  a_time       DATETIME,      #专辑所发表的时间
  a_Fabulous   INT,           #专辑所收获的赞
  a_play       INT,           #专辑的播放次数
  a_Collection INT,           #专辑的收藏人数
  a_tag        VARCHAR(200),  #专辑所对应的标签(得到标签的id,然后去标签表查询)
  a_ishot      BOOLEAN,       #专辑是否是每日推荐的其中之一(true/false)
  a_img        VARCHAR(125),  #专辑所对应的照片
  a_comment    INT            #专辑对应的评论(外键用户表，说明是谁点评的)
);

/**歌曲状态表**/
CREATE TABLE status(
  st_id         INT PRIMARY KEY AUTO_INCREMENT, #状态的id
  st_name       VARCHAR(20)                     #状态名称
);

/**歌单表**/
CREATE TABLE list(
  lid          INT PRIMARY KEY AUTO_INCREMENT, #歌单id
  user_id      INT,                            #歌单属于哪个用户的,用户id(外键去用户表)
  l_ishot      BOOLEAN,                        #歌单是否属于每日推荐之一
  l_describe   VARCHAR(200),                   #歌单的描述
  l_time       DATETIME,                       #歌单建立的时间
  l_Fabulous   INT,                            #歌单所收获的赞
  l_play       INT,                            #歌单的播放次数
  l_Collection INT,                            #歌单的收藏人数
  l_tag        VARCHAR(200),                   #歌单所对应的标签(得到标签的id,然后去标签表查询)
  l_img        VARCHAR(128),                   #歌单所对应的照片
  l_video      VARCHAR(180),                   #歌单对应的video
  l_title      VARCHAR(100),                   #歌单对应的标题
  l_comment    INT                             #歌单对应的评论(外键用户表，说明是谁点评的)
);

/**标签表**/
CREATE TABLE tag(
  t_id         INT PRIMARY KEY AUTO_INCREMENT,  #标签id
  t_name       VARCHAR(50),                     #标签名称
  t_describe   VARCHAR(300),                    #标签的描述
  t_title      VARCHAR(100),                    #标签的题目
  t_singer     VARCHAR(200),                    #标签的相关歌手(得到歌手id,然后去歌手表查询)
  t_album      VARCHAR(200),                    #标签对应的相关专辑(同上)
  t_song       VARCHAR(200),                    #标签对应的相关歌曲(同上)
  t_list       VARCHAR(200)                     #标签对应的相关歌单(同上)
);

/**热度视频表**/
CREATE TABLE hotVideo(
  v_id         INT PRIMARY KEY AUTO_INCREMENT,  #视频id
  v_name       VARCHAR(100),                    #视频标题
  v_describe   VARCHAR(300),                    #视频描述
  v_tag        VARCHAR(200),                    #视频标签(得到标签的id,然后去标签表查询)
  v_Subheading VARCHAR(200),                    #视频副标题
  v_singer     INT,                             #视频mv的歌手(外键歌手表)
  v_Fabulous   INT                              #视频所收获的赞
);

/**用户表**/
CREATE TABLE user(
  u_id                INT PRIMARY KEY AUTO_INCREMENT,   #用户id
  u_name              VARCHAR(50),                      #用户名称
  u_sex               BOOLEAN,                          #用户性别
  u_birthday          DATETIME,                         #用户生日
  u_signature         VARCHAR(100),                     #用户签名
  u_img               VARCHAR(128),                     #用户头像
  u_follow            VARCHAR(200),                     #用户关注(存用户id，再去用户表寻找)
  u_fans              VARCHAR(200),                     #用户粉丝数(存用户id，再去用户表寻找)
  u_CollectionSong    VARCHAR(200),                     #用户收藏的歌曲(存歌曲id,再去歌曲表找)
  u_collectionSinger  VARCHAR(200),                     #用户收藏的艺人(存歌手id,再去歌手表找)
  u_collectionAlbum   VARCHAR(200),                     #用户收藏的专辑(存专辑id,再去专辑表找)
  u_mylist            VARCHAR(200),                     #用户自己建立的歌单表(存歌单id,去歌单表找) 
  u_collectionList    VARCHAR(200),                     #用户收藏的歌单表(存歌单id,去歌单表找)
  u_localSong         VARCHAR(200),                     #用户下载的当地歌曲(存歌曲id,再去歌曲表找)
  u_Latelysong        VARCHAR(200),                     #用户最近播放的歌曲(存歌曲id,再去歌曲表找)
  u_album             VARCHAR(200),                     #用户最近播放专辑(存专辑id,再去专辑表找)
  u_list              VARCHAR(200),                     #用户最近播放的歌单(存歌单id,去歌单表找)
  u_msg               VARCHAR(100),                     #用户的我的消息
  u_fllowmsg          VARCHAR(100)                      #用户正在关注的消息
);

/**歌手表**/
CREATE TABLE singer(
  singer_id          INT PRIMARY KEY AUTO_INCREMENT,  #歌手id
  singer_intr        VARCHAR(100),                    #歌手简介
  singer_fans        INT,                             #歌手关注人数
  singer_video       VARCHAR(128),                    #歌手视频
  singer_affect      VARCHAR(100),                    #影响歌手的人(填写歌手id,后续去歌手表寻找)
  singer_beaffected  VARCHAR(100),                    #被歌手影响的人(填写歌手id,后续去歌手表寻找)
  likeSinger         VARCHAR(100)                     #与歌手相似的艺人(填写歌手id,后续去歌手表找)
);

alter table carousel add foreign key(listID) references list(lid);
alter table song add foreign key(s_singerID) references singer(singer_id);
alter table song add foreign key(s_AlbumID) references album(a_id);
alter table song add foreign key(s_status) references status(st_id);
alter table song add foreign key(s_comment) references user(u_id);
alter table album add foreign key(a_singer) references singer(singer_id);
alter table album add foreign key(a_comment) references user(u_id);
alter table list add foreign key(user_id) references user(u_id);
alter table list add foreign key(l_comment) references user(u_id);
alter table hotVideo add foreign key(v_singer) references singer(singer_id);

