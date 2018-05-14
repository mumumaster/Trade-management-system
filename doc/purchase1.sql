/*
SQLyog  v12.2.6 (64 bit)
MySQL - 5.7.20 : Database - purchase
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`purchase` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `purchase`;

/*Table structure for table `smbms_bill` */

DROP TABLE IF EXISTS `smbms_bill`;

CREATE TABLE `smbms_bill` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `orderId` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '订单编号',
  `cost` float DEFAULT NULL COMMENT '总消费',
  `providerId` int(20) DEFAULT NULL COMMENT '供应商(取自供应商表Id)',
  `isPayment` int(10) DEFAULT NULL COMMENT '订单状态',
  PRIMARY KEY (`id`),
  KEY `pk_providerId` (`providerId`),
  KEY `pk_isPayment` (`isPayment`),
  CONSTRAINT `pk_isPayment` FOREIGN KEY (`isPayment`) REFERENCES `smbms_status` (`id`),
  CONSTRAINT `pk_providerId` FOREIGN KEY (`providerId`) REFERENCES `smbms_provider` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `smbms_bill_detail` */

DROP TABLE IF EXISTS `smbms_bill_detail`;

CREATE TABLE `smbms_bill_detail` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `orderId` int(20) DEFAULT NULL COMMENT '订单编号(外键，引用订单表id)',
  `productId` int(20) DEFAULT NULL COMMENT '商品编号(外键，引用商品表id)',
  `quantity` int(10) DEFAULT NULL COMMENT '数量',
  `cost` float DEFAULT NULL COMMENT '消费',
  PRIMARY KEY (`id`),
  KEY `pk_orderId` (`orderId`),
  KEY `pk_productId` (`productId`),
  CONSTRAINT `pk_orderId` FOREIGN KEY (`orderId`) REFERENCES `smbms_bill` (`id`),
  CONSTRAINT `pk_productId` FOREIGN KEY (`productId`) REFERENCES `smbms_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

/*Table structure for table `smbms_product` */

DROP TABLE IF EXISTS `smbms_product`;

CREATE TABLE `smbms_product` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `productId` varchar(20) NOT NULL COMMENT '商品编号',
  `productName` varchar(20) NOT NULL COMMENT '商品名称',
  `productDesc` varchar(20) DEFAULT NULL COMMENT '商品描述',
  `productUnit` varchar(20) DEFAULT NULL COMMENT '商品单位',
  `productCount` int(20) DEFAULT NULL COMMENT '商品数量',
  `price` float DEFAULT NULL COMMENT '商品单价',
  `createdBy` int(10) DEFAULT NULL COMMENT '创建者',
  `creationDate` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `modifyBy` int(10) DEFAULT NULL COMMENT '更新者',
  `modifyDate` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `providerId` int(10) DEFAULT NULL COMMENT '供应商Id（外键）',
  PRIMARY KEY (`id`),
  KEY `PK_providerId_` (`providerId`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Table structure for table `smbms_provider` */

DROP TABLE IF EXISTS `smbms_provider`;

CREATE TABLE `smbms_provider` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `proCode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '供应商编码',
  `proName` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '供应商名称',
  `proDesc` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '供应商详细描述',
  `proContact` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '供应商联系人',
  `proPhone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '联系电话',
  `proAddress` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '地址',
  `proFax` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '传真',
  `createdBy` int(20) DEFAULT NULL COMMENT '创建者（userId）',
  `creationDate` datetime DEFAULT NULL COMMENT '创建时间',
  `modifyBy` int(20) DEFAULT NULL COMMENT '更新者（userId）',
  `modifyDate` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `smbms_resources` */

DROP TABLE IF EXISTS `smbms_resources`;

CREATE TABLE `smbms_resources` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '资源信息表自增id',
  `name` varchar(100) NOT NULL COMMENT '资源名称',
  `type` int(11) NOT NULL DEFAULT '1' COMMENT '资源的类型 （1：菜单类型，2：控制器的访问路径）',
  `url` varchar(500) NOT NULL COMMENT '资源访问路径',
  `parentId` int(11) NOT NULL COMMENT '资源可以是菜单项，如果前面的type为1，那么，parentId的值为0的就代表为顶层菜单，如果为其他的值，则可以进行判断，是否能找到对应的id，如果找得到，就代表是那个顶层菜单的子项（但实际上，应该是先获取到顶层菜单的id值，然后，搜索parentId的值有没有与这个值一样的）；如果前面的type为2 ，那这里的值均为-1，因为控制器资源路径没有父资源',
  `parentAll` varchar(50) DEFAULT NULL COMMENT '全部上级，中间用:分隔',
  `isAvailable` int(1) NOT NULL DEFAULT '1' COMMENT '这个资源是否可用（0 不可用 ，1 可用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Table structure for table `smbms_role` */

DROP TABLE IF EXISTS `smbms_role`;

CREATE TABLE `smbms_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `roleCode` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '角色编码',
  `roleName` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '角色名称',
  `createdBy` int(11) DEFAULT NULL COMMENT '创建者',
  `creationDate` datetime DEFAULT NULL COMMENT '创建时间',
  `modifyBy` int(11) DEFAULT NULL COMMENT '修改者',
  `modifyDate` datetime DEFAULT NULL COMMENT '修改时间',
  `isAvailable` int(1) DEFAULT '1' COMMENT '这个角色是否可用（0 不可用 ，1 可用）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Table structure for table `smbms_role_jurisdiction` */

