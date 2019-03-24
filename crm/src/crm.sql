/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 8.0.13 : Database - learnjava
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`learnjava` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;

USE `learnjava`;

/*Table structure for table `account` */

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `money` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `account` */

insert  into `account`(`id`,`name`,`money`) values (1,'黎明',900),(2,'黎明bySpring',1000),(3,'郭富城',1100),(4,'郭德纲',1000);

/*Table structure for table `base_dict` */

DROP TABLE IF EXISTS `base_dict`;

CREATE TABLE `base_dict` (
  `dict_id` varchar(32) NOT NULL COMMENT '数据字典id(主键)',
  `dict_type_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '数据字典类别代码',
  `dict_type_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '数据字典类别名称',
  `dict_item_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '数据字典项目名称',
  `dict_item_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '数据字典项目(可为空)',
  `dict_sort` int(10) DEFAULT NULL COMMENT '排序字段',
  `dict_enable` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '1:使用 0:停用',
  `dict_memo` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `base_dict` */

insert  into `base_dict`(`dict_id`,`dict_type_code`,`dict_type_name`,`dict_item_name`,`dict_item_code`,`dict_sort`,`dict_enable`,`dict_memo`) values ('1','001','客户行业','教育培训 ',NULL,1,'1',NULL),('10','003','公司性质','民企',NULL,3,'1',NULL),('12','004','年营业额','1-10万',NULL,1,'1',NULL),('13','004','年营业额','10-20万',NULL,2,'1',NULL),('14','004','年营业额','20-50万',NULL,3,'1',NULL),('15','004','年营业额','50-100万',NULL,4,'1',NULL),('16','004','年营业额','100-500万',NULL,5,'1',NULL),('17','004','年营业额','500-1000万',NULL,6,'1',NULL),('18','005','客户状态','基础客户',NULL,1,'1',NULL),('19','005','客户状态','潜在客户',NULL,2,'1',NULL),('2','001','客户行业','电子商务',NULL,2,'1',NULL),('20','005','客户状态','成功客户',NULL,3,'1',NULL),('21','005','客户状态','无效客户',NULL,4,'1',NULL),('22','006','客户级别','普通客户',NULL,1,'1',NULL),('23','006','客户级别','VIP客户',NULL,2,'1',NULL),('24','007','商机状态','意向客户',NULL,1,'1',NULL),('25','007','商机状态','初步沟通',NULL,2,'1',NULL),('26','007','商机状态','深度沟通',NULL,3,'1',NULL),('27','007','商机状态','签订合同',NULL,4,'1',NULL),('3','001','客户行业','对外贸易',NULL,3,'1',NULL),('30','008','商机类型','新业务',NULL,1,'1',NULL),('31','008','商机类型','现有业务',NULL,2,'1',NULL),('32','009','商机来源','电话营销',NULL,1,'1',NULL),('33','009','商机来源','网络营销',NULL,2,'1',NULL),('34','009','商机来源','推广活动',NULL,3,'1',NULL),('4','001','客户行业','酒店旅游',NULL,4,'1',NULL),('5','001','客户行业','房地产',NULL,5,'1',NULL),('6','002','客户信息来源','电话营销',NULL,1,'1',NULL),('7','002','客户信息来源','网络营销',NULL,2,'1',NULL),('8','003','公司性质','合资',NULL,1,'1',NULL),('9','003','公司性质','国企',NULL,2,'1',NULL);

/*Table structure for table `cst_customer` */

DROP TABLE IF EXISTS `cst_customer`;

CREATE TABLE `cst_customer` (
  `cust_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cust_name` varchar(255) DEFAULT NULL,
  `cust_source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `cust_industry` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `cust_level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `cust_phone` varchar(255) DEFAULT NULL,
  `cust_mobile` varchar(255) DEFAULT NULL,
  `cust_image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cust_id`),
  KEY `FKeh5g36duab8g1h051pdjfwcgd` (`cust_source`),
  KEY `FK2xhr3arwp3tkuae1da4lqv352` (`cust_industry`),
  KEY `FKrty52nvbjg1echf0se39eng49` (`cust_level`),
  CONSTRAINT `FK2xhr3arwp3tkuae1da4lqv352` FOREIGN KEY (`cust_industry`) REFERENCES `base_dict` (`dict_id`),
  CONSTRAINT `FKeh5g36duab8g1h051pdjfwcgd` FOREIGN KEY (`cust_source`) REFERENCES `base_dict` (`dict_id`),
  CONSTRAINT `FKrty52nvbjg1echf0se39eng49` FOREIGN KEY (`cust_level`) REFERENCES `base_dict` (`dict_id`),
  CONSTRAINT `cst_customer_ibfk_1` FOREIGN KEY (`cust_source`) REFERENCES `base_dict` (`dict_id`),
  CONSTRAINT `cst_customer_ibfk_2` FOREIGN KEY (`cust_industry`) REFERENCES `base_dict` (`dict_id`),
  CONSTRAINT `cst_customer_ibfk_3` FOREIGN KEY (`cust_level`) REFERENCES `base_dict` (`dict_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `cst_customer` */

insert  into `cst_customer`(`cust_id`,`cust_name`,`cust_source`,`cust_industry`,`cust_level`,`cust_phone`,`cust_mobile`,`cust_image`) values (4,'李兵','6','4','22',NULL,NULL,NULL),(5,'赵洪','7','2','22',NULL,NULL,NULL),(6,'郑志龙','6','1','22',NULL,NULL,NULL),(18,'黎明','7','4','23','8888888','1888888888',NULL),(22,'郭富城','7','2','22','99999999','16579667825',NULL),(23,'刘邦','6','5','23','232323','32323232323',NULL),(26,'项羽','7','5','23','323232323','32323232',NULL),(27,'二哈','7','5','23','66564554','138348103',NULL),(31,'劫','7','2','22','010-8888888','1888888888',NULL),(32,'易大师','7','2','23','010-8888888','1888888888',NULL),(34,'赵信','6','1','22','010-8888888','1888888888',NULL),(35,'蛮子','6','1','22','010-8888888','1888888888',NULL),(45,'亚索','7','2','23','010-8888888','1888888888','G:/upload/11/9/08f211ab0ca54240a1b95fab50cbff21.jpg'),(50,'凯尔','7','4','23','010-8888888','1888888888','');

/*Table structure for table `cst_linkman` */

DROP TABLE IF EXISTS `cst_linkman`;

CREATE TABLE `cst_linkman` (
  `lkm_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `lkm_name` varchar(255) DEFAULT NULL,
  `lkm_gender` varchar(255) DEFAULT NULL,
  `lkm_phone` varchar(255) DEFAULT NULL,
  `lkm_mobile` varchar(255) DEFAULT NULL,
  `lkm_email` varchar(255) DEFAULT NULL,
  `lkm_qq` varchar(255) DEFAULT NULL,
  `lkm_position` varchar(255) DEFAULT NULL,
  `lkm_memo` varchar(255) DEFAULT NULL,
  `lkm_cust_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`lkm_id`),
  KEY `FKh9yp1nql5227xxcopuxqx2e7q` (`lkm_cust_id`),
  CONSTRAINT `FKh9yp1nql5227xxcopuxqx2e7q` FOREIGN KEY (`lkm_cust_id`) REFERENCES `cst_customer` (`cust_id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `cst_linkman` */

insert  into `cst_linkman`(`lkm_id`,`lkm_name`,`lkm_gender`,`lkm_phone`,`lkm_mobile`,`lkm_email`,`lkm_qq`,`lkm_position`,`lkm_memo`,`lkm_cust_id`) values (4,'王东','1','6666666','888888','888888',NULL,'经理',NULL,4),(14,'凤姐','2','383838438','383838438','383838438','383838438','技师',NULL,22),(24,'菊花','1','383838438','383838438','383838438','383838438','技师','',45),(57,'锐雯','2','1999999','1999999','1999999','1999999','战士','2323',45);

/*Table structure for table `sale_visit` */

DROP TABLE IF EXISTS `sale_visit`;

CREATE TABLE `sale_visit` (
  `visit_id` bigint(32) NOT NULL AUTO_INCREMENT,
  `visit_cust_id` bigint(32) DEFAULT NULL COMMENT '客户id',
  `visit_user_id` bigint(32) DEFAULT NULL COMMENT '负责人id',
  `visit_time` date DEFAULT NULL COMMENT '拜访时间',
  `visit_addr` varchar(128) DEFAULT NULL COMMENT '拜访地点',
  `visit_detail` varchar(256) DEFAULT NULL COMMENT '拜访详情',
  `visit_nexttime` date DEFAULT NULL COMMENT '下次拜访时间',
  PRIMARY KEY (`visit_id`),
  KEY `FK_sale_visit_cust_id` (`visit_cust_id`),
  KEY `FK_sale_visit_user_id` (`visit_user_id`),
  CONSTRAINT `FK_sale_visit_cust_id` FOREIGN KEY (`visit_cust_id`) REFERENCES `cst_customer` (`cust_id`),
  CONSTRAINT `FK_sale_visit_user_id` FOREIGN KEY (`visit_user_id`) REFERENCES `sys_user` (`user_id`),
  CONSTRAINT `FKc92iepd26mixxfiris92hccjx` FOREIGN KEY (`visit_user_id`) REFERENCES `sys_user` (`user_id`),
  CONSTRAINT `FKgr4aivocixwcvkwxcmc0b4css` FOREIGN KEY (`visit_cust_id`) REFERENCES `cst_customer` (`cust_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sale_visit` */

insert  into `sale_visit`(`visit_id`,`visit_cust_id`,`visit_user_id`,`visit_time`,`visit_addr`,`visit_detail`,`visit_nexttime`) values (1,31,1,'2019-02-13','上路','还行','2019-02-23'),(2,32,2,'2019-02-06','下路','不错','2019-02-08'),(3,35,3,'2019-01-29','中路','可以','2019-02-09'),(4,32,1,'2019-01-28','野区','666','2019-02-01'),(5,26,8,'2019-02-01','未知地点','很不愉快','2019-02-28');

/*Table structure for table `sys_role` */

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  `role_memo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sys_role` */

insert  into `sys_role`(`role_id`,`role_name`,`role_memo`) values (1,'研发部',NULL),(2,'市场部',NULL),(3,'公关部',NULL);

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_code` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `user_state` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sys_user` */

insert  into `sys_user`(`user_id`,`user_code`,`user_name`,`user_password`,`user_state`) values (1,'','赵洪','123',NULL),(2,'','李兵','321',NULL),(3,'lm','黎明','202cb962ac59075b964b07152d234b70','1'),(4,'gfc','郭富城','caf1a3dfb505ffed0d024130f58c5cfa','1'),(5,'ldh','刘德华','df6d2338b2b8fce1ec2f6dda0a630eb0','1'),(6,'gdg','郭德纲','68053af2923e00204c3ca7c6a3150cf7','1'),(7,'zxy','张学友','fae0b27c451c728867a567e8c1bb4e53','1'),(8,'lb','刘邦','698d51a19d8a121ce581499d7b701668','1'),(9,'xy','项羽','698d51a19d8a121ce581499d7b701668','1'),(10,'hsq','哈士奇','caf1a3dfb505ffed0d024130f58c5cfa','1'),(11,'zx','赵信','caf1a3dfb505ffed0d024130f58c5cfa','1');

/*Table structure for table `sys_user_role` */

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `role_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKhh52n8vd4ny9ff4x9fb8v65qx` (`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `sys_user_role` */

insert  into `sys_user_role`(`role_id`,`user_id`) values (2,1),(3,1),(2,2),(3,2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
