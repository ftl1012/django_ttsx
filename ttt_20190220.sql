-- MySQL dump 10.13  Distrib 5.5.33, for linux2.6 (x86_64)
--
-- Host: localhost    Database: ttt
-- ------------------------------------------------------
-- Server version	5.5.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `ttt`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ttt` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ttt`;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add 用户信息',7,'add_userinfo'),(20,'Can change 用户信息',7,'change_userinfo'),(21,'Can delete 用户信息',7,'delete_userinfo'),(22,'Can add 商品信息',8,'add_goodsinfo'),(23,'Can change 商品信息',8,'change_goodsinfo'),(24,'Can delete 商品信息',8,'delete_goodsinfo'),(25,'Can add 分类信息',9,'add_typeinfo'),(26,'Can change 分类信息',9,'change_typeinfo'),(27,'Can delete 分类信息',9,'delete_typeinfo'),(28,'Can add 购物车商品信息',10,'add_cartinfo'),(29,'Can change 购物车商品信息',10,'change_cartinfo'),(30,'Can delete 购物车商品信息',10,'delete_cartinfo'),(31,'Can add 购物车商品信息',11,'add_cartinfo'),(32,'Can change 购物车商品信息',11,'change_cartinfo'),(33,'Can delete 购物车商品信息',11,'delete_cartinfo'),(34,'Can add order detail info',12,'add_orderdetailinfo'),(35,'Can change order detail info',12,'change_orderdetailinfo'),(36,'Can delete order detail info',12,'delete_orderdetailinfo'),(37,'Can add order info',13,'add_orderinfo'),(38,'Can change order info',13,'change_orderinfo'),(39,'Can delete order info',13,'delete_orderinfo');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$100000$PlaZRGHA3yEy$zmBgPtDlY9PBUA16Um9EmJR+UwEic+VWaJRZECOS24w=','2019-02-16 11:19:01',1,'admin','','','fadf123@qq.com',1,1,'2019-02-16 11:16:56');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_carts_cartinfo`
--

DROP TABLE IF EXISTS `df_carts_cartinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `df_carts_cartinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_carts_cartinfo_goods_id_cece947a_fk_df_goods_goodsinfo_id` (`goods_id`),
  KEY `df_carts_cartinfo_user_id_aee7440a_fk_df_user_userinfo_id` (`user_id`),
  CONSTRAINT `df_carts_cartinfo_goods_id_cece947a_fk_df_goods_goodsinfo_id` FOREIGN KEY (`goods_id`) REFERENCES `df_goods_goodsinfo` (`id`),
  CONSTRAINT `df_carts_cartinfo_user_id_aee7440a_fk_df_user_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `df_user_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_carts_cartinfo`
--

LOCK TABLES `df_carts_cartinfo` WRITE;
/*!40000 ALTER TABLE `df_carts_cartinfo` DISABLE KEYS */;
INSERT INTO `df_carts_cartinfo` VALUES (9,2,4,1);
/*!40000 ALTER TABLE `df_carts_cartinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_goods_goodsinfo`
--

DROP TABLE IF EXISTS `df_goods_goodsinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `df_goods_goodsinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gtitle` varchar(20) NOT NULL,
  `gpic` varchar(100) DEFAULT NULL,
  `gprice` decimal(7,2) NOT NULL,
  `gunit` varchar(20) NOT NULL,
  `gclick` int(11) NOT NULL,
  `isDelete` tinyint(1) NOT NULL,
  `gjianjie` varchar(200) NOT NULL,
  `gkucun` int(11) NOT NULL,
  `gcontent` longtext NOT NULL,
  `gadv` tinyint(1) NOT NULL,
  `gtype_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_goods_goodsinfo_gtype_id_63a02cef_fk_df_goods_typeinfo_id` (`gtype_id`),
  CONSTRAINT `df_goods_goodsinfo_gtype_id_63a02cef_fk_df_goods_typeinfo_id` FOREIGN KEY (`gtype_id`) REFERENCES `df_goods_typeinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_goods_goodsinfo`
--

