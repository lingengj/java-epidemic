/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.7.24 : Database - epidemic
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`epidemic` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `epidemic`;

/*Table structure for table `epidemics` */

DROP TABLE IF EXISTS `epidemics`;

CREATE TABLE `epidemics` (
  `serial_id` int(11) NOT NULL AUTO_INCREMENT,
  `province_id` int(11) DEFAULT NULL,
  `data_year` smallint(6) DEFAULT NULL,
  `data_month` smallint(6) DEFAULT NULL,
  `data_day` smallint(6) DEFAULT NULL,
  `affirmed` int(11) DEFAULT NULL,
  `suspected` int(11) DEFAULT NULL,
  `isolated` int(11) DEFAULT NULL,
  `dead` int(11) DEFAULT NULL,
  `cured` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `input_date` datetime DEFAULT NULL,
  PRIMARY KEY (`serial_id`),
  KEY `FK_epid_prov` (`province_id`),
  KEY `FK_epid_user` (`user_id`),
  CONSTRAINT `FK_epid_prov` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`province_id`),
  CONSTRAINT `FK_epid_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

/*Data for the table `epidemics` */

insert  into `epidemics`(`serial_id`,`province_id`,`data_year`,`data_month`,`data_day`,`affirmed`,`suspected`,`isolated`,`dead`,`cured`,`user_id`,`input_date`) values (1,11,2020,7,6,300,20,40,0,300,1,'2020-07-06 00:34:06'),(2,12,2020,7,6,200,0,0,0,0,1,'2020-07-06 00:34:06'),(3,13,2020,7,6,450,0,0,0,0,1,'2020-07-06 00:34:06'),(4,14,2020,7,6,1200,0,0,0,0,1,'2020-07-06 00:34:06'),(5,15,2020,7,6,30,0,0,0,0,1,'2020-07-06 00:34:06'),(6,21,2020,7,6,60,0,0,0,0,1,'2020-07-06 00:34:06'),(7,22,2020,7,6,90,0,0,0,0,1,'2020-07-06 00:34:21'),(8,23,2020,7,6,440,0,0,0,0,1,'2020-07-06 00:34:21'),(9,31,2020,7,6,660,0,0,0,0,1,'2020-07-06 00:34:21'),(10,22,2020,7,6,100,0,0,0,0,1,'2020-07-06 00:34:21'),(11,32,2020,7,6,10,0,0,0,0,1,'2020-07-06 00:34:21'),(12,23,2020,7,6,50,0,0,0,0,1,'2020-07-06 00:34:21'),(13,33,2020,7,6,300,0,0,0,0,1,'2020-07-06 00:34:21'),(14,31,2020,7,6,50,0,0,0,0,1,'2020-07-06 00:34:21'),(15,34,2020,7,6,80,0,0,0,0,1,'2020-07-06 00:34:21'),(16,32,2020,7,6,90,0,0,0,0,1,'2020-07-06 00:34:21'),(17,33,2020,7,6,150,0,0,0,0,1,'2020-07-06 00:34:21'),(18,34,2020,7,6,130,0,0,0,0,1,'2020-07-06 00:34:21'),(19,35,2020,7,6,120,0,0,0,0,1,'2020-07-06 00:34:22'),(20,36,2020,7,6,100,0,0,0,0,1,'2020-07-06 00:34:22'),(21,37,2020,7,6,30,0,0,0,0,1,'2020-07-06 00:34:22'),(22,41,2020,7,6,20,0,0,0,0,1,'2020-07-06 00:34:22'),(23,42,2020,7,6,100,0,0,0,0,1,'2020-07-06 00:34:22'),(24,43,2020,7,6,50,0,0,0,0,1,'2020-07-06 00:34:22'),(25,44,2020,7,6,550,0,0,0,0,1,'2020-07-06 00:34:22'),(26,45,2020,7,6,600,0,0,0,0,1,'2020-07-06 00:34:22'),(27,46,2020,7,6,20,0,0,0,0,1,'2020-07-06 00:34:22'),(28,50,2020,7,6,55,0,0,0,0,1,'2020-07-06 00:34:22'),(29,51,2020,7,6,50,0,0,0,0,1,'2020-07-06 00:34:22'),(30,52,2020,7,6,33,0,0,0,0,1,'2020-07-06 00:34:22'),(31,53,2020,7,6,0,0,0,0,0,1,'2020-07-06 00:34:23'),(32,53,2020,7,6,50,0,0,0,0,1,'2020-07-06 00:34:23'),(33,54,2020,7,6,0,0,0,0,0,1,'2020-07-06 00:34:23'),(34,54,2020,7,6,0,0,0,0,0,1,'2020-07-06 00:34:23'),(35,61,2020,7,6,0,0,0,0,0,1,'2020-07-06 00:34:23'),(36,61,2020,7,6,0,0,0,0,0,1,'2020-07-06 00:34:23'),(37,62,2020,7,6,0,0,0,0,0,1,'2020-07-06 00:34:23'),(38,62,2020,7,6,0,0,0,0,0,1,'2020-07-06 00:34:23'),(39,63,2020,7,6,0,0,0,0,0,1,'2020-07-06 00:34:23'),(40,63,2020,7,6,0,0,0,0,0,1,'2020-07-06 00:34:23'),(41,64,2020,7,6,0,0,0,0,0,1,'2020-07-06 00:34:23'),(42,64,2020,7,6,0,0,0,0,0,1,'2020-07-06 00:34:23'),(43,65,2020,7,6,0,0,0,0,0,1,'2020-07-06 00:34:24'),(44,71,2020,7,6,0,0,0,0,0,1,'2020-07-06 00:34:24'),(45,81,2020,7,6,0,0,0,0,0,1,'2020-07-06 00:34:24'),(46,65,2020,7,6,0,0,0,0,0,1,'2020-07-06 00:34:24'),(47,82,2020,7,6,0,0,0,0,0,1,'2020-07-06 00:34:24'),(48,71,2020,7,6,50,0,0,0,0,1,'2020-07-06 00:34:24'),(49,81,2020,7,6,0,0,0,0,0,1,'2020-07-06 00:34:24'),(50,82,2020,7,6,0,0,0,0,0,1,'2020-07-06 00:34:24');

/*Table structure for table `provinces` */

DROP TABLE IF EXISTS `provinces`;

CREATE TABLE `provinces` (
  `province_id` int(11) NOT NULL,
  `province_name` varchar(10) DEFAULT NULL,
  `province_py` varchar(30) DEFAULT NULL,
  `del_flag` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`province_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `provinces` */

