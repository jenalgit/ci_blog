-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.21 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for blog_ci
CREATE DATABASE IF NOT EXISTS `blog_ci` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `blog_ci`;


-- Dumping structure for table blog_ci.about
CREATE TABLE IF NOT EXISTS `about` (
  `idabout` int(1) NOT NULL,
  `login_id` int(10) NOT NULL,
  `text` text NOT NULL,
  `images` varchar(100) NOT NULL,
  `twitter` varchar(50) NOT NULL,
  `plus` varchar(50) NOT NULL,
  `github` varchar(50) NOT NULL,
  PRIMARY KEY (`idabout`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table blog_ci.category
CREATE TABLE IF NOT EXISTS `category` (
  `idcategory` int(2) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`idcategory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table blog_ci.categorytutorial
CREATE TABLE IF NOT EXISTS `categorytutorial` (
  `idcategorytutorial` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `slug_cat` varchar(45) NOT NULL,
  PRIMARY KEY (`idcategorytutorial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table blog_ci.ci_sessions
CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table blog_ci.contact
CREATE TABLE IF NOT EXISTS `contact` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `date` int(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.


-- Dumping structure for table blog_ci.ebook
CREATE TABLE IF NOT EXISTS `ebook` (
  `idebook` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `file` varchar(100) NOT NULL,
  `date` int(20) NOT NULL,
  `counter` int(5) DEFAULT NULL,
  PRIMARY KEY (`idebook`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table blog_ci.file
CREATE TABLE IF NOT EXISTS `file` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `tutorial` varchar(200) DEFAULT NULL,
  `demo` varchar(100) DEFAULT NULL,
  `file` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table blog_ci.login
CREATE TABLE IF NOT EXISTS `login` (
  `idlogin` int(100) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(30) NOT NULL,
  `status` varchar(25) NOT NULL,
  `active` int(1) NOT NULL,
  `kodeactivation` varchar(200) NOT NULL,
  `hit` int(30) NOT NULL,
  PRIMARY KEY (`idlogin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table blog_ci.project
CREATE TABLE IF NOT EXISTS `project` (
  `idproject` int(10) NOT NULL AUTO_INCREMENT,
  `idcategory` int(3) NOT NULL,
  `title` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `text` text NOT NULL,
  `image` varchar(100) NOT NULL,
  `date` int(20) DEFAULT NULL,
  `author` int(3) NOT NULL,
  PRIMARY KEY (`idproject`),
  KEY `idcategory_idx` (`idcategory`),
  CONSTRAINT `category_fk` FOREIGN KEY (`idcategory`) REFERENCES `category` (`idcategory`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table blog_ci.tag
CREATE TABLE IF NOT EXISTS `tag` (
  `idtag` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`idtag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table blog_ci.tutorial
CREATE TABLE IF NOT EXISTS `tutorial` (
  `idtutorial` int(10) NOT NULL AUTO_INCREMENT,
  `id_category` int(3) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `text` text NOT NULL,
  `image` varchar(100) NOT NULL,
  `tag` varchar(100) NOT NULL,
  `date` int(20) DEFAULT NULL,
  `publish` enum('yes','no') NOT NULL,
  `author` int(3) NOT NULL,
  `counter` int(5) DEFAULT NULL,
  PRIMARY KEY (`idtutorial`),
  UNIQUE KEY `tutorial_fk` (`idtutorial`,`slug`,`title`),
  KEY `fk_tutorial_idx` (`id_category`),
  CONSTRAINT `fk_tutorial_1` FOREIGN KEY (`id_category`) REFERENCES `categorytutorial` (`idcategorytutorial`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table blog_ci.tutorial_delete
CREATE TABLE IF NOT EXISTS `tutorial_delete` (
  `idtutorial` int(10) NOT NULL,
  `id_category` int(3) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `text` text NOT NULL,
  `image` varchar(100) NOT NULL,
  `tag` varchar(100) NOT NULL,
  `date` int(20) DEFAULT NULL,
  `publish` enum('yes','no') NOT NULL,
  `author` int(3) NOT NULL,
  `counter` int(5) DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  `name_user` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idtutorial`),
  UNIQUE KEY `tutorial_fk` (`idtutorial`,`slug`,`title`),
  KEY `fk_tutorial_idx` (`id_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for trigger blog_ci.tg_delete_tutorial
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `tg_delete_tutorial` AFTER DELETE ON `tutorial` FOR EACH ROW BEGIN
INSERT INTO tutorial_delete
(
idtutorial,
id_category,
title,
slug,
text,
image,
tag,
date,
publish,
author,
counter,
create_at,
name_user
)
VALUES
(
OLD.idtutorial,
OLD.id_category,
OLD.title,
OLD.slug,
OLD.text,
OLD.image,
OLD.tag,
OLD.date,
OLD.publish,
OLD.author,
OLD.counter,
SYSDATE(),
CURRENT_USER
);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