LOCK TABLES `df_goods_goodsinfo` WRITE;
/*!40000 ALTER TABLE `df_goods_goodsinfo` DISABLE KEYS */;
INSERT INTO `df_goods_goodsinfo` VALUES (1,'香蕉','df_goods/5b514c51N8170488f.jpg',6.99,'500g',13,0,'香蕉',33,'<p>香蕉</p>',1,1),(2,'火龙果','df_goods/57ab290aN34f76b37.jpg',33.20,'500g',12,0,'火龙果',33,'<ul id=\"parameter-brand\" class=\"p-parameter-list list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>品牌：&nbsp;<span style=\"color: rgb(94, 105, 173);\">京东生鲜</span></p></li><li><p>商品名称：京东生鲜越南进口 红心火龙果3个装 单果约500g</p></li><li><p>商品编号：3048509</p></li><li><p>商品毛重：1.94kg</p></li><li><p>商品产地：越南</p></li><li><p>重量：1kg-2kg</p></li><li><p>国产/进口：进口</p></li><li><p>分类：红心火龙果</p></li><li><p>包装：简装</p></li><li><p>原产地：越南</p></li></ul><p><br/></p>',0,1),(3,'水果礼盒','df_goods/5b18c158N35a55d7a.jpg',99.00,'500g',67,0,'水果礼盒',43,'<p>水果礼盒</p>',0,1),(4,'椰子','df_goods/5b4871e6N072f0d74.jpg',125.00,'500g',210,0,'椰子',32,'<p>椰子</p>',0,1),(5,'大闸蟹','df_goods/5b2c5716N1a1c07b1.jpg',123.50,'500g',16,0,'大闸蟹',1,'<p>大闸蟹</p>',0,2),(6,'鲶鱼','df_goods/5addb366Nb137c891.jpg',32.60,'500g',17,0,'鲶鱼',54,'<p>鲶鱼</p>',1,2),(7,'大虾','df_goods/577f85a7N39f40c35.jpg',56.00,'500g',57,0,'大虾',96,'<p>大虾</p>',1,2),(8,'扇贝','df_goods/57c4e212N9e09772f.jpg',12.00,'500g',64,0,'扇贝',45,'<p>扇贝</p>',0,2),(9,'鸭脖','df_goods/5ac2ee43N56cf06b0.jpg',3.00,'500g',21,0,'鸭脖',123,'<p>鸭脖</p>',1,3),(10,'澳洲牛肉','df_goods/59ba49beNfa4afb17.jpg',90.00,'500g',112,0,'鸭脖',21,'<p>鸭脖</p>',1,3),(11,'羊排','df_goods/57e3aea6N5d8f4459.jpg',89.60,'500g',8,0,'羊排',33,'<p>羊排</p>',0,3),(12,'猪肉馅','df_goods/57cd6554N11b56a5e.jpg',9.60,'500g',2,0,'猪肉馅',12,'<p>猪肉馅</p>',0,3),(13,'鹅蛋','df_goods/590c63b4N63036e65.jpg',32.00,'500g',1,0,'鹅蛋',126,'<p>鹅蛋</p>',0,4),(14,'鸽子蛋','df_goods/5927942eN14545b4d.jpg',2.20,'500g',24,0,'鸽子蛋',7,'<p>鸽子蛋</p>',0,4),(15,'咸鸭蛋','df_goods/57481b77Nbed0cff5.jpg',6.60,'500g',132,0,'咸鸭蛋',423,'<p>咸鸭蛋</p>',1,4),(16,'高级鸡蛋','df_goods/57b5151aN00a63bf1.jpg',23.00,'500g',124,0,'咸鸭蛋',321,'<p>咸鸭蛋</p>',1,4),(17,'白菜','df_goods/5a389d24N39ad0079.jpg',432.00,'500g',11,0,'白菜',1,'<p>白菜</p>',1,5),(18,'有机菜','df_goods/594c8c8fN707ca024.jpg',432.00,'500g',3,0,'有机菜',41,'<p>有机菜</p>',0,5),(19,'山药','df_goods/57fee44fN7427cd09.jpg',2.90,'500g',31,0,'山药',55,'<p>山药</p>',1,5),(20,'泡菜','df_goods/57a9a823N2c38934e.jpg',6.70,'500g',32,0,'泡菜',21,'<p>泡菜</p>',1,5),(21,'蛋糕','df_goods/59eaf320N10e96d9e.jpg',5.60,'500g',4,0,'蛋糕',5,'<p>蛋糕</p>',1,6),(22,'巧克力','df_goods/57b587b6N97ef9e91.jpg',5.90,'500g',31,0,'巧克力',90,'<p>巧克力</p>',0,6),(23,'酸奶','df_goods/5af04933N83958117.jpg',65.80,'500g',125,0,'酸奶',42,'<p>酸奶</p>',1,6),(24,'湾仔码头','df_goods/5523aa83N67e99470.jpg',33.80,'500g',123,0,'湾仔码头',43,'<p>湾仔码头</p>',0,6);
/*!40000 ALTER TABLE `df_goods_goodsinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_goods_typeinfo`
--

DROP TABLE IF EXISTS `df_goods_typeinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `df_goods_typeinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(30) NOT NULL,
  `idDelete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_goods_typeinfo`
--

LOCK TABLES `df_goods_typeinfo` WRITE;
/*!40000 ALTER TABLE `df_goods_typeinfo` DISABLE KEYS */;
INSERT INTO `df_goods_typeinfo` VALUES (1,'新鲜水果',0),(2,'海鲜市场',0),(3,'猪牛羊肉',0),(4,'禽类蛋品',0),(5,'新鲜蔬菜',0),(6,'速冻食品',0);
/*!40000 ALTER TABLE `df_goods_typeinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_order_orderdetailinfo`
--

DROP TABLE IF EXISTS `df_order_orderdetailinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `df_order_orderdetailinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oprice` decimal(5,2) NOT NULL,
  `ocount` int(11) NOT NULL,
  `ogoods_id` int(11) NOT NULL,
  `orderinfo_id` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `df_order_orderdetail_ogoods_id_cf4a75c5_fk_df_goods_` (`ogoods_id`),
  KEY `df_order_orderdetail_orderinfo_id_b5c915d3_fk_df_order_` (`orderinfo_id`),
  CONSTRAINT `df_order_orderdetail_ogoods_id_cf4a75c5_fk_df_goods_` FOREIGN KEY (`ogoods_id`) REFERENCES `df_goods_goodsinfo` (`id`),
  CONSTRAINT `df_order_orderdetail_orderinfo_id_b5c915d3_fk_df_order_` FOREIGN KEY (`orderinfo_id`) REFERENCES `df_order_orderinfo` (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_order_orderdetailinfo`
--

LOCK TABLES `df_order_orderdetailinfo` WRITE;
/*!40000 ALTER TABLE `df_order_orderdetailinfo` DISABLE KEYS */;
INSERT INTO `df_order_orderdetailinfo` VALUES (1,56.00,3,7,'15505801871037838'),(2,125.00,1,4,'15505801871037838'),(4,125.00,1,4,'1550580278718024');
/*!40000 ALTER TABLE `df_order_orderdetailinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_order_orderinfo`
--

DROP TABLE IF EXISTS `df_order_orderinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `df_order_orderinfo` (
  `oid` varchar(20) NOT NULL,
  `otime` datetime NOT NULL,
  `oispay` tinyint(1) NOT NULL,
  `ototal` decimal(7,2) NOT NULL,
  `oaddress` varchar(150) NOT NULL,
  `ouser_id` int(11) NOT NULL,
  PRIMARY KEY (`oid`),
  KEY `df_order_orderinfo_ouser_id_5b630cc6_fk_df_user_userinfo_id` (`ouser_id`),
  CONSTRAINT `df_order_orderinfo_ouser_id_5b630cc6_fk_df_user_userinfo_id` FOREIGN KEY (`ouser_id`) REFERENCES `df_user_userinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_order_orderinfo`
--

LOCK TABLES `df_order_orderinfo` WRITE;
/*!40000 ALTER TABLE `df_order_orderinfo` DISABLE KEYS */;
INSERT INTO `df_order_orderinfo` VALUES ('15505801871037838','2019-02-19 12:43:08',0,303.00,'北京市朝阳区万国璐12号 ( 天天相声 收) 123456789',1),('1550580278718024','2019-02-19 12:44:39',0,135.00,'北京市朝阳区万国璐12号 ( 天天相声 收) 123456789',1);
/*!40000 ALTER TABLE `df_order_orderinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `df_user_userinfo`
--

DROP TABLE IF EXISTS `df_user_userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `df_user_userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(20) NOT NULL,
  `upwd` varchar(40) NOT NULL,
  `uemail` varchar(30) NOT NULL,
  `ushou` varchar(20) NOT NULL,
  `uaddress` varchar(100) NOT NULL,
  `uyoubian` varchar(6) NOT NULL,
  `uphone` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `df_user_userinfo`
--

LOCK TABLES `df_user_userinfo` WRITE;
/*!40000 ALTER TABLE `df_user_userinfo` DISABLE KEYS */;
INSERT INTO `df_user_userinfo` VALUES (1,'admin','14cb307639ae70397dfa5d1db4a42de7e79fea84','fasfas@qq.com','天天相声','北京市朝阳区万国璐12号','123456','123456789'),(2,'admin2009','14cb307639ae70397dfa5d1db4a42de7e79fea84','fasfas@qq.com','','','','');
/*!40000 ALTER TABLE `df_user_userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2019-02-16 11:21:01','1','新鲜水果',1,'[{\"added\": {}}]',9,1),(2,'2019-02-16 11:21:09','2','海鲜市场',1,'[{\"added\": {}}]',9,1),(3,'2019-02-16 11:21:18','3','猪牛羊肉',1,'[{\"added\": {}}]',9,1),(4,'2019-02-16 11:21:24','4','禽类蛋品',1,'[{\"added\": {}}]',9,1),(5,'2019-02-16 11:21:29','5','新鲜蔬菜',1,'[{\"added\": {}}]',9,1),(6,'2019-02-16 11:21:39','6','速冻食品',1,'[{\"added\": {}}]',9,1),(7,'2019-02-16 11:23:30','1','GoodsInfo object (1)',1,'[{\"added\": {}}]',8,1),(8,'2019-02-16 11:25:40','2','GoodsInfo object (2)',1,'[{\"added\": {}}]',8,1),(9,'2019-02-16 11:27:11','3','GoodsInfo object (3)',1,'[{\"added\": {}}]',8,1),(10,'2019-02-16 11:28:38','4','GoodsInfo object (4)',1,'[{\"added\": {}}]',8,1),(11,'2019-02-16 11:29:21','5','GoodsInfo object (5)',1,'[{\"added\": {}}]',8,1),(12,'2019-02-16 11:29:52','6','GoodsInfo object (6)',1,'[{\"added\": {}}]',8,1),(13,'2019-02-16 11:30:40','7','GoodsInfo object (7)',1,'[{\"added\": {}}]',8,1),(14,'2019-02-16 11:31:15','8','GoodsInfo object (8)',1,'[{\"added\": {}}]',8,1),(15,'2019-02-16 11:32:03','9','GoodsInfo object (9)',1,'[{\"added\": {}}]',8,1),(16,'2019-02-16 11:32:52','10','GoodsInfo object (10)',1,'[{\"added\": {}}]',8,1),(17,'2019-02-16 11:33:25','11','GoodsInfo object (11)',1,'[{\"added\": {}}]',8,1),(18,'2019-02-16 11:34:00','12','GoodsInfo object (12)',1,'[{\"added\": {}}]',8,1),(19,'2019-02-16 11:34:31','13','GoodsInfo object (13)',1,'[{\"added\": {}}]',8,1),(20,'2019-02-16 11:35:05','14','GoodsInfo object (14)',1,'[{\"added\": {}}]',8,1),(21,'2019-02-16 11:35:53','15','GoodsInfo object (15)',1,'[{\"added\": {}}]',8,1),(22,'2019-02-16 11:36:27','16','GoodsInfo object (16)',1,'[{\"added\": {}}]',8,1),(23,'2019-02-16 11:36:56','17','GoodsInfo object (17)',1,'[{\"added\": {}}]',8,1),(24,'2019-02-16 11:37:27','18','GoodsInfo object (18)',1,'[{\"added\": {}}]',8,1),(25,'2019-02-16 11:38:15','19','GoodsInfo object (19)',1,'[{\"added\": {}}]',8,1),(26,'2019-02-16 11:39:07','20','GoodsInfo object (20)',1,'[{\"added\": {}}]',8,1),(27,'2019-02-16 11:39:48','21','GoodsInfo object (21)',1,'[{\"added\": {}}]',8,1),(28,'2019-02-16 11:40:37','22','GoodsInfo object (22)',1,'[{\"added\": {}}]',8,1),(29,'2019-02-16 11:41:10','23','GoodsInfo object (23)',1,'[{\"added\": {}}]',8,1),(30,'2019-02-16 11:41:39','24','GoodsInfo object (24)',1,'[{\"added\": {}}]',8,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(10,'df_cart','cartinfo'),(11,'df_carts','cartinfo'),(8,'df_goods','goodsinfo'),(9,'df_goods','typeinfo'),(12,'df_order','orderdetailinfo'),(13,'df_order','orderinfo'),(7,'df_user','userinfo'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-02-17 07:10:45'),(2,'auth','0001_initial','2019-02-17 07:10:45'),(3,'admin','0001_initial','2019-02-17 07:10:45'),(4,'admin','0002_logentry_remove_auto_add','2019-02-17 07:10:45'),(5,'contenttypes','0002_remove_content_type_name','2019-02-17 07:10:45'),(6,'auth','0002_alter_permission_name_max_length','2019-02-17 07:10:45'),(7,'auth','0003_alter_user_email_max_length','2019-02-17 07:10:45'),(8,'auth','0004_alter_user_username_opts','2019-02-17 07:10:45'),(9,'auth','0005_alter_user_last_login_null','2019-02-17 07:10:45'),(10,'auth','0006_require_contenttypes_0002','2019-02-17 07:10:45'),(11,'auth','0007_alter_validators_add_error_messages','2019-02-17 07:10:45'),(12,'auth','0008_alter_user_username_max_length','2019-02-17 07:10:45'),(13,'auth','0009_alter_user_last_name_max_length','2019-02-17 07:10:45'),(14,'df_user','0001_initial','2019-02-17 07:10:45'),(15,'df_goods','0001_initial','2019-02-17 07:10:45'),(16,'df_goods','0002_auto_20190217_1347','2019-02-17 07:10:45'),(17,'df_cart','0001_initial','2019-02-17 07:10:45'),(18,'sessions','0001_initial','2019-02-17 07:10:45'),(19,'df_carts','0001_initial','2019-02-17 07:19:23'),(20,'df_order','0001_initial','2019-02-17 09:09:03');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1zls0ztoryzjhr441kvt4du8bmoydh8d','MDdhMmU2YTExMDkzNjE0MzRjMTVmNGYzMTRiN2M3NDU1MGM3NGE3YTp7Imdvb2RzX2lkcyI6WyIxMSJdLCJ1c2VyX25hbWUiOiJhZG1pbiIsInVzZXJfaWQiOjF9','2019-03-03 13:45:20'),('7eawv67n57br5chfrnkl0zvatk9s409k','YTM0ZGM5ODZiNzljN2FhMjI0ZTcwNmUzMmU3NTdlMWQ4ZjY0NWQ5ZDp7InVzZXJfaWQiOjEsInVzZXJfbmFtZSI6ImFkbWluIn0=','2019-03-04 13:19:08'),('nlyjobjyb7cu7wr8350gz0agnmsxxlzo','MDhmZDRhYzYzMGJmOTAyZTZmYWIxZWZkOWZlYWJjMDY5ZWNjMDRjMzp7InVzZXJfaWQiOjEsIjEiOlsiNCIsIjE0IiwiMSIsIjgiLCI3Il0sInVzZXJfbmFtZSI6ImFkbWluIiwiZ29vZHNfaWRzIjpbIjQiLCIxNCIsIjEiLCI4IiwiNyJdfQ==','2019-03-06 11:09:29'),('os93yifr01686s1zjgdjv5eii8qmal4s','Njg3YWRkMThmMzg3YmY4YTdiNWRjMjIzNjY1MjBhNTdmOTFhNGQzNzp7InVzZXJfaWQiOjEsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJ1c2VyX25hbWUiOiJhZG1pbiIsIl9hdXRoX3VzZXJfaGFzaCI6IjAxNDFmYzU2NTdkOWU5ZWI4YWU0ZjEwODhlZDQ3ZWM5OGIxOGIyM2YifQ==','2019-03-02 11:19:01'),('zgiywxzr4zsxlr57iydbikdc7vdpb7kv','ZTQ4NzBkZTRlNzIwZmE2NDE5MTU4MmRjZWFjNTdhOWRjMjQyZjg1ZDp7InVzZXJfbmFtZSI6ImFkbWluIiwidXNlcl9pZCI6MX0=','2019-03-02 10:01:20');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'ttt'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-20 20:10:39
