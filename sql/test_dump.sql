-- MySQL dump 10.13  Distrib 5.5.22, for Linux (x86_64)
--
-- Host: localhost    Database: seoappers
-- ------------------------------------------------------
-- Server version	5.5.22

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
-- Table structure for table `crawl`
--

DROP TABLE IF EXISTS `crawl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `crawl` (
  `crawl_id` int(11) NOT NULL AUTO_INCREMENT,
  `date_started` datetime DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_finished` datetime DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `website_id` int(11) NOT NULL,
  PRIMARY KEY (`crawl_id`,`website_id`),
  KEY `fk_crawl_website1` (`website_id`),
  CONSTRAINT `fk_crawl_website1` FOREIGN KEY (`website_id`) REFERENCES `website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crawl`
--

LOCK TABLES `crawl` WRITE;
/*!40000 ALTER TABLE `crawl` DISABLE KEYS */;
INSERT INTO `crawl` VALUES (88,'2012-08-24 00:41:33','2012-08-24 00:41:33','2012-08-24 00:41:34',255,18),(89,'2012-08-24 00:41:34','2012-08-24 00:41:34','2012-08-24 00:41:48',255,19),(90,'2012-08-24 00:42:54','2012-08-24 00:42:54','2012-08-24 00:42:55',255,18),(91,'2012-08-24 00:42:55','2012-08-24 00:42:55','2012-08-24 00:43:08',255,19),(92,'2012-08-24 00:43:46','2012-08-24 00:43:46','2012-08-24 00:43:46',255,18),(93,'2012-08-24 00:43:46','2012-08-24 00:43:46','2012-08-24 00:44:00',255,19),(94,'2012-08-24 00:47:35','2012-08-24 00:47:35','2012-08-24 00:47:36',255,18),(95,'2012-08-24 00:47:36','2012-08-24 00:47:36','2012-08-24 00:47:50',255,19),(96,'2012-08-24 00:48:44','2012-08-24 00:48:44','2012-08-24 00:48:45',255,18),(97,'2012-08-24 00:48:45','2012-08-24 00:48:45','2012-08-24 00:48:58',255,19),(98,'2012-08-24 00:51:30','2012-08-24 00:51:30','2012-08-24 00:51:31',255,18),(99,'2012-08-24 00:51:31','2012-08-24 00:51:31','2012-08-24 00:51:45',255,19),(100,'2012-08-24 00:54:28','2012-08-24 00:54:28',NULL,255,18),(101,'2012-08-24 00:54:52','2012-08-24 00:54:52',NULL,255,19),(102,'2012-08-24 00:57:13','2012-08-24 00:57:13',NULL,255,18),(103,'2012-08-24 00:57:24','2012-08-24 00:57:24','2012-08-24 00:57:38',255,19),(104,'2012-08-24 00:57:38','2012-08-24 00:57:38','2012-08-24 00:57:39',255,18),(105,'2012-08-24 00:57:39','2012-08-24 00:57:39','2012-08-24 00:57:53',255,19),(106,'2012-08-24 00:58:08','2012-08-24 00:58:08','2012-08-24 00:58:09',255,18),(107,'2012-08-24 00:58:09','2012-08-24 00:58:09',NULL,255,19),(108,'2012-08-24 01:03:51','2012-08-24 01:03:51','2012-08-24 01:03:52',255,18),(109,'2012-08-24 01:03:52','2012-08-24 01:03:52','2012-08-24 01:04:06',255,19);
/*!40000 ALTER TABLE `crawl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page` (
  `page_id` int(11) NOT NULL AUTO_INCREMENT,
  `seo_score` int(11) DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `crawl_id` int(11) NOT NULL,
  `website_id` int(11) NOT NULL,
  PRIMARY KEY (`page_id`,`crawl_id`,`website_id`),
  KEY `fk_page_crawl1` (`crawl_id`,`website_id`),
  CONSTRAINT `fk_page_crawl1` FOREIGN KEY (`crawl_id`, `website_id`) REFERENCES `crawl` (`crawl_id`, `website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=432 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page`
--

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` VALUES (244,42,'',96,18),(245,42,'imprint.html',96,18),(246,42,'frankfurt.html',96,18),(247,42,'yoga.html',96,18),(248,42,'tennis.html',96,18),(249,42,'start.html',96,18),(250,42,'softwareentwicklung-im-internet.html',96,18),(251,42,'entjungfert.php?replytocom=1#comment-1',97,19),(252,42,'entjungfert.php#respond',97,19),(253,42,'entjungfert.php#comment-1',97,19),(254,42,'slides/schwarze-hand-hassloch',97,19),(255,42,'hassloch',97,19),(256,42,'nuddn',97,19),(257,42,'',97,19),(258,42,'entjungfert.php#comment-2',97,19),(259,42,'entjungfert.php#more-1',97,19),(260,42,'entjungfert.php?replytocom=1#respond',97,19),(261,42,'slides/motto',97,19),(262,42,'entjungfert.php?replytocom=2',97,19),(263,42,'hasslocher-legenden',97,19),(264,42,'niemand-geht-aufs-eis-bevor.php',97,19),(265,42,'tag/nonsense',97,19),(266,42,'tag/horlachgraben',97,19),(267,42,'slides/dem-eppelwoi',97,19),(268,42,'impressum',97,19),(269,42,'niemand-geht-aufs-eis-bevor.php#respond',97,19),(270,42,'entjungfert.php#comments',97,19),(271,42,'tag/eishockey',97,19),(272,42,'entjungfert.php?replytocom=2#respond',97,19),(273,42,'author/shh',97,19),(274,42,'tag/winter-in-hassloch',97,19),(275,42,'tag/hassloch',97,19),(276,42,'niemand-geht-aufs-eis-bevor.php#more-35',97,19),(277,42,'entjungfert.php',97,19),(278,42,'entjungfert.php?replytocom=2#comment-2',97,19),(279,42,'entjungfert.php?replytocom=1',97,19),(280,42,'shh-codex',97,19),(281,42,'',98,18),(282,42,'imprint.html',98,18),(283,42,'frankfurt.html',98,18),(284,42,'yoga.html',98,18),(285,42,'tennis.html',98,18),(286,42,'start.html',98,18),(287,42,'softwareentwicklung-im-internet.html',98,18),(288,42,'entjungfert.php?replytocom=1#comment-1',99,19),(289,42,'entjungfert.php#respond',99,19),(290,42,'entjungfert.php#comment-1',99,19),(291,42,'slides/schwarze-hand-hassloch',99,19),(292,42,'hassloch',99,19),(293,42,'nuddn',99,19),(294,42,'',99,19),(295,42,'entjungfert.php#comment-2',99,19),(296,42,'entjungfert.php#more-1',99,19),(297,42,'entjungfert.php?replytocom=1#respond',99,19),(298,42,'slides/motto',99,19),(299,42,'entjungfert.php?replytocom=2',99,19),(300,42,'hasslocher-legenden',99,19),(301,42,'niemand-geht-aufs-eis-bevor.php',99,19),(302,42,'tag/nonsense',99,19),(303,42,'tag/horlachgraben',99,19),(304,42,'slides/dem-eppelwoi',99,19),(305,42,'impressum',99,19),(306,42,'niemand-geht-aufs-eis-bevor.php#respond',99,19),(307,42,'entjungfert.php#comments',99,19),(308,42,'tag/eishockey',99,19),(309,42,'entjungfert.php?replytocom=2#respond',99,19),(310,42,'author/shh',99,19),(311,42,'tag/winter-in-hassloch',99,19),(312,42,'tag/hassloch',99,19),(313,42,'niemand-geht-aufs-eis-bevor.php#more-35',99,19),(314,42,'entjungfert.php',99,19),(315,42,'entjungfert.php?replytocom=2#comment-2',99,19),(316,42,'entjungfert.php?replytocom=1',99,19),(317,42,'shh-codex',99,19),(318,42,'',100,18),(319,42,'entjungfert.php?replytocom=1#comment-1',101,19),(320,42,'',102,18),(321,42,'entjungfert.php?replytocom=1#comment-1',103,19),(322,42,'entjungfert.php#respond',103,19),(323,42,'entjungfert.php#comment-1',103,19),(324,42,'slides/schwarze-hand-hassloch',103,19),(325,42,'hassloch',103,19),(326,42,'nuddn',103,19),(327,42,'',103,19),(328,42,'entjungfert.php#comment-2',103,19),(329,42,'entjungfert.php#more-1',103,19),(330,42,'entjungfert.php?replytocom=1#respond',103,19),(331,42,'slides/motto',103,19),(332,42,'entjungfert.php?replytocom=2',103,19),(333,42,'hasslocher-legenden',103,19),(334,42,'niemand-geht-aufs-eis-bevor.php',103,19),(335,42,'tag/nonsense',103,19),(336,42,'tag/horlachgraben',103,19),(337,42,'slides/dem-eppelwoi',103,19),(338,42,'impressum',103,19),(339,42,'niemand-geht-aufs-eis-bevor.php#respond',103,19),(340,42,'entjungfert.php#comments',103,19),(341,42,'tag/eishockey',103,19),(342,42,'entjungfert.php?replytocom=2#respond',103,19),(343,42,'author/shh',103,19),(344,42,'tag/winter-in-hassloch',103,19),(345,42,'tag/hassloch',103,19),(346,42,'niemand-geht-aufs-eis-bevor.php#more-35',103,19),(347,42,'entjungfert.php',103,19),(348,42,'entjungfert.php?replytocom=2#comment-2',103,19),(349,42,'entjungfert.php?replytocom=1',103,19),(350,42,'shh-codex',103,19),(351,42,'',104,18),(352,42,'imprint.html',104,18),(353,42,'frankfurt.html',104,18),(354,42,'yoga.html',104,18),(355,42,'tennis.html',104,18),(356,42,'start.html',104,18),(357,42,'softwareentwicklung-im-internet.html',104,18),(358,42,'entjungfert.php?replytocom=1#comment-1',105,19),(359,42,'entjungfert.php#respond',105,19),(360,42,'entjungfert.php#comment-1',105,19),(361,42,'slides/schwarze-hand-hassloch',105,19),(362,42,'hassloch',105,19),(363,42,'nuddn',105,19),(364,42,'',105,19),(365,42,'entjungfert.php#comment-2',105,19),(366,42,'entjungfert.php#more-1',105,19),(367,42,'entjungfert.php?replytocom=1#respond',105,19),(368,42,'slides/motto',105,19),(369,42,'entjungfert.php?replytocom=2',105,19),(370,42,'hasslocher-legenden',105,19),(371,42,'niemand-geht-aufs-eis-bevor.php',105,19),(372,42,'tag/nonsense',105,19),(373,42,'tag/horlachgraben',105,19),(374,42,'slides/dem-eppelwoi',105,19),(375,42,'impressum',105,19),(376,42,'niemand-geht-aufs-eis-bevor.php#respond',105,19),(377,42,'entjungfert.php#comments',105,19),(378,42,'tag/eishockey',105,19),(379,42,'entjungfert.php?replytocom=2#respond',105,19),(380,42,'author/shh',105,19),(381,42,'tag/winter-in-hassloch',105,19),(382,42,'tag/hassloch',105,19),(383,42,'niemand-geht-aufs-eis-bevor.php#more-35',105,19),(384,42,'entjungfert.php',105,19),(385,42,'entjungfert.php?replytocom=2#comment-2',105,19),(386,42,'entjungfert.php?replytocom=1',105,19),(387,42,'shh-codex',105,19),(388,42,'',106,18),(389,42,'imprint.html',106,18),(390,42,'frankfurt.html',106,18),(391,42,'yoga.html',106,18),(392,42,'tennis.html',106,18),(393,42,'start.html',106,18),(394,42,'softwareentwicklung-im-internet.html',106,18),(395,42,'',108,18),(396,42,'imprint.html',108,18),(397,42,'frankfurt.html',108,18),(398,42,'yoga.html',108,18),(399,42,'tennis.html',108,18),(400,42,'start.html',108,18),(401,42,'softwareentwicklung-im-internet.html',108,18),(402,42,'entjungfert.php?replytocom=1#comment-1',109,19),(403,42,'entjungfert.php#respond',109,19),(404,42,'entjungfert.php#comment-1',109,19),(405,42,'slides/schwarze-hand-hassloch',109,19),(406,42,'hassloch',109,19),(407,42,'nuddn',109,19),(408,42,'',109,19),(409,42,'entjungfert.php#comment-2',109,19),(410,42,'entjungfert.php#more-1',109,19),(411,42,'entjungfert.php?replytocom=1#respond',109,19),(412,42,'slides/motto',109,19),(413,42,'entjungfert.php?replytocom=2',109,19),(414,42,'hasslocher-legenden',109,19),(415,42,'niemand-geht-aufs-eis-bevor.php',109,19),(416,42,'tag/nonsense',109,19),(417,42,'tag/horlachgraben',109,19),(418,42,'slides/dem-eppelwoi',109,19),(419,42,'impressum',109,19),(420,42,'niemand-geht-aufs-eis-bevor.php#respond',109,19),(421,42,'entjungfert.php#comments',109,19),(422,42,'tag/eishockey',109,19),(423,42,'entjungfert.php?replytocom=2#respond',109,19),(424,42,'author/shh',109,19),(425,42,'tag/winter-in-hassloch',109,19),(426,42,'tag/hassloch',109,19),(427,42,'niemand-geht-aufs-eis-bevor.php#more-35',109,19),(428,42,'entjungfert.php',109,19),(429,42,'entjungfert.php?replytocom=2#comment-2',109,19),(430,42,'entjungfert.php?replytocom=1',109,19),(431,42,'shh-codex',109,19);
/*!40000 ALTER TABLE `page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_item`
--

DROP TABLE IF EXISTS `page_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_item` (
  `page_item_id` int(11) NOT NULL AUTO_INCREMENT,
  `page_item_key` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `page_value` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `page_id` int(11) NOT NULL,
  `crawl_id` int(11) NOT NULL,
  `website_id` int(11) NOT NULL,
  PRIMARY KEY (`page_item_id`,`page_id`,`crawl_id`,`website_id`),
  KEY `fk_page_item_page1` (`page_id`,`crawl_id`,`website_id`),
  CONSTRAINT `fk_page_item_page1` FOREIGN KEY (`page_id`, `crawl_id`, `website_id`) REFERENCES `page` (`page_id`, `crawl_id`, `website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_item`
--

LOCK TABLES `page_item` WRITE;
/*!40000 ALTER TABLE `page_item` DISABLE KEYS */;
INSERT INTO `page_item` VALUES (1,'title','Wirtschaftsportal des Mittelstandes - MCEI202',395,108,18),(2,'meta.description','',395,108,18),(3,'meta.keywords','',395,108,18),(4,'title','Imprint - MCEI2020',396,108,18),(5,'meta.description','',396,108,18),(6,'meta.keywords','',396,108,18),(7,'title','Frankfurt - MCEI2020',397,108,18),(8,'meta.description','Test',397,108,18),(9,'meta.keywords','frankfurt, fra, bankenmetropole, finanzplatz,',397,108,18),(10,'title','Yoga - MCEI2020',398,108,18),(11,'meta.description','',398,108,18),(12,'meta.keywords','',398,108,18),(13,'title','Tennis - MCEI2020',399,108,18),(14,'meta.description','',399,108,18),(15,'meta.keywords','',399,108,18),(16,'title','Wirtschaftsportal des Mittelstandes - MCEI202',400,108,18),(17,'meta.description','',400,108,18),(18,'meta.keywords','',400,108,18),(19,'title','Softwareentwicklung im Internet - MCEI2020',401,108,18),(20,'meta.description','',401,108,18),(21,'meta.keywords','',401,108,18),(22,'title','Entjungfert! | Schwarze Hand Haßloch',402,109,19),(23,'meta.description','',402,109,19),(24,'meta.keywords','',402,109,19),(25,'title','Entjungfert! | Schwarze Hand Haßloch',403,109,19),(26,'meta.description','',403,109,19),(27,'meta.keywords','',403,109,19),(28,'title','Entjungfert! | Schwarze Hand Haßloch',404,109,19),(29,'meta.description','',404,109,19),(30,'meta.keywords','',404,109,19),(31,'title','Schwarze Hand Haßloch | Schwarze Hand Haßloch',405,109,19),(32,'meta.description','',405,109,19),(33,'meta.keywords','',405,109,19),(34,'title','Haßloch | Schwarze Hand Haßloch',406,109,19),(35,'meta.description','',406,109,19),(36,'meta.keywords','',406,109,19),(37,'title','Nuddn | Schwarze Hand Haßloch',407,109,19),(38,'meta.description','',407,109,19),(39,'meta.keywords','',407,109,19),(40,'title','Schwarze Hand Haßloch | Geheimorganisation',408,109,19),(41,'meta.description','',408,109,19),(42,'meta.keywords','',408,109,19),(43,'title','Entjungfert! | Schwarze Hand Haßloch',409,109,19),(44,'meta.description','',409,109,19),(45,'meta.keywords','',409,109,19),(46,'title','Entjungfert! | Schwarze Hand Haßloch',410,109,19),(47,'meta.description','',410,109,19),(48,'meta.keywords','',410,109,19),(49,'title','Entjungfert! | Schwarze Hand Haßloch',411,109,19),(50,'meta.description','',411,109,19),(51,'meta.keywords','',411,109,19),(52,'title','Motto | Schwarze Hand Haßloch',412,109,19),(53,'meta.description','',412,109,19),(54,'meta.keywords','',412,109,19),(55,'title','Entjungfert! | Schwarze Hand Haßloch',413,109,19),(56,'meta.description','',413,109,19),(57,'meta.keywords','',413,109,19),(58,'title','Haßlocher Legenden | Schwarze Hand Haßloch',414,109,19),(59,'meta.description','',414,109,19),(60,'meta.keywords','',414,109,19),(61,'title','Niemand geht auf’s Eis, bevor … | Schwarze Ha',415,109,19),(62,'meta.description','',415,109,19),(63,'meta.keywords','',415,109,19),(64,'title','Nonsense | Schwarze Hand Haßloch',416,109,19),(65,'meta.description','',416,109,19),(66,'meta.keywords','',416,109,19),(67,'title','Horlachgraben | Schwarze Hand Haßloch',417,109,19),(68,'meta.description','',417,109,19),(69,'meta.keywords','',417,109,19),(70,'title','Dem Eppelwoi | Schwarze Hand Haßloch',418,109,19),(71,'meta.description','',418,109,19),(72,'meta.keywords','',418,109,19),(73,'title','Impressum | Schwarze Hand Haßloch',419,109,19),(74,'meta.description','',419,109,19),(75,'meta.keywords','',419,109,19),(76,'title','Niemand geht auf’s Eis, bevor … | Schwarze Ha',420,109,19),(77,'meta.description','',420,109,19),(78,'meta.keywords','',420,109,19),(79,'title','Entjungfert! | Schwarze Hand Haßloch',421,109,19),(80,'meta.description','',421,109,19),(81,'meta.keywords','',421,109,19),(82,'title','Eishockey | Schwarze Hand Haßloch',422,109,19),(83,'meta.description','',422,109,19),(84,'meta.keywords','',422,109,19),(85,'title','Entjungfert! | Schwarze Hand Haßloch',423,109,19),(86,'meta.description','',423,109,19),(87,'meta.keywords','',423,109,19),(88,'title','Buford T. Justice | Schwarze Hand Haßloch',424,109,19),(89,'meta.description','',424,109,19),(90,'meta.keywords','',424,109,19),(91,'title','Winter in Haßloch | Schwarze Hand Haßloch',425,109,19),(92,'meta.description','',425,109,19),(93,'meta.keywords','',425,109,19),(94,'title','Haßloch | Schwarze Hand Haßloch',426,109,19),(95,'meta.description','',426,109,19),(96,'meta.keywords','',426,109,19),(97,'title','Niemand geht auf’s Eis, bevor … | Schwarze Ha',427,109,19),(98,'meta.description','',427,109,19),(99,'meta.keywords','',427,109,19),(100,'title','Entjungfert! | Schwarze Hand Haßloch',428,109,19),(101,'meta.description','',428,109,19),(102,'meta.keywords','',428,109,19),(103,'title','Entjungfert! | Schwarze Hand Haßloch',429,109,19),(104,'meta.description','',429,109,19),(105,'meta.keywords','',429,109,19),(106,'title','Entjungfert! | Schwarze Hand Haßloch',430,109,19),(107,'meta.description','',430,109,19),(108,'meta.keywords','',430,109,19),(109,'title','SHH Codex | Schwarze Hand Haßloch',431,109,19),(110,'meta.description','',431,109,19),(111,'meta.keywords','',431,109,19);
/*!40000 ALTER TABLE `page_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `website`
--

DROP TABLE IF EXISTS `website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `website` (
  `website_id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `state` enum('active','deleted') COLLATE utf8_bin DEFAULT NULL,
  `seo_score` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `max_sites` int(11) DEFAULT NULL,
  PRIMARY KEY (`website_id`),
  UNIQUE KEY `url_UNIQUE` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website`
--

LOCK TABLES `website` WRITE;
/*!40000 ALTER TABLE `website` DISABLE KEYS */;
INSERT INTO `website` VALUES (18,'http://www.mcei2020.de/','mcei',NULL,0,'2012-08-24 00:41:28',100),(19,'http://www.schwarze-hand-hassloch.de/','Hassloch',NULL,0,'2012-08-24 00:41:28',100);
/*!40000 ALTER TABLE `website` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-08-24  3:04:29
