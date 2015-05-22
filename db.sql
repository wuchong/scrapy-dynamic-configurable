# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.22)
# Database: spider
# Generation Time: 2015-05-22 14:07:57 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table articles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `articles`;

CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `publish_time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source_site` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table rules
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rules`;

CREATE TABLE `rules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `allow_domains` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start_urls` text COLLATE utf8_unicode_ci,
  `next_page` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `allow_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extract_from` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title_xpath` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body_xpath` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publish_time_xpath` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source_site_xpath` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `rules` WRITE;
/*!40000 ALTER TABLE `rules` DISABLE KEYS */;

INSERT INTO `rules` (`id`, `name`, `allow_domains`, `start_urls`, `next_page`, `allow_url`, `extract_from`, `title_xpath`, `body_xpath`, `publish_time_xpath`, `source_site_xpath`, `enable`)
VALUES
	(1,'中国会展门户','cnena.com','http://www.cnena.com/news/list-htm-fid-55.html','//a[@title=\'下一页\']','bencandy-htm-fid-.*\\.html','//*[@id=\"sort_list\"]','//div[@class=\"content\"]//h1//text()','//*[@id=\"divcontent\"]//div//text()','//div[@class=\"content\"]//div[@class=\"content_info\"]/text()','//div[@class=\"content\"]//div[@class=\"content_info\"]/a/text()',0),
	(2,'中国会展网','expo-china.com','http://www.expo-china.com/web/news/news_list.aspx','','\\/pages\\/news\\/\\d{6}\\/\\d*\\/index.shtml','//*[@id=\"NewsView_GNZX_bianju\"]/div','//*[@id=\"NewsView_HDTK_bianju\"]/div[1]/h2/text()','//*[@id=\"NewsView_HDTK_bianju\"]/div[3]/p//text()','//*[@id=\"NewsView_HDTK_bianju\"]/div[1]/span[1]/text()','//*[@id=\"NewsView_HDTK_bianju\"]/div[1]/span[2]/text()',1),
	(3,'成都会展','cdexpo.com.cn','http://www.cdexpo.com.cn/article-1-35-1.html','//a[@title=\'下一页\']','article-detail-.*\\.html','//*[@id=\"news-list\"]/div','//*[@id=\"content\"]//div[@class=\"detail-tit\"]/h3/text()','//*[@id=\"content\"]//div[@class=\"detail-content\"]/p/text()','//*[@id=\"content\"]/div/div[1]/div/div/div[2]/p/span[1]/text()','//*[@id=\"content\"]/div/div[1]/div/div/div[2]/p/span[2]/text()',1);

/*!40000 ALTER TABLE `rules` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
