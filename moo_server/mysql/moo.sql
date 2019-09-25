SET NAMES UTF8;
DROP DATABASE IF EXISTS moo;
CREATE DATABASE moo CHARSET=UTF8;
USE moo;

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

/**歌手表 已做**/
CREATE TABLE singer(
  singer_id          INT PRIMARY KEY AUTO_INCREMENT,  #歌手id
  singer_name        VARCHAR(100),                    #歌手名字
  singer_intr        VARCHAR(100),                    #歌手简介
  singer_fans        INT,                             #歌手关注人数
  singer_video       VARCHAR(128),                    #歌手视频
  singer_affect      VARCHAR(100),                    #影响歌手的人(填写歌手id,后续去歌手表寻找)
  singer_beaffected  VARCHAR(100),                    #被歌手影响的人(填写歌手id,后续去歌手表寻找)
  likeSinger         VARCHAR(100),                     #与歌手相似的艺人(填写歌手id,后续去歌手表找)
  singer_img         VARCHAR(200)                      #歌手的头像
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

/**轮播图表**/
CREATE TABLE carousel(
  cid      INT  PRIMARY KEY AUTO_INCREMENT,   #轮播图图片id
  img      VARCHAR(128),                      #轮播图路径
  title    VARCHAR(30),                       #轮播图图片的名称
  listID   INT,                               #对应的歌单(外键歌单表)
  c_status INT                                #用外键查询新歌
);

/**专辑表  已做**/
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

/**热度视频表**/
CREATE TABLE hotVideo(
  v_id         INT PRIMARY KEY AUTO_INCREMENT,  #视频id
  v_name       VARCHAR(100),                    #视频标题
  v_describe   VARCHAR(300),                    #视频描述
  v_tag        VARCHAR(200),                    #视频标签(得到标签的id,然后去标签表查询)
  v_Subheading VARCHAR(200),                    #视频副标题
  v_singer     INT,                             #视频mv的歌手(外键歌手表)
  v_Fabulous   INT,                              #视频所收获的赞
  v_img        VARCHAR(200)                    #视频对应的图片
);

/**歌曲大全表  已做**/  
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
  s_list       VARCHAR(200),      #歌曲所属的歌单(得到歌单的id,然后去歌单表查询)
  s_img        VARCHAR(200)      #歌曲对应的图片
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
alter table carousel add foreign key(c_status) references status(st_id);



/*数据插入*/
/*用户表*/
INSERT INTO user VALUES
(NULL,"丘小丽",0,"2000-01-01 08:39:10","超级无敌善良美丽小可爱","http://176.122.14.69:8080/user-img/x1.jpg","2/3/4","2/3/4","1/2/4/7/9/14/18/20","1/5/7/15","2/4","1/3","2/6","5/13/20","1/13/16/17/24","1","3","你好！","再次你好！"),
(NULL,"刘小威",1,"2000-01-01 08:39:10","型到跌渣~","http://176.122.14.69:8080/user-img/x2.jpg","2/3/4","2/3/4","1/2/4/7/9/14/18/20","1/5/7/15","2/4","1/3","2/6","5/13/20","1/13/16/17/24","1","3","你好！","再次你好！"),
(NULL,"蔡小达",1,"2000-01-01 08:39:10","全村我最老实","http://176.122.14.69:8080/user-img/x3.jpg","2/3/4","2/3/4","1/2/4/7/9/14/18/20","1/5/7/15","2/4","1/3","2/6","5/13/20","1/13/16/17/24","1","3","你好！","再次你好！"),
(NULL,"谢小感",1,"2000-01-01 08:39:10","靓爆镜~","http://176.122.14.69:8080/user-img/x4.jpg","2/3/4","2/3/4","1/2/4/7/9/14/18/20","1/5/7/15","2/4","1/3","2/6","5/13/20","1/13/16/17/24","1","3","你好！","再次你好！");

/*歌手表*/
INSERT INTO singer VALUES
(NULL,"周杰伦","周杰伦（Jay Chou），1979年1月18日出生于台湾省新北市，毕业于淡江中学，中国台湾流行乐男歌手、音乐人、演员、导演、编剧等",1000,"http://176.122.14.69:8080/bath/bath.mp4","1/12/6","20/3/15/6","4/7","http://176.122.14.69:8080/singerimg/zjl.jpg"),

(NULL,"陶喆","陶喆（David Zee Tao），1969年7月11日出生于香港，台湾创作型男歌手、音乐制作人，毕业于加利福尼亚大学洛杉矶分校。1993年以音乐制作人身份出道，并参与制作专辑《Alton》",18,"http://176.122.14.69:8080/Chemicals/Chemicals.mp4","8/9/15","1/3/18/22","6","http://176.122.14.69:8080/singerimg/tz.jpg"),

(NULL,"Beyond","Beyond，中国香港摇滚乐队，由黄家驹、黄贯中、黄家强、叶世荣组成",108,"http://176.122.14.69:8080/WouldYouBe/Oneway-WouldYouBe.mp4","18/19","11/3","4","http://176.122.14.69:8080/singerimg/beyond.jpg"),

(NULL,"丁当","丁当（Della），本名吴娴，1982年4月17日出生于浙江省嘉善县，华语流行女歌手，毕业于杭州师范大学。",200,"http://176.122.14.69:8080/걱정말아요그대/걱정말아요그대(Don'tWorry).mp4","8/9","10","14","http://176.122.14.69:8080/singerimg/dd.jpg"),

(NULL,"凤凰传奇","凤凰传奇，中国内地演唱组合，由杨魏玲花、曾毅组成。2004年4月，凤凰传奇成立。2005年凤凰传奇在“星光大道”获得年度亚军，同年推出首张专辑《月亮之上》开创“民族流行风”类型音乐先河",823,"http://176.122.14.69:8080/층간스캔들/층간스캔들.mp4","9/19","15/7","3","http://176.122.14.69:8080/singerimg/fhcq.jpg"),

(NULL,"动力火车","动力火车是1997年在中国台湾成立的流行摇滚演唱组合，由尤秋兴与颜志琳两位台湾原住民歌手组成，是华研国际音乐旗下的组合",718,"http://176.122.14.69:8080/bath/bath.mp4","12/5","10/3","21","http://176.122.14.69:8080/singerimg/dlhc.jpg"),

(NULL,"海明威","海鸣威，1982年7月10日出生于中国广州，歌手，毕业于中国传媒大学，隶属于英皇星艺。2000年获“新偶像”歌唱比赛总冠军。2005年，参与演出《雪狼湖》。2006年获得中央电视台《梦想中国》亚军",456,"http://176.122.14.69:8080/Chemicals/Chemicals.mp4","22/20","17/6/4","2","http://176.122.14.69:8080/singerimg/hmw.jpg"),

(NULL,"黄艺明","黄艺明，男，中国内地男歌手。1973年2月10日生，毕业于广东轻工职业技术学院艺术设计学院。作品有《光辉的璀璨》、《岁月同舟》、《超越真理》、《风云》、《我们的天空》等。",433,"http://176.122.14.69:8080/WouldYouBe/Oneway-WouldYouBe.mp4","12/9","5/3","2","http://176.122.14.69:8080/singerimg/hym.jpg"),

(NULL,"郑中基","郑中基，1972年3月9日出生于中国台湾新竹，中国香港男歌手、演员。1996年，郑中基发行第一张个人国语专辑《左右为难》",621,"http://176.122.14.69:8080/걱정말아요그대/걱정말아요그대(Don'tWorry).mp4","18/19/20","11/13","14","http://176.122.14.69:8080/singerimg/zzj.jpg"),

(NULL,"筷子兄弟","筷子兄弟是由肖央与王太利组成集“编剧、导演、演员、音乐创作、歌手”于一身的复合型组合。",618,"http://176.122.14.69:8080/층간스캔들/층간스캔들.mp4","17/6","8/18","9","http://176.122.14.69:8080/singerimg/kzxd.jpg"),

(NULL,"王力宏","王力宏（Leehom Wang），1976年5月17日出生于美国纽约罗切斯特，祖籍浙江义乌；华语流行乐男歌手、音乐制作人、演员、导演；拥有威廉姆斯大学和伯克利音乐学院双荣誉博士的学历",521,"http://176.122.14.69:8080/bath/bath.mp4","12/3/17","20/13","1","http://176.122.14.69:8080/singerimg/wlh.jpg"),

(NULL,"谢安琪","谢安琪，1977年3月13日出生于香港，中国香港女歌手、演员，毕业于香港大学文学院。现属金牌大风旗下艺人",188,"http://176.122.14.69:8080/층간스캔들/층간스캔들.mp4","1/3","14/2","4","http://176.122.14.69:8080/singerimg/xaq.jpg"),

(NULL,"offonoff","offonoff由Colde、0channel两位成员组成，于2015年8月25日通过soundcloud发表首张专辑《mood》。现签约Tablo厂牌HIGHGRND，并于2016年9月21日发行数字单曲《bath》",118,"http://176.122.14.69:8080/bath/bath.mp4","10","15/16","8","http://176.122.14.69:8080/singerimg/offoff.jpg"),

(NULL,"Alok,Sevenn","Alok,Sevenn两位成员组成，于2015年8月25日通过soundcloud发表首张专辑《mood》",256,"http://176.122.14.69:8080/bath/bath.mp4","2/3","7","14","http://176.122.14.69:8080/singerimg/alok.jpg"),

(NULL,"Tiësto,Don Diablo,Thomas Troelsen","提雅斯多（Tisto），原名提吉斯·米基尔·弗韦斯特（Tijs Michiel Verwest），1969年1月17日出生于荷兰布北布拉邦省布雷达，荷兰DJ、音乐制作人",18,"http://176.122.14.69:8080/bath/bath.mp4","12","1","7","http://176.122.14.69:8080/singerimg/thomas.jpg"),

(NULL,"少女时代","少女时代（Girls' Generation）是韩国SM娱乐有限公司于2007年推出的女子流行演唱团体，由金泰妍、郑秀妍、李顺圭、黄美英、金孝渊、权俞利、崔秀英、林允儿和徐珠贤9人组成，现以5人形式进行演艺活动",78,"http://176.122.14.69:8080/층간스캔들/층간스캔들.mp4","10/12","13/22","7","http://176.122.14.69:8080/singerimg/snsd.jpg"),

(NULL,"Danelle Sandoval","hopeSandoval于1966年出生在美国洛杉矶，是一名民谣女歌手",28,"http://176.122.14.69:8080/bath/bath.mp4","8/12/15","6/12","7","http://176.122.14.69:8080/singerimg/danelle.jpg"),

(NULL,"KSHMR,BassKillers,B3nte","喀什米尔（KSHMR），原名奈尔斯·霍洛韦尔-达尔（Niles Hollowell-Dhar），1988年10月6日出生于美国加利福尼亚州伯克利，印度/美国混血儿，美国DJ、音乐制作人",98,"http://176.122.14.69:8080/WouldYouBe/Oneway-WouldYouBe.mp4","1/22","10/11","4","http://176.122.14.69:8080/singerimg/kshmr.jpg"),

(NULL,"Oneway","是韩国的新组合，所属公司为YJ Entertainment，于2010年2月11日发行自己的首张同名单曲《Oneway》，2010年3月6日MBC 音乐中心为出道舞台",568,"http://176.122.14.69:8080/층간스캔들/층간스캔들.mp4","8/19","18","17","http://176.122.14.69:8080/singerimg/oneway.jpg"),

(NULL,"曹政奭,D.O.","曹政奭（Cho Jung Seok），1980年12月26日出生于韩国首尔，毕业于首尔艺术大学，韩国音乐剧专业演员",763,"http://176.122.14.69:8080/bath/bath.mp4","12/2/3","14","3","http://176.122.14.69:8080/singerimg/czs.jpg"),

(NULL,"Plastic","喀什米尔（KSHMR），原名奈尔斯·霍洛韦尔-达尔（Niles Hollowell-Dhar），1988年10月6日出生于美国加利福尼亚州伯克利，印度/美国混血儿，美国DJ、音乐制作人",362,"http://176.122.14.69:8080/층간스캔들/층간스캔들.mp4","8/9","1/3","4","http://176.122.14.69:8080/singerimg/plastic.jpg"),

(NULL,"IOSYS","喀什米尔（KSHMR），原名奈尔斯·霍洛韦尔-达尔（Niles Hollowell-Dhar），1988年10月6日出生于美国加利福尼亚州伯克利，印度/美国混血儿，美国DJ、音乐制作人",443,"http://176.122.14.69:8080/WouldYouBe/Oneway-WouldYouBe.mp4","8/11","1/8","7","http://176.122.14.69:8080/singerimg/iosys.jpg");

/*歌曲状态表*/
INSERT INTO status VALUES
(NULL,"新歌"),
(NULL,"个性好歌");

/*标签表*/
INSERT INTO tag VALUES
(NULL,"#Moo指南","为你推荐最新上架的优质专辑","朱某丽的眼泪","1/5","2/3","1/2","1/3"),
(NULL,"#新歌首发","为你推荐最新上架的优质专辑","朱某丽的眼泪","1/5","2/3","1/2","1/3"),
(NULL,"#下周末的夜","为你推荐最新上架的优质专辑","朱某丽的眼泪","1/5","2/3","1/2","1/3"),
(NULL,"#名流客串","为你推荐最新上架的优质专辑","朱某丽的眼泪","1/5","2/3","1/2","1/3"),
(NULL,"#上班摸鱼","为你推荐最新上架的优质专辑","朱某丽的眼泪","1/5","2/3","1/2","1/3"),
(NULL,"#Moo Friends","为你推荐最新上架的优质专辑","朱某丽的眼泪","1/5","2/3","1/2","1/3");

/*歌单表*/
INSERT INTO list VALUES
(NULL,3,1,"达哥最爱","2019-10-01 08:40:50",80,39,400,"1","http://176.122.14.69:8080/list/timg08.jpg","http://176.122.14.69:8080/list/x.mp4","另类的歌单标题求推荐",null),
(NULL,1,0,"丘哥最爱","2019-10-01 08:40:50",80,39,400,"2","http://176.122.14.69:8080/list/timg09.jpg","http://176.122.14.69:8080/list/x.mp4","另类的歌单标题求推荐",null),
(NULL,2,0,"威哥最爱","2019-10-01 08:40:50",80,39,400,"3","http://176.122.14.69:8080/list/timg09.jpg","http://176.122.14.69:8080/list/x.mp4","另类的歌单标题求推荐",null),
(NULL,4,1,"小哥最爱","2019-10-01 08:40:50",80,39,400,"4","http://176.122.14.69:8080/list/timg08.jpg","http://176.122.14.69:8080/list/x.mp4","另类的歌单标题求推荐",null),
(NULL,4,1,"感哥最爱","2019-10-01 08:40:50",80,39,400,"5","http://176.122.14.69:8080/list/timg09.jpg","http://176.122.14.69:8080/list/x.mp4","另类的歌单标题求推荐",null);

/*轮播图*/
INSERT INTO carousel VALUES
(NULL,"http://176.122.14.69:8080/carousel/timg01.jpg","你的名字",1,NULL),
(NULL,"http://176.122.14.69:8080/carousel/timg02.jpg","哆来a梦是个梦",NULL,1),
(NULL,"http://176.122.14.69:8080/carousel/timg03.jpg","夜霞漂流",2,NULL),
(NULL,"http://176.122.14.69:8080/carousel/timg04.jpg","徒行",3,NULL),
(NULL,"http://176.122.14.69:8080/carousel/timg05.jpg","湾州露上",4,NULL),
(NULL,"http://176.122.14.69:8080/carousel/timg06.jpg","征战影子",NULL,NULL);

/*专辑表*/
INSERT INTO album VALUES
(NULL,"泡8喝9玩时尚","zz最爱",1,"2019-01-01 08:40:50",66,20,30,"1",0,"http://176.122.14.69:8080/青花瓷/01.jpg",null),
(NULL,"泡8喝9玩时尚","zz最爱",2,"2019-10-01 08:40:50",66,20,30,"6",0,"http://176.122.14.69:8080/月亮之上/01.jpg",null),
(NULL,"泡8喝9玩时尚","zz最爱",3,"2019-10-01 08:40:50",66,20,30,"3",0,"http://176.122.14.69:8080/小苹果/01.jpg",null),
(NULL,"泡8喝9玩时尚","zz最爱",4,"2019-10-01 08:40:50",66,20,30,"4/5",0,"http://176.122.14.69:8080/不再犹豫/01.jpg",null),
(NULL,"泡8喝9玩时尚","zz最爱",5,"2019-10-01 08:40:50",66,20,30,"1/5/3",0,"http://176.122.14.69:8080/钟无艳/01.jpg",null);

/**歌曲大全表**/
INSERT INTO song VALUES(NULL,"青花瓷","http://176.122.14.69:8080/青花瓷/青花瓷.mp3","填词：方文山/谱曲：周杰伦/歌曲原唱：周杰伦/素胚勾勒出青花笔锋浓转淡/瓶身描绘的牡丹一如你初妆/冉冉檀香透过窗心事我了然/宣纸上走笔至此搁一半/釉色渲染仕女图韵味被私藏/而你嫣然的一笑如含苞待放/你的美一缕飘散/去到我去不了的地方/天青色等烟雨，而我在等你/炊烟袅袅升起，隔江千万里/在瓶底书刻隶仿前朝的飘逸/就当我为遇见你伏笔/天青色等烟雨，而我在等你/月色被打捞起，晕开了结局/如传世的青花瓷自顾自美丽/你眼带笑意/色白花青的锦鲤跃然于碗底/临摹宋体落款时却惦记着你/你隐藏在窑烧里千年的秘密/极细腻犹如绣花针落地/篱外芭蕉惹骤雨门环惹铜绿/而我路过那江南小镇惹了你/在泼墨山水画里/你从墨色深处被隐去/天青色等烟雨，而我在等你/炊烟袅袅升起，隔江千万里/在瓶底书刻隶仿前朝的飘逸/就当我为遇见你伏笔/天青色等烟雨，而我在等你/月色被打捞起，晕开了结局/如传世的青花瓷自顾自美丽/你眼带笑意/天青色等烟雨，而我在等你/炊烟袅袅升起，隔江千万里/在瓶底书刻隶仿前朝的飘逸/就当我为遇见你伏笔/天青色等烟雨，而我在等你/月色被打捞起，晕开了结局/如传世的青花瓷自顾自美丽/你眼带笑意","方文山","周杰伦",1,2,"http://176.122.14.69:8080/WouldYouBe/Oneway-WouldYouBe.mp4","3/6",1,"好听无瑕疵,胖胖哒",109,1,13,25,"1/5","http://176.122.14.69:8080/songimgs/01.jpg"),
(NULL,"爱，很简单","http://176.122.14.69:8080/爱，很简单/爱,很简单.mp3","作曲：陶喆/作词：娃娃/演唱：陶喆/忘了是怎么开始，也许就是对你，有一种感觉/忽然间发现自己，已深深爱上你，真的很简单/爱的地暗天黑都已无所谓，是是非非无法抉择，喔~~/没有后悔为爱日夜去跟随，那个疯狂的人是我，喔~~/I LOVE U/无法不爱你 baby/说你也爱我/I LOVE U/永远不愿意 baby/失去你/不可能更快乐，只要能在一起，做什么都可以/虽然，世界变个不停，用最真诚的心，让爱变的简单/爱的地暗天黑都已无所谓，是是非非无法抉择，喔~~/没有后悔为爱日夜去跟随，那个疯狂的人是我，喔~~/I LOVE U/一直在这里，baby/一直在爱你 oh yeah~/I LOVE U，(oh yes I do)/永远都不放弃，yeah~/这爱你的权利/如果你还有一些困惑 Oh No 请贴著我的心倾听/听我说著，爱你 (yes I do)/I LOVE U/一直在这里，(oh yes I do)/一直在爱你 oh yeah~/I LOVE U/永远都不放弃/这爱你的权利","娃娃","陶喆",2,5,"http://176.122.14.69:8080/WouldYouBe/Oneway-WouldYouBe.mp4","3/4",2,"好听无瑕疵,胖胖哒",109,2,13,25,"2/3","http://176.122.14.69:8080/songimgs/02.jpg"),
(NULL,"不再犹豫","http://176.122.14.69:8080/不再犹豫/不再犹豫.mp3","Everybody is going to the party/每个人都涌向派对/Have real good time/玩得很嗨皮/Dancing in the desert/在沙漠中狂舞/Blowing up the sunshine/比阳光还灿烂/Everybody is going to the party/每个人都涌向派对/Have a real good time/玩得很嗨皮/Dancing in the desert/在沙漠中狂舞/Blowing up the sunshine/比阳光还灿烂Alok,Sevenn","小美","Beyond",3,5,"http://176.122.14.69:8080/WouldYouBe/Oneway-WouldYouBe.mp4","3/5",1,"好听无瑕疵,胖胖哒",109,3,13,25,"3","http://176.122.14.69:8080/songimgs/03.jpg"),
(NULL,"猜不透","http://176.122.14.69:8080/猜不透/猜不透.mp3","《终于明白》/填词：徐光义/谱曲：徐光义，王美莲/歌曲原唱：动力火车/望着你，慢慢离开/宿命像潮水般/淹没我，不能呼吸/飘浮在黑色的海/怎么习惯失去你的未来/怎么留住渐渐消失的云彩/骗自己，爱还存在/泪水却始终不断/命中注定，没有你的未来/莫失莫忘渐渐消失的空白/什么都别说，我不想懂/至少我还拥有美丽的梦/什么都别说，我真的不想懂/终于明白，该放手/骗自己，爱还存在/泪水却始终不断/命中注定，没有你的未来/莫失莫忘渐渐消失的空白/什么都别说，我不想懂/至少我还拥有美丽的梦/什么都别说，我真的不想懂/终于明白，该放手/什么都别说，我不想懂/至少我还拥有美丽的梦/什么都别说，我真的不想懂/终于明白，该放手/终于明白，爱，该放手/望着你，慢慢离开/泪水不断","娃娃","丁当",4,3,"http://176.122.14.69:8080/WouldYouBe/Oneway-WouldYouBe.mp4","4/5/6",2,"好听无瑕疵,胖胖哒",109,4,13,25,"2/3","http://176.122.14.69:8080/songimgs/01.jpg"),
(NULL,"狼的诱惑","http://176.122.14.69:8080/狼的诱惑/狼的诱惑.mp3","《终于明白》/填词：徐光义/谱曲：徐光义，王美莲/歌曲原唱：动力火车/望着你，慢慢离开/宿命像潮水般/淹没我，不能呼吸/飘浮在黑色的海/怎么习惯失去你的未来/怎么留住渐渐消失的云彩/骗自己，爱还存在/泪水却始终不断/命中注定，没有你的未来/莫失莫忘渐渐消失的空白/什么都别说，我不想懂/至少我还拥有美丽的梦/什么都别说，我真的不想懂/终于明白，该放手/骗自己，爱还存在/泪水却始终不断/命中注定，没有你的未来/莫失莫忘渐渐消失的空白/什么都别说，我不想懂/至少我还拥有美丽的梦/什么都别说，我真的不想懂/终于明白，该放手/什么都别说，我不想懂/至少我还拥有美丽的梦/什么都别说，我真的不想懂/终于明白，该放手/终于明白，爱，该放手/望着你，慢慢离开/泪水不断","凤凰传奇","凤凰传奇",5,4,"http://176.122.14.69:8080/WouldYouBe/Oneway-WouldYouBe.mp4","3/6",1,"好听无瑕疵,胖胖哒",109,3,13,25,"3/4","http://176.122.14.69:8080/songimgs/04.gif"),
(NULL,"那就这样吧","http://176.122.14.69:8080/那就这样吧/那就这样吧.mp3","歌曲：《猜不透》/作曲：林迈可/作词：黄婷/演唱：丁当/歌词：/你最近时好时坏的沉默/我也不想去追问太多/让试探为彼此的心上了锁/猜不透，相处会比分开还寂寞/两个人都只是得过且过/无法感受每次触摸是真的是热的/如果忽远忽近的洒脱，是你要的自由/那我宁愿回到一个人生活/如果忽冷忽热的温柔，是你的借口/那我宁愿对你从没认真过/猜不透，相处会比分开还寂寞/两个人都只是得过且过/无法感受每次触摸是真的是热的/如果忽远忽近的洒脱，是你要的自由/那我宁愿回到一个人生活/如果忽冷忽热的温柔，是你的借口/那我宁愿对你从没认真过/如果忽远忽近的洒脱，是你要的自由/那我宁愿回到一个人生活/如果忽冷忽热的温柔，是你的借口/那我宁愿对你从没认真过/到底这感觉谁对谁错，我已不想追究/越是在乎的人越是猜不透","娃娃","动力火车",6,3,"http://176.122.14.69:8080/WouldYouBe/Oneway-WouldYouBe.mp4","2",2,"好听无瑕疵,胖胖哒",109,3,13,25,"2/3","http://176.122.14.69:8080/songimgs/04.gif"),
(NULL,"情人","http://176.122.14.69:8080/情人/情人.mp3","Everybody is going to the party/每个人都涌向派对/Have real good time/玩得很嗨皮/Dancing in the desert/在沙漠中狂舞/Blowing up the sunshine/比阳光还灿烂/Everybody is going to the party/每个人都涌向派对/Have a real good time/玩得很嗨皮/Dancing in the desert/在沙漠中狂舞/Blowing up the sunshine/比阳光还灿烂Alok,Sevenn","娃娃","Beyond",3,4,"http://176.122.14.69:8080/WouldYouBe/Oneway-WouldYouBe.mp4","4/5",1,"好听无瑕疵,胖胖哒",109,4,13,25,"1/2","http://176.122.14.69:8080/songimgs/04.gif"),
(NULL,"我的回忆不是我的","http://176.122.14.69:8080/我的回忆不是我的/我的回忆不是我的.mp3","KSHMR,BassKillers,B3nte/They said he wasn’t real/人们说他是虚构的/They said he wouldn’t come back/人们说他再也不会回来/But this isn’t a dream/但他此刻在这里出现/And there’s no running from the spook/什么都逃脱不了这个幽灵的魔爪/Don’t be scared/不要害怕/Spook/幽灵来了/Come little children I’ll take you away/小朋友快过来/Into a land of enchantment/我要带你去一个魔幻之地/Come little children the times come to play/小朋友娱乐时间到了/Here in my garden of magic/带你去我的魔幻花园玩/Don’t be scared/不要害怕/Spook/我只是个幽灵","娃娃","海明威",7,3,"http://176.122.14.69:8080/WouldYouBe/Oneway-WouldYouBe.mp4","3/5",2,"好听无瑕疵,胖胖哒",109,4,13,25,"3/4","http://176.122.14.69:8080/songimgs/05.jpg"),
(NULL,"我们的天空","http://176.122.14.69:8080/我们的天空/我们的天空.mp3","KSHMR,BassKillers,B3nte/They said he wasn’t real/人们说他是虚构的/They said he wouldn’t come back/人们说他再也不会回来/But this isn’t a dream/但他此刻在这里出现/And there’s no running from the spook/什么都逃脱不了这个幽灵的魔爪/Don’t be scared/不要害怕/Spook/幽灵来了/Come little children I’ll take you away/小朋友快过来/Into a land of enchantment/我要带你去一个魔幻之地/Come little children the times come to play/小朋友娱乐时间到了/Here in my garden of magic/带你去我的魔幻花园玩/Don’t be scared/不要害怕/Spook/我只是个幽灵","娃娃","黄艺明",8,4,"http://176.122.14.69:8080/WouldYouBe/Oneway-WouldYouBe.mp4","6",2,"好听无瑕疵,胖胖哒",109,2,13,25,"1/2","http://176.122.14.69:8080/songimgs/05.jpg"),
(NULL,"无赖","http://176.122.14.69:8080/无赖/无赖.mp3","《终于明白》/填词：徐光义/谱曲：徐光义，王美莲/歌曲原唱：动力火车/望着你，慢慢离开/宿命像潮水般/淹没我，不能呼吸/飘浮在黑色的海/怎么习惯失去你的未来/怎么留住渐渐消失的云彩/骗自己，爱还存在/泪水却始终不断/命中注定，没有你的未来/莫失莫忘渐渐消失的空白/什么都别说，我不想懂/至少我还拥有美丽的梦/什么都别说，我真的不想懂/终于明白，该放手/骗自己，爱还存在/泪水却始终不断/命中注定，没有你的未来/莫失莫忘渐渐消失的空白/什么都别说，我不想懂/至少我还拥有美丽的梦/什么都别说，我真的不想懂/终于明白，该放手/什么都别说，我不想懂/至少我还拥有美丽的梦/什么都别说，我真的不想懂/终于明白，该放手/终于明白，爱，该放手/望着你，慢慢离开/泪水不断","娃娃","郑中基",9,3,"http://176.122.14.69:8080/WouldYouBe/Oneway-WouldYouBe.mp4","2/5",1,"好听无瑕疵,胖胖哒",109,3,13,25,"1/3","http://176.122.14.69:8080/songimgs/05.jpg"),
(NULL,"小苹果","http://176.122.14.69:8080/小苹果/小苹果.mp3","《终于明白》/填词：徐光义/谱曲：徐光义，王美莲/歌曲原唱：动力火车/望着你，慢慢离开/宿命像潮水般/淹没我，不能呼吸/飘浮在黑色的海/怎么习惯失去你的未来/怎么留住渐渐消失的云彩/骗自己，爱还存在/泪水却始终不断/命中注定，没有你的未来/莫失莫忘渐渐消失的空白/什么都别说，我不想懂/至少我还拥有美丽的梦/什么都别说，我真的不想懂/终于明白，该放手/骗自己，爱还存在/泪水却始终不断/命中注定，没有你的未来/莫失莫忘渐渐消失的空白/什么都别说，我不想懂/至少我还拥有美丽的梦/什么都别说，我真的不想懂/终于明白，该放手/什么都别说，我不想懂/至少我还拥有美丽的梦/什么都别说，我真的不想懂/终于明白，该放手/终于明白，爱，该放手/望着你，慢慢离开/泪水不断","娃娃","筷子兄弟",10,5,"http://176.122.14.69:8080/WouldYouBe/Oneway-WouldYouBe.mp4","2/3/4",2,"好听无瑕疵,胖胖哒",109,4,13,25,"1/2","http://176.122.14.69:8080/songimgs/02.jpg"),
(NULL,"缘分一道桥","http://176.122.14.69:8080/缘分一道桥/缘分一道桥.mp3","Everybody is going to the party/每个人都涌向派对/Have real good time/玩得很嗨皮/Dancing in the desert/在沙漠中狂舞/Blowing up the sunshine/比阳光还灿烂/Everybody is going to the party/每个人都涌向派对/Have a real good time/玩得很嗨皮/Dancing in the desert/在沙漠中狂舞/Blowing up the sunshine/比阳光还灿烂Alok,Sevenn","娃娃","王力宏",11,3,"http://176.122.14.69:8080/WouldYouBe/Oneway-WouldYouBe.mp4","2",1,"好听无瑕疵,胖胖哒",109,1,13,25,"1/2","http://176.122.14.69:8080/songimgs/03.jpg"),
(NULL,"月亮之上","http://176.122.14.69:8080/月亮之上/月亮之上.mp3","《终于明白》/填词：徐光义/谱曲：徐光义，王美莲/歌曲原唱：动力火车/望着你，慢慢离开/宿命像潮水般/淹没我，不能呼吸/飘浮在黑色的海/怎么习惯失去你的未来/怎么留住渐渐消失的云彩/骗自己，爱还存在/泪水却始终不断/命中注定，没有你的未来/莫失莫忘渐渐消失的空白/什么都别说，我不想懂/至少我还拥有美丽的梦/什么都别说，我真的不想懂/终于明白，该放手/骗自己，爱还存在/泪水却始终不断/命中注定，没有你的未来/莫失莫忘渐渐消失的空白/什么都别说，我不想懂/至少我还拥有美丽的梦/什么都别说，我真的不想懂/终于明白，该放手/什么都别说，我不想懂/至少我还拥有美丽的梦/什么都别说，我真的不想懂/终于明白，该放手/终于明白，爱，该放手/望着你，慢慢离开/泪水不断","娃娃","凤凰传奇",5,3,"http://176.122.14.69:8080/WouldYouBe/Oneway-WouldYouBe.mp4","2/3",2,"好听无瑕疵,胖胖哒",109,2,13,25,"2/4","http://176.122.14.69:8080/songimgs/04.gif"),
(NULL,"终于明白","http://176.122.14.69:8080/终于明白/终于明白.mp3","Everybody is going to the party/每个人都涌向派对/Have real good time/玩得很嗨皮/Dancing in the desert/在沙漠中狂舞/Blowing up the sunshine/比阳光还灿烂/Everybody is going to the party/每个人都涌向派对/Have a real good time/玩得很嗨皮/Dancing in the desert/在沙漠中狂舞/Blowing up the sunshine/比阳光还灿烂Alok,Sevenn","娃娃","动力火车",6,3,"http://176.122.14.69:8080/WouldYouBe/Oneway-WouldYouBe.mp4","2/3",2,"好听无瑕疵,胖胖哒",109,4,13,25,"2/5","http://176.122.14.69:8080/songimgs/05.jpg"),
(NULL,"钟无艳","http://176.122.14.69:8080/钟无艳/钟无艳.mp3","作曲：陶喆/作词：娃娃/演唱：陶喆/忘了是怎么开始，也许就是对你，有一种感觉/忽然间发现自己，已深深爱上你，真的很简单/爱的地暗天黑都已无所谓，是是非非无法抉择，喔~~/没有后悔为爱日夜去跟随，那个疯狂的人是我，喔~~/I LOVE U/无法不爱你 baby/说你也爱我/I LOVE U/永远不愿意 baby/失去你/不可能更快乐，只要能在一起，做什么都可以/虽然，世界变个不停，用最真诚的心，让爱变的简单/爱的地暗天黑都已无所谓，是是非非无法抉择，喔~~/没有后悔为爱日夜去跟随，那个疯狂的人是我，喔~~/I LOVE U/一直在这里，baby/一直在爱你 oh yeah~/I LOVE U，(oh yes I do)/永远都不放弃，yeah~/这爱你的权利/如果你还有一些困惑 Oh No 请贴著我的心倾听/听我说著，爱你 (yes I do)/I LOVE U/一直在这里，(oh yes I do)/一直在爱你 oh yeah~/I LOVE U/永远都不放弃/这爱你的权利","娃娃","谢安琪",12,5,"http://176.122.14.69:8080/WouldYouBe/Oneway-WouldYouBe.mp4","1/6",1,"好听无瑕疵,胖胖哒",109,1,13,25,"4/5","http://176.122.14.69:8080/songimgs/01.jpg"),
(NULL,"bath","http://176.122.14.69:8080/BYOB/BYOB.mp3","Everybody is going to the party/每个人都涌向派对/Have real good time/玩得很嗨皮/Dancing in the desert/在沙漠中狂舞/Blowing up the sunshine/比阳光还灿烂/Everybody is going to the party/每个人都涌向派对/Have a real good time/玩得很嗨皮/Dancing in the desert/在沙漠中狂舞/Blowing up the sunshine/比阳光还灿烂Alok,Sevenn","娃娃","offonoff",13,3,"http://176.122.14.69:8080/WouldYouBe/Oneway-WouldYouBe.mp4","2/6",2,"好听无瑕疵,胖胖哒",109,1,13,25,"2/3","http://176.122.14.69:8080/songimgs/02.jpg"),
(NULL,"BYOB","http://176.122.14.69:8080/BYOB/BYOB.mp3","Everybody is going to the party/每个人都涌向派对/Have real good time/玩得很嗨皮/Dancing in the desert/在沙漠中狂舞/Blowing up the sunshine/比阳光还灿烂/Everybody is going to the party/每个人都涌向派对/Have a real good time/玩得很嗨皮/Dancing in the desert/在沙漠中狂舞/Blowing up the sunshine/比阳光还灿烂Alok,Sevenn","娃娃","Alok,Sevenn",14,5,"http://176.122.14.69:8080/WouldYouBe/Oneway-WouldYouBe.mp4","3",1,"好听无瑕疵,胖胖哒",109,2,13,25,"2/5","http://176.122.14.69:8080/songimgs/04.gif"),
(NULL,"Chemicals","http://176.122.14.69:8080/Chemicals/Chemicals.mp3","Everybody is going to the party/每个人都涌向派对/Have real good time/玩得很嗨皮/Dancing in the desert/在沙漠中狂舞/Blowing up the sunshine/比阳光还灿烂/Everybody is going to the party/每个人都涌向派对/Have a real good time/玩得很嗨皮/Dancing in the desert/在沙漠中狂舞/Blowing up the sunshine/比阳光还灿烂Alok,Sevenn","娃娃","Tiësto,Don Diablo,Thomas Troelsen",15,4,"http://176.122.14.69:8080/WouldYouBe/Oneway-WouldYouBe.mp4","3/4",2,"好听无瑕疵,胖胖哒",109,4,13,25,"4/5","http://176.122.14.69:8080/songimgs/05.jpg"),
(NULL,"Gee","http://176.122.14.69:8080/Gee/Gee.mp3","Everybody is going to the party/每个人都涌向派对/Have real good time/玩得很嗨皮/Dancing in the desert/在沙漠中狂舞/Blowing up the sunshine/比阳光还灿烂/Everybody is going to the party/每个人都涌向派对/Have a real good time/玩得很嗨皮/Dancing in the desert/在沙漠中狂舞/Blowing up the sunshine/比阳光还灿烂Alok,Sevenn","娃娃","少女时代",16,1,"http://176.122.14.69:8080/WouldYouBe/Oneway-WouldYouBe.mp4","1/2",2,"好听无瑕疵,胖胖哒",109,3,13,25,"2/3","http://176.122.14.69:8080/songimgs/01.jpg"),
(NULL,"Nobody","http://176.122.14.69:8080/Nobody/Nobody.mp3","Everybody is going to the party/每个人都涌向派对/Have real good time/玩得很嗨皮/Dancing in the desert/在沙漠中狂舞/Blowing up the sunshine/比阳光还灿烂/Everybody is going to the party/每个人都涌向派对/Have a real good time/玩得很嗨皮/Dancing in the desert/在沙漠中狂舞/Blowing up the sunshine/比阳光还灿烂Alok,Sevenn","娃娃","Danelle Sandoval",17,2,"http://176.122.14.69:8080/WouldYouBe/Oneway-WouldYouBe.mp4","4",1,"好听无瑕疵,胖胖哒",109,1,13,25,"2/3","http://176.122.14.69:8080/songimgs/05.jpg"),
(NULL,"TheSpook","http://176.122.14.69:8080/TheSpook/TheSpook.mp3","Everybody is going to the party/每个人都涌向派对/Have real good time/玩得很嗨皮/Dancing in the desert/在沙漠中狂舞/Blowing up the sunshine/比阳光还灿烂/Everybody is going to the party/每个人都涌向派对/Have a real good time/玩得很嗨皮/Dancing in the desert/在沙漠中狂舞/Blowing up the sunshine/比阳光还灿烂Alok,Sevenn","娃娃","KSHMR,BassKillers,B3nte",18,3,"http://176.122.14.69:8080/WouldYouBe/Oneway-WouldYouBe.mp4","2/6",2,"好听无瑕疵,胖胖哒",109,3,13,25,"4/5","http://176.122.14.69:8080/songimgs/05.jpg"),
(NULL,"WouldYouBe","http://176.122.14.69:8080/WouldYouBe/WouldYouBe.mp3","Everybody is going to the party/每个人都涌向派对/Have real good time/玩得很嗨皮/Dancing in the desert/在沙漠中狂舞/Blowing up the sunshine/比阳光还灿烂/Everybody is going to the party/每个人都涌向派对/Have a real good time/玩得很嗨皮/Dancing in the desert/在沙漠中狂舞/Blowing up the sunshine/比阳光还灿烂Alok,Sevenn","娃娃","Oneway",19,4,"http://176.122.14.69:8080/WouldYouBe/Oneway-WouldYouBe.mp4","4/6",2,"好听无瑕疵,胖胖哒",109,4,13,25,"2","http://176.122.14.69:8080/songimgs/02.jpg"),
(NULL,"걱정말아요그대","http://176.122.14.69:8080/걱정말아요그대/걱정말아요그대.mp3","Everybody is going to the party/每个人都涌向派对/Have real good time/玩得很嗨皮/Dancing in the desert/在沙漠中狂舞/Blowing up the sunshine/比阳光还灿烂/Everybody is going to the party/每个人都涌向派对/Have a real good time/玩得很嗨皮/Dancing in the desert/在沙漠中狂舞/Blowing up the sunshine/比阳光还灿烂Alok,Sevenn","娃娃","曹政奭",20,5,"http://176.122.14.69:8080/WouldYouBe/Oneway-WouldYouBe.mp4","1/2",1,"好听无瑕疵,胖胖哒",109,2,13,25,"4","http://176.122.14.69:8080/songimgs/05.jpg"),
(NULL,"층간스캔들","http://176.122.14.69:8080/층간스캔들/층간스캔들.mp3","Everybody is going to the party/每个人都涌向派对/Have real good time/玩得很嗨皮/Dancing in the desert/在沙漠中狂舞/Blowing up the sunshine/比阳光还灿烂/Everybody is going to the party/每个人都涌向派对/Have a real good time/玩得很嗨皮/Dancing in the desert/在沙漠中狂舞/Blowing up the sunshine/比阳光还灿烂Alok,Sevenn","娃娃","Plastic",21,3,"http://176.122.14.69:8080/WouldYouBe/Oneway-WouldYouBe.mp4","1/4",1,"好听无瑕疵,胖胖哒",109,1,13,25,"1","http://176.122.14.69:8080/songimgs/04.gif"),
(NULL,"エンドレス？てゐマパーク","http://176.122.14.69:8080/エンドレスてゐマパーク/エンドレスてゐマパーク.mp3","Everybody is going to the party/每个人都涌向派对/Have real good time/玩得很嗨皮/Dancing in the desert/在沙漠中狂舞/Blowing up the sunshine/比阳光还灿烂/Everybody is going to the party/每个人都涌向派对/Have a real good time/玩得很嗨皮/Dancing in the desert/在沙漠中狂舞/Blowing up the sunshine/比阳光还灿烂Alok,Sevenn","娃娃","IOSYS",22,5,"http://176.122.14.69:8080/WouldYouBe/Oneway-WouldYouBe.mp4","5/6",2,"好听无瑕疵,胖胖哒",109,4,13,25,"1","http://176.122.14.69:8080/songimgs/05.jpg");

/*热度视频表*/
INSERT INTO hotVideo VALUES
(NULL,"茄子蛋情感剧场再度开演：当学生弟爱上小姐","以多种隐喻方式 描述似得似失、自我怀疑的情感","1","情感渣渣",2,10,"http://176.122.14.69:8080/carousel/timg02.jpg"),
(NULL,"茄子蛋情感剧场再度开演：当学生弟爱上小姐","以多种隐喻方式 描述似得似失、自我怀疑的情感","6","情感渣渣",1,10,"http://176.122.14.69:8080/carousel/timg03.jpg"),
(NULL,"茄子蛋情感剧场再度开演：当学生弟爱上小姐","以多种隐喻方式 描述似得似失、自我怀疑的情感","2","情感渣渣",3,10,"http://176.122.14.69:8080/carousel/timg04.jpg"),
(NULL,"与蛇共舞！Young Thug 创意视觉令人惊讶","这位炫酷又不失可爱的Rapper，你怎么看？","3","情感渣渣",8,10,"http://176.122.14.69:8080/carousel/timg05.jpg"),
(NULL,"茄子蛋情感剧场再度开演：当学生弟爱上小姐","以多种隐喻方式 描述似得似失、自我怀疑的情感","5","情感渣渣",10,10,"http://176.122.14.69:8080/carousel/timg01.jpg"),
(NULL,"茄子蛋情感剧场再度开演：当学生弟爱上小姐","以多种隐喻方式 描述似得似失、自我怀疑的情感","4","情感渣渣",5,10,"http://176.122.14.69:8080/carousel/timg02.jpg"),
(NULL,"茄子蛋情感剧场再度开演：当学生弟爱上小姐","以多种隐喻方式 描述似得似失、自我怀疑的情感","3","情感渣渣",20,10,"http://176.122.14.69:8080/carousel/timg03.jpg");