insert  into `provinces`(`province_id`,`province_name`,`province_py`,`del_flag`) values (11,'北京','beijing',NULL),(12,'天津','tianjin',NULL),(13,'河北','hebei',NULL),(14,'山西','shanxi',NULL),(15,'内蒙古','neimenggu',NULL),(21,'辽宁','liaoning',NULL),(22,'吉林','jilin',NULL),(23,'黑龙江','heilongjiang',NULL),(31,'上海','shanghai',NULL),(32,'江苏','jiangsu',NULL),(33,'浙江','zhejiang',NULL),(34,'安徽','anhui',NULL),(35,'福建','fujian',NULL),(36,'江西','jiangxi',NULL),(37,'山东','shandong',NULL),(41,'河南','henan',NULL),(42,'湖北','hubei',NULL),(43,'湖南','hunan',NULL),(44,'广东','guangdong',NULL),(45,'广西','guangxi',NULL),(46,'海南','hainan',NULL),(50,'重庆','chongqing',NULL),(51,'四川','sichuan',NULL),(52,'贵州','guizhou',NULL),(53,'云南','yunnan',NULL),(54,'西藏','xizang',NULL),(61,'陕西','shaanxi',NULL),(62,'甘肃','gansu',NULL),(63,'青海','qinghai',NULL),(64,'宁夏','ningxia',NULL),(65,'新疆','xinjiang',NULL),(71,'台湾','taiwan',NULL),(81,'香港','xianggang',NULL),(82,'澳门','aomen',NULL);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(30) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `user_name` varchar(30) DEFAULT NULL,
  `del_flag` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`user_id`,`account`,`password`,`user_name`,`del_flag`) values (1,'zhangsan','333','张三',NULL),(2,'lisi','333','李四',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
