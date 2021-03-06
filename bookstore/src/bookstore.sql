/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 8.0.13 : Database - bookstore
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bookstore` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;

USE `bookstore`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `adminId` bigint(8) NOT NULL AUTO_INCREMENT,
  `adminName` varchar(32) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`adminId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `admin` */

insert  into `admin`(`adminId`,`adminName`,`password`) values (1,'admin','21232f297a57a5a743894a0e4a801fc3');

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `bookId` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `bookName` varchar(64) DEFAULT NULL,
  `author` varchar(64) DEFAULT NULL,
  `price` decimal(5,2) DEFAULT NULL COMMENT '进货价',
  `currentPrice` decimal(5,2) DEFAULT NULL COMMENT '当前售价',
  `discount` decimal(3,1) DEFAULT NULL COMMENT '折扣',
  `ISBN` varchar(64) DEFAULT NULL,
  `press` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '出版社',
  `edition` varchar(8) DEFAULT NULL,
  `smallImage` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `bigImage` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `categoryID` bigint(8) DEFAULT NULL,
  PRIMARY KEY (`bookId`),
  KEY `FKeq4oacjs3hy559tmw1rsd21n4` (`categoryID`),
  CONSTRAINT `FK290k9j8o199m2m52ka029ivc0` FOREIGN KEY (`categoryID`) REFERENCES `category` (`categoryid`),
  CONSTRAINT `FKeq4oacjs3hy559tmw1rsd21n4` FOREIGN KEY (`categoryID`) REFERENCES `category` (`categoryid`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `category` (`categoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `book` */

insert  into `book`(`bookId`,`bookName`,`author`,`price`,`currentPrice`,`discount`,`ISBN`,`press`,`edition`,`smallImage`,`bigImage`,`categoryID`) values ('23579654','三体：全三册','刘慈欣',60.00,99.00,9.0,'23579654','重庆出版社',NULL,'b2bc7fbd64ef46febc50db6ae9759b21.jpg','bb3eef17c5734de992a350ec7927643e.jpg',19),('23697183','经济学原理 （第7版）','（美）曼昆 著，梁小民，梁砾 译',56.00,89.00,9.0,'23697183','北京大学出版社',NULL,'a16088a9fadb446abec0b417a6600301.jpg','21ae3b0da2354489b192901edea9f04b.jpg',26),('23812473','郑渊洁十二生肖童话（全12册）','郑渊洁',86.00,168.00,8.5,'23812473','浙江少年儿童出版社',NULL,'f468e168775642d4b97c76a3b2d81588.jpg','7ec99181ecde4cb7b6ce5c15d17d5a85.jpg',20),('9787030602831','西氏内科学精要','Ivor J. Benjmin等 主编；王辰等译',498.00,999.00,7.9,'9787030602831','科学出版社',NULL,'7e718e41b2aa48519dc731fc25849449.jpg','bbe84b2832d845d09b9ca61141d48a8a.jpg',37),('9787040396614','线性代数 第六版','同济大学数学系',16.00,36.00,4.8,'9787040396614','高等教育出版社',NULL,'487f26d4dee94b58bd9e5c2c2db000d4.jpg','24795bc6d529420d96e38ece676fe25c.jpg',9),('9787040396638','高等数学（第七版）（上册）','同济大学数学系',39.00,47.60,9.8,'9787040396638','高等教育出版社','第七版','gdsx.jpg','gdsx_big.jpg',9),('9787100077040','新华字典（第11版）（双色本）','中国社会科学院语言研究所',15.00,50.00,4.9,'9787100077040','商务印书馆',NULL,'e528ceb9f3ed4ef7a83e70b2feba04f9.jpg','0e1c03c6ad53494da93853e9bf102605.jpg',12),('9787108062475','图说中国民居','[美]那仲良 著 [菲] 王行富 摄影 任羽楠 译',310.00,790.00,7.1,'9787108062475','生活.读书.新知三联书店',NULL,'51261cfe16e944068023302f65c34dc8.jpg','f49d10dbb2e14ec1963f4d80e799275b.jpg',36),('9787111421900','深入理解Java虚拟机','周志明',54.90,79.00,8.9,'9787111421900','机械工业出版社',NULL,'961236e30a3c434eaa90fd63104ae5a9.jpg','05f41c1e5c624005b2ea860e57703bd0.jpg',34),('9787111445142','Java核心技术 卷1 基础知识','(美)霍斯特曼 等',87.00,119.00,8.8,'9787111445142','机械工业出版社',NULL,'11521dce0d9241f586675c8a79004767.jpg','ceaaa8d13d344ee79f850e8548ca6fbd.jpg',34),('9787111547426','Java核心技术卷II：高级特性','(美)霍斯特曼 等',200.00,258.00,8.8,'9787111547426','机械工业出版社',NULL,'f279bf853adc4076aa914afefad7c155.jpg','f9b3743354a6432286b31c23c01b6f18.jpg',34),('9787114151606','流浪地球-电影制作手记','朔方 等',45.00,59.80,8.9,'9787114151606','人民交通出版社','第一版','must_6.jpg','must_6_big.jpg',35),('9787115409362','心理学与生活（第19版）','【美】理查德·格里格，菲利普·津巴多',70.00,168.00,8.0,'9787115409362','人民邮电出版社',NULL,'6a72fd2b525a458f9577fd35b9fac566.jpg','968721ba5011410294bfc5b2a6de234d.jpg',25),('9787115508645','重构 改善既有代码的设计','[美]马丁·福勒',118.50,168.00,8.7,'9787115508645','人民邮电出版社',NULL,'b9b5a89a028f4d49a85c7fb269c31416.jpg','9151a46b625d4b1a865482afafba2ac9.jpg',34),('9787121350023','大型网站性能优化实战','周涛明',45.00,79.00,9.0,'9787121350023','电子工业出版社','第二版','jsj3.jpg','jsj3_big.jpg',34),('9787121359545','互联网轻量级SSM框架解密','李艳鹏 等',59.00,109.00,9.0,'9787121359545','电子工业出版社','第四版','jsj2.jpg','jsj2_big.jpg',34),('9787213090370','敢于孤独的勇气','周国平',26.00,46.00,6.5,'9787213090370','浙江人民出版社','第二版','must_3.jpg','must_3_big.jpg',25),('9787220109201','走遍中国 图说天下 寻梦之旅','霍晨昕',18.00,36.00,5.8,'9787220109201','四川人民出版社',NULL,'daedd88342944a56ac67b8d929041e62.jpg','7c183e1b16904829bf92758cf79f6d76.jpg',29),('9787302517979','Spring Boot+Vue全栈开发实战','王松',36.00,69.00,7.9,'9787302517979','清华大学出版社','第一版','jsj1.jpg','jsj1_big.jpg',34),('9787506365437','活着','余华',20.00,28.00,5.9,'9787506365437','作家出版社',NULL,'hz.jpg','hz_big.jpg',13),('9787508698144','认知尺度','魏坤琳、陈虎平等',43.00,59.00,7.5,'9787508698144','中信出版社','第一版','must_4.jpg','must_4_big.jpg',23),('9787508698908','魏坤琳的科学养育宝典','魏坤琳',38.00,58.00,7.5,'9787508698908','中信出版社',NULL,'must_1.jpg','must_1_big.jpg',35),('9787513923514','拥有一个你说了算的人生·活出自我篇','武志红 ',31.00,62.00,7.3,'9787513923514','民主与建设出版社','第一版','must_5.jpg','must_5_big.jpg',25),('9787516814628','我爱这三分欣喜七分哀伤的世界','[黎巴嫩]纪伯伦',29.00,39.00,6.7,'9787516814628','台海出版社','第一版','must_8.jpg','must_8_big.jpg',14),('9787519303365','新东方 托福考试官方指南','ETS（美国教育考试服务中心） 著',120.00,148.00,8.8,'9787519303365','群言出版社',NULL,'wy.jpg','wy_big.jpg',11),('9787530955574','福尔摩斯探案全集（上、中、下）','（英）柯南道尔　著，王知一　译',88.00,108.00,9.4,'9787530955574','天津教育出版社','第三版','fems.jpg','fems_big.jpg',15),('9787532168835','小读客·米米没问题系列','周逸芬/文 陈致元 和英美术团队/图',88.00,139.80,9.5,'9787532168835','上海文艺出版社','第一版','must_2.jpg','must_2_big.jpg',22),('9787532492855','十万个为什么 第六版平装套装','韩启德',300.00,780.00,7.0,'9787532492855','少年儿童出版社',NULL,'9d828f25374549349c867eb60116c989.jpg','5412b62bd7b84993b3b27ed44f3af3bf.jpg',21),('9787533954741','易中天中华史 第二十一卷','易中天，果麦文化',21.00,42.00,6.0,'9787533954741','浙江文艺出版社',NULL,'666ea38dc9b04b70ad2a00024aa531ec.jpg','341655c0c4f84f33a3bfd3ea8b7bac5d.jpg',23),('9787534951282','景观园林植物图鉴','闫双喜 刘保国 李永华 编',320.00,800.00,7.5,'9787534951282','河南科学技术出版社',NULL,'6141dc2952734058873e1ddae7efe695.jpg','eea9fac42a2c4455a8b7e9a07780f2b0.jpg',38),('9787538597066','意林少年版合订本2019年01-03','《意林·少年版》编辑部',14.00,66.00,5.0,'9787538597066','北方妇女儿童出版社',NULL,'fdb54b35887c46b0a2d796c10b4b867d.jpg','8cb2b85fa17d4582b7122853f12b8d2b.jpg',16),('9787549237814','龙族4奥丁之渊','江南',17.00,32.00,5.7,'9787549237814','长江出版社',NULL,'8a255097530f470a8b69e479187ead06.jpg','80d5e55219b3412d9b4c32b1fb322a44.jpg',18),('9787550022584','我念你如初','顾西爵，白马时光',23.00,57.00,5.9,'9787550022584','百花洲文艺出版社',NULL,'f9a0c473b36940bcbb8c00ed36c40b53.jpg','4657cab654164a12beab347a7a69d44c.jpg',17),('9787559415103','深度思考：不断逼近问题的本质','[美]莫琳·希凯 著 孔锐才 译',32.00,89.00,7.4,'9787559415103','江苏凤凰文艺出版社',NULL,'588a1bc2f40845939680d16941dbe6fb.jpg','153c1b04d87647d2936a1a4df3acef04.jpg',27),('9787559431523','夏摩山谷','庆山（安妮宝贝），果麦文化 出品',39.00,58.00,9.9,'9787559431523','江苏凤凰文艺出版社','第一版','must_7.jpg','must_7_big.jpg',13),('9787563236008','大学英语4级真题试卷','王海华 徐瑾',30.00,35.00,6.8,'9787563236008','大连海事大学出版社',NULL,'4j.jpg','4j_big.jpg',10),('9787563236099','高等数学（第七版）（下册）','同济大学数学系',31.00,45.00,6.9,'9787563236099','高等教育出版社','第七版','gdsx_xia.jpg','gdsx_xia_big.jpg',9);

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `categoryId` bigint(8) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(64) DEFAULT NULL,
  `pid` bigint(8) DEFAULT NULL,
  PRIMARY KEY (`categoryId`),
  KEY `pid` (`pid`),
  CONSTRAINT `category_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `category` (`categoryid`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `category` */

insert  into `category`(`categoryId`,`categoryName`,`pid`) values (1,'教育',NULL),(2,'小说',NULL),(3,'青春文学',NULL),(4,'童书',NULL),(5,'人文社科',NULL),(6,'经管',NULL),(7,'生活',NULL),(8,'科技',NULL),(9,'教材',1),(10,'考试',1),(11,'外语',1),(12,'工具书',1),(13,'中国小说',2),(14,'外国小说',2),(15,'悬疑推理',2),(16,'校园',3),(17,'情感',3),(18,'热血',3),(19,'科幻',3),(20,'儿童文学',4),(21,'科普百科',4),(22,'启蒙读物',4),(23,'历史文化',5),(24,'政治/军事',5),(25,'心理学',5),(26,'经济',6),(27,'管理',6),(28,'投资理财',6),(29,'旅游',7),(30,'美食',7),(31,'运动',7),(32,'休闲',7),(33,'手工',7),(34,'计算机',8),(35,'科普',8),(36,'建筑',8),(37,'医学',8),(38,'农林',8);

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `commentId` varchar(64) NOT NULL,
  `userId` varchar(64) DEFAULT NULL,
  `bookId` varchar(64) DEFAULT NULL,
  `commentTime` datetime DEFAULT NULL,
  `comments` varchar(128) DEFAULT NULL,
  `userName` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`commentId`),
  KEY `userId` (`userId`),
  KEY `bookId` (`bookId`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userid`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`bookId`) REFERENCES `book` (`bookid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `comment` */

insert  into `comment`(`commentId`,`userId`,`bookId`,`commentTime`,`comments`,`userName`) values ('1','43fb7f5a-37e3-4e96-a7f6-d804bea65204','9787508698908','2019-04-03 19:36:46','挺好用的一本书,很喜欢挺好用的一本书','kldxss'),('10','235a0c27-23t4-4679-h505-79we64s40d56','9787040396638','2019-04-23 19:36:49','非常有用,很喜欢这本书,受益良多','123'),('11','235a0c27-23t4-4679-h505-79we64s40d56','9787508698908','2019-04-23 22:36:20','非常有用,很喜欢这本书,受益良多','123'),('12','43fb7f5a-37e3-4e96-a7f6-d804bea65204','9787508698908','2019-04-22 19:36:51','挺好用的一本书,很喜欢挺好用的一本书','kldxss'),('2','235a0c27-23t4-4679-h505-79we64s40d56','9787508698908','2019-04-19 19:36:01','非常有用,很喜欢这本书,受益良多','123'),('3','235a0c27-23t4-4679-h505-79we64s40d56','9787040396638','2019-04-23 19:36:04','非常有用,很喜欢这本书,受益良多','123'),('4','235a0c27-23t4-4679-h505-79we64s40d56','9787508698908','2019-04-03 23:35:59','非常有用,很喜欢这本书,受益良多','123'),('4a5ff480-483e-4c02-a4c9-9e30b26b0df0','235a0c27-23t4-4679-h505-79we64s40d56','9787508698908','2019-04-26 19:32:53','2019/4/21 18:40','123'),('4bcb37b8-9ff8-4d6d-ab2d-2bfeb4c5a8f4','6f50dc9e-dd52-4263-97c6-0f176533830e','9787213090370','2019-05-05 21:31:59','再次读这本书,又体会到了另一种心境','快乐风男'),('5','235a0c27-23t4-4679-h505-79we64s40d56','9787040396638','2019-04-21 11:36:32','非常有用,很喜欢这本书,受益良多','123'),('53b3bbeb-bda6-4cf4-8105-b96d104c6548','235a0c27-23t4-4679-h505-79we64s40d56','9787302517979','2019-05-13 22:55:19','通过这本书学到了很多Spring Boot的知识','123'),('6','235a0c27-23t4-4679-h505-79we64s40d56','9787040396638','2019-04-09 12:36:26','非常有用,很喜欢这本书,受益良多','123'),('7','235a0c27-23t4-4679-h505-79we64s40d56','9787040396638','2019-04-23 09:36:38','非常有用,很喜欢这本书,受益良多','123'),('8','235a0c27-23t4-4679-h505-79we64s40d56','9787040396638','2019-04-03 19:36:54','非常有用,很喜欢这本书,受益良多','123'),('9','235a0c27-23t4-4679-h505-79we64s40d56','9787508698908','2019-04-16 19:36:56','非常有用,很喜欢这本书,受益良多','123'),('a1d2c93f-5e51-499b-a6cf-5b35d0198567','235a0c27-23t4-4679-h505-79we64s40d56','9787506365437','2019-04-25 19:36:58','好难看 看不懂','123'),('a3892bde-b765-4aa8-95a0-2f908380c52a','6f50dc9e-dd52-4263-97c6-0f176533830e','9787213090370','2019-05-05 21:51:45','','快乐风男'),('e6ccfc33-4727-4c95-9795-9475ab02d59c','235a0c27-23t4-4679-h505-79we64s40d56','9787506365437','2019-04-21 19:48:14','其实还好拉,余华是我见过最优秀的作家之一,这本书用心看还是挺不错的','123'),('f2ec6467-36ec-459c-ba1f-9112410f4dc8','6f50dc9e-dd52-4263-97c6-0f176533830e','9787213090370','2019-05-05 21:30:08','这本对对我来说非常有意义','快乐风男');

/*Table structure for table `orderitem` */

DROP TABLE IF EXISTS `orderitem`;

CREATE TABLE `orderitem` (
  `orderItemId` varchar(64) NOT NULL,
  `quantity` bigint(8) DEFAULT NULL COMMENT '数量',
  `subtotal` decimal(8,2) DEFAULT NULL,
  `bookId` varchar(64) DEFAULT NULL,
  `bookName` varchar(64) DEFAULT NULL,
  `currentPrice` decimal(8,2) DEFAULT NULL,
  `image` varchar(64) DEFAULT NULL,
  `orderID` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`orderItemId`),
  KEY `orderID` (`orderID`),
  CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `orderitem` */

insert  into `orderitem`(`orderItemId`,`quantity`,`subtotal`,`bookId`,`bookName`,`currentPrice`,`image`,`orderID`) values ('00551059-2bfb-4241-86e9-2cfde90ec25f',5,152.00,'9787513923514','拥有一个你说了算的人生·活出自我篇',30.40,'must_5.jpg','f175f279-705c-4d62-ad2c-ebd9d1e8c418'),('02ae10db-e441-4695-8b20-8b4af4418109',2,56.80,'9787302517979','Spring Boot+Vue全栈开发实战',28.40,'jsj1.jpg','cb4f1fd9-ba23-42c0-b119-408573306ccb'),('0cc25443-5126-4dbe-a3e7-70586a935031',1,38.20,'9787040396638','高等数学（第七版）（上册）',38.20,'gdsx.jpg','cb4f1fd9-ba23-42c0-b119-408573306ccb'),('2b4b18a0-1d82-4d00-b498-aad80f9f0958',1,19.80,'9787506365437','活着',19.80,'hz.jpg','c9662e6e-2da5-43fd-91d6-98b4ac5bc2c6'),('2e1e4139-e37e-47fd-a629-958d19607412',2,59.40,'9787563236008','大学英语4级真题试卷',29.70,'4j.jpg','f175f279-705c-4d62-ad2c-ebd9d1e8c418'),('3e811038-a2b5-48ee-8c48-062529ee5e9f',1,24.40,'9787213090370','敢于孤独的勇气',24.40,'must_3.jpg','ca417c1d-c193-4de2-8d33-a274f57cc493'),('41b3f253-aee4-4f0e-9842-b28a18d1d9f9',1,38.20,'9787040396638','高等数学（第七版）（上册）',38.20,'gdsx.jpg','a78f7efe-561e-494d-b8f8-c7eb65466091'),('701adb5d-885e-4377-8af7-65575e2c28fe',1,19.50,'9787121350023','大型网站性能优化实战',19.50,'jsj3.jpg','9abecc6e-1d8d-491a-b8d0-0a4ab786c35b'),('73df13e5-32c0-4094-9e72-1277027ae13b',1,19.80,'9787506365437','活着',19.80,'hz.jpg','ca417c1d-c193-4de2-8d33-a274f57cc493'),('8d48bff3-c067-4035-a937-78aa4bfe15ef',3,114.60,'9787040396638','高等数学（第七版）（上册）',38.20,'gdsx.jpg','9abecc6e-1d8d-491a-b8d0-0a4ab786c35b'),('99f3ef22-6402-435f-81e9-35dbeb6e1e71',2,80.00,'9787114151606','流浪地球-电影制作手记',40.00,'must_6.jpg','9abecc6e-1d8d-491a-b8d0-0a4ab786c35b'),('ad76f6c0-e565-4924-b7d5-44a1be14e664',1,28.40,'9787302517979','Spring Boot+Vue全栈开发实战',28.40,'jsj1.jpg','f5af637c-957a-442b-9d8e-eb7ac9706ce3'),('fc16a763-c017-4c5b-a982-67f4d2afc8bb',1,28.40,'9787516814628','我爱这三分欣喜七分哀伤的世界',28.40,'must_8.jpg','982cbe82-767b-41ec-b3f0-05ad5151e457');

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `orderId` varchar(64) NOT NULL,
  `orderTime` datetime DEFAULT NULL,
  `orderStatus` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '0=完成 1=待付款 2=已付款,未发货 3=,已发货,待签收',
  `address` varchar(128) DEFAULT NULL,
  `total` decimal(8,2) DEFAULT NULL,
  `userID` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`orderId`),
  KEY `userID` (`userID`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `orders` */

insert  into `orders`(`orderId`,`orderTime`,`orderStatus`,`address`,`total`,`userID`) values ('982cbe82-767b-41ec-b3f0-05ad5151e457','2019-05-13 22:53:22','3','湖北省武汉市武汉纺织大学学生公寓5A',28.40,'235a0c27-23t4-4679-h505-79we64s40d56'),('9abecc6e-1d8d-491a-b8d0-0a4ab786c35b','2019-04-20 23:38:08','1','湖北省武汉市武汉纺织大学学生公寓5A',214.30,'235a0c27-23t4-4679-h505-79we64s40d56'),('a78f7efe-561e-494d-b8f8-c7eb65466091','2019-05-01 22:15:48','3','湖北省武汉市武汉纺织大学学生公寓5A',66.30,'a9321b3a-6f8e-4a80-ba39-ac95fe4249d8'),('c9662e6e-2da5-43fd-91d6-98b4ac5bc2c6','2019-04-21 12:44:50','0','湖北省武汉市武汉纺织大学学生公寓5A',19.80,'235a0c27-23t4-4679-h505-79we64s40d56'),('ca417c1d-c193-4de2-8d33-a274f57cc493','2019-04-21 16:41:59','2','湖北省武汉市武汉纺织大学学生公寓5B',278.20,'a9321b3a-6f8e-4a80-ba39-ac95fe4249d8'),('cb4f1fd9-ba23-42c0-b119-408573306ccb','2019-05-06 18:50:00','1','湖北省武汉市武汉纺织大学5A627',95.10,'6f50dc9e-dd52-4263-97c6-0f176533830e'),('f175f279-705c-4d62-ad2c-ebd9d1e8c418','2019-05-13 22:54:35','2','湖北省武汉市武汉纺织大学学生公寓5A',211.40,'235a0c27-23t4-4679-h505-79we64s40d56'),('f5af637c-957a-442b-9d8e-eb7ac9706ce3','2019-04-20 23:39:14','0','湖北省武汉市武汉纺织大学学生公寓5A',28.40,'235a0c27-23t4-4679-h505-79we64s40d56');

/*Table structure for table `shoppingcart` */

DROP TABLE IF EXISTS `shoppingcart`;

CREATE TABLE `shoppingcart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `quantity` bigint(8) DEFAULT NULL COMMENT '数量',
  `bookID` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `userID` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `bookName` varchar(64) DEFAULT NULL,
  `bookImage` varchar(64) DEFAULT NULL,
  `currentPrice` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKrkuxljqutjy109c48fgi1bxsf` (`userID`),
  KEY `FKgpr9ng0yqjoo09fvykbsu7l85` (`bookID`),
  CONSTRAINT `FKgpr9ng0yqjoo09fvykbsu7l85` FOREIGN KEY (`bookID`) REFERENCES `book` (`bookid`),
  CONSTRAINT `FKrkuxljqutjy109c48fgi1bxsf` FOREIGN KEY (`userID`) REFERENCES `user` (`userid`),
  CONSTRAINT `shoppingcart_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `user` (`userid`),
  CONSTRAINT `shoppingcart_ibfk_2` FOREIGN KEY (`bookID`) REFERENCES `book` (`bookid`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `shoppingcart` */

insert  into `shoppingcart`(`id`,`quantity`,`bookID`,`userID`,`bookName`,`bookImage`,`currentPrice`) values (147,1,'9787121350023','43fb7f5a-37e3-4e96-a7f6-d804bea65204','大型网站性能优化实战','jsj3.jpg',19.50),(148,1,'9787114151606','43fb7f5a-37e3-4e96-a7f6-d804bea65204','流浪地球-电影制作手记','must_6.jpg',40.00),(149,1,'9787121359545','43fb7f5a-37e3-4e96-a7f6-d804bea65204','互联网轻量级SSM框架解密','jsj2.jpg',46.00),(150,1,'9787213090370','43fb7f5a-37e3-4e96-a7f6-d804bea65204','敢于孤独的勇气','must_3.jpg',24.40),(182,1,'9787538597066','235a0c27-23t4-4679-h505-79we64s40d56','意林少年版合订本2019年01-03','fdb54b35887c46b0a2d796c10b4b867d.jpg',7.00);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `userId` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `userEmail` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `userPhone` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `userAddress` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `money` bigint(8) DEFAULT NULL,
  `userStatus` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `loginname` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`userId`,`username`,`password`,`userEmail`,`userPhone`,`userAddress`,`money`,`userStatus`) values ('235a0c27-23t4-4679-h505-79we64s40d56','123','caf1a3dfb505ffed0d024130f58c5cfa','963945475@qq.com','13945475232','湖北省武汉市武汉纺织大学学生公寓5A',1000,'1'),('391661ce-90eb-4254-9d5d-26f798ee91a1','18672962232','202cb962ac59075b964b07152d234b70','18672962232@163.com','18672962232','湖北省武汉市武汉纺织大学学生公寓5A',1000,'1'),('43fb7f5a-37e3-4e96-a7f6-d804bea65204','kldxss','7cc6f414478b9351ad76c5f647ef57d2','1169904875@qq.com','114002658',NULL,0,'1'),('635a0c27-e434-4400-8207-f802e0500da4','admin','21232f297a57a5a743894a0e4a801fc3','','','',0,'0'),('6f50dc9e-dd52-4263-97c6-0f176533830e','快乐风男','202cb962ac59075b964b07152d234b70','963941527@qq.com','18672962232','湖北省武汉市武汉纺织大学5A627',0,'1'),('96b61b8a-496b-4016-b2ab-288c36b46459','快乐的小松鼠','4b6538a44a1dfdc2b83477cd76dee98e','18672962232@163.com','18672962232','湖北省武汉市江夏区武汉纺织大学',0,'1'),('a9321b3a-6f8e-4a80-ba39-ac95fe4249d8','bsdxss','fb11b49d0847ed23b7c6d8f93198b1d4','1166902444@qq.com','13164159988','湖北省武汉市江夏区武汉纺织大学',0,'1'),('e99feb5b-49cd-4365-b13b-ad67997cc366','2233','e0f7a4d0ef9b84b83b693bbf3feb8e6e','2233666666@bilibili.com','2233666666','湖北省武汉市武汉纺织大学学生公寓5A',1000,'1');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
