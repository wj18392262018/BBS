/*
SQLyog Ultimate - MySQL GUI v8.21 
MySQL - 5.1.44-community : Database - bbs
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`bbs` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `bbs`;

/*Table structure for table `board` */

DROP TABLE IF EXISTS `board`;

CREATE TABLE `board` (
  `boardId` int(11) NOT NULL AUTO_INCREMENT,
  `boardName` varchar(50) NOT NULL,
  `cateDate` datetime NOT NULL,
  `forcumId` int(11) NOT NULL,
  `memberId` int(11) NOT NULL,
  PRIMARY KEY (`boardId`),
  KEY `FK_board` (`memberId`),
  KEY `FK_board1` (`forcumId`),
  CONSTRAINT `FK_board` FOREIGN KEY (`memberId`) REFERENCES `member` (`memberId`),
  CONSTRAINT `FK_board1` FOREIGN KEY (`forcumId`) REFERENCES `forcum` (`forcumId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `board` */

insert  into `board`(`boardId`,`boardName`,`cateDate`,`forcumId`,`memberId`) values (1,'C#','2019-03-25 20:38:13',1,1),(2,'WinForms','2019-03-25 20:38:36',1,1),(3,'Java','2019-03-25 20:38:59',2,11),(4,'SQL Server','2019-03-25 20:39:59',3,1),(5,'watering','2019-03-25 20:40:54',4,10);

/*Table structure for table `forcum` */

DROP TABLE IF EXISTS `forcum`;

CREATE TABLE `forcum` (
  `forcumId` int(11) NOT NULL AUTO_INCREMENT,
  `forcumName` varchar(50) NOT NULL,
  `forcumPosition` varchar(50) NOT NULL,
  `forcumDate` datetime NOT NULL,
  PRIMARY KEY (`forcumId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `forcum` */

insert  into `forcum`(`forcumId`,`forcumName`,`forcumPosition`,`forcumDate`) values (1,'.NET','1','2019-03-25 20:35:09'),(2,'Java','2','2019-03-25 20:35:26'),(3,'JBDC','3','2019-03-25 20:35:56'),(4,'recreation','4','2019-03-25 20:36:28');

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `memberId` int(11) NOT NULL AUTO_INCREMENT,
  `memberName` varchar(50) NOT NULL,
  `memberPwd` varchar(50) NOT NULL,
  `memberIcon` varchar(100) NOT NULL,
  `memberGender` varchar(50) NOT NULL,
  `isAdmin` int(1) NOT NULL,
  `isPass` int(1) NOT NULL,
  `isPower` int(1) NOT NULL,
  `regDate` datetime NOT NULL,
  PRIMARY KEY (`memberId`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `member` */

insert  into `member`(`memberId`,`memberName`,`memberPwd`,`memberIcon`,`memberGender`,`isAdmin`,`isPass`,`isPower`,`regDate`) values (1,'admin','123','3.gif','2',1,1,1,'2019-03-25 14:56:02'),(9,'ym','521','3.gif','1',0,0,0,'2019-03-25 17:03:40'),(10,'gxt','123','7.gif','1',0,0,0,'2019-03-25 17:25:45'),(11,'zly','521','7.gif','1',0,0,0,'2019-03-25 17:27:12'),(12,'mm','123','7.gif','2',0,0,0,'2019-03-25 18:01:53'),(16,'3','3','7.gif','2',0,0,0,'2019-03-25 18:15:03'),(17,'2','2','7.gif','2',0,0,0,'2019-03-25 18:17:25'),(18,'wo','123','7.gif','2',0,0,0,'2019-03-27 13:32:21');

/*Table structure for table `reply` */

DROP TABLE IF EXISTS `reply`;

CREATE TABLE `reply` (
  `replyId` int(11) NOT NULL AUTO_INCREMENT,
  `borderId` int(11) NOT NULL,
  `topicId` int(11) NOT NULL,
  `memberId` int(11) NOT NULL,
  `topicContent` varchar(50) NOT NULL,
  `publishTime` datetime NOT NULL,
  `modifyTime` datetime NOT NULL,
  PRIMARY KEY (`replyId`),
  KEY `FK_reply` (`memberId`),
  KEY `FK_reply2` (`topicId`),
  KEY `FK_reply3` (`borderId`),
  CONSTRAINT `FK_reply` FOREIGN KEY (`memberId`) REFERENCES `member` (`memberId`),
  CONSTRAINT `FK_reply2` FOREIGN KEY (`topicId`) REFERENCES `topic` (`topicId`),
  CONSTRAINT `FK_reply3` FOREIGN KEY (`borderId`) REFERENCES `board` (`boardId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `reply` */

insert  into `reply`(`replyId`,`borderId`,`topicId`,`memberId`,`topicContent`,`publishTime`,`modifyTime`) values (3,1,1,10,'不管谁来','2019-03-30 16:16:20','2019-03-30 16:16:23'),(4,1,2,1,'wo de','2019-03-30 17:37:26','2019-03-30 17:37:26'),(5,1,13,11,'wo ye shi','2019-03-30 17:49:11','2019-03-30 17:49:11'),(6,1,14,1,'哈哈','2019-03-31 09:04:16','2019-03-31 09:04:16'),(7,4,21,11,'huan xing','2019-03-31 09:28:52','2019-03-31 09:28:52'),(8,2,34,11,'万岁','2019-03-31 11:34:55','2019-03-31 11:34:55');

/*Table structure for table `topic` */

DROP TABLE IF EXISTS `topic`;

CREATE TABLE `topic` (
  `topicId` int(11) NOT NULL AUTO_INCREMENT,
  `topicCaption` varchar(50) NOT NULL,
  `topicContent` varchar(1000) NOT NULL,
  `borderId` int(11) NOT NULL,
  `memberId` int(11) NOT NULL,
  `isGood` int(1) NOT NULL,
  `publishTime` datetime NOT NULL,
  `modifyTime` datetime NOT NULL,
  `lastReplyUser` varchar(50) NOT NULL,
  `lastReplyDate` datetime NOT NULL,
  PRIMARY KEY (`topicId`),
  KEY `FK_topic` (`borderId`),
  KEY `FK_topic1` (`memberId`),
  CONSTRAINT `FK_topic` FOREIGN KEY (`borderId`) REFERENCES `board` (`boardId`),
  CONSTRAINT `FK_topic1` FOREIGN KEY (`memberId`) REFERENCES `member` (`memberId`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

/*Data for the table `topic` */

insert  into `topic`(`topicId`,`topicCaption`,`topicContent`,`borderId`,`memberId`,`isGood`,`publishTime`,`modifyTime`,`lastReplyUser`,`lastReplyDate`) values (1,'C#是微软开发的语言','灌水',1,1,1,'2019-03-26 20:45:40','2019-03-26 20:45:44','admin','2019-03-26 20:46:02'),(2,'谁帮我看看我的程序 ','继续灌水',2,10,0,'2019-03-26 20:47:45','2019-03-26 20:47:48','admin','2019-03-26 20:47:54'),(3,'我是新手，我刚开始学习Java','娱乐',3,11,0,'2019-03-26 20:49:02','2019-03-26 20:49:07','mm','2019-03-26 20:49:15'),(4,'这段SQL错在哪了? ','嘿嘿',4,12,1,'2019-03-26 20:50:00','2019-03-26 20:50:03','zly','2019-03-26 20:50:09'),(10,'灌水','watering',5,1,0,'2019-03-26 20:51:00','2019-03-26 20:51:03','ym','2019-03-26 20:51:11'),(13,'hello','word',1,1,0,'2019-03-27 18:41:18','2019-03-27 18:41:18','admin','2019-03-27 18:41:18'),(14,'hello','haha',1,1,0,'2019-03-30 11:46:50','2019-03-30 11:46:50','admin','2019-03-30 11:46:50'),(15,'tong zhi meng hao!','ni hao',4,11,0,'2019-03-30 16:58:13','2019-03-30 16:58:13','zly','2019-03-30 16:58:13'),(16,'ni hao','wo',4,11,0,'2019-03-30 17:03:30','2019-03-30 17:03:30','zly','2019-03-30 17:03:30'),(17,'ta shi','he',4,11,0,'2019-03-30 17:06:30','2019-03-30 17:06:30','zly','2019-03-30 17:06:30'),(21,'ni kuai le ma ','yu le',4,11,0,'2019-03-31 09:27:51','2019-03-31 09:27:51','zly','2019-03-31 09:27:51'),(23,'sss','ni ',4,11,0,'2019-03-31 09:40:15','2019-03-31 09:40:15','zly','2019-03-31 09:40:15'),(24,'wo reng wei bu shi','shi ma',1,11,0,'2019-03-31 09:44:06','2019-03-31 09:44:06','zly','2019-03-31 09:44:06'),(25,'ji xu guan shui','ji xu',2,11,0,'2019-03-31 09:45:06','2019-03-31 09:45:06','zly','2019-03-31 09:45:06'),(26,'he he he he','zhong',3,1,0,'2019-03-31 09:47:01','2019-03-31 09:47:01','admin','2019-03-31 09:47:01'),(34,'中国真好！','中国',2,11,0,'2019-03-31 11:34:23','2019-03-31 11:34:23','zly','2019-03-31 11:34:23');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