DROP TABLE IF EXISTS `smbms_role_jurisdiction`;

CREATE TABLE `smbms_role_jurisdiction` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色权限表自增id',
  `roleId` int(11) NOT NULL COMMENT '角色id 外键 role_Info表',
  `resId` int(11) NOT NULL COMMENT '外键 资源表id',
  `isAvailable` int(1) NOT NULL DEFAULT '1' COMMENT '这个角色权限是否可用（0 不可用 ，1 可用）',
  PRIMARY KEY (`id`),
  KEY `roleId` (`roleId`),
  KEY `resId` (`resId`),
  CONSTRAINT `pk_resid_jur` FOREIGN KEY (`resId`) REFERENCES `smbms_resources` (`id`),
  CONSTRAINT `pk_roleid_jur` FOREIGN KEY (`roleId`) REFERENCES `smbms_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Table structure for table `smbms_status` */

DROP TABLE IF EXISTS `smbms_status`;

CREATE TABLE `smbms_status` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '订单状态名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Table structure for table `smbms_user` */

DROP TABLE IF EXISTS `smbms_user`;

CREATE TABLE `smbms_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `userCode` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户编码',
  `userName` varchar(15) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户名称',
  `userPassword` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '用户密码',
  `gender` int(10) DEFAULT NULL COMMENT '性别（1:女、 2:男）',
  `birthday` timestamp NULL DEFAULT NULL COMMENT '出生日期',
  `phone` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '手机',
  `address` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '地址',
  `userRole` int(10) DEFAULT NULL COMMENT '用户角色（取自角色表-角色id）',
  `createdBy` int(10) DEFAULT NULL COMMENT '创建者（userId）',
  `creationDate` datetime DEFAULT NULL COMMENT '创建时间',
  `modifyBy` int(10) DEFAULT NULL COMMENT '更新者（userId）',
  `modifyDate` datetime DEFAULT NULL COMMENT '更新时间',
  `idPicPath` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '证件照路径',
  `workPicPath` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '工作证照片路径',
  `userState` int(10) DEFAULT '0' COMMENT '用户账户的状态（-1封禁，0可登陆，1被锁定）',
  PRIMARY KEY (`id`),
  KEY `pk_userRole` (`userRole`),
  CONSTRAINT `pk_userRole` FOREIGN KEY (`userRole`) REFERENCES `smbms_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1025 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



INSERT  INTO `smbms_user`(`id`,`userCode`,`userName`,`userPassword`,`gender`,`birthday`,`phone`,`address`,`userRole`,`createdBy`,
`creationDate`,`modifyBy`,`modifyDate`,`idPicPath`,`workPicPath`,`userState`) 
VALUES (1,'admin','admin','admin',1,'1983-10-10 00:00:00','13688889999','北京市海淀区成府路207号',
1,1,'2013-03-21 16:52:07',NULL,NULL,NULL,NULL,0)
/*Table structure for table `smbms_user_jurisdiction` */

DROP TABLE IF EXISTS `smbms_user_jurisdiction`;

CREATE TABLE `smbms_user_jurisdiction` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '员工权限表自增id',
  `uId` int(11) NOT NULL COMMENT '外键关联用户表id',
  `roleId` int(11) NOT NULL COMMENT '该用户的角色 (对某个资源的操作是否具有权限 外键 role_Info)',
  `isAvailable` int(1) NOT NULL DEFAULT '1' COMMENT '这个用户权限是否可用（0 不可用 ，1 可用）',
  PRIMARY KEY (`id`),
  KEY `staffId` (`uId`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `pk_roleid__` FOREIGN KEY (`roleId`) REFERENCES `smbms_role` (`id`),
  CONSTRAINT `pk_uid__` FOREIGN KEY (`uId`) REFERENCES `smbms_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
