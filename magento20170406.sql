-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: localhost    Database: magento
-- ------------------------------------------------------
-- Server version	5.7.17-0ubuntu0.16.04.1

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
-- Table structure for table `magev1_admin_assert`
--

DROP TABLE IF EXISTS `magev1_admin_assert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_admin_assert` (
  `assert_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Assert ID',
  `assert_type` varchar(20) DEFAULT NULL COMMENT 'Assert Type',
  `assert_data` text COMMENT 'Assert Data',
  PRIMARY KEY (`assert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Admin Assert Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_admin_assert`
--

LOCK TABLES `magev1_admin_assert` WRITE;
/*!40000 ALTER TABLE `magev1_admin_assert` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_admin_assert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_admin_role`
--

DROP TABLE IF EXISTS `magev1_admin_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_admin_role` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Role ID',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parent Role ID',
  `tree_level` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Role Tree Level',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Role Sort Order',
  `role_type` varchar(1) NOT NULL DEFAULT '0' COMMENT 'Role Type',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'User ID',
  `role_name` varchar(50) DEFAULT NULL COMMENT 'Role Name',
  PRIMARY KEY (`role_id`),
  KEY `IDX_MAGEV1_ADMIN_ROLE_PARENT_ID_SORT_ORDER` (`parent_id`,`sort_order`),
  KEY `IDX_MAGEV1_ADMIN_ROLE_TREE_LEVEL` (`tree_level`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Admin Role Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_admin_role`
--

LOCK TABLES `magev1_admin_role` WRITE;
/*!40000 ALTER TABLE `magev1_admin_role` DISABLE KEYS */;
INSERT INTO `magev1_admin_role` VALUES (1,0,1,1,'G',0,'Administrators'),(3,1,2,0,'U',1,'poney');
/*!40000 ALTER TABLE `magev1_admin_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_admin_rule`
--

DROP TABLE IF EXISTS `magev1_admin_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_admin_rule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule ID',
  `role_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Role ID',
  `resource_id` varchar(255) DEFAULT NULL COMMENT 'Resource ID',
  `privileges` varchar(20) DEFAULT NULL COMMENT 'Privileges',
  `assert_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Assert ID',
  `role_type` varchar(1) DEFAULT NULL COMMENT 'Role Type',
  `permission` varchar(10) DEFAULT NULL COMMENT 'Permission',
  PRIMARY KEY (`rule_id`),
  KEY `IDX_MAGEV1_ADMIN_RULE_RESOURCE_ID_ROLE_ID` (`resource_id`,`role_id`),
  KEY `IDX_MAGEV1_ADMIN_RULE_ROLE_ID_RESOURCE_ID` (`role_id`,`resource_id`),
  CONSTRAINT `FK_MAGEV1_ADMIN_RULE_ROLE_ID_MAGEV1_ADMIN_ROLE_ROLE_ID` FOREIGN KEY (`role_id`) REFERENCES `magev1_admin_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Admin Rule Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_admin_rule`
--

LOCK TABLES `magev1_admin_rule` WRITE;
/*!40000 ALTER TABLE `magev1_admin_rule` DISABLE KEYS */;
INSERT INTO `magev1_admin_rule` VALUES (1,1,'all',NULL,0,'G','allow');
/*!40000 ALTER TABLE `magev1_admin_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_admin_user`
--

DROP TABLE IF EXISTS `magev1_admin_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_admin_user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'User ID',
  `firstname` varchar(32) DEFAULT NULL COMMENT 'User First Name',
  `lastname` varchar(32) DEFAULT NULL COMMENT 'User Last Name',
  `email` varchar(128) DEFAULT NULL COMMENT 'User Email',
  `username` varchar(40) DEFAULT NULL COMMENT 'User Login',
  `password` varchar(100) DEFAULT NULL COMMENT 'User Password',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'User Created Time',
  `modified` timestamp NULL DEFAULT NULL COMMENT 'User Modified Time',
  `logdate` timestamp NULL DEFAULT NULL COMMENT 'User Last Login Time',
  `lognum` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'User Login Number',
  `reload_acl_flag` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Reload ACL',
  `is_active` smallint(6) NOT NULL DEFAULT '1' COMMENT 'User Is Active',
  `extra` text COMMENT 'User Extra Data',
  `rp_token` text COMMENT 'Reset Password Link Token',
  `rp_token_created_at` timestamp NULL DEFAULT NULL COMMENT 'Reset Password Link Token Creation Date',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `UNQ_MAGEV1_ADMIN_USER_USERNAME` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Admin User Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_admin_user`
--

LOCK TABLES `magev1_admin_user` WRITE;
/*!40000 ALTER TABLE `magev1_admin_user` DISABLE KEYS */;
INSERT INTO `magev1_admin_user` VALUES (1,'poney','poney','pierre@diva-cloud.com','poney','e276b4f8987e6369d87e446c13ba05aa:RcKmwRxT8XehErYbKaY6eMgWkI9Jw9LD','2017-03-15 10:27:12','2017-04-03 11:24:12','2017-04-05 21:17:53',43,0,1,'a:1:{s:11:\"configState\";a:31:{s:14:\"design_package\";s:1:\"1\";s:12:\"design_theme\";s:1:\"1\";s:11:\"design_head\";s:1:\"1\";s:13:\"design_header\";s:1:\"1\";s:13:\"design_footer\";s:1:\"1\";s:16:\"design_watermark\";s:1:\"1\";s:17:\"design_pagination\";s:1:\"1\";s:12:\"design_email\";s:1:\"1\";s:12:\"dev_restrict\";s:1:\"0\";s:9:\"dev_debug\";s:1:\"1\";s:12:\"dev_template\";s:1:\"1\";s:20:\"dev_translate_inline\";s:1:\"0\";s:7:\"dev_log\";s:1:\"0\";s:6:\"dev_js\";s:1:\"0\";s:7:\"dev_css\";s:1:\"0\";s:15:\"general_country\";s:1:\"1\";s:14:\"general_region\";s:1:\"0\";s:14:\"general_locale\";s:1:\"1\";s:25:\"general_store_information\";s:1:\"0\";s:16:\"currency_options\";s:1:\"1\";s:20:\"currency_webservicex\";s:1:\"0\";s:15:\"currency_import\";s:1:\"0\";s:7:\"web_url\";s:1:\"1\";s:7:\"web_seo\";s:1:\"1\";s:12:\"web_unsecure\";s:1:\"0\";s:10:\"web_secure\";s:1:\"0\";s:11:\"web_default\";s:1:\"0\";s:9:\"web_polls\";s:1:\"0\";s:10:\"web_cookie\";s:1:\"0\";s:11:\"web_session\";s:1:\"0\";s:24:\"web_browser_capabilities\";s:1:\"0\";}}',NULL,NULL);
/*!40000 ALTER TABLE `magev1_admin_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_adminnotification_inbox`
--

DROP TABLE IF EXISTS `magev1_adminnotification_inbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_adminnotification_inbox` (
  `notification_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Notification id',
  `severity` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Problem type',
  `date_added` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Create date',
  `title` varchar(255) NOT NULL COMMENT 'Title',
  `description` text COMMENT 'Description',
  `url` varchar(255) DEFAULT NULL COMMENT 'Url',
  `is_read` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Flag if notification read',
  `is_remove` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Flag if notification might be removed',
  PRIMARY KEY (`notification_id`),
  KEY `IDX_MAGEV1_ADMINNOTIFICATION_INBOX_SEVERITY` (`severity`),
  KEY `IDX_MAGEV1_ADMINNOTIFICATION_INBOX_IS_READ` (`is_read`),
  KEY `IDX_MAGEV1_ADMINNOTIFICATION_INBOX_IS_REMOVE` (`is_remove`)
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8 COMMENT='Adminnotification Inbox';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_adminnotification_inbox`
--

LOCK TABLES `magev1_adminnotification_inbox` WRITE;
/*!40000 ALTER TABLE `magev1_adminnotification_inbox` DISABLE KEYS */;
INSERT INTO `magev1_adminnotification_inbox` VALUES (1,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(2,3,'2008-11-20 06:31:12','Magento version 1.1.7 Now Available','Magento version 1.1.7 Now Available.\n\nThis version includes over 350 issue resolutions for Magento 1.1.x that are listed in the release notes section, and new functionality that includes:\n\n-Google Website Optimizer integration\n-Google Base integration\n-Scheduled DB logs cleaning option','http://www.magentocommerce.com/blog/comments/magento-version-117-now-available/',0,0),(3,3,'2008-11-27 02:24:50','Magento Version 1.1.8 Now Available','Magento version 1.1.8 now available.\n\nThis version includes some issue resolutions for Magento 1.1.x that are listed in the release notes section.','http://www.magentocommerce.com/blog/comments/magento-version-118-now-available/',0,0),(4,3,'2008-12-30 12:45:59','Magento version 1.2.0 is now available for download and upgrade','We are extremely happy to announce the availability of Magento version 1.2.0 for download and upgrade.\n\nThis version includes numerous issue resolutions for Magento version 1.1.x and some highly requested new features such as:\n\n    * Support for Downloadable/Digital Products. \n    * Added Layered Navigation to site search result page.\n    * Improved site search to utilize MySQL fulltext search\n    * Added support for fixed-taxes on product level.\n    * Upgraded Zend Framework to the latest stable version 1.7.2','http://www.magentocommerce.com/blog/comments/magento-version-120-is-now-available/',0,0),(5,2,'2008-12-31 02:59:22','Magento version 1.2.0.1 now available','Magento version 1.2.0.1 now available.This version includes some issue resolutions for Magento 1.2.x that are listed in the release notes section.','http://www.magentocommerce.com/blog/comments/magento-version-1201-available/',0,0),(6,2,'2009-01-13 01:41:49','Magento version 1.2.0.2 now available','Magento version 1.2.0.2 is now available for download and upgrade. This version includes an issue resolutions for Magento version 1.2.0.x as listed in the release notes.','http://www.magentocommerce.com/blog/comments/magento-version-1202-now-available/',0,0),(7,3,'2009-01-24 05:25:56','Magento version 1.2.0.3 now available','Magento version 1.2.0.3 is now available for download and upgrade. This version includes issue resolutions for Magento version 1.2.0.x as listed in the release notes.','http://www.magentocommerce.com/blog/comments/magento-version-1203-now-available/',0,0),(8,3,'2009-02-03 02:57:00','Magento version 1.2.1 is now available for download and upgrade','We are happy to announce the availability of Magento version 1.2.1 for download and upgrade.\n\nThis version includes some issue resolutions for Magento version 1.2.x. A full list of items included in this release can be found on the release notes page.','http://www.magentocommerce.com/blog/comments/magento-version-121-now-available/',0,0),(9,3,'2009-02-24 05:45:47','Magento version 1.2.1.1 now available','Magento version 1.2.1.1 now available.This version includes some issue resolutions for Magento 1.2.x that are listed in the release notes section.','http://www.magentocommerce.com/blog/comments/magento-version-1211-now-available/',0,0),(10,3,'2009-02-27 06:39:24','CSRF Attack Prevention','We have just posted a blog entry about a hypothetical CSRF attack on a Magento admin panel. Please read the post to find out if your Magento installation is at risk at http://www.magentocommerce.com/blog/comments/csrf-vulnerabilities-in-web-application-and-how-to-avoid-them-in-magento/','http://www.magentocommerce.com/blog/comments/csrf-vulnerabilities-in-web-application-and-how-to-avoid-them-in-magento/',0,0),(11,2,'2009-03-04 04:03:58','Magento version 1.2.1.2 now available','Magento version 1.2.1.2 is now available for download and upgrade.\nThis version includes some updates to improve admin security as described in the release notes page.','http://www.magentocommerce.com/blog/comments/magento-version-1212-now-available/',0,0),(12,3,'2009-03-31 06:22:40','Magento version 1.3.0 now available','Magento version 1.3.0 is now available for download and upgrade. This version includes numerous issue resolutions for Magento version 1.2.x and new features as described on the release notes page.','http://www.magentocommerce.com/blog/comments/magento-version-130-is-now-available/',0,0),(13,3,'2009-04-18 08:06:02','Magento version 1.3.1 now available','Magento version 1.3.1 is now available for download and upgrade. This version includes some issue resolutions for Magento version 1.3.x and new features such as Checkout By Amazon and Amazon Flexible Payment. To see a full list of updates please check the release notes page.','http://www.magentocommerce.com/blog/comments/magento-version-131-now-available/',0,0),(14,3,'2009-05-20 02:31:21','Magento version 1.3.1.1 now available','Magento version 1.3.1.1 is now available for download and upgrade. This version includes some issue resolutions for Magento version 1.3.x and a security update for Magento installations that run on multiple domains or sub-domains. If you are running Magento with multiple domains or sub-domains we highly recommend upgrading to this version.','http://www.magentocommerce.com/blog/comments/magento-version-1311-now-available/',0,0),(15,3,'2009-05-30 02:54:06','Magento version 1.3.2 now available','This version includes some improvements and issue resolutions for version 1.3.x that are listed on the release notes page. also included is a Beta version of the Compile module.','http://www.magentocommerce.com/blog/comments/magento-version-132-now-available/',0,0),(16,3,'2009-06-01 23:32:52','Magento version 1.3.2.1 now available','Magento version 1.3.2.1 now available for download and upgrade.\n\nThis release solves an issue for users running Magento with PHP 5.2.0, and changes to index.php to support the new Compiler Module.','http://www.magentocommerce.com/blog/comments/magento-version-1321-now-available/',0,0),(17,3,'2009-07-02 05:21:44','Magento version 1.3.2.2 now available','Magento version 1.3.2.2 is now available for download and upgrade.\n\nThis release includes issue resolution for Magento version 1.3.x. To see a full list of changes please visit the release notes page http://www.magentocommerce.com/download/release_notes.','http://www.magentocommerce.com/blog/comments/magento-version-1322-now-available/',0,0),(18,3,'2009-07-23 10:48:54','Magento version 1.3.2.3 now available','Magento version 1.3.2.3 is now available for download and upgrade.\n\nThis release includes issue resolution for Magento version 1.3.x. We recommend to upgrade to this version if PayPal payment modules are in use. To see a full list of changes please visit the release notes page http://www.magentocommerce.com/download/release_notes.','http://www.magentocommerce.com/blog/comments/magento-version-1323-now-available/',0,0),(19,4,'2009-08-28 22:26:28','PayPal is updating Payflow Pro and Website Payments Pro (Payflow Edition) UK.','If you are using Payflow Pro and/or Website Payments Pro (Payflow Edition) UK.  payment methods, you will need to update the URLÃ¢â‚¬Ëœs in your Magento Administrator Panel in order to process transactions after September 1, 2009. Full details are available here: http://www.magentocommerce.com/wiki/paypal_payflow_changes','http://www.magentocommerce.com/wiki/paypal_payflow_changes',0,0),(20,2,'2009-09-24 00:16:49','Magento Version 1.3.2.4 Security Update','Magento Version 1.3.2.4 is now available. This version includes a security updates for Magento 1.3.x that solves possible XSS vulnerability issue on customer registration page and is available through SVN, Download Page and through the Magento Connect Manager.','http://www.magentocommerce.com/blog/comments/magento-version-1324-security-update/',0,0),(21,4,'2009-09-25 18:57:54','Magento Preview Version 1.4.0.0-alpha2 is now available','We are happy to announce the availability of Magento Preview Version 1.4.0.0-alpha2 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-1400-alpha2-now-available/',0,0),(22,4,'2009-10-07 04:55:40','Magento Preview Version 1.4.0.0-alpha3 is now available','We are happy to announce the availability of Magento Preview Version 1.4.0.0-alpha3 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-1400-alpha3-now-available/',0,0),(23,4,'2009-12-09 04:30:36','Magento Preview Version 1.4.0.0-beta1 is now available','We are happy to announce the availability of Magento Preview Version 1.4.0.0-beta1 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-1400-beta1-now-available/',0,0),(24,4,'2009-12-31 14:22:12','Magento Preview Version 1.4.0.0-rc1 is now available','We are happy to announce the availability of Magento Preview Version 1.4.0.0-rc1 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-1400-rc1-now-available/',0,0),(25,4,'2010-02-13 08:39:53','Magento CE Version 1.4.0.0 Stable is now available','We are excited to announce the availability of Magento CE Version 1.4.0.0 Stable for upgrade and download.','http://bit.ly/c53rpK',0,0),(26,3,'2010-02-20 07:39:36','Magento CE Version 1.4.0.1 Stable is now available','Magento CE 1.4.0.1 Stable is now available for upgrade and download.','http://www.magentocommerce.com/blog/comments/magento-ce-version-1401-stable-now-available/',0,0),(27,4,'2010-04-24 00:09:03','Magento Version CE 1.3.3.0 Stable - Now Available With Support for 3-D Secure','Based on community requests, we are excited to announce the release of Magento CE 1.3.3.0-Stable with support for 3-D Secure. This release is intended for Magento merchants using version 1.3.x, who want to add support for 3-D Secure.','http://www.magentocommerce.com/blog/comments/magento-version-ce-1330-stable-now-available-with-support-for-3-d-secure/',0,0),(28,4,'2010-05-31 21:20:21','Announcing the Launch of Magento Mobile','The Magento team is pleased to announce the launch of Magento mobile, a new product that will allow Magento merchants to easily create branded, native mobile storefront applications that are deeply integrated with MagentoÃ¢â‚¬â„¢s market-leading eCommerce platform. The product includes a new administrative manager, a native iPhone app that is fully customizable, and a service where Magento manages the submission and maintenance process for the iTunes App Store.\n\nLearn more by visiting the Magento mobile product page and sign-up to be the first to launch a native mobile commerce app, fully integrated with Magento.','http://www.magentocommerce.com/product/mobile',0,0),(29,4,'2010-06-11 00:08:08','Magento CE Version 1.4.1.0 Stable is now available','We are excited to announce the availability of Magento CE Version 1.4.1.0 Stable for upgrade and download. Some of the highlights of this release include: Enhanced PayPal integration (more info to follow), Change of Database structure of the Sales module to no longer use EAV, and much more.','http://www.magentocommerce.com/blog/comments/magento-ce-version-1410-stable-now-available/',0,0),(30,4,'2010-07-27 01:37:34','Magento CE Version 1.4.1.1 Stable is now available','We are excited to announce the availability of Magento CE Version 1.4.1.1 Stable for download and upgrade.','http://www.magentocommerce.com/blog/comments/magento-ce-version-1411-stable-now-available/',0,0),(31,4,'2010-07-28 09:12:12','Magento CE Version 1.4.2.0-beta1 Preview Release Now Available','This release gives a preview of the new Magento Connect Manager.','http://www.magentocommerce.com/blog/comments/magento-preview-version-1420-beta1-now-available/',0,0),(32,4,'2010-07-29 00:15:01','Magento CE Version 1.4.1.1 Patch Available','As some users experienced issues with upgrading to CE 1.4.1.1 through PEAR channels we provided a patch for it that is available on our blog http://www.magentocommerce.com/blog/comments/magento-ce-version-1411-stable-patch/','http://www.magentocommerce.com/blog/comments/magento-ce-version-1411-stable-patch/',0,0),(33,4,'2010-10-12 04:13:25','Magento Mobile is now live!','Magento Mobile is now live! Signup today to have your own native iPhone mobile-shopping app in iTunes for the holiday season! Learn more at http://www.magentomobile.com/','http://www.magentomobile.com/',0,0),(34,4,'2010-11-09 02:52:06','Magento CE Version 1.4.2.0-RC1 Preview Release Now Available','We are happy to announce the availability of Magento Preview Version 1.4.2.0-RC1 for download.','http://www.magentocommerce.com/blog/comments/magento-preview-version-1420-rc1-now-available/',0,0),(35,4,'2010-12-03 01:33:00','Magento CE Version 1.4.2.0-RC2 Preview Release Now Available','We are happy to announce the availability of Magento Preview Version 1.4.2.0-RC2 for download.','http://www.magentocommerce.com/blog/comments/magento-preview-version-1420-rc2-now-available/',0,0),(36,4,'2010-12-09 03:29:55','Magento CE Version 1.4.2.0 Stable is now available','We are excited to announce the availability of Magento CE Version 1.4.2.0 Stable for download and upgrade.','http://www.magentocommerce.com/blog/comments/magento-ce-version-1420-stable-now-available/',0,0),(37,4,'2010-12-18 04:23:55','Magento Preview Version CE 1.5.0.0-alpha1 is now available','We are happy to announce the availability of Magento Preview Version CE 1.5.0.0-alpha1 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1500-alpha1-now-available/',0,0),(38,4,'2010-12-30 04:51:08','Magento Preview Version CE 1.5.0.0-alpha2 is now available','We are happy to announce the availability of Magento Preview Version CE 1.5.0.0-alpha2 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1500-alpha2-now-available/',0,0),(39,4,'2011-01-14 05:35:36','Magento Preview Version CE 1.5.0.0-beta1 is now available','We are happy to announce the availability of Magento Preview Version CE 1.5.0.0-beta1 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1500-beta1-now-available/',0,0),(40,4,'2011-01-22 02:19:09','Magento Preview Version CE 1.5.0.0-beta2 is now available','We are happy to announce the availability of Magento Preview Version CE 1.5.0.0-beta2 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1500-beta2-now-available/',0,0),(41,4,'2011-01-28 02:27:57','Magento Preview Version CE 1.5.0.0-rc1 is now available','We are happy to announce the availability of Magento Preview Version CE 1.5.0.0-rc1 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1500-rc1-now-available/',0,0),(42,4,'2011-02-04 02:56:33','Magento Preview Version CE 1.5.0.0-rc2 is now available','We are happy to announce the availability of Magento Preview Version CE 1.5.0.0-rc2 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1500-rc2-now-available/',0,0),(43,4,'2011-02-09 00:43:23','Magento CE Version 1.5.0.0 Stable is now available','We are excited to announce the availability of Magento CE Version 1.5.0.0 Stable for download and upgrade.','http://www.magentocommerce.com/blog/comments/magento-community-professional-and-enterprise-editions-releases-now-availab/',0,0),(44,4,'2011-02-10 04:42:57','Magento CE 1.5.0.1 stable Now Available','We are excited to announce the availability of Magento CE Version 1.5.0.1 Stable for download and upgrade.','http://www.magentocommerce.com/blog/comments/magento-ce-1501-stable-now-available/',0,0),(45,4,'2011-03-19 00:15:45','Magento CE 1.5.1.0-beta1 Now Available','We are happy to announce the availability of Magento Preview Version CE 1.5.1.0-beta1 for download and upgrade.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1510-beta1-now-available/',0,0),(46,4,'2011-03-31 22:43:02','Magento CE 1.5.1.0-rc1 Now Available','We are happy to announce the availability of Magento Preview Version CE 1.5.1.0-rc1 for download and upgrade.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1510-rc1-now-available/',0,0),(47,4,'2011-04-26 23:21:07','Magento CE 1.5.1.0-stable Now Available','We are excited to announce the availability of Magento CE Version 1.5.1.0 Stable for download and upgrade.','http://www.magentocommerce.com/blog/comments/magento-ce-version-1510-stable-now-available/',0,0),(48,4,'2011-05-26 23:33:23','Magento Preview Version CE 1.6.0.0-alpha1 is now available','We are happy to announce the availability of Magento Preview Version CE 1.6.0.0-alpha1 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1600-alpha1-now-available/',0,0),(49,4,'2011-06-15 22:12:08','Magento Preview Version CE 1.6.0.0-beta1 is now available','We are happy to announce the availability of Magento Preview Version CE 1.6.0.0-beta1for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1600-beta1-now-available/',0,0),(50,4,'2011-06-30 23:03:58','Magento Preview Version CE 1.6.0.0-rc1 is now available','We are happy to announce the availability of Magento Preview Version CE 1.6.0.0-rc1 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1600-rc1-now-available/',0,0),(51,4,'2011-07-11 23:07:39','Magento Preview Version CE 1.6.0.0-rc2 is now available','We are happy to announce the availability of Magento Preview Version CE 1.6.0.0-rc2 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1600-rc2-now-available/',0,0),(52,4,'2011-08-19 21:58:31','Magento CE 1.6.0.0-stable Now Available','We are excited to announce the availability of Magento CE Version 1.6.0.0 Stable for download and upgrade.','http://www.magentocommerce.com/blog/comments/magento-ce-version-1600-stable-now-available/',0,0),(53,4,'2011-09-17 05:31:26','Magento Preview Version CE 1.6.1.0-beta1 is now available','We are happy to announce the availability of Magento Preview Version CE 1.6.1.0-beta1 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1610-beta1-now-available/',0,0),(54,4,'2011-09-29 19:44:10','Magento Preview Version CE 1.6.1.0-rc1 is now available','We are happy to announce the availability of Magento Preview Version CE 1.6.1.0-rc1 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1610-rc1-now-available/',0,0),(55,4,'2011-10-19 21:50:05','Magento CE 1.6.1.0-stable Now Available','We are excited to announce the availability of Magento CE Version 1.6.1.0 Stable for download and upgrade.','http://www.magentocommerce.com/blog/comments/magento-ce-version-1610-stable-now-available/',0,0),(56,4,'2011-12-30 22:39:35','Magento Preview Version CE 1.7.0.0-alpha1 is now available','We are happy to announce the availability of Magento Preview Version CE 1.7.0.0-alpha1 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1700-alpha1-now-available/',0,0),(57,4,'2012-01-11 22:24:20','Magento CE 1.6.2.0-stable Now Available','We are excited to announce the availability of Magento CE Version 1.6.2.0 Stable for download and upgrade.','http://www.magentocommerce.com/blog/comments/magento-ce-version-1620-stable-now-available/',0,0),(58,4,'2012-03-03 00:54:12','Magento Preview Version CE 1.7.0.0-beta1 is now available','We are happy to announce the availability of Magento Preview Version CE 1.7.0.0-beta1 for download.\nAs this is a preview version it is NOT recommended in any way to be used in a production environment.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1700-beta1-now-available/',0,0),(59,4,'2012-04-23 14:02:40','Magento Community Preview Version CE 1.7.0.0-RC1 has been released!','Learn more about the exciting new features and updates in this release and how you can take it for a test drive. As this is a preview version, we need to stress that it\'s likely unstable and that we DON\'T recommend that you use it in any production environment just yet.','http://www.magentocommerce.com/blog/comments/magento-preview-version-ce-1700-rc1-now-available/',0,0),(60,4,'2012-05-11 09:46:54','Magento Community 1.7 and Magento Enterprise 1.12 now available!','Learn more about the exciting new features and updates in these releases.','http://www.magentocommerce.com/blog/comments/magento-enterprise-112-and-community-17-now-available/',0,0),(61,4,'2012-06-20 18:54:07','Magento Community Edition 1.7.0.1 now available! ','We have just released an updated version of Magento Community Edition, version 1.7.0.1. This update delivers new, minor functionality and fixes for some potential security vulnerabilities.','http://www.magentocommerce.com/blog/comments/magento-community-edition-1701-released/',0,0),(62,4,'2012-07-05 19:21:43','Important Security Update - Zend Platform Vulnerability','We have recently learned of a serious vulnerability in the Zend platform on which Magento is built. Learn more and access a patch that addresses this issue. ','http://www.magentocommerce.com/blog/comments/important-security-update-zend-platform-vulnerability/',0,0),(63,4,'2012-11-19 20:27:42','Wrap up more holiday sales with financing','Give your customers up to 6 months financing. You get paid right away with Bill Me Later, a PayPal service. Itâ€™s a great way to extend financing in time for the holidays. Learn More.','http://www.magentocommerce.com/paypal/billmelater?utm_source=CEMessaging&utm_medium=copy&utm_content=sixmonths&utm_campaign=BML',0,0),(64,4,'2012-12-07 11:22:30','Increase Your Sales With PayPal','Magento merchants using PayPal Express Checkout can help increase their sales on average 18%. It is one simple thing you can do right now to help boost your sales. Learn more.','http://www.magentocommerce.com/add-paypal?utm_source=CEModule&utm_medium=copy&utm_content=18&utm_campaign=choosepaypal',0,0),(65,4,'2013-02-12 17:53:42','Get More eCommerce Power with Magento Enterprise','Limited time offer: Get a free, customized evaluation of your Community Edition site from a Magento Solution Partner. This evaluation gives you a clear look at the numerous benefits you can achieve by upgrading to Enterprise Edition. ','http://www.magentocommerce.com/community-to-enterprise?utm_source=CEMM&utm_medium=copy&utm_campaign=CE2EE',0,0),(66,2,'2013-09-27 17:28:13','Magento Community Edition 1.8.0.0 - now available for download!','Get tax, security, performance, and many other improvements. \n\nLearn more at http://www.magentocommerce.com/blog/comments/magento-community-edition-one-eight-now-available/ ','http://www.magentocommerce.com/blog/comments/magento-community-edition-one-eight-now-available/',0,0),(67,4,'2013-12-11 15:35:06','Magento Community Edition 1.8.1.0 is here!','This new version offers significant tax calculation, product quality, and security enhancements. Be sure to carefully review the upgrade instructions before starting. More information is available at http://www.magentocommerce.com/blog/comments/magento-community-edition-1810-is-here/','http://www.magentocommerce.com/blog/comments/magento-community-edition-1810-is-here/',0,0),(68,4,'2013-12-12 23:24:39','Important Magento Community Edition Patch','A security patch is available for Magento Community Edition 1.4.0.0 through 1.7.0.2; the issue has been fixed in Magento Community Edition 1.8.0.0 and later. It resolves a vulnerability discovered through our quarterly penetration testing process and has not been reported by merchants. We encourage all merchants to apply the patch in their next regularly scheduled maintenance cycle. The patch is available at http://www.magentocommerce.com/download in the Magento Community Edition Patches section.','http://www.magentocommerce.com/download',0,0),(69,4,'2014-01-21 18:34:48','PHP 5.4 Patch Now Available','Magento is advancing its platform and making development more efficient by adding support for PHP 5.4. Patches are available for download at www.magentocommerce.com/download and you can learn more about this update in our blog post at http://www.magentocommerce.com/blog/comments/magento-now-supports-php-54 .','http://www.magentocommerce.com/blog/comments/magento-now-supports-php-54',0,0),(70,4,'2014-02-20 17:51:46','Discover Card Validation Patch Available','A patch that resolves an issue with validating Discover credit cards is now available for download at http://www.magentocommerce.com/download. More information on the patch is available in the Magento Knowledge Base at http://www.magentocommerce.com/knowledge-base/entry/discover-card-validation','http://www.magentocommerce.com/knowledge-base/entry/discover-card-validation ',0,0),(71,4,'2014-03-04 15:12:26','Learn How to Quickly Increase Sales on Your Site','Adding the PayPal Express Checkout button to your checkout page can help increase sales 18% on average. Itâ€™s fast and easy and you can do it right now to boost sales. Express Checkout is already seamlessly integrated into Community Edition.','http://magento.com/paypal/CE_Express_Checkout_NA?utm_source=messagemodule&utm_medium=message&utm_campaign=Ceexpresscheckout',0,0),(72,4,'2014-05-13 16:46:11','Magento Community Edition 1.9 is now available!','It accelerates your entry into the mobile commerce space by slashing the time and cost of getting a mobile device-friendly responsive site.  And a new Bill Me Later payment option helps boost your sales. Visit http://magento.com/blog/magento-news/magento-enables-responsive-sites-half-time to learn more.','http://magento.com/blog/magento-news/magento-enables-responsive-sites-half-time',0,0),(73,4,'2014-10-08 04:55:06','Itâ€™s still not too late: Boost your 2014 Holiday sales today.','See results in as little as one week with eBay Enterprise Display and 2 business days with eBay Enterprise Affiliate. DID YOU KNOW: Get access to over 128 million highly qualified shoppers on eBay.com with eBay Enterprise Display. And the average retail client using product retargeting sees a $10 to $1 ROI on retargeting spend during Q4. With the eBay Enterprise Affiliate Network, get access to over 200,000 active network publishers across 30+ verticals, and only pay when a customer makes a purchase (Affiliate Network is only available in the U.S. & Canada).  GET STARTED TODAY by visiting www.ebayenterprise.com/turbochargesales','http://www.ebayenterprise.com/turbochargesales',0,0),(74,4,'2014-11-12 19:03:26','Important: PayPal Users Must Discontinue Using SSL 3.0 By December 3, 2014','To address a vulnerability with the SSL 3.0 security protocol, PayPal and other payment gateways will be disabling SSL 3.0 support. Merchants must upgrade to Transport Layer Service (TLS) by December 3, 2014 to avoid PayPal payment operation failures. Learn more about what you need to do at https://devblog.paypal.com/poodle-ssl-3-0-vulnerability/','https://devblog.paypal.com/poodle-ssl-3-0-vulnerability/',0,0),(75,4,'2014-11-24 23:25:21','Magento Community Edition 1.9.1 is available!','Magento Community Edition 1.9.1 empowers merchants to deliver compelling shopping experiences by offering enhanced responsive design capabilities, new swatches to display product variations, and improved performance through support for MySQL 5.6 and PHP 5.5. It also includes support for Google Universal Analytics and over 70 product improvements. Find out more at http://magento.com/blog/magento-news/magento-community-edition-191-now-available-download','http://magento.com/blog/magento-news/magento-community-edition-191-now-available-download',0,0),(76,1,'2015-04-16 16:17:07','Critical Reminder: Download and install Magento security patches.  Download now.','Download and implement 2 important security patches (SUPEE-5344 and SUPEE-1533) from the Magento Community Edition download page (https://www.magentocommerce.com/products/downloads/magento/).  If you have not done so already, download and install 2 previously-released patches that prevent an attacker from remotely executing code on Magento software.  These issues affect all versions of Magento Community Edition.  A press release from Check Point Software Technologies in the coming days will make one of these issues widely known, possibly alerting hackers who may try to exploit it.  Ensure the patches are in place as a preventative measure before the issue is publicized.','https://www.magentocommerce.com/products/downloads/magento/ ',0,0),(77,1,'2015-04-19 22:37:00','Second Reminder: Download and install Magento critical security patches now.','If you have not done so already, download and install 2 previously-released security patches (SUPEE-5344 and SUPEE-1533) from the Magento Community Edition download page (https://www.magentocommerce.com/products/downloads/magento/).  These security issues affect all versions of Magento Community Edition and enable an attacker to remotely execute code on Magento software. A press release from Check Point Software Technologies tomorrow  will make one of these issues widely known, possibly alerting hackers who may try to exploit it.  Ensure the patches are in place as a preventative measure before the issue is publicized.','https://www.magentocommerce.com/products/downloads/magento/',0,0),(78,1,'2015-04-23 19:43:31','Urgent: Immediately install Magento critical security patches','It is critical for you to download and install 2 previously-released security patches (SUPEE-5344 and SUPEE-1533) from the Magento Community Edition download page (https://www.magentocommerce.com/products/downloads/magento/).  Please do this immediately, as Check Point Software Technologies has published a technical description of how they discovered the issue, which we feel might serve as a tutorial for implementing an attack against your website. ','https://www.magentocommerce.com/products/downloads/magento/',0,0),(79,1,'2015-05-15 00:34:01','Important: New Magento Security Patch - Install it Now','It is important for you to download and install a new security patch (SUPEE-5994) from the Magento Community Edition download page (https://www.magentocommerce.com/products/downloads/magento/).  Please apply this critical update immediately to help protect your site from exposure to multiple security vulnerabilities impacting all versions of the Magento Community Edition software. Please note that this patch should be installed in addition to the recent Shoplift patch (SUPEE-5344).','https://www.magentocommerce.com/products/downloads/magento/',0,0),(80,4,'2015-07-07 16:28:25','Now available:  Enhanced site quality and security with Community Edition 1.9.2','Magento Community Edition 1.9.2 is now available for download and features over 105 product improvements, nearly 170 automated functional tests to help internal development teams improve implementation quality and time to market, and several security enhancements. Read our blog announcement for more information (http://magento.com/blog/magento-news/magento-community-edition-192-now-available), or go to the Community Edition download page to get the software today (https://www.magentocommerce.com/products/downloads/magento/).','https://www.magentocommerce.com/products/downloads/magento/',0,0),(81,1,'2015-07-07 17:08:05','July 7, 2015: New Magento Security Patch (SUPEE-6285) â€“ Install Immediately','Today we are providing a new security patch (SUPEE-6285) that addresses critical security vulnerabilities. The patch is available for Community Edition 1.4.1 to 1.9.1.1 and is part of the core code of our latest release, Community Edition 1.9.2, available for download today.  PLEASE NOTE:  You must first implement SUPEE-5994 to ensure SUPEE-6285 works properly. Download Community Edition 1.9.2 or the patch from the Community Edition download page: https://www.magentocommerce.com/products/downloads/magento/  ','https://www.magentocommerce.com/products/downloads/magento/',0,0),(82,1,'2015-08-04 17:28:26','August 4, 2015: New Magento Security Patch (SUPEE-6482) â€“ Install Immediately','Today we are providing a new security patch (SUPEE-6482) that addresses 4 security issues; two issues related to APIs and two cross-site scripting risks. The patch is available for Community Edition 1.4 and later releases and is part of the core code of Community Edition 1.9.2.1, which is available for download today. Before implementing this new security patch, you must first implement all previous security patches. Download Community Edition 1.9.2.1 or the patch from the Community Edition download page at https://www.magentocommerce.com/products/downloads/magento/  ','https://www.magentocommerce.com/products/downloads/magento/  ',0,0),(83,2,'2015-08-05 20:12:55','August 5, 2015:  Security Patch (SUPEE-6482) Release Note CORRECTION','When we announced a new security patch (SUPEE-6482) for Community Edition yesterday we incorrectly said that it addresses 4 issues. It actually addresses 2 security issues: Autoloaded File Inclusion in Magento SOAP API and a SSRF Vulnerability in WSDL File. The patch and Community Edition 1.9.2.1 are complete, fully-tested, and ready to deploy. We strongly encourage you to deploy the patch or upgrade to the latest version of Community Edition if you havenâ€™t done so already. You can find the patch at https://www.magentocommerce.com/products/downloads/magento/. ','https://www.magentocommerce.com/products/downloads/magento/',0,0),(84,4,'2015-10-01 17:32:53','Episode VI: Return of Imagine Commerce | 2016 Registration is Open!','The force is strong with this one. Join the Magento rebellion at Imagine Commerce 2016. Enlist Now at http://imagine.magento.com.','http://imagine.magento.com',0,0),(85,1,'2015-10-21 00:28:05','New Malware Issue. Make Sure You Have Implemented All Security Patches','We have received reports that some Magento sites are being targeted by Guruincsite malware (Neutrino exploit kit). We have NOT identified a new attack vector at this time. Nearly all the impacted sites checked so far were vulnerable to a previously identified and patched issue; sites not vulnerable to that issue show other unpatched issues. Visit the Magento Security Center at http://magento.com/security/news/important-security-update for more information on how to address this issue and make sure that you have implemented all recent security patches.\n','http://magento.com/security/news/important-security-update',0,0),(86,1,'2015-10-27 21:48:23','October 27, 2015: New Magento Security Patch (SUPEE-6788) â€“ Install Immediately','Today, we are releasing a new patch (SUPEE-6788) and Community Edition 1.9.2.2 to address 10+ security issues, including remote code execution and information leak vulnerabilities. This patch is unrelated to the Guruincsite malware issue. Be sure to test the patch in a development environment first, as it can affect extensions and customizations. Download the patch from the Community Edition Download page and learn more at http://magento.com/security/patches/supee-6788  ','http://magento.com/security/patches/supee-6788  ',0,0),(87,1,'2015-11-18 00:25:00','New JavaScript Malware Issue. Make sure your site is secure.','Magento Commerce has received reports of a JavaScript malware exploit that forwards credit card information from checkout pages to an external site. No new attack vector has been identified. It appears most impacted sites have not implemented the February 2015 Shoplift patch, or the patch was implemented after the site was already compromised. Information on how to identify and remove the malicious code is available on the Magento Security Center at http://magento.com/security/news/new-javascript-malware-issue','http://magento.com/security/news/new-javascript-malware-issue ',0,0),(88,4,'2015-11-18 21:40:40','Magento 2.0 Is Available!','Magento 2.0, our next generation open source digital commerce platform is here!  Magento 2.0 offers enhanced performance and scalability, new features to deliver better shopping experiences and conversion rates, and business agility and productivity improvements.  Learn more http://magento.com/blog/magento-news/new-era-commerce-innovation.\n\n','http://magento.com/blog/magento-news/new-era-commerce-innovation',0,0),(89,4,'2016-01-13 22:51:52','Have questions? Magento has big answers at Imagine Commerce.','Big news, bigger experts, and an even bigger ecosystem. Will you be at Imagine Commerce? Join us. ','http://imagine.magento.com',0,0),(90,1,'2016-01-20 22:17:19','Important: New Security Patch (SUPEE-7405) and Release â€“ 1/20/2016','Today, we are releasing a new patch (SUPEE-7405) and Community Edition 1.9.2.3 to improve the security of Magento sites. There are no confirmed attacks related to the security issues, but certain vulnerabilities can potentially be exploited to access customer information or take over administrator sessions. You can download the patch and release from the Community Edition Download Page and learn more at https://magento.com/security/patches/supee-7405. ','https://magento.com/security/patches/supee-7405',0,0),(91,1,'2016-02-24 08:06:43','Important: Updates to SUPEE-7405 Security Patch and Release â€“ 2/23/2016','Updated versions of the recent SUPEE-7405 patch and Community Edition 1.9.2.3 release are now available. The updates add support for PHP 5.3 and address issues with upload file permissions, merging carts, and SOAP APIs experienced with the original release. They DO NOT address any new security issues, but all merchants should upgrade to the new versions to maintain compatibility with future releases. You can learn more about the updates at https://magento.com/security/patches/supee-7405','https://magento.com/security/patches/supee-7405',0,0),(92,1,'2016-03-31 00:25:07','Protect Your Business from Brute-Force Password Guessing Attacks','We just posted an article on the Magento Security Center that shares best practices for protecting stores from brute-force password guessing attacks. Weâ€™ve recently been made aware of a rise in these attacks, so we strongly recommend that you review the approaches outlined in this article with your developer and hosting provider immediately and implement the ones that are best suited to your unique situation. Learn more at https://magento.com/security/best-practices/protect-your-magento-installation-password-guessing ','https://magento.com/security/best-practices/protect-your-magento-installation-password-guessing ',0,0),(93,4,'2016-06-23 16:44:34','Increase your sales and productivity, while simplifying PCI compliance with exciting new Magento Community Edition 2.1 features.','Shoppers can now check out faster using credit cards stored with PayPal and a redesigned PayPal checkout. PCI compliance is easier thanks to Braintree Hosted Fields. Admin tools are redesigned to help you work more efficiently. Upgrade to Enterprise Edition for new Content Staging and Preview and Enhanced Site Search capabilities.','https://magento.com/blog/magento-news/magento-enterprise-edition-21-unleashes-power-marketers-and-merchandisers ',0,0),(94,1,'2016-10-12 20:30:13','Community Edition 1.9.3 and SUPEE-8788 Provide Critical Security & Functional Updates â€“ 10/12/2016','Community Edition 1.9.3 and SUPEE-8788 resolve multiple security issues, including critical vulnerabilities with certain payment methods and Zend Framework libraries. Community Edition 1.9.3 also includes over 120 product quality enhancements and support for PHP 5.6. Learn more about the security issues at https://magento.com/security/patches/supee-8788 and functional updates at http://devdocs.magento.com/guides/m1x/ce19-ee114/ce1.9_release-notes.html#ce19-1930 ','https://magento.com/security/patches/supee-8788 ',0,0),(95,1,'2016-10-25 16:51:10','Dirty COW Linux OS Vulnerability â€“ 10/25/2016','Dirty COW (CVE-2016-5195) is a serious vulnerability affecting most Linux Operating Systems that can be exploited to gain root access to the server. More information on how to immediately update your Linux OS is available in the Magento Security Center at https://magento.com/security/vulnerabilities/new-linux-operating-system-vulnerability. ','https://magento.com/security/vulnerabilities/new-linux-operating-system-vulnerability',0,0),(96,4,'2016-11-14 21:08:04','Community Edition 1.9.3.1 is Now Available â€“ 11/14/2016','Community Edition 1.9.3.1 addresses issues encountered by some merchants in our October 12 product releases. All merchants should either upgrade to Community Edition 1.9.3.1 or apply our latest patch, SUPEE-8788, to close several serious security vulnerabilities. More information is available in the release notes at: http://devdocs.magento.com/guides/m1x/ce19-ee114/ce1.9_release-notes.html#ce19-1931 ','http://devdocs.magento.com/guides/m1x/ce19-ee114/ce1.9_release-notes.html#ce19-1931 ',0,0),(97,1,'2017-01-14 02:33:20','New Zend Framework Security Vulnerability â€“ 1/13/2017','Weâ€™ve found a new vulnerability in a Zend Framework 1 and 2 email component used by all Magento 1 and Magento 2 software (as well as other PHP solutions). This vulnerability is serious and can lead to a remote code execution attack if your servers use Sendmail as a mail transport agent. Learn how to protect your sites at https://magento.com/security/news/new-zend-framework-1-security-vulnerability\n\n','https://magento.com/security/news/new-zend-framework-1-security-vulnerability',0,0),(98,4,'2017-01-19 16:58:24','New Magento DevBox Beta Speeds Magento 2 Setup â€“ 1/19/2017','Magento DevBox Beta makes it faster and easier than ever to setup your Magento 2 development environment. Read our blog post to find out more at: https://magento.com/blog/technical/set-your-magento-2-development-environment-faster.','https://magento.com/blog/technical/set-your-magento-2-development-environment-faster',0,0),(99,1,'2017-02-07 20:03:15','Community Edition 1.9.3.2 and SUPEE-9652 Resolve Zend Framework Security Issue â€“ 2/7/2017','Community Edition 1.9.3.2 and the SUPEE-9652 patch resolve the recent Zend Framework 1 Security vulnerability. Review the Magento Security Center post for more information:  https://magento.com/security/patches/supee-9652','https://magento.com/security/patches/supee-9652',0,0),(100,4,'2017-02-17 21:07:28','Inspirational athlete, Serena Williams, will join Magento at Imagine 2017.','Imagine 2017 will bring together 3000+ international commerce experts to exchange ideas on the future of commerce. Donâ€™t miss this opportunity to hear from inspirational athlete, Serena Williams, and Stella & Dot CEO, Jessica Herrin. Join us in Las Vegas, April 3-5. Register Now at https://imagine.magento.com/\n','https://imagine.magento.com/',0,0),(101,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(102,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(103,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(104,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(105,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(106,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(107,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(108,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(109,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(110,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(111,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(112,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(113,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(114,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(115,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(116,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(117,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(118,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(119,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(120,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(121,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(122,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(123,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(124,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(125,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(126,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(127,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(128,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(129,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(130,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(131,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(132,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(133,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(134,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(135,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(136,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(137,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(138,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(139,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(140,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(141,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(142,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(143,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(144,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(145,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(146,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(147,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(148,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(149,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(150,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(151,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(152,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(153,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(154,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(155,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(156,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(157,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(158,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(159,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(160,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(161,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(162,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(163,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(164,4,'2008-11-08 04:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(165,4,'2008-11-08 03:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(166,4,'2008-11-08 03:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(167,4,'2008-11-08 03:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(168,4,'2008-11-08 03:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(169,4,'2008-11-08 03:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(170,4,'2008-11-08 03:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(171,4,'2008-11-08 03:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(172,4,'2008-11-08 03:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(173,4,'2008-11-08 03:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(174,4,'2008-11-08 03:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(175,4,'2008-11-08 03:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(176,4,'2008-11-08 03:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(177,4,'2008-11-08 03:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(178,4,'2008-11-08 03:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(179,4,'2008-11-08 03:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(180,4,'2008-11-08 03:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(181,4,'2008-11-08 03:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(182,4,'2008-11-08 03:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(183,4,'2008-11-08 03:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(184,4,'2008-11-08 03:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(185,4,'2008-11-08 03:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(186,4,'2008-11-08 03:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0),(187,4,'2008-11-08 03:46:42','Reminder: Change Magento`s default phone numbers and callouts before site launch','Before launching your Magento store, please remember to change Magento`s default phone numbers that appear in email templates, callouts, templates, etc.','',0,0);
/*!40000 ALTER TABLE `magev1_adminnotification_inbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_api2_acl_attribute`
--

DROP TABLE IF EXISTS `magev1_api2_acl_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_api2_acl_attribute` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `user_type` varchar(20) NOT NULL COMMENT 'Type of user',
  `resource_id` varchar(255) NOT NULL COMMENT 'Resource ID',
  `operation` varchar(20) NOT NULL COMMENT 'Operation',
  `allowed_attributes` text COMMENT 'Allowed attributes',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_MAGEV1_MAGEV1_API2_ACL_ATTR_USR_TYPE_RES_ID_OPERATION` (`user_type`,`resource_id`,`operation`),
  KEY `IDX_MAGEV1_API2_ACL_ATTRIBUTE_USER_TYPE` (`user_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api2 Filter ACL Attributes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_api2_acl_attribute`
--

LOCK TABLES `magev1_api2_acl_attribute` WRITE;
/*!40000 ALTER TABLE `magev1_api2_acl_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_api2_acl_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_api2_acl_role`
--

DROP TABLE IF EXISTS `magev1_api2_acl_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_api2_acl_role` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `role_name` varchar(255) NOT NULL COMMENT 'Name of role',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_MAGEV1_API2_ACL_ROLE_CREATED_AT` (`created_at`),
  KEY `IDX_MAGEV1_API2_ACL_ROLE_UPDATED_AT` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Api2 Global ACL Roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_api2_acl_role`
--

LOCK TABLES `magev1_api2_acl_role` WRITE;
/*!40000 ALTER TABLE `magev1_api2_acl_role` DISABLE KEYS */;
INSERT INTO `magev1_api2_acl_role` VALUES (1,'2017-03-15 10:24:05',NULL,'Guest'),(2,'2017-03-15 10:24:05',NULL,'Customer');
/*!40000 ALTER TABLE `magev1_api2_acl_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_api2_acl_rule`
--

DROP TABLE IF EXISTS `magev1_api2_acl_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_api2_acl_rule` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `role_id` int(10) unsigned NOT NULL COMMENT 'Role ID',
  `resource_id` varchar(255) NOT NULL COMMENT 'Resource ID',
  `privilege` varchar(20) DEFAULT NULL COMMENT 'ACL Privilege',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_MAGEV1_MAGEV1_API2_ACL_RULE_ROLE_ID_RESOURCE_ID_PRIVILEGE` (`role_id`,`resource_id`,`privilege`),
  CONSTRAINT `FK_MAGEV1_API2_ACL_RULE_ROLE_ID_MAGEV1_API2_ACL_ROLE_ENTITY_ID` FOREIGN KEY (`role_id`) REFERENCES `magev1_api2_acl_role` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api2 Global ACL Rules';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_api2_acl_rule`
--

LOCK TABLES `magev1_api2_acl_rule` WRITE;
/*!40000 ALTER TABLE `magev1_api2_acl_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_api2_acl_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_api2_acl_user`
--

DROP TABLE IF EXISTS `magev1_api2_acl_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_api2_acl_user` (
  `admin_id` int(10) unsigned NOT NULL COMMENT 'Admin ID',
  `role_id` int(10) unsigned NOT NULL COMMENT 'Role ID',
  UNIQUE KEY `UNQ_MAGEV1_MAGEV1_API2_ACL_USER_ADMIN_ID` (`admin_id`),
  KEY `FK_MAGEV1_API2_ACL_USER_ROLE_ID_MAGEV1_API2_ACL_ROLE_ENTITY_ID` (`role_id`),
  CONSTRAINT `FK_MAGEV1_API2_ACL_USER_ADMIN_ID_MAGEV1_ADMIN_USER_USER_ID` FOREIGN KEY (`admin_id`) REFERENCES `magev1_admin_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_API2_ACL_USER_ROLE_ID_MAGEV1_API2_ACL_ROLE_ENTITY_ID` FOREIGN KEY (`role_id`) REFERENCES `magev1_api2_acl_role` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api2 Global ACL Users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_api2_acl_user`
--

LOCK TABLES `magev1_api2_acl_user` WRITE;
/*!40000 ALTER TABLE `magev1_api2_acl_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_api2_acl_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_api_assert`
--

DROP TABLE IF EXISTS `magev1_api_assert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_api_assert` (
  `assert_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Assert id',
  `assert_type` varchar(20) DEFAULT NULL COMMENT 'Assert type',
  `assert_data` text COMMENT 'Assert additional data',
  PRIMARY KEY (`assert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api ACL Asserts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_api_assert`
--

LOCK TABLES `magev1_api_assert` WRITE;
/*!40000 ALTER TABLE `magev1_api_assert` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_api_assert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_api_role`
--

DROP TABLE IF EXISTS `magev1_api_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_api_role` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Role id',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parent role id',
  `tree_level` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Role level in tree',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort order to display on admin area',
  `role_type` varchar(1) NOT NULL DEFAULT '0' COMMENT 'Role type',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'User id',
  `role_name` varchar(50) DEFAULT NULL COMMENT 'Role name',
  PRIMARY KEY (`role_id`),
  KEY `IDX_MAGEV1_API_ROLE_PARENT_ID_SORT_ORDER` (`parent_id`,`sort_order`),
  KEY `IDX_MAGEV1_API_ROLE_TREE_LEVEL` (`tree_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api ACL Roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_api_role`
--

LOCK TABLES `magev1_api_role` WRITE;
/*!40000 ALTER TABLE `magev1_api_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_api_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_api_rule`
--

DROP TABLE IF EXISTS `magev1_api_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_api_rule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Api rule Id',
  `role_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Api role Id',
  `resource_id` varchar(255) DEFAULT NULL COMMENT 'Module code',
  `api_privileges` varchar(20) DEFAULT NULL COMMENT 'Privileges',
  `assert_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Assert id',
  `role_type` varchar(1) DEFAULT NULL COMMENT 'Role type',
  `api_permission` varchar(10) DEFAULT NULL COMMENT 'Permission',
  PRIMARY KEY (`rule_id`),
  KEY `IDX_MAGEV1_API_RULE_RESOURCE_ID_ROLE_ID` (`resource_id`,`role_id`),
  KEY `IDX_MAGEV1_API_RULE_ROLE_ID_RESOURCE_ID` (`role_id`,`resource_id`),
  CONSTRAINT `FK_MAGEV1_API_RULE_ROLE_ID_MAGEV1_API_ROLE_ROLE_ID` FOREIGN KEY (`role_id`) REFERENCES `magev1_api_role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api ACL Rules';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_api_rule`
--

LOCK TABLES `magev1_api_rule` WRITE;
/*!40000 ALTER TABLE `magev1_api_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_api_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_api_session`
--

DROP TABLE IF EXISTS `magev1_api_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_api_session` (
  `user_id` int(10) unsigned NOT NULL COMMENT 'User id',
  `logdate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Login date',
  `sessid` varchar(40) DEFAULT NULL COMMENT 'Sessioin id',
  KEY `IDX_MAGEV1_API_SESSION_USER_ID` (`user_id`),
  KEY `IDX_MAGEV1_API_SESSION_SESSID` (`sessid`),
  CONSTRAINT `FK_MAGEV1_API_SESSION_USER_ID_MAGEV1_API_USER_USER_ID` FOREIGN KEY (`user_id`) REFERENCES `magev1_api_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api Sessions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_api_session`
--

LOCK TABLES `magev1_api_session` WRITE;
/*!40000 ALTER TABLE `magev1_api_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_api_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_api_user`
--

DROP TABLE IF EXISTS `magev1_api_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_api_user` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'User id',
  `firstname` varchar(32) DEFAULT NULL COMMENT 'First name',
  `lastname` varchar(32) DEFAULT NULL COMMENT 'Last name',
  `email` varchar(128) DEFAULT NULL COMMENT 'Email',
  `username` varchar(40) DEFAULT NULL COMMENT 'Nickname',
  `api_key` varchar(100) DEFAULT NULL COMMENT 'Api key',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'User record create date',
  `modified` timestamp NULL DEFAULT NULL COMMENT 'User record modify date',
  `lognum` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Quantity of log ins',
  `reload_acl_flag` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Refresh ACL flag',
  `is_active` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Account status',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Api Users';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_api_user`
--

LOCK TABLES `magev1_api_user` WRITE;
/*!40000 ALTER TABLE `magev1_api_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_api_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_captcha_log`
--

DROP TABLE IF EXISTS `magev1_captcha_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_captcha_log` (
  `type` varchar(32) NOT NULL COMMENT 'Type',
  `value` varchar(32) NOT NULL COMMENT 'Value',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Count',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  PRIMARY KEY (`type`,`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Count Login Attempts';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_captcha_log`
--

LOCK TABLES `magev1_captcha_log` WRITE;
/*!40000 ALTER TABLE `magev1_captcha_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_captcha_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_category_anc_categs_index_idx`
--

DROP TABLE IF EXISTS `magev1_catalog_category_anc_categs_index_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_category_anc_categs_index_idx` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `path` varchar(255) DEFAULT NULL COMMENT 'Path',
  KEY `IDX_MAGEV1_CATALOG_CATEGORY_ANC_CATEGS_INDEX_IDX_CATEGORY_ID` (`category_id`),
  KEY `IDX_MAGEV1_CAT_CTGR_ANC_CATEGS_IDX_IDX_PATH_CTGR_ID` (`path`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Anchor Indexer Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_category_anc_categs_index_idx`
--

LOCK TABLES `magev1_catalog_category_anc_categs_index_idx` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_category_anc_categs_index_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_category_anc_categs_index_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_category_anc_categs_index_tmp`
--

DROP TABLE IF EXISTS `magev1_catalog_category_anc_categs_index_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_category_anc_categs_index_tmp` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `path` varchar(255) DEFAULT NULL COMMENT 'Path',
  KEY `IDX_MAGEV1_CATALOG_CATEGORY_ANC_CATEGS_INDEX_TMP_CATEGORY_ID` (`category_id`),
  KEY `IDX_MAGEV1_CAT_CTGR_ANC_CATEGS_IDX_TMP_PATH_CTGR_ID` (`path`,`category_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Category Anchor Indexer Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_category_anc_categs_index_tmp`
--

LOCK TABLES `magev1_catalog_category_anc_categs_index_tmp` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_category_anc_categs_index_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_category_anc_categs_index_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_category_anc_products_index_idx`
--

DROP TABLE IF EXISTS `magev1_catalog_category_anc_products_index_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_category_anc_products_index_idx` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(10) unsigned DEFAULT NULL COMMENT 'Position',
  KEY `IDX_MAGEV1_CAT_CTGR_ANC_PRDS_IDX_IDX_CTGR_ID_PRD_ID_POSITION` (`category_id`,`product_id`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Anchor Product Indexer Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_category_anc_products_index_idx`
--

LOCK TABLES `magev1_catalog_category_anc_products_index_idx` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_category_anc_products_index_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_category_anc_products_index_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_category_anc_products_index_tmp`
--

DROP TABLE IF EXISTS `magev1_catalog_category_anc_products_index_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_category_anc_products_index_tmp` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(10) unsigned DEFAULT NULL COMMENT 'Position',
  KEY `IDX_MAGEV1_CAT_CTGR_ANC_PRDS_IDX_TMP_CTGR_ID_PRD_ID_POSITION` (`category_id`,`product_id`,`position`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Category Anchor Product Indexer Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_category_anc_products_index_tmp`
--

LOCK TABLES `magev1_catalog_category_anc_products_index_tmp` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_category_anc_products_index_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_category_anc_products_index_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_category_entity`
--

DROP TABLE IF EXISTS `magev1_catalog_category_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_category_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attriute Set ID',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parent Category ID',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  `path` varchar(255) NOT NULL COMMENT 'Tree Path',
  `position` int(11) NOT NULL COMMENT 'Position',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT 'Tree Level',
  `children_count` int(11) NOT NULL COMMENT 'Child Count',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_MAGEV1_CATALOG_CATEGORY_ENTITY_LEVEL` (`level`),
  KEY `IDX_MAGEV1_CATALOG_CATEGORY_ENTITY_PATH_ENTITY_ID` (`path`,`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='Catalog Category Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_category_entity`
--

LOCK TABLES `magev1_catalog_category_entity` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_category_entity` DISABLE KEYS */;
INSERT INTO `magev1_catalog_category_entity` VALUES (1,3,0,0,'2017-03-15 10:25:03','2017-03-15 10:25:03','1',0,0,4),(2,3,3,1,'2017-03-15 10:25:04','2017-04-04 17:59:20','1/2',1,1,3),(17,3,3,2,'2017-04-04 17:59:52','2017-04-05 05:56:23','1/2/17',1,2,1),(19,3,3,17,'2017-04-05 05:52:36','2017-04-05 09:17:11','1/2/17/19',2,3,0),(21,3,3,2,'2017-04-05 06:11:16','2017-04-05 06:11:31','1/2/21',2,2,0);
/*!40000 ALTER TABLE `magev1_catalog_category_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_category_entity_datetime`
--

DROP TABLE IF EXISTS `magev1_catalog_category_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_category_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` datetime DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `D105A5686A66C0FAE7302E7717C4FD16` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_MAGEV1_CATALOG_CATEGORY_ENTITY_DATETIME_ENTITY_ID` (`entity_id`),
  KEY `IDX_MAGEV1_CATALOG_CATEGORY_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_MAGEV1_CATALOG_CATEGORY_ENTITY_DATETIME_STORE_ID` (`store_id`),
  CONSTRAINT `FK_44B206DBBDC403829473F170FB83222B` FOREIGN KEY (`entity_id`) REFERENCES `magev1_catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ACD37E779FD5124F310744827CD391B3` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CAT_CTGR_ENTT_DTIME_ATTR_ID_MAGEV1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `magev1_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 COMMENT='Catalog Category Datetime Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_category_entity_datetime`
--

LOCK TABLES `magev1_catalog_category_entity_datetime` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_category_entity_datetime` DISABLE KEYS */;
INSERT INTO `magev1_catalog_category_entity_datetime` VALUES (47,3,59,0,2,NULL),(48,3,60,0,2,NULL),(49,3,59,0,17,NULL),(50,3,60,0,17,NULL),(61,3,59,0,19,NULL),(62,3,60,0,19,NULL),(75,3,59,0,21,NULL),(76,3,60,0,21,NULL);
/*!40000 ALTER TABLE `magev1_catalog_category_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_category_entity_decimal`
--

DROP TABLE IF EXISTS `magev1_catalog_category_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_category_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` decimal(12,4) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `EA9101378CF485FBCFB8A5BAF46B71E9` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_MAGEV1_CATALOG_CATEGORY_ENTITY_DECIMAL_ENTITY_ID` (`entity_id`),
  KEY `IDX_MAGEV1_CATALOG_CATEGORY_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_MAGEV1_CATALOG_CATEGORY_ENTITY_DECIMAL_STORE_ID` (`store_id`),
  CONSTRAINT `FK_MAGEV1_CAT_CTGR_ENTT_DEC_ATTR_ID_MAGEV1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `magev1_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CAT_CTGR_ENTT_DEC_ENTT_ID_MAGEV1_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `magev1_catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CAT_CTGR_ENTT_DEC_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='Catalog Category Decimal Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_category_entity_decimal`
--

LOCK TABLES `magev1_catalog_category_entity_decimal` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_category_entity_decimal` DISABLE KEYS */;
INSERT INTO `magev1_catalog_category_entity_decimal` VALUES (15,3,70,0,2,NULL),(16,3,70,0,17,NULL),(18,3,70,0,19,NULL),(20,3,70,0,21,NULL);
/*!40000 ALTER TABLE `magev1_catalog_category_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_category_entity_int`
--

DROP TABLE IF EXISTS `magev1_catalog_category_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_category_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` int(11) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `9C2CC488ADB1535A758D658003207D79` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_MAGEV1_CATALOG_CATEGORY_ENTITY_INT_ENTITY_ID` (`entity_id`),
  KEY `IDX_MAGEV1_CATALOG_CATEGORY_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_MAGEV1_CATALOG_CATEGORY_ENTITY_INT_STORE_ID` (`store_id`),
  CONSTRAINT `FK_MAGEV1_CAT_CTGR_ENTT_INT_ATTR_ID_MAGEV1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `magev1_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CAT_CTGR_ENTT_INT_ENTT_ID_MAGEV1_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `magev1_catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CAT_CTGR_ENTT_INT_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8 COMMENT='Catalog Category Integer Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_category_entity_int`
--

LOCK TABLES `magev1_catalog_category_entity_int` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_category_entity_int` DISABLE KEYS */;
INSERT INTO `magev1_catalog_category_entity_int` VALUES (1,3,67,0,1,1),(2,3,67,1,1,1),(3,3,42,0,2,1),(4,3,67,0,2,1),(5,3,42,1,2,1),(6,3,67,1,2,1),(100,3,50,0,2,NULL),(101,3,51,0,2,0),(102,3,69,0,2,0),(103,3,42,0,17,1),(104,3,67,0,17,1),(105,3,50,0,17,NULL),(106,3,51,0,17,0),(107,3,68,0,17,0),(108,3,69,0,17,1),(119,3,42,0,19,1),(120,3,67,0,19,1),(121,3,50,0,19,NULL),(122,3,51,0,19,0),(123,3,68,0,19,0),(124,3,69,0,19,0),(141,3,42,0,21,1),(142,3,67,0,21,1),(143,3,50,0,21,NULL),(144,3,51,0,21,0),(145,3,68,0,21,0),(146,3,69,0,21,0);
/*!40000 ALTER TABLE `magev1_catalog_category_entity_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_category_entity_text`
--

DROP TABLE IF EXISTS `magev1_catalog_category_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_category_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` text COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `D98FFECF8C16143F860F60E23253AA9E` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_MAGEV1_CATALOG_CATEGORY_ENTITY_TEXT_ENTITY_ID` (`entity_id`),
  KEY `IDX_MAGEV1_CATALOG_CATEGORY_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_MAGEV1_CATALOG_CATEGORY_ENTITY_TEXT_STORE_ID` (`store_id`),
  CONSTRAINT `FK_B7F8D857ED39888404DDBC0BD9F404D6` FOREIGN KEY (`entity_id`) REFERENCES `magev1_catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CAT_CTGR_ENTT_TEXT_ATTR_ID_MAGEV1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `magev1_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CAT_CTGR_ENTT_TEXT_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8 COMMENT='Catalog Category Text Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_category_entity_text`
--

LOCK TABLES `magev1_catalog_category_entity_text` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_category_entity_text` DISABLE KEYS */;
INSERT INTO `magev1_catalog_category_entity_text` VALUES (1,3,65,0,1,NULL),(2,3,65,1,1,NULL),(3,3,65,0,2,NULL),(4,3,65,1,2,NULL),(117,3,44,0,2,'Chambre'),(118,3,47,0,2,'Chambre'),(119,3,48,0,2,'Chambre'),(120,3,62,0,2,NULL),(122,3,44,0,17,'Les pieces'),(123,3,47,0,17,NULL),(124,3,48,0,17,NULL),(125,3,62,0,17,NULL),(126,3,65,0,17,NULL),(150,3,44,0,19,'Piece barroque'),(151,3,47,0,19,'Piece barroque'),(152,3,48,0,19,NULL),(153,3,62,0,19,NULL),(154,3,65,0,19,NULL),(183,3,44,0,21,'Nos produits'),(184,3,47,0,21,NULL),(185,3,48,0,21,NULL),(186,3,62,0,21,NULL),(187,3,65,0,21,NULL);
/*!40000 ALTER TABLE `magev1_catalog_category_entity_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_category_entity_varchar`
--

DROP TABLE IF EXISTS `magev1_catalog_category_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_category_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `281A910DB42CDA0070B98944D9475AE5` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_MAGEV1_CATALOG_CATEGORY_ENTITY_VARCHAR_ENTITY_ID` (`entity_id`),
  KEY `IDX_MAGEV1_CATALOG_CATEGORY_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_MAGEV1_CATALOG_CATEGORY_ENTITY_VARCHAR_STORE_ID` (`store_id`),
  CONSTRAINT `FK_E7E9C12DD05FDF4C752BB3196E99AAE0` FOREIGN KEY (`entity_id`) REFERENCES `magev1_catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CAT_CTGR_ENTT_VCHR_ATTR_ID_MAGEV1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `magev1_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CAT_CTGR_ENTT_VCHR_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=utf8 COMMENT='Catalog Category Varchar Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_category_entity_varchar`
--

LOCK TABLES `magev1_catalog_category_entity_varchar` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_category_entity_varchar` DISABLE KEYS */;
INSERT INTO `magev1_catalog_category_entity_varchar` VALUES (1,3,41,0,1,'Root Catalog'),(2,3,41,1,1,'Root Catalog'),(3,3,43,1,1,'root-catalog'),(4,3,41,0,2,'Default Category'),(5,3,41,1,2,'Default Category'),(6,3,49,1,2,'PRODUCTS'),(7,3,43,1,2,'default-category'),(152,3,46,0,2,NULL),(153,3,49,0,2,'PRODUCTS'),(154,3,58,0,2,NULL),(155,3,61,0,2,NULL),(156,3,43,0,2,'default-category'),(157,3,41,0,17,'LES PIÃˆCES '),(158,3,46,0,17,'rooms'),(159,3,49,0,17,'PRODUCTS'),(160,3,58,0,17,'rwd/default'),(161,3,61,0,17,NULL),(162,3,43,0,17,'les-pieces'),(163,3,57,1,17,'les-pieces.html'),(164,3,57,0,17,'les-pieces.html'),(184,3,41,0,19,'Barroque'),(185,3,43,0,19,'barroque'),(186,3,46,0,19,NULL),(187,3,49,0,19,'PRODUCTS'),(188,3,58,0,19,'rwd/default'),(189,3,61,0,19,NULL),(190,3,45,0,19,'M17031716553252_ROOM.jpg'),(191,3,57,1,19,'les-pieces/barroque.html'),(192,3,57,0,19,'les-pieces/barroque.html'),(215,3,41,0,21,'LES PRODUITS'),(216,3,43,0,21,'les-produits'),(217,3,46,0,21,NULL),(218,3,49,0,21,'PRODUCTS'),(219,3,58,0,21,'rwd/default'),(220,3,61,0,21,NULL),(221,3,57,1,21,'les-produits.html'),(222,3,57,0,21,'les-produits.html');
/*!40000 ALTER TABLE `magev1_catalog_category_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_category_flat_store_1`
--

DROP TABLE IF EXISTS `magev1_catalog_category_flat_store_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_category_flat_store_1` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'entity_id',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'parent_id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'created_at',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'updated_at',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT 'path',
  `position` int(11) NOT NULL COMMENT 'position',
  `level` int(11) NOT NULL DEFAULT '0' COMMENT 'level',
  `children_count` int(11) NOT NULL COMMENT 'children_count',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `all_children` text COMMENT 'All Children',
  `available_sort_by` text COMMENT 'Available Product Listing Sort By',
  `children` text COMMENT 'Children',
  `custom_apply_to_products` int(11) DEFAULT NULL COMMENT 'Apply To Products',
  `custom_design` varchar(255) DEFAULT NULL COMMENT 'Custom Design',
  `custom_design_from` datetime DEFAULT NULL COMMENT 'Active From',
  `custom_design_to` datetime DEFAULT NULL COMMENT 'Active To',
  `custom_layout_update` text COMMENT 'Custom Layout Update',
  `custom_use_parent_settings` int(11) DEFAULT NULL COMMENT 'Use Parent Category Settings',
  `default_sort_by` varchar(255) DEFAULT NULL COMMENT 'Default Product Listing Sort By',
  `description` text COMMENT 'Description',
  `display_mode` varchar(255) DEFAULT NULL COMMENT 'Display Mode',
  `filter_price_range` decimal(12,4) DEFAULT NULL COMMENT 'Layered Navigation Price Step',
  `image` varchar(255) DEFAULT NULL COMMENT 'Image',
  `include_in_menu` int(11) DEFAULT NULL COMMENT 'Include in Navigation Menu',
  `is_active` int(11) DEFAULT NULL COMMENT 'Is Active',
  `is_anchor` int(11) DEFAULT NULL COMMENT 'Is Anchor',
  `landing_page` int(11) DEFAULT NULL COMMENT 'CMS Block',
  `meta_description` text COMMENT 'Meta Description',
  `meta_keywords` text COMMENT 'Meta Keywords',
  `meta_title` varchar(255) DEFAULT NULL COMMENT 'Page Title',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `page_layout` varchar(255) DEFAULT NULL COMMENT 'Page Layout',
  `path_in_store` text COMMENT 'Path In Store',
  `url_key` varchar(255) DEFAULT NULL COMMENT 'URL Key',
  `url_path` varchar(255) DEFAULT NULL COMMENT 'Url Path',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_MAGEV1_CATALOG_CATEGORY_FLAT_STORE_1_STORE_ID` (`store_id`),
  KEY `IDX_MAGEV1_CATALOG_CATEGORY_FLAT_STORE_1_PATH` (`path`),
  KEY `IDX_MAGEV1_CATALOG_CATEGORY_FLAT_STORE_1_LEVEL` (`level`),
  CONSTRAINT `FK_55967FB751B7A02D0B3EF47720F17BC6` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_58F59149EE585F43EF43D300346B446D` FOREIGN KEY (`entity_id`) REFERENCES `magev1_catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Flat (Store 1)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_category_flat_store_1`
--

LOCK TABLES `magev1_catalog_category_flat_store_1` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_category_flat_store_1` DISABLE KEYS */;
INSERT INTO `magev1_catalog_category_flat_store_1` VALUES (1,0,'2017-03-15 10:25:03','2017-03-15 10:25:03','1',0,0,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,'Root Catalog',NULL,NULL,'root-catalog',NULL),(2,1,'2017-03-15 10:25:04','2017-03-15 10:25:04','1/2',1,1,0,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'PRODUCTS',NULL,NULL,1,1,NULL,NULL,NULL,NULL,NULL,'Default Category',NULL,NULL,'default-category',NULL);
/*!40000 ALTER TABLE `magev1_catalog_category_flat_store_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_category_product`
--

DROP TABLE IF EXISTS `magev1_catalog_category_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_category_product` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position',
  PRIMARY KEY (`category_id`,`product_id`),
  KEY `IDX_MAGEV1_CATALOG_CATEGORY_PRODUCT_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_MAGEV1_CAT_CTGR_PRD_CTGR_ID_MAGEV1_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`category_id`) REFERENCES `magev1_catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CAT_CTGR_PRD_PRD_ID_MAGEV1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product To Category Linkage Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_category_product`
--

LOCK TABLES `magev1_catalog_category_product` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_category_product` DISABLE KEYS */;
INSERT INTO `magev1_catalog_category_product` VALUES (19,15,1),(19,18,1),(21,12,0),(21,13,0),(21,14,0),(21,16,1),(21,17,1);
/*!40000 ALTER TABLE `magev1_catalog_category_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_category_product_index`
--

DROP TABLE IF EXISTS `magev1_catalog_category_product_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_category_product_index` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(11) DEFAULT NULL COMMENT 'Position',
  `is_parent` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `visibility` smallint(5) unsigned NOT NULL COMMENT 'Visibility',
  PRIMARY KEY (`category_id`,`product_id`,`store_id`),
  KEY `IDX_MAGEV1_CAT_CTGR_PRD_IDX_PRD_ID_STORE_ID_CTGR_ID_VISIBILITY` (`product_id`,`store_id`,`category_id`,`visibility`),
  KEY `FC1CB24D70511765D22B309D4A82DBBD` (`store_id`,`category_id`,`visibility`,`is_parent`,`position`),
  CONSTRAINT `FK_MAGEV1_CAT_CTGR_PRD_IDX_CTGR_ID_MAGEV1_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`category_id`) REFERENCES `magev1_catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CAT_CTGR_PRD_IDX_PRD_ID_MAGEV1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CAT_CTGR_PRD_IDX_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_category_product_index`
--

LOCK TABLES `magev1_catalog_category_product_index` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_category_product_index` DISABLE KEYS */;
INSERT INTO `magev1_catalog_category_product_index` VALUES (2,15,80001,0,1,4),(2,13,90000,0,1,4),(2,14,90001,0,1,4),(2,16,90001,0,1,4),(2,18,120001,0,1,4),(19,15,1,1,1,4),(19,18,1,1,1,4),(21,13,0,1,1,4),(21,14,0,1,1,4),(21,16,1,1,1,4),(2,15,80001,0,2,4),(2,13,90000,0,2,4),(2,14,90001,0,2,4),(2,16,90001,0,2,4),(2,18,120001,0,2,4),(19,15,1,1,2,4),(19,18,1,1,2,4),(21,13,0,1,2,4),(21,14,0,1,2,4),(21,16,1,1,2,4);
/*!40000 ALTER TABLE `magev1_catalog_category_product_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_category_product_index_enbl_idx`
--

DROP TABLE IF EXISTS `magev1_catalog_category_product_index_enbl_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_category_product_index_enbl_idx` (
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `visibility` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Visibility',
  KEY `IDX_MAGEV1_CATALOG_CATEGORY_PRODUCT_INDEX_ENBL_IDX_PRODUCT_ID` (`product_id`),
  KEY `IDX_MAGEV1_CAT_CTGR_PRD_IDX_ENBL_IDX_PRD_ID_VISIBILITY` (`product_id`,`visibility`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Enabled Indexer Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_category_product_index_enbl_idx`
--

LOCK TABLES `magev1_catalog_category_product_index_enbl_idx` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_category_product_index_enbl_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_category_product_index_enbl_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_category_product_index_enbl_tmp`
--

DROP TABLE IF EXISTS `magev1_catalog_category_product_index_enbl_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_category_product_index_enbl_tmp` (
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `visibility` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Visibility',
  KEY `IDX_MAGEV1_CATALOG_CATEGORY_PRODUCT_INDEX_ENBL_TMP_PRODUCT_ID` (`product_id`),
  KEY `IDX_MAGEV1_CAT_CTGR_PRD_IDX_ENBL_TMP_PRD_ID_VISIBILITY` (`product_id`,`visibility`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Enabled Indexer Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_category_product_index_enbl_tmp`
--

LOCK TABLES `magev1_catalog_category_product_index_enbl_tmp` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_category_product_index_enbl_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_category_product_index_enbl_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_category_product_index_idx`
--

DROP TABLE IF EXISTS `magev1_catalog_category_product_index_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_category_product_index_idx` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position',
  `is_parent` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `visibility` smallint(5) unsigned NOT NULL COMMENT 'Visibility',
  KEY `IDX_MAGEV1_CAT_CTGR_PRD_IDX_IDX_PRD_ID_CTGR_ID_STORE_ID` (`product_id`,`category_id`,`store_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Indexer Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_category_product_index_idx`
--

LOCK TABLES `magev1_catalog_category_product_index_idx` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_category_product_index_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_category_product_index_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_category_product_index_tmp`
--

DROP TABLE IF EXISTS `magev1_catalog_category_product_index_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_category_product_index_tmp` (
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Category ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position',
  `is_parent` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Parent',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `visibility` smallint(5) unsigned NOT NULL COMMENT 'Visibility',
  KEY `IDX_MAGEV1_CAT_CTGR_PRD_IDX_TMP_PRD_ID_CTGR_ID_STORE_ID` (`product_id`,`category_id`,`store_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Category Product Indexer Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_category_product_index_tmp`
--

LOCK TABLES `magev1_catalog_category_product_index_tmp` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_category_product_index_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_category_product_index_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_compare_item`
--

DROP TABLE IF EXISTS `magev1_catalog_compare_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_compare_item` (
  `catalog_compare_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Compare Item ID',
  `visitor_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Visitor ID',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  PRIMARY KEY (`catalog_compare_item_id`),
  KEY `IDX_MAGEV1_CATALOG_COMPARE_ITEM_CUSTOMER_ID` (`customer_id`),
  KEY `IDX_MAGEV1_CATALOG_COMPARE_ITEM_PRODUCT_ID` (`product_id`),
  KEY `IDX_MAGEV1_CATALOG_COMPARE_ITEM_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  KEY `IDX_MAGEV1_CATALOG_COMPARE_ITEM_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  KEY `IDX_MAGEV1_CATALOG_COMPARE_ITEM_STORE_ID` (`store_id`),
  CONSTRAINT `FK_MAGEV1_CAT_CMP_ITEM_CSTR_ID_MAGEV1_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `magev1_customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CAT_CMP_ITEM_PRD_ID_MAGEV1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CAT_CMP_ITEM_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Compare Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_compare_item`
--

LOCK TABLES `magev1_catalog_compare_item` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_compare_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_compare_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_eav_attribute`
--

DROP TABLE IF EXISTS `magev1_catalog_eav_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `frontend_input_renderer` varchar(255) DEFAULT NULL COMMENT 'Frontend Input Renderer',
  `is_global` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Global',
  `is_visible` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Visible',
  `is_searchable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Searchable',
  `is_filterable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Filterable',
  `is_comparable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Comparable',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `is_html_allowed_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is HTML Allowed On Front',
  `is_used_for_price_rules` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used For Price Rules',
  `is_filterable_in_search` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Filterable In Search',
  `used_in_product_listing` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used In Product Listing',
  `used_for_sort_by` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used For Sorting',
  `is_configurable` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Configurable',
  `apply_to` varchar(255) DEFAULT NULL COMMENT 'Apply To',
  `is_visible_in_advanced_search` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible In Advanced Search',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position',
  `is_wysiwyg_enabled` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is WYSIWYG Enabled',
  `is_used_for_promo_rules` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Used For Promo Rules',
  PRIMARY KEY (`attribute_id`),
  KEY `IDX_MAGEV1_CATALOG_EAV_ATTRIBUTE_USED_FOR_SORT_BY` (`used_for_sort_by`),
  KEY `IDX_MAGEV1_CATALOG_EAV_ATTRIBUTE_USED_IN_PRODUCT_LISTING` (`used_in_product_listing`),
  CONSTRAINT `FK_MAGEV1_CAT_EAV_ATTR_ATTR_ID_MAGEV1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `magev1_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog EAV Attribute Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_eav_attribute`
--

LOCK TABLES `magev1_catalog_eav_attribute` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_eav_attribute` DISABLE KEYS */;
INSERT INTO `magev1_catalog_eav_attribute` VALUES (41,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(42,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(43,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(44,NULL,0,1,0,0,0,0,1,0,0,0,0,1,NULL,0,0,1,0),(45,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(46,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(47,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(48,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(49,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(50,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(51,NULL,1,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(52,NULL,1,0,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(53,NULL,1,0,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(54,NULL,1,0,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(55,NULL,1,0,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(56,NULL,1,0,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(57,NULL,0,0,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(58,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(59,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(60,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(61,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(62,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(63,NULL,1,0,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(64,NULL,1,0,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(65,'adminhtml/catalog_category_helper_sortby_available',0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(66,'adminhtml/catalog_category_helper_sortby_default',0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(67,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(68,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(69,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(70,'adminhtml/catalog_category_helper_pricestep',0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(71,NULL,0,1,1,0,0,0,0,0,0,1,1,1,NULL,1,0,0,0),(72,NULL,0,1,1,0,1,0,1,0,0,0,0,1,NULL,1,0,1,0),(73,NULL,0,1,1,0,1,0,1,0,0,1,0,1,NULL,1,0,1,0),(74,NULL,1,1,1,0,1,0,0,0,0,0,0,1,NULL,1,0,0,0),(75,NULL,2,1,1,1,0,0,0,0,0,1,1,1,'simple,configurable,virtual,bundle,downloadable',1,0,0,0),(76,NULL,2,1,0,0,0,0,0,0,0,1,0,1,'simple,configurable,virtual,bundle,downloadable',0,0,0,0),(77,NULL,2,1,0,0,0,0,0,0,0,1,0,1,'simple,configurable,virtual,bundle,downloadable',0,0,0,0),(78,NULL,2,1,0,0,0,0,0,0,0,1,0,1,'simple,configurable,virtual,bundle,downloadable',0,0,0,0),(79,NULL,2,1,0,0,0,0,0,0,0,0,0,1,'virtual,downloadable',0,0,0,0),(80,NULL,1,1,0,0,0,0,0,0,0,0,0,1,'simple,bundle',0,0,0,0),(81,NULL,1,1,1,1,1,0,0,0,0,0,0,1,'simple',1,0,0,0),(82,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(83,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(84,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(85,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(86,NULL,0,1,0,0,0,0,0,0,0,1,0,1,NULL,0,0,0,0),(87,NULL,0,1,0,0,0,0,0,0,0,1,0,1,NULL,0,0,0,0),(88,NULL,1,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(89,NULL,1,0,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(90,NULL,2,1,0,0,0,0,0,0,0,0,0,1,'simple,configurable,virtual,bundle,downloadable',0,0,0,0),(91,NULL,2,1,0,0,0,0,0,0,0,0,0,1,'simple,configurable,virtual,bundle,downloadable',0,0,0,0),(92,NULL,1,1,1,1,1,1,0,0,0,1,1,1,'simple',1,0,0,0),(93,NULL,2,1,0,0,0,0,0,0,0,1,0,1,NULL,0,0,0,0),(94,NULL,2,1,0,0,0,0,0,0,0,1,0,1,NULL,0,0,0,0),(95,NULL,1,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(96,NULL,2,1,1,0,0,0,0,0,0,1,0,1,NULL,0,0,0,0),(97,NULL,0,1,0,0,0,0,0,0,0,1,0,1,NULL,0,0,0,0),(98,NULL,0,0,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(99,NULL,0,0,0,0,0,0,0,0,0,0,0,1,'simple,configurable,virtual,bundle,downloadable',0,0,0,0),(100,NULL,1,1,0,0,0,0,0,0,0,0,0,0,'simple,virtual',0,0,0,0),(101,NULL,1,1,0,0,0,0,0,0,0,0,0,0,'simple,virtual',0,0,0,0),(102,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(103,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(104,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(105,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(106,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(107,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(108,NULL,1,0,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(109,NULL,0,1,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(110,NULL,1,0,0,0,0,0,0,0,0,1,0,1,NULL,0,0,0,0),(111,NULL,1,0,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(112,NULL,0,0,0,0,0,0,0,0,0,1,0,0,NULL,0,0,0,0),(113,NULL,0,0,0,0,0,0,0,0,0,1,0,0,NULL,0,0,0,0),(114,NULL,0,0,0,0,0,0,0,0,0,1,0,0,NULL,0,0,0,0),(115,NULL,1,0,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(116,NULL,1,0,0,0,0,0,0,0,0,0,0,1,NULL,0,0,0,0),(117,NULL,2,1,0,0,0,0,0,0,0,0,0,0,'simple,configurable,bundle,grouped',0,0,0,0),(118,'adminhtml/catalog_product_helper_form_msrp_enabled',2,1,0,0,0,0,0,0,0,1,0,1,'simple,bundle,configurable,virtual,downloadable',0,0,0,0),(119,'adminhtml/catalog_product_helper_form_msrp_price',2,1,0,0,0,0,0,0,0,1,0,1,'simple,bundle,configurable,virtual,downloadable',0,0,0,0),(120,NULL,2,1,0,0,0,0,0,0,0,1,0,1,'simple,bundle,configurable,virtual,downloadable',0,0,0,0),(121,NULL,2,1,1,0,0,0,0,0,0,1,0,1,'simple,configurable,virtual,downloadable,bundle',1,0,0,0),(122,'giftmessage/adminhtml_product_helper_form_config',1,1,0,0,0,0,0,0,0,0,0,0,NULL,0,0,0,0),(123,NULL,1,0,0,0,0,0,0,0,0,1,0,0,'bundle',0,0,0,0),(124,NULL,1,0,0,0,0,0,0,0,0,0,0,0,'bundle',0,0,0,0),(125,NULL,1,0,0,0,0,0,0,0,0,1,0,0,'bundle',0,0,0,0),(126,NULL,1,1,0,0,0,0,0,0,0,1,0,0,'bundle',0,0,0,0),(127,NULL,1,0,0,0,0,0,0,0,0,1,0,0,'bundle',0,0,0,0),(128,NULL,1,0,0,0,0,0,0,0,0,1,0,0,'downloadable',0,0,0,0),(129,NULL,0,0,0,0,0,0,0,0,0,0,0,0,'downloadable',0,0,0,0),(130,NULL,0,0,0,0,0,0,0,0,0,0,0,0,'downloadable',0,0,0,0),(131,NULL,1,0,0,0,0,0,0,0,0,1,0,0,'downloadable',0,0,0,0),(133,NULL,1,1,0,0,0,0,1,0,0,0,0,0,'grouped',0,0,0,0),(134,NULL,1,1,0,0,0,0,1,0,0,0,0,0,'grouped',0,0,0,0),(135,NULL,1,1,0,0,0,0,1,0,0,0,0,0,'grouped',0,0,0,0),(137,NULL,1,1,0,0,0,0,1,0,0,0,0,0,'grouped',0,0,0,0),(138,NULL,1,1,0,0,0,0,1,0,0,0,0,0,'grouped',0,0,0,0),(139,NULL,1,1,0,0,0,0,1,0,0,0,0,0,'grouped',0,0,0,0),(140,NULL,1,1,0,0,0,0,1,0,0,0,0,0,'simple',0,0,0,0),(141,NULL,1,1,0,0,0,0,1,0,0,0,0,0,'simple',0,0,0,0);
/*!40000 ALTER TABLE `magev1_catalog_eav_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_bundle_option`
--

DROP TABLE IF EXISTS `magev1_catalog_product_bundle_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_bundle_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `required` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Required',
  `position` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Position',
  `type` varchar(255) DEFAULT NULL COMMENT 'Type',
  PRIMARY KEY (`option_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_BUNDLE_OPTION_PARENT_ID` (`parent_id`),
  CONSTRAINT `FK_MAGEV1_CAT_PRD_BNDL_OPT_PARENT_ID_MAGEV1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Option';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_bundle_option`
--

LOCK TABLES `magev1_catalog_product_bundle_option` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_bundle_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_product_bundle_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_bundle_option_value`
--

DROP TABLE IF EXISTS `magev1_catalog_product_bundle_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_bundle_option_value` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `option_id` int(10) unsigned NOT NULL COMMENT 'Option Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_MAGEV1_CAT_PRD_BNDL_OPT_VAL_OPT_ID_STORE_ID` (`option_id`,`store_id`),
  CONSTRAINT `FK_BC47836A7397E03D44C87D6A4EDBE0A0` FOREIGN KEY (`option_id`) REFERENCES `magev1_catalog_product_bundle_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Option Value';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_bundle_option_value`
--

LOCK TABLES `magev1_catalog_product_bundle_option_value` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_bundle_option_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_product_bundle_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_bundle_price_index`
--

DROP TABLE IF EXISTS `magev1_catalog_product_bundle_price_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_bundle_price_index` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  `min_price` decimal(12,4) NOT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) NOT NULL COMMENT 'Max Price',
  PRIMARY KEY (`entity_id`,`website_id`,`customer_group_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_WEBSITE_ID` (`website_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_BUNDLE_PRICE_INDEX_CUSTOMER_GROUP_ID` (`customer_group_id`),
  CONSTRAINT `FK_3BC3DEB61562F2CEC0333F74B68F51FC` FOREIGN KEY (`entity_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_F443E0918E9C0B49E606524FCFAA9E8D` FOREIGN KEY (`customer_group_id`) REFERENCES `magev1_customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CAT_PRD_BNDL_PRICE_IDX_WS_ID_MAGEV1_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `magev1_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Price Index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_bundle_price_index`
--

LOCK TABLES `magev1_catalog_product_bundle_price_index` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_bundle_price_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_product_bundle_price_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_bundle_selection`
--

DROP TABLE IF EXISTS `magev1_catalog_product_bundle_selection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_bundle_selection` (
  `selection_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Selection Id',
  `option_id` int(10) unsigned NOT NULL COMMENT 'Option Id',
  `parent_product_id` int(10) unsigned NOT NULL COMMENT 'Parent Product Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `position` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Position',
  `is_default` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Default',
  `selection_price_type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Selection Price Type',
  `selection_price_value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Selection Price Value',
  `selection_qty` decimal(12,4) DEFAULT NULL COMMENT 'Selection Qty',
  `selection_can_change_qty` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Selection Can Change Qty',
  PRIMARY KEY (`selection_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_BUNDLE_SELECTION_OPTION_ID` (`option_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_BUNDLE_SELECTION_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_00C5EE1BAA1235F71DFE8756CA56DD1B` FOREIGN KEY (`product_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_0110120505FC865AD8F8BBC90DFF4F08` FOREIGN KEY (`option_id`) REFERENCES `magev1_catalog_product_bundle_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Selection';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_bundle_selection`
--

LOCK TABLES `magev1_catalog_product_bundle_selection` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_bundle_selection` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_product_bundle_selection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_bundle_selection_price`
--

DROP TABLE IF EXISTS `magev1_catalog_product_bundle_selection_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_bundle_selection_price` (
  `selection_id` int(10) unsigned NOT NULL COMMENT 'Selection Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `selection_price_type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Selection Price Type',
  `selection_price_value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Selection Price Value',
  PRIMARY KEY (`selection_id`,`website_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_BUNDLE_SELECTION_PRICE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `FK_4450400A2BBBE10065CB12DE5354606F` FOREIGN KEY (`selection_id`) REFERENCES `magev1_catalog_product_bundle_selection` (`selection_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_E1E38A4C295CE379015C803051E2241F` FOREIGN KEY (`website_id`) REFERENCES `magev1_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Selection Price';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_bundle_selection_price`
--

LOCK TABLES `magev1_catalog_product_bundle_selection_price` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_bundle_selection_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_product_bundle_selection_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_bundle_stock_index`
--

DROP TABLE IF EXISTS `magev1_catalog_product_bundle_stock_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_bundle_stock_index` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) unsigned NOT NULL COMMENT 'Stock Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `stock_status` smallint(6) DEFAULT '0' COMMENT 'Stock Status',
  PRIMARY KEY (`entity_id`,`website_id`,`stock_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Bundle Stock Index';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_bundle_stock_index`
--

LOCK TABLES `magev1_catalog_product_bundle_stock_index` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_bundle_stock_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_product_bundle_stock_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_enabled_index`
--

DROP TABLE IF EXISTS `magev1_catalog_product_enabled_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_enabled_index` (
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `visibility` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Visibility',
  PRIMARY KEY (`product_id`,`store_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_ENABLED_INDEX_STORE_ID` (`store_id`),
  CONSTRAINT `FK_F308FB8E27598EA41C666E9E03F0B1FB` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CAT_PRD_ENABLED_IDX_PRD_ID_MAGEV1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Visibility Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_enabled_index`
--

LOCK TABLES `magev1_catalog_product_enabled_index` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_enabled_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_product_enabled_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_entity`
--

DROP TABLE IF EXISTS `magev1_catalog_product_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set ID',
  `type_id` varchar(32) NOT NULL DEFAULT 'simple' COMMENT 'Type ID',
  `sku` varchar(64) DEFAULT NULL COMMENT 'SKU',
  `has_options` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Has Options',
  `required_options` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Required Options',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Update Time',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_ENTITY_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_ENTITY_ATTRIBUTE_SET_ID` (`attribute_set_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_ENTITY_SKU` (`sku`),
  CONSTRAINT `FK_8F5267FB2235CD28DB3E3324D83308F8` FOREIGN KEY (`attribute_set_id`) REFERENCES `magev1_eav_attribute_set` (`attribute_set_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_C09BD292880D1B180F46E00B7A8240E4` FOREIGN KEY (`entity_type_id`) REFERENCES `magev1_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_entity`
--

LOCK TABLES `magev1_catalog_product_entity` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_entity` DISABLE KEYS */;
INSERT INTO `magev1_catalog_product_entity` VALUES (12,4,4,'simple','dfsdf',0,0,'2017-04-05 05:45:14','2017-04-05 21:43:39'),(13,4,4,'simple','sdf',0,0,'2017-04-05 05:47:10','2017-04-05 22:01:21'),(14,4,4,'simple','sdfadgredgddsf',0,0,'2017-04-05 05:48:31','2017-04-05 21:44:22'),(15,4,4,'grouped','sdfqwerfczfdf',0,0,'2017-04-05 05:55:08','2017-04-05 19:21:00'),(16,4,4,'simple','dsfsdfsdfsdf',0,0,'2017-04-05 07:24:25','2017-04-05 07:24:57'),(17,4,4,'simple','sdfsczczc',0,0,'2017-04-05 07:29:18','2017-04-05 09:11:52'),(18,4,4,'grouped','dssdgfdggdsfasdfsdaf',0,0,'2017-04-05 19:52:05','2017-04-05 20:06:48');
/*!40000 ALTER TABLE `magev1_catalog_product_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_entity_datetime`
--

DROP TABLE IF EXISTS `magev1_catalog_product_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` datetime DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_MAGEV1_CAT_PRD_ENTT_DTIME_ENTT_ID_ATTR_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_ENTITY_DATETIME_STORE_ID` (`store_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_ENTITY_DATETIME_ENTITY_ID` (`entity_id`),
  CONSTRAINT `FK_MAGEV1_CAT_PRD_ENTT_DTIME_ATTR_ID_MAGEV1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `magev1_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CAT_PRD_ENTT_DTIME_ENTT_ID_MAGEV1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CAT_PRD_ENTT_DTIME_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=329 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Datetime Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_entity_datetime`
--

LOCK TABLES `magev1_catalog_product_entity_datetime` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_entity_datetime` DISABLE KEYS */;
INSERT INTO `magev1_catalog_product_entity_datetime` VALUES (199,4,93,0,12,NULL),(200,4,94,0,12,NULL),(201,4,77,0,12,NULL),(202,4,78,0,12,NULL),(203,4,104,0,12,NULL),(204,4,105,0,12,NULL),(205,4,93,0,13,NULL),(206,4,94,0,13,NULL),(207,4,77,0,13,NULL),(208,4,78,0,13,NULL),(209,4,104,0,13,NULL),(210,4,105,0,13,NULL),(211,4,93,0,14,NULL),(212,4,94,0,14,NULL),(213,4,77,0,14,NULL),(214,4,78,0,14,NULL),(215,4,104,0,14,NULL),(216,4,105,0,14,NULL),(229,4,93,0,15,NULL),(230,4,94,0,15,NULL),(231,4,104,0,15,NULL),(232,4,105,0,15,NULL),(249,4,77,0,16,NULL),(250,4,78,0,16,NULL),(251,4,93,0,16,NULL),(252,4,94,0,16,NULL),(253,4,104,0,16,NULL),(254,4,105,0,16,NULL),(261,4,77,0,17,NULL),(262,4,78,0,17,NULL),(263,4,93,0,17,NULL),(264,4,94,0,17,NULL),(265,4,104,0,17,NULL),(266,4,105,0,17,NULL),(325,4,93,0,18,NULL),(326,4,94,0,18,NULL),(327,4,104,0,18,NULL),(328,4,105,0,18,NULL);
/*!40000 ALTER TABLE `magev1_catalog_product_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_entity_decimal`
--

DROP TABLE IF EXISTS `magev1_catalog_product_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` decimal(12,4) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_MAGEV1_CAT_PRD_ENTT_DEC_ENTT_ID_ATTR_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_ENTITY_DECIMAL_STORE_ID` (`store_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_ENTITY_DECIMAL_ENTITY_ID` (`entity_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `FK_MAGEV1_CAT_PRD_ENTT_DEC_ATTR_ID_MAGEV1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `magev1_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CAT_PRD_ENTT_DEC_ENTT_ID_MAGEV1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CAT_PRD_ENTT_DEC_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Decimal Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_entity_decimal`
--

LOCK TABLES `magev1_catalog_product_entity_decimal` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_entity_decimal` DISABLE KEYS */;
INSERT INTO `magev1_catalog_product_entity_decimal` VALUES (98,4,80,0,12,23.0000),(99,4,75,0,12,20.0000),(100,4,76,0,12,NULL),(101,4,120,0,12,NULL),(102,4,80,0,13,12.0000),(103,4,75,0,13,23.0000),(104,4,76,0,13,NULL),(105,4,120,0,13,NULL),(106,4,80,0,14,23424.0000),(107,4,75,0,14,45.0000),(108,4,76,0,14,NULL),(109,4,120,0,14,NULL),(122,4,80,0,16,23424.0000),(123,4,75,0,16,45.0000),(124,4,76,0,16,NULL),(125,4,120,0,16,NULL),(129,4,80,0,17,12.0000),(130,4,75,0,17,23.0000),(131,4,76,0,17,NULL),(132,4,120,0,17,NULL);
/*!40000 ALTER TABLE `magev1_catalog_product_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_entity_gallery`
--

DROP TABLE IF EXISTS `magev1_catalog_product_entity_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_entity_gallery` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `position` int(11) NOT NULL DEFAULT '0' COMMENT 'Position',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `63A30509BB66CCF9504A3E0FB49093FD` (`entity_type_id`,`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_ENTITY_GALLERY_ENTITY_ID` (`entity_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_ENTITY_GALLERY_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_ENTITY_GALLERY_STORE_ID` (`store_id`),
  CONSTRAINT `FK_MAGEV1_CAT_PRD_ENTT_GLR_ATTR_ID_MAGEV1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `magev1_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CAT_PRD_ENTT_GLR_ENTT_ID_MAGEV1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CAT_PRD_ENTT_GLR_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Gallery Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_entity_gallery`
--

LOCK TABLES `magev1_catalog_product_entity_gallery` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_entity_gallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_product_entity_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_entity_group_price`
--

DROP TABLE IF EXISTS `magev1_catalog_product_entity_group_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_entity_group_price` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `all_groups` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Applicable To All Customer Groups',
  `customer_group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `is_percent` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Percent',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `E3A628A91111E18FD16EF8F055BD5000` (`entity_id`,`all_groups`,`customer_group_id`,`website_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_ENTITY_GROUP_PRICE_ENTITY_ID` (`entity_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_ENTITY_GROUP_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_ENTITY_GROUP_PRICE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `FK_2654CF1F595489C2BBB72051D6824F59` FOREIGN KEY (`customer_group_id`) REFERENCES `magev1_customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_36183302864EE5F2831382F763A855C3` FOREIGN KEY (`entity_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CAT_PRD_ENTT_GROUP_PRICE_WS_ID_MAGEV1_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `magev1_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Group Price Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_entity_group_price`
--

LOCK TABLES `magev1_catalog_product_entity_group_price` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_entity_group_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_product_entity_group_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_entity_int`
--

DROP TABLE IF EXISTS `magev1_catalog_product_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` int(11) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_MAGEV1_CAT_PRD_ENTT_INT_ENTT_ID_ATTR_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_ENTITY_INT_STORE_ID` (`store_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_ENTITY_INT_ENTITY_ID` (`entity_id`),
  CONSTRAINT `FK_MAGEV1_CAT_PRD_ENTT_INT_ATTR_ID_MAGEV1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `magev1_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CAT_PRD_ENTT_INT_ENTT_ID_MAGEV1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CAT_PRD_ENTT_INT_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Integer Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_entity_int`
--

LOCK TABLES `magev1_catalog_product_entity_int` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_entity_int` DISABLE KEYS */;
INSERT INTO `magev1_catalog_product_entity_int` VALUES (63,4,92,0,12,4),(64,4,96,0,12,1),(65,4,102,0,12,4),(66,4,121,0,12,0),(67,4,100,0,12,0),(69,4,92,0,13,4),(70,4,96,0,13,1),(71,4,102,0,13,4),(72,4,121,0,13,0),(73,4,100,0,13,0),(75,4,92,0,14,4),(76,4,96,0,14,1),(77,4,102,0,14,4),(78,4,121,0,14,0),(79,4,100,0,14,0),(81,4,96,0,15,1),(82,4,102,0,15,4),(83,4,92,0,16,4),(84,4,96,0,16,1),(85,4,100,0,16,0),(86,4,102,0,16,4),(87,4,121,0,16,0),(90,4,92,0,17,4),(91,4,96,0,17,1),(92,4,100,0,17,0),(93,4,102,0,17,4),(94,4,121,0,17,0),(97,4,96,0,18,1),(98,4,102,0,18,4);
/*!40000 ALTER TABLE `magev1_catalog_product_entity_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_entity_media_gallery`
--

DROP TABLE IF EXISTS `magev1_catalog_product_entity_media_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_entity_media_gallery` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_ENTITY_ID` (`entity_id`),
  CONSTRAINT `FK_D845CC53E2972A5220EBE5E652BCB6AB` FOREIGN KEY (`entity_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CAT_PRD_ENTT_MDA_GLR_ATTR_ID_MAGEV1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `magev1_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Media Gallery Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_entity_media_gallery`
--

LOCK TABLES `magev1_catalog_product_entity_media_gallery` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_entity_media_gallery` DISABLE KEYS */;
INSERT INTO `magev1_catalog_product_entity_media_gallery` VALUES (28,88,12,'/u/1/u17030312374014_neu01.png'),(29,88,13,'/u/1/u17031315075802_neu01.png'),(30,88,14,'/u/1/u17031616450217_lis01.png'),(31,88,15,'/m/1/m17031914305977_room.jpg'),(32,88,16,'/u/1/u17031616450217_lis01_1.png'),(33,88,17,'/u/1/u17031315075802_neu01_1.png'),(34,88,15,'/r/1/r17032316201482_foto1.jpg'),(35,88,18,'/m/1/m17031914305977_room_1.jpg'),(36,88,18,'/r/1/r17032316201482_foto1_1.jpg');
/*!40000 ALTER TABLE `magev1_catalog_product_entity_media_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_entity_media_gallery_value`
--

DROP TABLE IF EXISTS `magev1_catalog_product_entity_media_gallery_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_entity_media_gallery_value` (
  `value_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Value ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `label` varchar(255) DEFAULT NULL COMMENT 'Label',
  `position` int(10) unsigned DEFAULT NULL COMMENT 'Position',
  `disabled` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Disabled',
  PRIMARY KEY (`value_id`,`store_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_ENTITY_MEDIA_GALLERY_VALUE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_4885289D16F3F2D555F9D23B7E8BA1F5` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_D5EA92F48B177F1E4C3177F849EDC44F` FOREIGN KEY (`value_id`) REFERENCES `magev1_catalog_product_entity_media_gallery` (`value_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Media Gallery Attribute Value Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_entity_media_gallery_value`
--

LOCK TABLES `magev1_catalog_product_entity_media_gallery_value` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_entity_media_gallery_value` DISABLE KEYS */;
INSERT INTO `magev1_catalog_product_entity_media_gallery_value` VALUES (28,0,NULL,1,0),(29,0,NULL,1,0),(30,0,NULL,1,0),(31,0,NULL,1,0),(32,0,NULL,1,0),(33,0,NULL,1,0),(34,0,NULL,2,0),(35,0,NULL,1,0),(36,0,NULL,2,0);
/*!40000 ALTER TABLE `magev1_catalog_product_entity_media_gallery_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_entity_text`
--

DROP TABLE IF EXISTS `magev1_catalog_product_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` text COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_MAGEV1_CAT_PRD_ENTT_TEXT_ENTT_ID_ATTR_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_ENTITY_TEXT_STORE_ID` (`store_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_ENTITY_TEXT_ENTITY_ID` (`entity_id`),
  CONSTRAINT `FK_MAGEV1_CAT_PRD_ENTT_TEXT_ATTR_ID_MAGEV1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `magev1_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CAT_PRD_ENTT_TEXT_ENTT_ID_MAGEV1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CAT_PRD_ENTT_TEXT_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Text Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_entity_text`
--

LOCK TABLES `magev1_catalog_product_entity_text` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_entity_text` DISABLE KEYS */;
INSERT INTO `magev1_catalog_product_entity_text` VALUES (102,4,72,0,12,'Magnifique rangement '),(103,4,73,0,12,'Magnifique rangement '),(104,4,83,0,12,NULL),(105,4,106,0,12,NULL),(106,4,72,0,13,'Un fauteuil qui casse des culs'),(107,4,73,0,13,'Un fauteuil qui casse des culs'),(108,4,83,0,13,NULL),(109,4,106,0,13,NULL),(110,4,72,0,14,'Petit meuble qui est vraiment pas mal'),(111,4,73,0,14,'Petit meuble qui est vraiment pas mal'),(112,4,83,0,14,NULL),(113,4,106,0,14,NULL),(118,4,72,0,15,'La petite piece du barroque qui casse des culs merci au revoir'),(119,4,73,0,15,'Piece Barroque'),(120,4,83,0,15,NULL),(121,4,106,0,15,NULL),(128,4,72,0,16,'Petit meuble qui est vraiment pas mal'),(129,4,73,0,16,'Petit meuble qui est vraiment pas mal'),(130,4,83,0,16,NULL),(131,4,106,0,16,NULL),(134,4,72,0,17,'Un fauteuil qui casse des culs'),(135,4,73,0,17,'Un fauteuil qui casse des culs'),(136,4,83,0,17,NULL),(137,4,106,0,17,NULL),(165,4,72,0,18,'Ma petite deco Posee, j\'aime la musique et je souhaite travailler dans un metier qui m\'apporte sur la question de l\'ethique. La culture m\'attire beaucoup.'),(166,4,73,0,18,'Piece Barroque'),(167,4,83,0,18,NULL),(168,4,106,0,18,NULL);
/*!40000 ALTER TABLE `magev1_catalog_product_entity_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_entity_tier_price`
--

DROP TABLE IF EXISTS `magev1_catalog_product_entity_tier_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_entity_tier_price` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `all_groups` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Applicable To All Customer Groups',
  `customer_group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group ID',
  `qty` decimal(12,4) NOT NULL DEFAULT '1.0000' COMMENT 'QTY',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `9AEE65681518B9A1CF7E7D7CB4F5C3F5` (`entity_id`,`all_groups`,`customer_group_id`,`qty`,`website_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_ENTITY_TIER_PRICE_ENTITY_ID` (`entity_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_ENTITY_TIER_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_ENTITY_TIER_PRICE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `FK_03361D788AEFAB49640C24291C30F44A` FOREIGN KEY (`customer_group_id`) REFERENCES `magev1_customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_FB2F78FA4F2D1B5427B3BACEC0052243` FOREIGN KEY (`entity_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CAT_PRD_ENTT_TIER_PRICE_WS_ID_MAGEV1_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `magev1_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Tier Price Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_entity_tier_price`
--

LOCK TABLES `magev1_catalog_product_entity_tier_price` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_entity_tier_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_product_entity_tier_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_entity_varchar`
--

DROP TABLE IF EXISTS `magev1_catalog_product_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `entity_type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_MAGEV1_CAT_PRD_ENTT_VCHR_ENTT_ID_ATTR_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_ENTITY_VARCHAR_STORE_ID` (`store_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_ENTITY_VARCHAR_ENTITY_ID` (`entity_id`),
  CONSTRAINT `FK_MAGEV1_CAT_PRD_ENTT_VCHR_ATTR_ID_MAGEV1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `magev1_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CAT_PRD_ENTT_VCHR_ENTT_ID_MAGEV1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CAT_PRD_ENTT_VCHR_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=854 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Varchar Attribute Backend Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_entity_varchar`
--

LOCK TABLES `magev1_catalog_product_entity_varchar` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_entity_varchar` DISABLE KEYS */;
INSERT INTO `magev1_catalog_product_entity_varchar` VALUES (490,4,71,0,12,'Rangement'),(491,4,97,0,12,'dfsdf'),(492,4,117,0,12,'DZ'),(493,4,118,0,12,'2'),(494,4,119,0,12,'4'),(495,4,82,0,12,NULL),(496,4,84,0,12,NULL),(497,4,85,0,12,'/u/1/u17030312374014_neu01.png'),(498,4,86,0,12,'/u/1/u17030312374014_neu01.png'),(499,4,87,0,12,'/u/1/u17030312374014_neu01.png'),(500,4,103,0,12,NULL),(501,4,107,0,12,NULL),(502,4,109,0,12,'container1'),(503,4,122,0,12,NULL),(504,4,112,0,12,NULL),(505,4,113,0,12,NULL),(506,4,114,0,12,NULL),(507,4,71,0,13,'Fauteuil'),(508,4,97,0,13,'fauteuil'),(509,4,117,0,13,NULL),(510,4,118,0,13,'2'),(511,4,119,0,13,'4'),(512,4,82,0,13,NULL),(513,4,84,0,13,NULL),(514,4,85,0,13,'/u/1/u17031315075802_neu01.png'),(515,4,86,0,13,'/u/1/u17031315075802_neu01.png'),(516,4,87,0,13,'/u/1/u17031315075802_neu01.png'),(517,4,103,0,13,'room/default'),(518,4,107,0,13,NULL),(519,4,109,0,13,'container1'),(520,4,122,0,13,NULL),(521,4,112,0,13,NULL),(522,4,113,0,13,NULL),(523,4,114,0,13,NULL),(524,4,71,0,14,'Meuble'),(525,4,97,0,14,'meuble'),(526,4,117,0,14,NULL),(527,4,118,0,14,'2'),(528,4,119,0,14,'4'),(529,4,82,0,14,NULL),(530,4,84,0,14,NULL),(531,4,85,0,14,'/u/1/u17031616450217_lis01.png'),(532,4,86,0,14,'/u/1/u17031616450217_lis01.png'),(533,4,87,0,14,'/u/1/u17031616450217_lis01.png'),(534,4,103,0,14,'rwd/default'),(535,4,107,0,14,NULL),(536,4,109,0,14,'container1'),(537,4,122,0,14,NULL),(538,4,112,0,14,NULL),(539,4,113,0,14,NULL),(540,4,114,0,14,NULL),(559,4,71,0,15,'Piece Barroque'),(560,4,97,0,15,'piece-barroque'),(561,4,117,0,15,'AL'),(562,4,82,0,15,NULL),(563,4,84,0,15,NULL),(564,4,85,0,15,'/m/1/m17031914305977_room.jpg'),(565,4,86,0,15,'/m/1/m17031914305977_room.jpg'),(566,4,87,0,15,'/m/1/m17031914305977_room.jpg'),(567,4,103,0,15,'room/default'),(568,4,107,0,15,'ou'),(569,4,109,0,15,'container1'),(570,4,122,0,15,NULL),(577,4,98,1,15,'piece-barroque.html'),(578,4,98,0,15,'piece-barroque.html'),(588,4,98,1,14,'meuble.html'),(589,4,98,0,14,'meuble.html'),(599,4,71,0,16,'Meuble'),(600,4,82,0,16,NULL),(601,4,84,0,16,NULL),(602,4,85,0,16,'/u/1/u17031616450217_lis01_1.png'),(603,4,86,0,16,'/u/1/u17031616450217_lis01_1.png'),(604,4,87,0,16,'/u/1/u17031616450217_lis01_1.png'),(605,4,97,0,16,'meuble'),(606,4,98,0,16,'meuble-16.html'),(607,4,103,0,16,'rwd/default'),(608,4,107,0,16,NULL),(609,4,109,0,16,'container1'),(610,4,112,0,16,NULL),(611,4,113,0,16,NULL),(612,4,114,0,16,NULL),(613,4,117,0,16,NULL),(614,4,118,0,16,'2'),(615,4,119,0,16,'4'),(616,4,122,0,16,NULL),(617,4,98,1,16,'meuble.html'),(627,4,71,0,17,'Fauteuil'),(628,4,97,0,17,'fauteuil'),(629,4,117,0,17,NULL),(630,4,118,0,17,'2'),(631,4,119,0,17,'4'),(632,4,82,0,17,NULL),(633,4,84,0,17,NULL),(634,4,85,0,17,'/u/1/u17031315075802_neu01_1.png'),(635,4,86,0,17,'/u/1/u17031315075802_neu01_1.png'),(636,4,87,0,17,'/u/1/u17031315075802_neu01_1.png'),(637,4,103,0,17,NULL),(638,4,107,0,17,NULL),(639,4,109,0,17,'container1'),(640,4,122,0,17,NULL),(641,4,112,0,17,NULL),(642,4,113,0,17,NULL),(643,4,114,0,17,NULL),(675,4,112,0,15,NULL),(676,4,113,0,15,NULL),(677,4,114,0,15,NULL),(693,4,134,0,15,'Arnaud Pinot'),(694,4,133,0,15,'123'),(733,4,137,0,15,'25'),(734,4,138,0,15,'Paris'),(735,4,139,0,15,'Je suis Arnaud Pinot, je suis Ã©tudiant a Hetic en DÃ©veloppement Web. Lead Developer j\'aide ma team autant que je peux.'),(736,4,135,0,15,'/r/1/r17032316201482_foto1.jpg'),(750,4,71,0,18,'Une autre piece Barroque'),(751,4,82,0,18,NULL),(752,4,84,0,18,NULL),(753,4,85,0,18,'/m/1/m17031914305977_room_1.jpg'),(754,4,86,0,18,'/m/1/m17031914305977_room_1.jpg'),(755,4,87,0,18,'/m/1/m17031914305977_room_1.jpg'),(756,4,97,0,18,'piece-barroque'),(757,4,98,0,18,'piece-barroque-18.html'),(758,4,103,0,18,'room/default'),(759,4,107,0,18,'ou'),(760,4,109,0,18,'container1'),(761,4,112,0,18,NULL),(762,4,113,0,18,NULL),(763,4,114,0,18,NULL),(764,4,117,0,18,'AL'),(765,4,122,0,18,NULL),(766,4,133,0,18,'123'),(767,4,134,0,18,'Theo Rossier'),(768,4,135,0,18,'/r/1/r17032316201482_foto1_1.jpg'),(769,4,137,0,18,'23'),(770,4,138,0,18,'Paris'),(771,4,139,0,18,'Je fais des cartes Trello avec mes conquÃªtes, '),(772,4,98,1,18,'piece-barroque.html'),(804,4,140,0,12,'20'),(805,4,141,0,12,'50'),(814,4,140,0,13,'60'),(815,4,141,0,13,'60'),(825,4,140,0,14,'70'),(826,4,141,0,14,'80'),(852,4,98,1,13,'fauteuil.html'),(853,4,98,0,13,'fauteuil.html');
/*!40000 ALTER TABLE `magev1_catalog_product_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_flat_1`
--

DROP TABLE IF EXISTS `magev1_catalog_product_flat_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_flat_1` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'entity_id',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'attribute_set_id',
  `type_id` varchar(32) NOT NULL DEFAULT 'simple' COMMENT 'type_id',
  `cost` decimal(12,4) DEFAULT NULL COMMENT 'cost',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'created_at',
  `gift_message_available` smallint(6) DEFAULT NULL COMMENT 'gift_message_available',
  `has_options` smallint(6) NOT NULL DEFAULT '0' COMMENT 'has_options',
  `image_label` varchar(255) DEFAULT NULL COMMENT 'image_label',
  `is_recurring` smallint(6) DEFAULT NULL COMMENT 'is_recurring',
  `links_exist` int(11) DEFAULT NULL COMMENT 'links_exist',
  `links_purchased_separately` int(11) DEFAULT NULL COMMENT 'links_purchased_separately',
  `links_title` varchar(255) DEFAULT NULL COMMENT 'links_title',
  `msrp` decimal(12,4) DEFAULT NULL COMMENT 'msrp',
  `msrp_display_actual_price_type` varchar(255) DEFAULT NULL COMMENT 'msrp_display_actual_price_type',
  `msrp_enabled` smallint(6) DEFAULT NULL COMMENT 'msrp_enabled',
  `name` varchar(255) DEFAULT NULL COMMENT 'name',
  `news_from_date` datetime DEFAULT NULL COMMENT 'news_from_date',
  `news_to_date` datetime DEFAULT NULL COMMENT 'news_to_date',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'price',
  `price_type` int(11) DEFAULT NULL COMMENT 'price_type',
  `price_view` int(11) DEFAULT NULL COMMENT 'price_view',
  `recurring_profile` text COMMENT 'recurring_profile',
  `required_options` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'required_options',
  `shipment_type` int(11) DEFAULT NULL COMMENT 'shipment_type',
  `short_description` text COMMENT 'short_description',
  `sku` varchar(64) DEFAULT NULL COMMENT 'sku',
  `sku_type` int(11) DEFAULT NULL COMMENT 'sku_type',
  `small_image` varchar(255) DEFAULT NULL COMMENT 'small_image',
  `small_image_label` varchar(255) DEFAULT NULL COMMENT 'small_image_label',
  `special_from_date` datetime DEFAULT NULL COMMENT 'special_from_date',
  `special_price` decimal(12,4) DEFAULT NULL COMMENT 'special_price',
  `special_to_date` datetime DEFAULT NULL COMMENT 'special_to_date',
  `status` smallint(5) unsigned DEFAULT NULL COMMENT 'status',
  `tax_class_id` int(10) unsigned DEFAULT NULL COMMENT 'tax_class_id',
  `thumbnail` varchar(255) DEFAULT NULL COMMENT 'thumbnail',
  `thumbnail_label` varchar(255) DEFAULT NULL COMMENT 'thumbnail_label',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'updated_at',
  `url_key` varchar(255) DEFAULT NULL COMMENT 'url_key',
  `url_path` varchar(255) DEFAULT NULL COMMENT 'url_path',
  `visibility` smallint(5) unsigned DEFAULT NULL COMMENT 'visibility',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'weight',
  `weight_type` int(11) DEFAULT NULL COMMENT 'weight_type',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_FLAT_1_TYPE_ID` (`type_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_FLAT_1_ATTRIBUTE_SET_ID` (`attribute_set_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_FLAT_1_NAME` (`name`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_FLAT_1_PRICE` (`price`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_FLAT_1_STATUS` (`status`),
  CONSTRAINT `FK_4030A2F07C8D0F794DFE13C8BF4DC9A0` FOREIGN KEY (`entity_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Flat (Store 1)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_flat_1`
--

LOCK TABLES `magev1_catalog_product_flat_1` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_flat_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_product_flat_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_index_eav`
--

DROP TABLE IF EXISTS `magev1_catalog_product_index_eav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_index_eav` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` int(10) unsigned NOT NULL COMMENT 'Value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_INDEX_EAV_ENTITY_ID` (`entity_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_INDEX_EAV_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_INDEX_EAV_STORE_ID` (`store_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_INDEX_EAV_VALUE` (`value`),
  CONSTRAINT `FK_MAGEV1_CAT_PRD_IDX_EAV_ATTR_ID_MAGEV1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `magev1_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CAT_PRD_IDX_EAV_ENTT_ID_MAGEV1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CAT_PRD_IDX_EAV_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_index_eav`
--

LOCK TABLES `magev1_catalog_product_index_eav` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_index_eav` DISABLE KEYS */;
INSERT INTO `magev1_catalog_product_index_eav` VALUES (14,92,1,4),(14,92,2,4),(14,121,1,0),(14,121,2,0);
/*!40000 ALTER TABLE `magev1_catalog_product_index_eav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_index_eav_decimal`
--

DROP TABLE IF EXISTS `magev1_catalog_product_index_eav_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_index_eav_decimal` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_ENTITY_ID` (`entity_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_STORE_ID` (`store_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_VALUE` (`value`),
  CONSTRAINT `FK_5DD76AA0AD92A1A513B4590AE99D0560` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_7ABD43AE8DB121C1F99E8B523C6BE6E2` FOREIGN KEY (`entity_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CAT_PRD_IDX_EAV_DEC_ATTR_ID_MAGEV1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `magev1_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Decimal Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_index_eav_decimal`
--

LOCK TABLES `magev1_catalog_product_index_eav_decimal` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_index_eav_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_product_index_eav_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_index_eav_decimal_idx`
--

DROP TABLE IF EXISTS `magev1_catalog_product_index_eav_decimal_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_index_eav_decimal_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_ENTITY_ID` (`entity_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_STORE_ID` (`store_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_IDX_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Decimal Indexer Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_index_eav_decimal_idx`
--

LOCK TABLES `magev1_catalog_product_index_eav_decimal_idx` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_index_eav_decimal_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_product_index_eav_decimal_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_index_eav_decimal_tmp`
--

DROP TABLE IF EXISTS `magev1_catalog_product_index_eav_decimal_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_index_eav_decimal_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` decimal(12,4) NOT NULL COMMENT 'Value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_ENTITY_ID` (`entity_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_STORE_ID` (`store_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_INDEX_EAV_DECIMAL_TMP_VALUE` (`value`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Decimal Indexer Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_index_eav_decimal_tmp`
--

LOCK TABLES `magev1_catalog_product_index_eav_decimal_tmp` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_index_eav_decimal_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_product_index_eav_decimal_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_index_eav_idx`
--

DROP TABLE IF EXISTS `magev1_catalog_product_index_eav_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_index_eav_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` int(10) unsigned NOT NULL COMMENT 'Value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_INDEX_EAV_IDX_ENTITY_ID` (`entity_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_INDEX_EAV_IDX_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_INDEX_EAV_IDX_STORE_ID` (`store_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_INDEX_EAV_IDX_VALUE` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Indexer Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_index_eav_idx`
--

LOCK TABLES `magev1_catalog_product_index_eav_idx` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_index_eav_idx` DISABLE KEYS */;
INSERT INTO `magev1_catalog_product_index_eav_idx` VALUES (4,92,1,3),(4,92,1,4),(4,92,2,3),(4,92,2,4),(4,92,3,3),(4,92,3,4),(5,92,1,4),(5,92,2,4),(5,92,3,4),(6,92,1,4),(6,92,2,4),(6,92,3,4),(7,92,1,4),(7,92,2,4),(7,92,3,4),(8,92,1,4),(8,92,2,4),(8,92,3,4),(1,121,1,2),(1,121,2,2),(1,121,3,2),(4,121,1,2),(4,121,2,2),(4,121,3,2),(5,121,1,2),(5,121,2,2),(5,121,3,2),(6,121,1,2),(6,121,2,2),(6,121,3,2),(7,121,1,2),(7,121,2,2),(7,121,3,2),(8,121,1,2),(8,121,2,2),(8,121,3,2),(9,121,1,2),(9,121,2,2),(9,121,3,2),(9,132,1,8),(9,132,2,8),(9,132,3,8);
/*!40000 ALTER TABLE `magev1_catalog_product_index_eav_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_index_eav_tmp`
--

DROP TABLE IF EXISTS `magev1_catalog_product_index_eav_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_index_eav_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `value` int(10) unsigned NOT NULL COMMENT 'Value',
  PRIMARY KEY (`entity_id`,`attribute_id`,`store_id`,`value`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_INDEX_EAV_TMP_ENTITY_ID` (`entity_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_INDEX_EAV_TMP_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_INDEX_EAV_TMP_STORE_ID` (`store_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_INDEX_EAV_TMP_VALUE` (`value`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product EAV Indexer Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_index_eav_tmp`
--

LOCK TABLES `magev1_catalog_product_index_eav_tmp` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_index_eav_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_product_index_eav_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_index_group_price`
--

DROP TABLE IF EXISTS `magev1_catalog_product_index_group_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_index_group_price` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_INDEX_GROUP_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_INDEX_GROUP_PRICE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `FK_5F52A68241AC950A5051979E71B6847C` FOREIGN KEY (`customer_group_id`) REFERENCES `magev1_customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_9863811FFB7DFA1D974DE08A58A3B93A` FOREIGN KEY (`entity_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CAT_PRD_IDX_GROUP_PRICE_WS_ID_MAGEV1_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `magev1_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Group Price Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_index_group_price`
--

LOCK TABLES `magev1_catalog_product_index_group_price` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_index_group_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_product_index_group_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_index_price`
--

DROP TABLE IF EXISTS `magev1_catalog_product_index_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_index_price` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(12,4) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_INDEX_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_INDEX_PRICE_WEBSITE_ID` (`website_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_INDEX_PRICE_MIN_PRICE` (`min_price`),
  KEY `IDX_MAGEV1_CAT_PRD_IDX_PRICE_WS_ID_CSTR_GROUP_ID_MIN_PRICE` (`website_id`,`customer_group_id`,`min_price`),
  CONSTRAINT `FK_B5590C86C164969616707C477E32A55D` FOREIGN KEY (`customer_group_id`) REFERENCES `magev1_customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CAT_PRD_IDX_PRICE_ENTT_ID_MAGEV1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CAT_PRD_IDX_PRICE_WS_ID_MAGEV1_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `magev1_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_index_price`
--

LOCK TABLES `magev1_catalog_product_index_price` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_index_price` DISABLE KEYS */;
INSERT INTO `magev1_catalog_product_index_price` VALUES (14,0,1,0,45.0000,45.0000,45.0000,45.0000,NULL,NULL),(14,1,1,0,45.0000,45.0000,45.0000,45.0000,NULL,NULL),(14,2,1,0,45.0000,45.0000,45.0000,45.0000,NULL,NULL),(14,3,1,0,45.0000,45.0000,45.0000,45.0000,NULL,NULL);
/*!40000 ALTER TABLE `magev1_catalog_product_index_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_index_price_bundle_idx`
--

DROP TABLE IF EXISTS `magev1_catalog_product_index_price_bundle_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_index_price_bundle_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class Id',
  `price_type` smallint(5) unsigned NOT NULL COMMENT 'Price Type',
  `special_price` decimal(12,4) DEFAULT NULL COMMENT 'Special Price',
  `tier_percent` decimal(12,4) DEFAULT NULL COMMENT 'Tier Percent',
  `orig_price` decimal(12,4) DEFAULT NULL COMMENT 'Orig Price',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(12,4) DEFAULT NULL COMMENT 'Base Tier',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  `base_group_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Group Price',
  `group_price_percent` decimal(12,4) DEFAULT NULL COMMENT 'Group Price Percent',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Idx';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_index_price_bundle_idx`
--

LOCK TABLES `magev1_catalog_product_index_price_bundle_idx` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_index_price_bundle_idx` DISABLE KEYS */;
INSERT INTO `magev1_catalog_product_index_price_bundle_idx` VALUES (8,0,1,0,0,0.0000,NULL,0.0000,0.0000,0.0000,0.0000,NULL,NULL,NULL,NULL,NULL),(8,1,1,0,0,0.0000,NULL,0.0000,0.0000,0.0000,0.0000,NULL,NULL,NULL,NULL,NULL),(8,2,1,0,0,0.0000,NULL,0.0000,0.0000,0.0000,0.0000,NULL,NULL,NULL,NULL,NULL),(8,3,1,0,0,0.0000,NULL,0.0000,0.0000,0.0000,0.0000,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `magev1_catalog_product_index_price_bundle_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_index_price_bundle_opt_idx`
--

DROP TABLE IF EXISTS `magev1_catalog_product_index_price_bundle_opt_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_index_price_bundle_opt_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `alt_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `alt_tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  `alt_group_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Group Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Opt Idx';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_index_price_bundle_opt_idx`
--

LOCK TABLES `magev1_catalog_product_index_price_bundle_opt_idx` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_index_price_bundle_opt_idx` DISABLE KEYS */;
INSERT INTO `magev1_catalog_product_index_price_bundle_opt_idx` VALUES (8,0,1,1,18.0000,0.0000,25.0000,NULL,0.0000,NULL,0.0000),(8,1,1,1,18.0000,0.0000,25.0000,NULL,0.0000,NULL,0.0000),(8,2,1,1,18.0000,0.0000,25.0000,NULL,0.0000,NULL,0.0000),(8,3,1,1,18.0000,0.0000,25.0000,NULL,0.0000,NULL,0.0000);
/*!40000 ALTER TABLE `magev1_catalog_product_index_price_bundle_opt_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_index_price_bundle_opt_tmp`
--

DROP TABLE IF EXISTS `magev1_catalog_product_index_price_bundle_opt_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_index_price_bundle_opt_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `alt_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `alt_tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  `alt_group_price` decimal(12,4) DEFAULT NULL COMMENT 'Alt Group Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Opt Tmp';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_index_price_bundle_opt_tmp`
--

LOCK TABLES `magev1_catalog_product_index_price_bundle_opt_tmp` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_index_price_bundle_opt_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_product_index_price_bundle_opt_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_index_price_bundle_sel_idx`
--

DROP TABLE IF EXISTS `magev1_catalog_product_index_price_bundle_sel_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_index_price_bundle_sel_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `selection_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Selection Id',
  `group_type` smallint(5) unsigned DEFAULT '0' COMMENT 'Group Type',
  `is_required` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Required',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`,`selection_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Sel Idx';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_index_price_bundle_sel_idx`
--

LOCK TABLES `magev1_catalog_product_index_price_bundle_sel_idx` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_index_price_bundle_sel_idx` DISABLE KEYS */;
INSERT INTO `magev1_catalog_product_index_price_bundle_sel_idx` VALUES (8,0,1,1,1,0,1,18.0000,NULL,NULL),(8,0,1,1,2,0,1,25.0000,NULL,NULL),(8,1,1,1,1,0,1,18.0000,NULL,NULL),(8,1,1,1,2,0,1,25.0000,NULL,NULL),(8,2,1,1,1,0,1,18.0000,NULL,NULL),(8,2,1,1,2,0,1,25.0000,NULL,NULL),(8,3,1,1,1,0,1,18.0000,NULL,NULL),(8,3,1,1,2,0,1,25.0000,NULL,NULL);
/*!40000 ALTER TABLE `magev1_catalog_product_index_price_bundle_sel_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_index_price_bundle_sel_tmp`
--

DROP TABLE IF EXISTS `magev1_catalog_product_index_price_bundle_sel_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_index_price_bundle_sel_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `selection_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Selection Id',
  `group_type` smallint(5) unsigned DEFAULT '0' COMMENT 'Group Type',
  `is_required` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Required',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`,`selection_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Sel Tmp';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_index_price_bundle_sel_tmp`
--

LOCK TABLES `magev1_catalog_product_index_price_bundle_sel_tmp` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_index_price_bundle_sel_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_product_index_price_bundle_sel_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_index_price_bundle_tmp`
--

DROP TABLE IF EXISTS `magev1_catalog_product_index_price_bundle_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_index_price_bundle_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class Id',
  `price_type` smallint(5) unsigned NOT NULL COMMENT 'Price Type',
  `special_price` decimal(12,4) DEFAULT NULL COMMENT 'Special Price',
  `tier_percent` decimal(12,4) DEFAULT NULL COMMENT 'Tier Percent',
  `orig_price` decimal(12,4) DEFAULT NULL COMMENT 'Orig Price',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(12,4) DEFAULT NULL COMMENT 'Base Tier',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  `base_group_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Group Price',
  `group_price_percent` decimal(12,4) DEFAULT NULL COMMENT 'Group Price Percent',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Index Price Bundle Tmp';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_index_price_bundle_tmp`
--

LOCK TABLES `magev1_catalog_product_index_price_bundle_tmp` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_index_price_bundle_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_product_index_price_bundle_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_index_price_cfg_opt_agr_idx`
--

DROP TABLE IF EXISTS `magev1_catalog_product_index_price_cfg_opt_agr_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_index_price_cfg_opt_agr_idx` (
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent ID',
  `child_id` int(10) unsigned NOT NULL COMMENT 'Child ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  PRIMARY KEY (`parent_id`,`child_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Aggregate Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_index_price_cfg_opt_agr_idx`
--

LOCK TABLES `magev1_catalog_product_index_price_cfg_opt_agr_idx` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_index_price_cfg_opt_agr_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_product_index_price_cfg_opt_agr_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_index_price_cfg_opt_agr_tmp`
--

DROP TABLE IF EXISTS `magev1_catalog_product_index_price_cfg_opt_agr_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_index_price_cfg_opt_agr_tmp` (
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent ID',
  `child_id` int(10) unsigned NOT NULL COMMENT 'Child ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  PRIMARY KEY (`parent_id`,`child_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Aggregate Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_index_price_cfg_opt_agr_tmp`
--

LOCK TABLES `magev1_catalog_product_index_price_cfg_opt_agr_tmp` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_index_price_cfg_opt_agr_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_product_index_price_cfg_opt_agr_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_index_price_cfg_opt_idx`
--

DROP TABLE IF EXISTS `magev1_catalog_product_index_price_cfg_opt_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_index_price_cfg_opt_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_index_price_cfg_opt_idx`
--

LOCK TABLES `magev1_catalog_product_index_price_cfg_opt_idx` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_index_price_cfg_opt_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_product_index_price_cfg_opt_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_index_price_cfg_opt_tmp`
--

DROP TABLE IF EXISTS `magev1_catalog_product_index_price_cfg_opt_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_index_price_cfg_opt_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Config Option Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_index_price_cfg_opt_tmp`
--

LOCK TABLES `magev1_catalog_product_index_price_cfg_opt_tmp` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_index_price_cfg_opt_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_product_index_price_cfg_opt_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_index_price_downlod_idx`
--

DROP TABLE IF EXISTS `magev1_catalog_product_index_price_downlod_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_index_price_downlod_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Minimum price',
  `max_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Maximum price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Indexer Table for price of downloadable products';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_index_price_downlod_idx`
--

LOCK TABLES `magev1_catalog_product_index_price_downlod_idx` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_index_price_downlod_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_product_index_price_downlod_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_index_price_downlod_tmp`
--

DROP TABLE IF EXISTS `magev1_catalog_product_index_price_downlod_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_index_price_downlod_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Minimum price',
  `max_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Maximum price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Temporary Indexer Table for price of downloadable products';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_index_price_downlod_tmp`
--

LOCK TABLES `magev1_catalog_product_index_price_downlod_tmp` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_index_price_downlod_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_product_index_price_downlod_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_index_price_final_idx`
--

DROP TABLE IF EXISTS `magev1_catalog_product_index_price_final_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_index_price_final_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `orig_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Price',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(12,4) DEFAULT NULL COMMENT 'Base Tier',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  `base_group_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Group Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Final Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_index_price_final_idx`
--

LOCK TABLES `magev1_catalog_product_index_price_final_idx` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_index_price_final_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_product_index_price_final_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_index_price_final_tmp`
--

DROP TABLE IF EXISTS `magev1_catalog_product_index_price_final_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_index_price_final_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `orig_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Price',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `base_tier` decimal(12,4) DEFAULT NULL COMMENT 'Base Tier',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  `base_group_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Group Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Final Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_index_price_final_tmp`
--

LOCK TABLES `magev1_catalog_product_index_price_final_tmp` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_index_price_final_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_product_index_price_final_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_index_price_idx`
--

DROP TABLE IF EXISTS `magev1_catalog_product_index_price_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_index_price_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(12,4) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_INDEX_PRICE_IDX_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_INDEX_PRICE_IDX_WEBSITE_ID` (`website_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_INDEX_PRICE_IDX_MIN_PRICE` (`min_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_index_price_idx`
--

LOCK TABLES `magev1_catalog_product_index_price_idx` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_index_price_idx` DISABLE KEYS */;
INSERT INTO `magev1_catalog_product_index_price_idx` VALUES (1,0,1,2,39.9900,29.9900,29.9900,29.9900,NULL,NULL),(1,1,1,2,39.9900,29.9900,29.9900,29.9900,NULL,NULL),(1,2,1,2,39.9900,29.9900,29.9900,29.9900,NULL,NULL),(1,3,1,2,39.9900,29.9900,29.9900,29.9900,NULL,NULL),(2,0,1,2,0.0000,0.0000,0.0000,0.0000,NULL,NULL),(2,1,1,2,0.0000,0.0000,0.0000,0.0000,NULL,NULL),(2,2,1,2,0.0000,0.0000,0.0000,0.0000,NULL,NULL),(2,3,1,2,0.0000,0.0000,0.0000,0.0000,NULL,NULL),(3,0,1,2,0.0000,0.0000,0.0000,0.0000,NULL,NULL),(3,1,1,2,0.0000,0.0000,0.0000,0.0000,NULL,NULL),(3,2,1,2,0.0000,0.0000,0.0000,0.0000,NULL,NULL),(3,3,1,2,0.0000,0.0000,0.0000,0.0000,NULL,NULL),(4,0,1,2,80.0000,80.0000,80.0000,85.0000,NULL,NULL),(4,1,1,2,80.0000,80.0000,80.0000,85.0000,NULL,NULL),(4,2,1,2,80.0000,80.0000,80.0000,85.0000,NULL,NULL),(4,3,1,2,80.0000,80.0000,80.0000,85.0000,NULL,NULL),(5,0,1,2,18.0000,18.0000,18.0000,28.0000,NULL,NULL),(5,1,1,2,18.0000,18.0000,18.0000,28.0000,NULL,NULL),(5,2,1,2,18.0000,18.0000,18.0000,28.0000,NULL,NULL),(5,3,1,2,18.0000,18.0000,18.0000,28.0000,NULL,NULL),(6,0,1,2,25.0000,25.0000,25.0000,25.0000,NULL,NULL),(6,1,1,2,25.0000,25.0000,25.0000,25.0000,NULL,NULL),(6,2,1,2,25.0000,25.0000,25.0000,25.0000,NULL,NULL),(6,3,1,2,25.0000,25.0000,25.0000,25.0000,NULL,NULL),(7,0,1,2,NULL,NULL,18.0000,28.0000,NULL,NULL),(7,1,1,2,NULL,NULL,18.0000,28.0000,NULL,NULL),(7,2,1,2,NULL,NULL,18.0000,28.0000,NULL,NULL),(7,3,1,2,NULL,NULL,18.0000,28.0000,NULL,NULL),(8,0,1,0,0.0000,0.0000,18.0000,25.0000,NULL,NULL),(8,1,1,0,0.0000,0.0000,18.0000,25.0000,NULL,NULL),(8,2,1,0,0.0000,0.0000,18.0000,25.0000,NULL,NULL),(8,3,1,0,0.0000,0.0000,18.0000,25.0000,NULL,NULL),(9,0,1,2,125.0000,125.0000,125.0000,125.0000,NULL,NULL),(9,1,1,2,125.0000,125.0000,125.0000,125.0000,NULL,NULL),(9,2,1,2,125.0000,125.0000,125.0000,125.0000,NULL,NULL),(9,3,1,2,125.0000,125.0000,125.0000,125.0000,NULL,NULL);
/*!40000 ALTER TABLE `magev1_catalog_product_index_price_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_index_price_opt_agr_idx`
--

DROP TABLE IF EXISTS `magev1_catalog_product_index_price_opt_agr_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_index_price_opt_agr_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Aggregate Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_index_price_opt_agr_idx`
--

LOCK TABLES `magev1_catalog_product_index_price_opt_agr_idx` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_index_price_opt_agr_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_product_index_price_opt_agr_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_index_price_opt_agr_tmp`
--

DROP TABLE IF EXISTS `magev1_catalog_product_index_price_opt_agr_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_index_price_opt_agr_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`,`option_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Aggregate Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_index_price_opt_agr_tmp`
--

LOCK TABLES `magev1_catalog_product_index_price_opt_agr_tmp` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_index_price_opt_agr_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_product_index_price_opt_agr_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_index_price_opt_idx`
--

DROP TABLE IF EXISTS `magev1_catalog_product_index_price_opt_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_index_price_opt_idx` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_index_price_opt_idx`
--

LOCK TABLES `magev1_catalog_product_index_price_opt_idx` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_index_price_opt_idx` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_product_index_price_opt_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_index_price_opt_tmp`
--

DROP TABLE IF EXISTS `magev1_catalog_product_index_price_opt_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_index_price_opt_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Option Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_index_price_opt_tmp`
--

LOCK TABLES `magev1_catalog_product_index_price_opt_tmp` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_index_price_opt_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_product_index_price_opt_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_index_price_tmp`
--

DROP TABLE IF EXISTS `magev1_catalog_product_index_price_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_index_price_tmp` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `tax_class_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Tax Class ID',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `final_price` decimal(12,4) DEFAULT NULL COMMENT 'Final Price',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  `max_price` decimal(12,4) DEFAULT NULL COMMENT 'Max Price',
  `tier_price` decimal(12,4) DEFAULT NULL COMMENT 'Tier Price',
  `group_price` decimal(12,4) DEFAULT NULL COMMENT 'Group price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_INDEX_PRICE_TMP_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_INDEX_PRICE_TMP_WEBSITE_ID` (`website_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_INDEX_PRICE_TMP_MIN_PRICE` (`min_price`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Catalog Product Price Indexer Temp Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_index_price_tmp`
--

LOCK TABLES `magev1_catalog_product_index_price_tmp` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_index_price_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_product_index_price_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_index_tier_price`
--

DROP TABLE IF EXISTS `magev1_catalog_product_index_tier_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_index_tier_price` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity ID',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `min_price` decimal(12,4) DEFAULT NULL COMMENT 'Min Price',
  PRIMARY KEY (`entity_id`,`customer_group_id`,`website_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_INDEX_TIER_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_INDEX_TIER_PRICE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `FK_17BB2B00DFB0513014135847151D3D59` FOREIGN KEY (`entity_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_7A6157D37BD5C5B1960B5D50FC1D686C` FOREIGN KEY (`customer_group_id`) REFERENCES `magev1_customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CAT_PRD_IDX_TIER_PRICE_WS_ID_MAGEV1_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `magev1_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Tier Price Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_index_tier_price`
--

LOCK TABLES `magev1_catalog_product_index_tier_price` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_index_tier_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_product_index_tier_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_index_website`
--

DROP TABLE IF EXISTS `magev1_catalog_product_index_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_index_website` (
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  `website_date` date DEFAULT NULL COMMENT 'Website Date',
  `rate` float DEFAULT '1' COMMENT 'Rate',
  PRIMARY KEY (`website_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_INDEX_WEBSITE_WEBSITE_DATE` (`website_date`),
  CONSTRAINT `FK_MAGEV1_CAT_PRD_IDX_WS_WS_ID_MAGEV1_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `magev1_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Website Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_index_website`
--

LOCK TABLES `magev1_catalog_product_index_website` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_index_website` DISABLE KEYS */;
INSERT INTO `magev1_catalog_product_index_website` VALUES (1,'2017-04-06',1);
/*!40000 ALTER TABLE `magev1_catalog_product_index_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_link`
--

DROP TABLE IF EXISTS `magev1_catalog_product_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `linked_product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Linked Product ID',
  `link_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Link Type ID',
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `UNQ_MAGEV1_CAT_PRD_LNK_LNK_TYPE_ID_PRD_ID_LNKED_PRD_ID` (`link_type_id`,`product_id`,`linked_product_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_LINK_PRODUCT_ID` (`product_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_LINK_LINKED_PRODUCT_ID` (`linked_product_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_LINK_LINK_TYPE_ID` (`link_type_id`),
  CONSTRAINT `FK_FC670B13D22091E3E8536F609B6CC40B` FOREIGN KEY (`link_type_id`) REFERENCES `magev1_catalog_product_link_type` (`link_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CAT_PRD_LNK_LNKED_PRD_ID_MAGEV1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`linked_product_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CAT_PRD_LNK_PRD_ID_MAGEV1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='Catalog Product To Product Linkage Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_link`
--

LOCK TABLES `magev1_catalog_product_link` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_link` DISABLE KEYS */;
INSERT INTO `magev1_catalog_product_link` VALUES (16,15,12,1),(17,15,13,1),(18,15,14,1),(19,18,12,1),(20,18,13,1),(21,18,14,1);
/*!40000 ALTER TABLE `magev1_catalog_product_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_link_attribute`
--

DROP TABLE IF EXISTS `magev1_catalog_product_link_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_link_attribute` (
  `product_link_attribute_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product Link Attribute ID',
  `link_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Link Type ID',
  `product_link_attribute_code` varchar(32) DEFAULT NULL COMMENT 'Product Link Attribute Code',
  `data_type` varchar(32) DEFAULT NULL COMMENT 'Data Type',
  PRIMARY KEY (`product_link_attribute_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_LINK_ATTRIBUTE_LINK_TYPE_ID` (`link_type_id`),
  CONSTRAINT `FK_9329593D00E99F5844F33146052A2D7B` FOREIGN KEY (`link_type_id`) REFERENCES `magev1_catalog_product_link_type` (`link_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Attribute Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_link_attribute`
--

LOCK TABLES `magev1_catalog_product_link_attribute` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_link_attribute` DISABLE KEYS */;
INSERT INTO `magev1_catalog_product_link_attribute` VALUES (1,1,'position','int'),(2,3,'position','int'),(3,3,'qty','decimal'),(4,4,'position','int'),(5,5,'position','int');
/*!40000 ALTER TABLE `magev1_catalog_product_link_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_link_attribute_decimal`
--

DROP TABLE IF EXISTS `magev1_catalog_product_link_attribute_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_link_attribute_decimal` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_link_attribute_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Product Link Attribute ID',
  `link_id` int(10) unsigned NOT NULL COMMENT 'Link ID',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_MAGEV1_CAT_PRD_LNK_ATTR_DEC_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  KEY `IDX_MAGEV1_CAT_PRD_LNK_ATTR_DEC_PRD_LNK_ATTR_ID` (`product_link_attribute_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_LINK_ATTRIBUTE_DECIMAL_LINK_ID` (`link_id`),
  CONSTRAINT `FK_75EC4ACE3F3784DE0DC9C8B9F9492585` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `magev1_catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CAT_PRD_LNK_ATTR_DEC_LNK_ID_MAGEV1_CAT_PRD_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `magev1_catalog_product_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Decimal Attribute Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_link_attribute_decimal`
--

LOCK TABLES `magev1_catalog_product_link_attribute_decimal` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_link_attribute_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_product_link_attribute_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_link_attribute_int`
--

DROP TABLE IF EXISTS `magev1_catalog_product_link_attribute_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_link_attribute_int` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_link_attribute_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Product Link Attribute ID',
  `link_id` int(10) unsigned NOT NULL COMMENT 'Link ID',
  `value` int(11) NOT NULL DEFAULT '0' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_MAGEV1_CAT_PRD_LNK_ATTR_INT_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  KEY `IDX_MAGEV1_CAT_PRD_LNK_ATTR_INT_PRD_LNK_ATTR_ID` (`product_link_attribute_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_LINK_ATTRIBUTE_INT_LINK_ID` (`link_id`),
  CONSTRAINT `FK_42C777242C3F7FC184EB0404C9D1FEC6` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `magev1_catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CAT_PRD_LNK_ATTR_INT_LNK_ID_MAGEV1_CAT_PRD_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `magev1_catalog_product_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Integer Attribute Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_link_attribute_int`
--

LOCK TABLES `magev1_catalog_product_link_attribute_int` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_link_attribute_int` DISABLE KEYS */;
INSERT INTO `magev1_catalog_product_link_attribute_int` VALUES (23,1,16,0),(24,1,17,0),(25,1,18,0),(29,1,19,0),(30,1,20,0),(31,1,21,0);
/*!40000 ALTER TABLE `magev1_catalog_product_link_attribute_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_link_attribute_varchar`
--

DROP TABLE IF EXISTS `magev1_catalog_product_link_attribute_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_link_attribute_varchar` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_link_attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Link Attribute ID',
  `link_id` int(10) unsigned NOT NULL COMMENT 'Link ID',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_MAGEV1_CAT_PRD_LNK_ATTR_VCHR_PRD_LNK_ATTR_ID_LNK_ID` (`product_link_attribute_id`,`link_id`),
  KEY `IDX_MAGEV1_CAT_PRD_LNK_ATTR_VCHR_PRD_LNK_ATTR_ID` (`product_link_attribute_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_LINK_ATTRIBUTE_VARCHAR_LINK_ID` (`link_id`),
  CONSTRAINT `FK_0EFC9314178414DA51E4AE5BC333F908` FOREIGN KEY (`product_link_attribute_id`) REFERENCES `magev1_catalog_product_link_attribute` (`product_link_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CAT_PRD_LNK_ATTR_VCHR_LNK_ID_MAGEV1_CAT_PRD_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `magev1_catalog_product_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Varchar Attribute Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_link_attribute_varchar`
--

LOCK TABLES `magev1_catalog_product_link_attribute_varchar` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_link_attribute_varchar` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_product_link_attribute_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_link_type`
--

DROP TABLE IF EXISTS `magev1_catalog_product_link_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_link_type` (
  `link_type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link Type ID',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code',
  PRIMARY KEY (`link_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Catalog Product Link Type Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_link_type`
--

LOCK TABLES `magev1_catalog_product_link_type` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_link_type` DISABLE KEYS */;
INSERT INTO `magev1_catalog_product_link_type` VALUES (1,'relation'),(3,'super'),(4,'up_sell'),(5,'cross_sell');
/*!40000 ALTER TABLE `magev1_catalog_product_link_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_option`
--

DROP TABLE IF EXISTS `magev1_catalog_product_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `type` varchar(50) DEFAULT NULL COMMENT 'Type',
  `is_require` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Is Required',
  `sku` varchar(64) DEFAULT NULL COMMENT 'SKU',
  `max_characters` int(10) unsigned DEFAULT NULL COMMENT 'Max Characters',
  `file_extension` varchar(50) DEFAULT NULL COMMENT 'File Extension',
  `image_size_x` smallint(5) unsigned DEFAULT NULL COMMENT 'Image Size X',
  `image_size_y` smallint(5) unsigned DEFAULT NULL COMMENT 'Image Size Y',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`option_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_OPTION_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_MAGEV1_CAT_PRD_OPT_PRD_ID_MAGEV1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_option`
--

LOCK TABLES `magev1_catalog_product_option` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_product_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_option_price`
--

DROP TABLE IF EXISTS `magev1_catalog_product_option_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_option_price` (
  `option_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Price ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `price_type` varchar(7) NOT NULL DEFAULT 'fixed' COMMENT 'Price Type',
  PRIMARY KEY (`option_price_id`),
  UNIQUE KEY `UNQ_MAGEV1_CATALOG_PRODUCT_OPTION_PRICE_OPTION_ID_STORE_ID` (`option_id`,`store_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_OPTION_PRICE_OPTION_ID` (`option_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_OPTION_PRICE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_MAGEV1_CAT_PRD_OPT_PRICE_OPT_ID_MAGEV1_CAT_PRD_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `magev1_catalog_product_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CAT_PRD_OPT_PRICE_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Price Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_option_price`
--

LOCK TABLES `magev1_catalog_product_option_price` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_option_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_product_option_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_option_title`
--

DROP TABLE IF EXISTS `magev1_catalog_product_option_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_option_title` (
  `option_title_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Title ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`option_title_id`),
  UNIQUE KEY `UNQ_MAGEV1_CATALOG_PRODUCT_OPTION_TITLE_OPTION_ID_STORE_ID` (`option_id`,`store_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_OPTION_TITLE_OPTION_ID` (`option_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_OPTION_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_MAGEV1_CAT_PRD_OPT_TTL_OPT_ID_MAGEV1_CAT_PRD_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `magev1_catalog_product_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CAT_PRD_OPT_TTL_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Title Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_option_title`
--

LOCK TABLES `magev1_catalog_product_option_title` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_option_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_product_option_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_option_type_price`
--

DROP TABLE IF EXISTS `magev1_catalog_product_option_type_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_option_type_price` (
  `option_type_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Type Price ID',
  `option_type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Type ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `price_type` varchar(7) NOT NULL DEFAULT 'fixed' COMMENT 'Price Type',
  PRIMARY KEY (`option_type_price_id`),
  UNIQUE KEY `UNQ_MAGEV1_CAT_PRD_OPT_TYPE_PRICE_OPT_TYPE_ID_STORE_ID` (`option_type_id`,`store_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_OPTION_TYPE_PRICE_OPTION_TYPE_ID` (`option_type_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_OPTION_TYPE_PRICE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_CB7CF0351A1245B1EF56B71EF1DC95A7` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_D81D4BC3535840D93200171D26120E42` FOREIGN KEY (`option_type_id`) REFERENCES `magev1_catalog_product_option_type_value` (`option_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Type Price Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_option_type_price`
--

LOCK TABLES `magev1_catalog_product_option_type_price` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_option_type_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_product_option_type_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_option_type_title`
--

DROP TABLE IF EXISTS `magev1_catalog_product_option_type_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_option_type_title` (
  `option_type_title_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Type Title ID',
  `option_type_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Type ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`option_type_title_id`),
  UNIQUE KEY `UNQ_MAGEV1_CAT_PRD_OPT_TYPE_TTL_OPT_TYPE_ID_STORE_ID` (`option_type_id`,`store_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_OPTION_TYPE_TITLE_OPTION_TYPE_ID` (`option_type_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_OPTION_TYPE_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_59DAC6EF95068C8251B9742DB4FCE1E1` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_66E1A3677EA80DF9770BFD8C486C8DB7` FOREIGN KEY (`option_type_id`) REFERENCES `magev1_catalog_product_option_type_value` (`option_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Type Title Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_option_type_title`
--

LOCK TABLES `magev1_catalog_product_option_type_title` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_option_type_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_product_option_type_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_option_type_value`
--

DROP TABLE IF EXISTS `magev1_catalog_product_option_type_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_option_type_value` (
  `option_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Type ID',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option ID',
  `sku` varchar(64) DEFAULT NULL COMMENT 'SKU',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`option_type_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_OPTION_TYPE_VALUE_OPTION_ID` (`option_id`),
  CONSTRAINT `FK_MAGEV1_CAT_PRD_OPT_TYPE_VAL_OPT_ID_MAGEV1_CAT_PRD_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `magev1_catalog_product_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Option Type Value Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_option_type_value`
--

LOCK TABLES `magev1_catalog_product_option_type_value` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_option_type_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_product_option_type_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_relation`
--

DROP TABLE IF EXISTS `magev1_catalog_product_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_relation` (
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent ID',
  `child_id` int(10) unsigned NOT NULL COMMENT 'Child ID',
  PRIMARY KEY (`parent_id`,`child_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_RELATION_CHILD_ID` (`child_id`),
  CONSTRAINT `FK_MAGEV1_CAT_PRD_RELATION_CHILD_ID_MAGEV1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`child_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CAT_PRD_RELATION_PARENT_ID_MAGEV1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Relation Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_relation`
--

LOCK TABLES `magev1_catalog_product_relation` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_product_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_super_attribute`
--

DROP TABLE IF EXISTS `magev1_catalog_product_super_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_super_attribute` (
  `product_super_attribute_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product Super Attribute ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute ID',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Position',
  PRIMARY KEY (`product_super_attribute_id`),
  UNIQUE KEY `UNQ_MAGEV1_CAT_PRD_SPR_ATTR_PRD_ID_ATTR_ID` (`product_id`,`attribute_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_SUPER_ATTRIBUTE_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_MAGEV1_CAT_PRD_SPR_ATTR_PRD_ID_MAGEV1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Super Attribute Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_super_attribute`
--

LOCK TABLES `magev1_catalog_product_super_attribute` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_super_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_product_super_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_super_attribute_label`
--

DROP TABLE IF EXISTS `magev1_catalog_product_super_attribute_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_super_attribute_label` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_super_attribute_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Super Attribute ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `use_default` smallint(5) unsigned DEFAULT '0' COMMENT 'Use Default Value',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_MAGEV1_CAT_PRD_SPR_ATTR_LBL_PRD_SPR_ATTR_ID_STORE_ID` (`product_super_attribute_id`,`store_id`),
  KEY `IDX_MAGEV1_CAT_PRD_SPR_ATTR_LBL_PRD_SPR_ATTR_ID` (`product_super_attribute_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_SUPER_ATTRIBUTE_LABEL_STORE_ID` (`store_id`),
  CONSTRAINT `FK_091C74C58D50F5A17B7129C89973EFDB` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_6AE6C127598C409D8FFD09960319F01B` FOREIGN KEY (`product_super_attribute_id`) REFERENCES `magev1_catalog_product_super_attribute` (`product_super_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Super Attribute Label Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_super_attribute_label`
--

LOCK TABLES `magev1_catalog_product_super_attribute_label` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_super_attribute_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_product_super_attribute_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_super_attribute_pricing`
--

DROP TABLE IF EXISTS `magev1_catalog_product_super_attribute_pricing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_super_attribute_pricing` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value ID',
  `product_super_attribute_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Super Attribute ID',
  `value_index` varchar(255) DEFAULT NULL COMMENT 'Value Index',
  `is_percent` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Percent',
  `pricing_value` decimal(12,4) DEFAULT NULL COMMENT 'Pricing Value',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `F361DA2B14A7C864CDE0FB8ECD7D5189` (`product_super_attribute_id`,`value_index`,`website_id`),
  KEY `IDX_MAGEV1_CAT_PRD_SPR_ATTR_PRICING_PRD_SPR_ATTR_ID` (`product_super_attribute_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_SUPER_ATTRIBUTE_PRICING_WEBSITE_ID` (`website_id`),
  CONSTRAINT `FK_4BC8D9CC47ECEC9F3788FF19AEE91D13` FOREIGN KEY (`product_super_attribute_id`) REFERENCES `magev1_catalog_product_super_attribute` (`product_super_attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CAT_PRD_SPR_ATTR_PRICING_WS_ID_MAGEV1_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `magev1_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Super Attribute Pricing Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_super_attribute_pricing`
--

LOCK TABLES `magev1_catalog_product_super_attribute_pricing` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_super_attribute_pricing` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_product_super_attribute_pricing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_super_link`
--

DROP TABLE IF EXISTS `magev1_catalog_product_super_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_super_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parent ID',
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `UNQ_MAGEV1_CATALOG_PRODUCT_SUPER_LINK_PRODUCT_ID_PARENT_ID` (`product_id`,`parent_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_SUPER_LINK_PARENT_ID` (`parent_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_SUPER_LINK_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_MAGEV1_CAT_PRD_SPR_LNK_PARENT_ID_MAGEV1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CAT_PRD_SPR_LNK_PRD_ID_MAGEV1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product Super Link Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_super_link`
--

LOCK TABLES `magev1_catalog_product_super_link` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_super_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalog_product_super_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalog_product_website`
--

DROP TABLE IF EXISTS `magev1_catalog_product_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalog_product_website` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product ID',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website ID',
  PRIMARY KEY (`product_id`,`website_id`),
  KEY `IDX_MAGEV1_CATALOG_PRODUCT_WEBSITE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `FK_MAGEV1_CAT_PRD_WS_PRD_ID_MAGEV1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CAT_PRD_WS_WS_ID_MAGEV1_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `magev1_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Product To Website Linkage Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalog_product_website`
--

LOCK TABLES `magev1_catalog_product_website` WRITE;
/*!40000 ALTER TABLE `magev1_catalog_product_website` DISABLE KEYS */;
INSERT INTO `magev1_catalog_product_website` VALUES (13,1),(14,1),(15,1),(16,1),(18,1);
/*!40000 ALTER TABLE `magev1_catalog_product_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_cataloginventory_stock`
--

DROP TABLE IF EXISTS `magev1_cataloginventory_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_cataloginventory_stock` (
  `stock_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Stock Id',
  `stock_name` varchar(255) DEFAULT NULL COMMENT 'Stock Name',
  PRIMARY KEY (`stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_cataloginventory_stock`
--

LOCK TABLES `magev1_cataloginventory_stock` WRITE;
/*!40000 ALTER TABLE `magev1_cataloginventory_stock` DISABLE KEYS */;
INSERT INTO `magev1_cataloginventory_stock` VALUES (1,'Default');
/*!40000 ALTER TABLE `magev1_cataloginventory_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_cataloginventory_stock_item`
--

DROP TABLE IF EXISTS `magev1_cataloginventory_stock_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_cataloginventory_stock_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item Id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `stock_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Stock Id',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `min_qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Min Qty',
  `use_config_min_qty` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Min Qty',
  `is_qty_decimal` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Qty Decimal',
  `backorders` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Backorders',
  `use_config_backorders` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Backorders',
  `min_sale_qty` decimal(12,4) NOT NULL DEFAULT '1.0000' COMMENT 'Min Sale Qty',
  `use_config_min_sale_qty` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Min Sale Qty',
  `max_sale_qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Max Sale Qty',
  `use_config_max_sale_qty` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Max Sale Qty',
  `is_in_stock` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is In Stock',
  `low_stock_date` timestamp NULL DEFAULT NULL COMMENT 'Low Stock Date',
  `notify_stock_qty` decimal(12,4) DEFAULT NULL COMMENT 'Notify Stock Qty',
  `use_config_notify_stock_qty` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Notify Stock Qty',
  `manage_stock` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Manage Stock',
  `use_config_manage_stock` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Manage Stock',
  `stock_status_changed_auto` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Stock Status Changed Automatically',
  `use_config_qty_increments` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Qty Increments',
  `qty_increments` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Increments',
  `use_config_enable_qty_inc` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Use Config Enable Qty Increments',
  `enable_qty_increments` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Enable Qty Increments',
  `is_decimal_divided` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Divided into Multiple Boxes for Shipping',
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `UNQ_MAGEV1_CATALOGINVENTORY_STOCK_ITEM_PRODUCT_ID_STOCK_ID` (`product_id`,`stock_id`),
  KEY `IDX_MAGEV1_CATALOGINVENTORY_STOCK_ITEM_PRODUCT_ID` (`product_id`),
  KEY `IDX_MAGEV1_CATALOGINVENTORY_STOCK_ITEM_STOCK_ID` (`stock_id`),
  CONSTRAINT `FK_0A8F7C88DC6A36760AD3F1D7FFC28A03` FOREIGN KEY (`stock_id`) REFERENCES `magev1_cataloginventory_stock` (`stock_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CATINV_STOCK_ITEM_PRD_ID_MAGEV1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_cataloginventory_stock_item`
--

LOCK TABLES `magev1_cataloginventory_stock_item` WRITE;
/*!40000 ALTER TABLE `magev1_cataloginventory_stock_item` DISABLE KEYS */;
INSERT INTO `magev1_cataloginventory_stock_item` VALUES (12,12,1,0.0000,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2017-04-05 21:43:39',NULL,1,0,1,1,1,0.0000,1,0,0),(13,13,1,0.0000,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2017-04-05 22:01:21',NULL,1,0,1,1,1,0.0000,1,0,0),(14,14,1,20.0000,0.0000,1,0,0,1,1.0000,1,0.0000,1,1,NULL,NULL,1,0,1,0,1,0.0000,1,0,0),(15,15,1,0.0000,0.0000,1,0,0,1,1.0000,1,0.0000,1,1,NULL,NULL,1,0,1,0,1,0.0000,1,0,0),(16,16,1,0.0000,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2017-04-05 07:24:57',NULL,1,0,1,1,1,0.0000,1,0,0),(17,17,1,0.0000,0.0000,1,0,0,1,1.0000,1,0.0000,1,0,'2017-04-05 09:11:52',NULL,1,0,1,1,1,0.0000,1,0,0),(18,18,1,0.0000,0.0000,1,0,0,1,1.0000,1,0.0000,1,1,NULL,NULL,1,0,1,0,1,0.0000,1,0,0);
/*!40000 ALTER TABLE `magev1_cataloginventory_stock_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_cataloginventory_stock_status`
--

DROP TABLE IF EXISTS `magev1_cataloginventory_stock_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_cataloginventory_stock_status` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) unsigned NOT NULL COMMENT 'Stock Id',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint(5) unsigned NOT NULL COMMENT 'Stock Status',
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `IDX_MAGEV1_CATALOGINVENTORY_STOCK_STATUS_STOCK_ID` (`stock_id`),
  KEY `IDX_MAGEV1_CATALOGINVENTORY_STOCK_STATUS_WEBSITE_ID` (`website_id`),
  CONSTRAINT `FK_MAGEV1_CATINV_STOCK_STS_PRD_ID_MAGEV1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CATINV_STOCK_STS_STOCK_ID_MAGEV1_CATINV_STOCK_STOCK_ID` FOREIGN KEY (`stock_id`) REFERENCES `magev1_cataloginventory_stock` (`stock_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CATINV_STOCK_STS_WS_ID_MAGEV1_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `magev1_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Status';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_cataloginventory_stock_status`
--

LOCK TABLES `magev1_cataloginventory_stock_status` WRITE;
/*!40000 ALTER TABLE `magev1_cataloginventory_stock_status` DISABLE KEYS */;
INSERT INTO `magev1_cataloginventory_stock_status` VALUES (13,1,1,0.0000,0),(14,1,1,20.0000,1),(15,1,1,0.0000,0),(16,1,1,0.0000,0),(18,1,1,0.0000,0);
/*!40000 ALTER TABLE `magev1_cataloginventory_stock_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_cataloginventory_stock_status_idx`
--

DROP TABLE IF EXISTS `magev1_cataloginventory_stock_status_idx`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_cataloginventory_stock_status_idx` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) unsigned NOT NULL COMMENT 'Stock Id',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint(5) unsigned NOT NULL COMMENT 'Stock Status',
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `IDX_MAGEV1_CATALOGINVENTORY_STOCK_STATUS_IDX_STOCK_ID` (`stock_id`),
  KEY `IDX_MAGEV1_CATALOGINVENTORY_STOCK_STATUS_IDX_WEBSITE_ID` (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Status Indexer Idx';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_cataloginventory_stock_status_idx`
--

LOCK TABLES `magev1_cataloginventory_stock_status_idx` WRITE;
/*!40000 ALTER TABLE `magev1_cataloginventory_stock_status_idx` DISABLE KEYS */;
INSERT INTO `magev1_cataloginventory_stock_status_idx` VALUES (1,1,1,150.0000,1),(2,1,1,150.0000,1),(3,1,1,150.0000,1),(4,1,1,0.0000,1),(5,1,1,250.0000,1),(6,1,1,150.0000,1),(7,1,1,0.0000,1),(8,1,1,0.0000,1),(9,1,1,3.0000,1);
/*!40000 ALTER TABLE `magev1_cataloginventory_stock_status_idx` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_cataloginventory_stock_status_tmp`
--

DROP TABLE IF EXISTS `magev1_cataloginventory_stock_status_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_cataloginventory_stock_status_tmp` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `stock_id` smallint(5) unsigned NOT NULL COMMENT 'Stock Id',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `stock_status` smallint(5) unsigned NOT NULL COMMENT 'Stock Status',
  PRIMARY KEY (`product_id`,`website_id`,`stock_id`),
  KEY `IDX_MAGEV1_CATALOGINVENTORY_STOCK_STATUS_TMP_STOCK_ID` (`stock_id`),
  KEY `IDX_MAGEV1_CATALOGINVENTORY_STOCK_STATUS_TMP_WEBSITE_ID` (`website_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 COMMENT='Cataloginventory Stock Status Indexer Tmp';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_cataloginventory_stock_status_tmp`
--

LOCK TABLES `magev1_cataloginventory_stock_status_tmp` WRITE;
/*!40000 ALTER TABLE `magev1_cataloginventory_stock_status_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_cataloginventory_stock_status_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalogrule`
--

DROP TABLE IF EXISTS `magev1_catalogrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalogrule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `from_date` date DEFAULT NULL COMMENT 'From Date',
  `to_date` date DEFAULT NULL COMMENT 'To Date',
  `is_active` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Active',
  `conditions_serialized` mediumtext COMMENT 'Conditions Serialized',
  `actions_serialized` mediumtext COMMENT 'Actions Serialized',
  `stop_rules_processing` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Stop Rules Processing',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `simple_action` varchar(32) DEFAULT NULL COMMENT 'Simple Action',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `sub_is_enable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Rule Enable For Subitems',
  `sub_simple_action` varchar(32) DEFAULT NULL COMMENT 'Simple Action For Subitems',
  `sub_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount For Subitems',
  PRIMARY KEY (`rule_id`),
  KEY `IDX_MAGEV1_CATALOGRULE_IS_ACTIVE_SORT_ORDER_TO_DATE_FROM_DATE` (`is_active`,`sort_order`,`to_date`,`from_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalogrule`
--

LOCK TABLES `magev1_catalogrule` WRITE;
/*!40000 ALTER TABLE `magev1_catalogrule` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalogrule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalogrule_affected_product`
--

DROP TABLE IF EXISTS `magev1_catalogrule_affected_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalogrule_affected_product` (
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Affected Product';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalogrule_affected_product`
--

LOCK TABLES `magev1_catalogrule_affected_product` WRITE;
/*!40000 ALTER TABLE `magev1_catalogrule_affected_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalogrule_affected_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalogrule_customer_group`
--

DROP TABLE IF EXISTS `magev1_catalogrule_customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalogrule_customer_group` (
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  PRIMARY KEY (`rule_id`,`customer_group_id`),
  KEY `IDX_MAGEV1_CATALOGRULE_CUSTOMER_GROUP_RULE_ID` (`rule_id`),
  KEY `IDX_MAGEV1_CATALOGRULE_CUSTOMER_GROUP_CUSTOMER_GROUP_ID` (`customer_group_id`),
  CONSTRAINT `FK_6B197ABC46E8930BABD7142D0B25EA3D` FOREIGN KEY (`customer_group_id`) REFERENCES `magev1_customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CATRULE_CSTR_GROUP_RULE_ID_MAGEV1_CATRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `magev1_catalogrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Rules To Customer Groups Relations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalogrule_customer_group`
--

LOCK TABLES `magev1_catalogrule_customer_group` WRITE;
/*!40000 ALTER TABLE `magev1_catalogrule_customer_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalogrule_customer_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalogrule_group_website`
--

DROP TABLE IF EXISTS `magev1_catalogrule_group_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalogrule_group_website` (
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Rule Id',
  `customer_group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group Id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  PRIMARY KEY (`rule_id`,`customer_group_id`,`website_id`),
  KEY `IDX_MAGEV1_CATALOGRULE_GROUP_WEBSITE_RULE_ID` (`rule_id`),
  KEY `IDX_MAGEV1_CATALOGRULE_GROUP_WEBSITE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `IDX_MAGEV1_CATALOGRULE_GROUP_WEBSITE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `FK_9AA6E99E7A39A21DB70D8016151CC850` FOREIGN KEY (`customer_group_id`) REFERENCES `magev1_customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CATRULE_GROUP_WS_RULE_ID_MAGEV1_CATRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `magev1_catalogrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CATRULE_GROUP_WS_WS_ID_MAGEV1_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `magev1_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Group Website';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalogrule_group_website`
--

LOCK TABLES `magev1_catalogrule_group_website` WRITE;
/*!40000 ALTER TABLE `magev1_catalogrule_group_website` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalogrule_group_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalogrule_product`
--

DROP TABLE IF EXISTS `magev1_catalogrule_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalogrule_product` (
  `rule_product_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Product Id',
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Rule Id',
  `from_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'From Time',
  `to_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'To time',
  `customer_group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group Id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `action_operator` varchar(10) DEFAULT 'to_fixed' COMMENT 'Action Operator',
  `action_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Action Amount',
  `action_stop` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Action Stop',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `sub_simple_action` varchar(32) DEFAULT NULL COMMENT 'Simple Action For Subitems',
  `sub_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount For Subitems',
  PRIMARY KEY (`rule_product_id`),
  UNIQUE KEY `0D17839EA8333056357CB592EB249A9B` (`rule_id`,`from_time`,`to_time`,`website_id`,`customer_group_id`,`product_id`,`sort_order`),
  KEY `IDX_MAGEV1_CATALOGRULE_PRODUCT_RULE_ID` (`rule_id`),
  KEY `IDX_MAGEV1_CATALOGRULE_PRODUCT_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `IDX_MAGEV1_CATALOGRULE_PRODUCT_WEBSITE_ID` (`website_id`),
  KEY `IDX_MAGEV1_CATALOGRULE_PRODUCT_FROM_TIME` (`from_time`),
  KEY `IDX_MAGEV1_CATALOGRULE_PRODUCT_TO_TIME` (`to_time`),
  KEY `IDX_MAGEV1_CATALOGRULE_PRODUCT_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_4CD6BD34CD50C9DF782D26B4B2216927` FOREIGN KEY (`customer_group_id`) REFERENCES `magev1_customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CATALOGRULE_PRODUCT_RULE_ID_MAGEV1_CATALOGRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `magev1_catalogrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CATRULE_PRD_PRD_ID_MAGEV1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CATRULE_PRD_WS_ID_MAGEV1_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `magev1_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Product';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalogrule_product`
--

LOCK TABLES `magev1_catalogrule_product` WRITE;
/*!40000 ALTER TABLE `magev1_catalogrule_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalogrule_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalogrule_product_price`
--

DROP TABLE IF EXISTS `magev1_catalogrule_product_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalogrule_product_price` (
  `rule_product_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Product PriceId',
  `rule_date` date NOT NULL COMMENT 'Rule Date',
  `customer_group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Group Id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `rule_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Rule Price',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `latest_start_date` date DEFAULT NULL COMMENT 'Latest StartDate',
  `earliest_end_date` date DEFAULT NULL COMMENT 'Earliest EndDate',
  PRIMARY KEY (`rule_product_price_id`),
  UNIQUE KEY `8B9C53E85E2AEAAF1EE3FB31E4C8CC7B` (`rule_date`,`website_id`,`customer_group_id`,`product_id`),
  KEY `IDX_MAGEV1_CATALOGRULE_PRODUCT_PRICE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `IDX_MAGEV1_CATALOGRULE_PRODUCT_PRICE_WEBSITE_ID` (`website_id`),
  KEY `IDX_MAGEV1_CATALOGRULE_PRODUCT_PRICE_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_CB30A295C90A28A6D1510705CA0DC077` FOREIGN KEY (`customer_group_id`) REFERENCES `magev1_customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CATRULE_PRD_PRICE_PRD_ID_MAGEV1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CATRULE_PRD_PRICE_WS_ID_MAGEV1_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `magev1_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CatalogRule Product Price';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalogrule_product_price`
--

LOCK TABLES `magev1_catalogrule_product_price` WRITE;
/*!40000 ALTER TABLE `magev1_catalogrule_product_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalogrule_product_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalogrule_website`
--

DROP TABLE IF EXISTS `magev1_catalogrule_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalogrule_website` (
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  PRIMARY KEY (`rule_id`,`website_id`),
  KEY `IDX_MAGEV1_CATALOGRULE_WEBSITE_RULE_ID` (`rule_id`),
  KEY `IDX_MAGEV1_CATALOGRULE_WEBSITE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `FK_MAGEV1_CATALOGRULE_WEBSITE_RULE_ID_MAGEV1_CATALOGRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `magev1_catalogrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CATRULE_WS_WS_ID_MAGEV1_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `magev1_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog Rules To Websites Relations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalogrule_website`
--

LOCK TABLES `magev1_catalogrule_website` WRITE;
/*!40000 ALTER TABLE `magev1_catalogrule_website` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalogrule_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalogsearch_fulltext`
--

DROP TABLE IF EXISTS `magev1_catalogsearch_fulltext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalogsearch_fulltext` (
  `fulltext_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `data_index` longtext COMMENT 'Data index',
  PRIMARY KEY (`fulltext_id`),
  UNIQUE KEY `UNQ_MAGEV1_CATALOGSEARCH_FULLTEXT_PRODUCT_ID_STORE_ID` (`product_id`,`store_id`),
  FULLTEXT KEY `FTI_MAGEV1_CATALOGSEARCH_FULLTEXT_DATA_INDEX` (`data_index`)
) ENGINE=MyISAM AUTO_INCREMENT=108 DEFAULT CHARSET=utf8 COMMENT='Catalog search result table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalogsearch_fulltext`
--

LOCK TABLES `magev1_catalogsearch_fulltext` WRITE;
/*!40000 ALTER TABLE `magev1_catalogsearch_fulltext` DISABLE KEYS */;
INSERT INTO `magev1_catalogsearch_fulltext` VALUES (106,14,1,'sdfadgredgddsf|Natural|Aucun|Meuble|Petit meuble qui est vraiment pas mal|Petit meuble qui est vraiment pas mal|45|1'),(107,14,2,'sdfadgredgddsf|Natural|Aucun|Meuble|Petit meuble qui est vraiment pas mal|Petit meuble qui est vraiment pas mal|45|1');
/*!40000 ALTER TABLE `magev1_catalogsearch_fulltext` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalogsearch_query`
--

DROP TABLE IF EXISTS `magev1_catalogsearch_query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalogsearch_query` (
  `query_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Query ID',
  `query_text` varchar(255) DEFAULT NULL COMMENT 'Query text',
  `num_results` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Num results',
  `popularity` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Popularity',
  `redirect` varchar(255) DEFAULT NULL COMMENT 'Redirect',
  `synonym_for` varchar(255) DEFAULT NULL COMMENT 'Synonym for',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `display_in_terms` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Display in terms',
  `is_active` smallint(6) DEFAULT '1' COMMENT 'Active status',
  `is_processed` smallint(6) DEFAULT '0' COMMENT 'Processed status',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Updated at',
  PRIMARY KEY (`query_id`),
  KEY `IDX_MAGEV1_CATALOGSEARCH_QUERY_QUERY_TEXT_STORE_ID_POPULARITY` (`query_text`,`store_id`,`popularity`),
  KEY `IDX_MAGEV1_CATALOGSEARCH_QUERY_STORE_ID` (`store_id`),
  KEY `IDX_MAGEV1_MAGEV1_CATALOGSEARCH_QUERY_SYNONYM_FOR` (`synonym_for`),
  CONSTRAINT `FK_MAGEV1_CATSRCH_QR_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Catalog search query table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalogsearch_query`
--

LOCK TABLES `magev1_catalogsearch_query` WRITE;
/*!40000 ALTER TABLE `magev1_catalogsearch_query` DISABLE KEYS */;
INSERT INTO `magev1_catalogsearch_query` VALUES (1,'test',0,2,NULL,NULL,2,1,1,0,'2017-04-03 12:37:45'),(2,'fine travel duvet',1,1,NULL,NULL,2,1,1,0,'2017-04-03 12:39:56'),(3,'capsule',0,2,NULL,NULL,2,1,1,0,'2017-04-03 14:21:41');
/*!40000 ALTER TABLE `magev1_catalogsearch_query` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_catalogsearch_result`
--

DROP TABLE IF EXISTS `magev1_catalogsearch_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_catalogsearch_result` (
  `query_id` int(10) unsigned NOT NULL COMMENT 'Query ID',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product ID',
  `relevance` decimal(20,4) NOT NULL DEFAULT '0.0000' COMMENT 'Relevance',
  PRIMARY KEY (`query_id`,`product_id`),
  KEY `IDX_MAGEV1_CATALOGSEARCH_RESULT_QUERY_ID` (`query_id`),
  KEY `IDX_MAGEV1_CATALOGSEARCH_RESULT_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_MAGEV1_CATSRCH_RESULT_PRD_ID_MAGEV1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CATSRCH_RESULT_QR_ID_MAGEV1_CATSRCH_QR_QR_ID` FOREIGN KEY (`query_id`) REFERENCES `magev1_catalogsearch_query` (`query_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalog search result table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_catalogsearch_result`
--

LOCK TABLES `magev1_catalogsearch_result` WRITE;
/*!40000 ALTER TABLE `magev1_catalogsearch_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_catalogsearch_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_checkout_agreement`
--

DROP TABLE IF EXISTS `magev1_checkout_agreement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_checkout_agreement` (
  `agreement_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Agreement Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `content` text COMMENT 'Content',
  `content_height` varchar(25) DEFAULT NULL COMMENT 'Content Height',
  `checkbox_text` text COMMENT 'Checkbox Text',
  `is_active` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Active',
  `is_html` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Html',
  PRIMARY KEY (`agreement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Checkout Agreement';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_checkout_agreement`
--

LOCK TABLES `magev1_checkout_agreement` WRITE;
/*!40000 ALTER TABLE `magev1_checkout_agreement` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_checkout_agreement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_checkout_agreement_store`
--

DROP TABLE IF EXISTS `magev1_checkout_agreement_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_checkout_agreement_store` (
  `agreement_id` int(10) unsigned NOT NULL COMMENT 'Agreement Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  PRIMARY KEY (`agreement_id`,`store_id`),
  KEY `FK_MAGEV1_CHKT_AGRT_STORE_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_MAGEV1_CHKT_AGRT_STORE_AGRT_ID_MAGEV1_CHKT_AGRT_AGRT_ID` FOREIGN KEY (`agreement_id`) REFERENCES `magev1_checkout_agreement` (`agreement_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CHKT_AGRT_STORE_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Checkout Agreement Store';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_checkout_agreement_store`
--

LOCK TABLES `magev1_checkout_agreement_store` WRITE;
/*!40000 ALTER TABLE `magev1_checkout_agreement_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_checkout_agreement_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_cms_block`
--

DROP TABLE IF EXISTS `magev1_cms_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_cms_block` (
  `block_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Block ID',
  `title` varchar(255) NOT NULL COMMENT 'Block Title',
  `identifier` varchar(255) NOT NULL COMMENT 'Block String Identifier',
  `content` mediumtext COMMENT 'Block Content',
  `creation_time` timestamp NULL DEFAULT NULL COMMENT 'Block Creation Time',
  `update_time` timestamp NULL DEFAULT NULL COMMENT 'Block Modification Time',
  `is_active` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Is Block Active',
  PRIMARY KEY (`block_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='CMS Block Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_cms_block`
--

LOCK TABLES `magev1_cms_block` WRITE;
/*!40000 ALTER TABLE `magev1_cms_block` DISABLE KEYS */;
INSERT INTO `magev1_cms_block` VALUES (3,'Cookie restriction notice','cookie_restriction_notice_block','<p>This website requires cookies to provide all of its features. For more information on what data is contained in the cookies, please see our <a href=\"{{store direct_url=\"privacy-policy-cookie-restriction-mode\"}}\">Privacy Policy page</a>. To accept cookies from this site, please click the Allow button below.</p>','2017-03-15 10:25:03','2017-03-15 10:25:03',1),(6,'home_intro','home_intro','<h1 class=\"title_section\">ET SI ON VOUS EXPLIQUAIT ?</h1>\r\n<p class=\"introduce_text\">Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Maecenas faucibus mollis interdum. Donec ullamcorper nulla non metus auctor fringilla.</p>','2017-04-04 20:52:11','2017-04-04 21:29:46',1),(7,'footer_help','footer_help','<ul class=\"footer_list\">\r\n<li>Aide</li>\r\n<li><a href=\"#\">Assistance</a></li>\r\n<li><a href=\"#\">Suivi de commande</a></li>\r\n<li><a href=\"#\">Livraison</a></li>\r\n<li><a href=\"#\">Retours</a></li>\r\n</ul>','2017-04-04 22:10:29','2017-04-04 22:10:35',1),(8,'footer_follow','footer_follow','<ul class=\"footer_list\">\r\n<li>Nous suivre</li>\r\n<li><a href=\"#\">Facebook</a></li>\r\n<li><a href=\"#\">Twitter</a></li>\r\n<li><a href=\"#\">Instagram</a></li>\r\n</ul>','2017-04-04 22:11:33','2017-04-04 22:11:33',1),(9,'footer_mentions','footer_mentions','<ul class=\"footer_list\">\r\n<li>Mentions</li>\r\n<li><a href=\"#\">Mentions legales</a></li>\r\n<li><a href=\"#\">CGV</a></li>\r\n<li><a href=\"#\">Credits</a></li>\r\n</ul>','2017-04-04 22:12:39','2017-04-04 22:12:39',1),(10,'home_newsletter','home_newsletter','<h1 class=\"title_section title_section--newsletter\">Inscrivez-vous &agrave; notre newslewtter</h1>\r\n<p class=\"newsletter_text\">Nullam quis risus eget urna mollis ornare vel eu leo. Aenean eu leo quam. <br /> Pellentesque ornare sem lacinia quam venenatis vestibulum.</p>','2017-04-04 22:52:08','2017-04-04 23:00:01',1),(11,'home_promotion','home_promotion','<p>Jusqu\'au 1er Mai <span class=\"reduce\">-20% </span> Avec le code promo <span class=\"code\">Last-Day*</span></p>','2017-04-05 08:11:15','2017-04-05 08:11:15',1);
/*!40000 ALTER TABLE `magev1_cms_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_cms_block_store`
--

DROP TABLE IF EXISTS `magev1_cms_block_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_cms_block_store` (
  `block_id` smallint(6) NOT NULL COMMENT 'Block ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  PRIMARY KEY (`block_id`,`store_id`),
  KEY `IDX_MAGEV1_CMS_BLOCK_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_MAGEV1_CMS_BLOCK_STORE_BLOCK_ID_MAGEV1_CMS_BLOCK_BLOCK_ID` FOREIGN KEY (`block_id`) REFERENCES `magev1_cms_block` (`block_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CMS_BLOCK_STORE_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS Block To Store Linkage Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_cms_block_store`
--

LOCK TABLES `magev1_cms_block_store` WRITE;
/*!40000 ALTER TABLE `magev1_cms_block_store` DISABLE KEYS */;
INSERT INTO `magev1_cms_block_store` VALUES (3,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0);
/*!40000 ALTER TABLE `magev1_cms_block_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_cms_page`
--

DROP TABLE IF EXISTS `magev1_cms_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_cms_page` (
  `page_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Page ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Page Title',
  `root_template` varchar(255) DEFAULT NULL COMMENT 'Page Template',
  `meta_keywords` text COMMENT 'Page Meta Keywords',
  `meta_description` text COMMENT 'Page Meta Description',
  `identifier` varchar(100) DEFAULT NULL COMMENT 'Page String Identifier',
  `content_heading` varchar(255) DEFAULT NULL COMMENT 'Page Content Heading',
  `content` mediumtext COMMENT 'Page Content',
  `creation_time` timestamp NULL DEFAULT NULL COMMENT 'Page Creation Time',
  `update_time` timestamp NULL DEFAULT NULL COMMENT 'Page Modification Time',
  `is_active` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Is Page Active',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Page Sort Order',
  `layout_update_xml` text COMMENT 'Page Layout Update Content',
  `custom_theme` varchar(100) DEFAULT NULL COMMENT 'Page Custom Theme',
  `custom_root_template` varchar(255) DEFAULT NULL COMMENT 'Page Custom Template',
  `custom_layout_update_xml` text COMMENT 'Page Custom Layout Update Content',
  `custom_theme_from` date DEFAULT NULL COMMENT 'Page Custom Theme Active From Date',
  `custom_theme_to` date DEFAULT NULL COMMENT 'Page Custom Theme Active To Date',
  PRIMARY KEY (`page_id`),
  KEY `IDX_MAGEV1_CMS_PAGE_IDENTIFIER` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='CMS Page Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_cms_page`
--

LOCK TABLES `magev1_cms_page` WRITE;
/*!40000 ALTER TABLE `magev1_cms_page` DISABLE KEYS */;
INSERT INTO `magev1_cms_page` VALUES (1,'404 Not Found 1','two_columns_right','Page keywords','Page description','no-route',NULL,'\n<div class=\"page-title\"><h1>Whoops, our bad...</h1></div>\n<dl>\n    <dt>The page you requested was not found, and we have a fine guess why.</dt>\n    <dd>\n        <ul class=\"disc\">\n            <li>If you typed the URL directly, please make sure the spelling is correct.</li>\n            <li>If you clicked on a link to get here, the link is outdated.</li>\n        </ul>\n    </dd>\n</dl>\n<dl>\n    <dt>What can you do?</dt>\n    <dd>Have no fear, help is near! There are many ways you can get back on track with Magento Store.</dd>\n    <dd>\n        <ul class=\"disc\">\n            <li><a href=\"#\" onclick=\"history.go(-1); return false;\">Go back</a> to the previous page.</li>\n            <li>Use the search bar at the top of the page to search for your products.</li>\n            <li>Follow these links to get you back on track!<br /><a href=\"{{store url=\"\"}}\">Store Home</a>\n            <span class=\"separator\">|</span> <a href=\"{{store url=\"customer/account\"}}\">My Account</a></li>\n        </ul>\n    </dd>\n</dl>\n','2017-03-15 10:25:02','2017-03-15 10:25:02',1,0,NULL,NULL,NULL,NULL,NULL,NULL),(2,'Home page','homepage',NULL,NULL,'home',NULL,'<div class=\"page-title\">\r\n<h2>Home Page</h2>\r\n</div>','2017-03-15 10:25:02','2017-04-04 17:45:49',1,0,NULL,'room/default','homepage',NULL,NULL,NULL),(4,'Customer Service','three_columns',NULL,NULL,'customer-service',NULL,'<div class=\"page-title\">\n<h1>Customer Service</h1>\n</div>\n<ul class=\"disc\">\n<li><a href=\"#answer1\">Shipping &amp; Delivery</a></li>\n<li><a href=\"#answer2\">Privacy &amp; Security</a></li>\n<li><a href=\"#answer3\">Returns &amp; Replacements</a></li>\n<li><a href=\"#answer4\">Ordering</a></li>\n<li><a href=\"#answer5\">Payment, Pricing &amp; Promotions</a></li>\n<li><a href=\"#answer6\">Viewing Orders</a></li>\n<li><a href=\"#answer7\">Updating Account Information</a></li>\n</ul>\n<dl>\n<dt id=\"answer1\">Shipping &amp; Delivery</dt>\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit.\nMauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede.\nCras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in,\nfaucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa.\nPellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\nNunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec,\njusto.</dd>\n<dt id=\"answer2\">Privacy &amp; Security</dt>\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit.\nMauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede.\nCras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in,\nfaucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa.\nPellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\nNunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec,\njusto.</dd>\n<dt id=\"answer3\">Returns &amp; Replacements</dt>\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit.\nMauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede.\nCras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in,\nfaucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa.\nPellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\nNunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec,\njusto.</dd>\n<dt id=\"answer4\">Ordering</dt>\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit.\nMauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede.\nCras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in,\nfaucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa.\nPellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\nNunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec,\njusto.</dd>\n<dt id=\"answer5\">Payment, Pricing &amp; Promotions</dt>\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit.\nMauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede.\nCras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in,\nfaucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa.\nPellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\nNunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec,\njusto.</dd>\n<dt id=\"answer6\">Viewing Orders</dt>\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit.\nMauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede.\nCras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in,\nfaucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa.\n Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\n Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec,\n justo.</dd>\n<dt id=\"answer7\">Updating Account Information</dt>\n<dd>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi luctus. Duis lobortis. Nulla nec velit.\n Mauris pulvinar erat non massa. Suspendisse tortor turpis, porta nec, tempus vitae, iaculis semper, pede.\n Cras vel libero id lectus rhoncus porta. Suspendisse convallis felis ac enim. Vivamus tortor nisl, lobortis in,\n faucibus et, tempus at, dui. Nunc risus. Proin scelerisque augue. Nam ullamcorper. Phasellus id massa.\n Pellentesque nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.\n Nunc augue. Aenean sed justo non leo vehicula laoreet. Praesent ipsum libero, auctor ac, tempus nec, tempor nec,\n justo.</dd>\n</dl>','2017-03-15 10:25:02','2017-03-15 10:25:02',1,0,NULL,NULL,NULL,NULL,NULL,NULL),(5,'Enable Cookies','one_column',NULL,NULL,'enable-cookies',NULL,'<div class=\"std\">\n    <ul class=\"messages\">\n        <li class=\"notice-msg\">\n            <ul>\n                <li>Please enable cookies in your web browser to continue.</li>\n            </ul>\n        </li>\n    </ul>\n    <div class=\"page-title\">\n        <h1><a name=\"top\"></a>What are Cookies?</h1>\n    </div>\n    <p>Cookies are short pieces of data that are sent to your computer when you visit a website.\n    On later visits, this data is then returned to that website. Cookies allow us to recognize you automatically\n    whenever you visit our site so that we can personalize your experience and provide you with better service.\n    We also use cookies (and similar browser data, such as Flash cookies) for fraud prevention and other purposes.\n     If your web browser is set to refuse cookies from our website, you will not be able to complete a purchase\n     or take advantage of certain features of our website, such as storing items in your Shopping Cart or\n     receiving personalized recommendations. As a result, we strongly encourage you to configure your web\n     browser to accept cookies from our website.</p>\n    <h2 class=\"subtitle\">Enabling Cookies</h2>\n    <ul class=\"disc\">\n        <li><a href=\"#ie7\">Internet Explorer 7.x</a></li>\n        <li><a href=\"#ie6\">Internet Explorer 6.x</a></li>\n        <li><a href=\"#firefox\">Mozilla/Firefox</a></li>\n        <li><a href=\"#opera\">Opera 7.x</a></li>\n    </ul>\n    <h3><a name=\"ie7\"></a>Internet Explorer 7.x</h3>\n    <ol>\n        <li>\n            <p>Start Internet Explorer</p>\n        </li>\n        <li>\n            <p>Under the <strong>Tools</strong> menu, click <strong>Internet Options</strong></p>\n            <p><img src=\"{{skin url=\"images/cookies/ie7-1.gif\"}}\" alt=\"\" /></p>\n        </li>\n        <li>\n            <p>Click the <strong>Privacy</strong> tab</p>\n            <p><img src=\"{{skin url=\"images/cookies/ie7-2.gif\"}}\" alt=\"\" /></p>\n        </li>\n        <li>\n            <p>Click the <strong>Advanced</strong> button</p>\n            <p><img src=\"{{skin url=\"images/cookies/ie7-3.gif\"}}\" alt=\"\" /></p>\n        </li>\n        <li>\n            <p>Put a check mark in the box for <strong>Override Automatic Cookie Handling</strong>,\n            put another check mark in the <strong>Always accept session cookies </strong>box</p>\n            <p><img src=\"{{skin url=\"images/cookies/ie7-4.gif\"}}\" alt=\"\" /></p>\n        </li>\n        <li>\n            <p>Click <strong>OK</strong></p>\n            <p><img src=\"{{skin url=\"images/cookies/ie7-5.gif\"}}\" alt=\"\" /></p>\n        </li>\n        <li>\n            <p>Click <strong>OK</strong></p>\n            <p><img src=\"{{skin url=\"images/cookies/ie7-6.gif\"}}\" alt=\"\" /></p>\n        </li>\n        <li>\n            <p>Restart Internet Explore</p>\n        </li>\n    </ol>\n    <p class=\"a-top\"><a href=\"#top\">Back to Top</a></p>\n    <h3><a name=\"ie6\"></a>Internet Explorer 6.x</h3>\n    <ol>\n        <li>\n            <p>Select <strong>Internet Options</strong> from the Tools menu</p>\n            <p><img src=\"{{skin url=\"images/cookies/ie6-1.gif\"}}\" alt=\"\" /></p>\n        </li>\n        <li>\n            <p>Click on the <strong>Privacy</strong> tab</p>\n        </li>\n        <li>\n            <p>Click the <strong>Default</strong> button (or manually slide the bar down to <strong>Medium</strong>)\n            under <strong>Settings</strong>. Click <strong>OK</strong></p>\n            <p><img src=\"{{skin url=\"images/cookies/ie6-2.gif\"}}\" alt=\"\" /></p>\n        </li>\n    </ol>\n    <p class=\"a-top\"><a href=\"#top\">Back to Top</a></p>\n    <h3><a name=\"firefox\"></a>Mozilla/Firefox</h3>\n    <ol>\n        <li>\n            <p>Click on the <strong>Tools</strong>-menu in Mozilla</p>\n        </li>\n        <li>\n            <p>Click on the <strong>Options...</strong> item in the menu - a new window open</p>\n        </li>\n        <li>\n            <p>Click on the <strong>Privacy</strong> selection in the left part of the window. (See image below)</p>\n            <p><img src=\"{{skin url=\"images/cookies/firefox.png\"}}\" alt=\"\" /></p>\n        </li>\n        <li>\n            <p>Expand the <strong>Cookies</strong> section</p>\n        </li>\n        <li>\n            <p>Check the <strong>Enable cookies</strong> and <strong>Accept cookies normally</strong> checkboxes</p>\n        </li>\n        <li>\n            <p>Save changes by clicking <strong>Ok</strong>.</p>\n        </li>\n    </ol>\n    <p class=\"a-top\"><a href=\"#top\">Back to Top</a></p>\n    <h3><a name=\"opera\"></a>Opera 7.x</h3>\n    <ol>\n        <li>\n            <p>Click on the <strong>Tools</strong> menu in Opera</p>\n        </li>\n        <li>\n            <p>Click on the <strong>Preferences...</strong> item in the menu - a new window open</p>\n        </li>\n        <li>\n            <p>Click on the <strong>Privacy</strong> selection near the bottom left of the window. (See image below)</p>\n            <p><img src=\"{{skin url=\"images/cookies/opera.png\"}}\" alt=\"\" /></p>\n        </li>\n        <li>\n            <p>The <strong>Enable cookies</strong> checkbox must be checked, and <strong>Accept all cookies</strong>\n            should be selected in the &quot;<strong>Normal cookies</strong>&quot; drop-down</p>\n        </li>\n        <li>\n            <p>Save changes by clicking <strong>Ok</strong></p>\n        </li>\n    </ol>\n    <p class=\"a-top\"><a href=\"#top\">Back to Top</a></p>\n</div>\n','2017-03-15 10:25:02','2017-03-15 10:25:02',1,0,NULL,NULL,NULL,NULL,NULL,NULL),(6,'Privacy Policy','one_column',NULL,NULL,'privacy-policy-cookie-restriction-mode','Privacy Policy','<p style=\"color: #ff0000; font-weight: bold; font-size: 13px\">\n    Please replace this text with you Privacy Policy.\n    Please add any additional cookies your website uses below (e.g., Google Analytics)\n</p>\n<p>\n    This privacy policy sets out how {{config path=\"general/store_information/name\"}} uses and protects any information\n    that you give {{config path=\"general/store_information/name\"}} when you use this website.\n    {{config path=\"general/store_information/name\"}} is committed to ensuring that your privacy is protected.\n    Should we ask you to provide certain information by which you can be identified when using this website,\n    then you can be assured that it will only be used in accordance with this privacy statement.\n    {{config path=\"general/store_information/name\"}} may change this policy from time to time by updating this page.\n    You should check this page from time to time to ensure that you are happy with any changes.\n</p>\n<h2>What we collect</h2>\n<p>We may collect the following information:</p>\n<ul>\n    <li>name</li>\n    <li>contact information including email address</li>\n    <li>demographic information such as postcode, preferences and interests</li>\n    <li>other information relevant to customer surveys and/or offers</li>\n</ul>\n<p>\n    For the exhaustive list of cookies we collect see the <a href=\"#list\">List of cookies we collect</a> section.\n</p>\n<h2>What we do with the information we gather</h2>\n<p>\n    We require this information to understand your needs and provide you with a better service,\n    and in particular for the following reasons:\n</p>\n<ul>\n    <li>Internal record keeping.</li>\n    <li>We may use the information to improve our products and services.</li>\n    <li>\n        We may periodically send promotional emails about new products, special offers or other information which we\n        think you may find interesting using the email address which you have provided.\n    </li>\n    <li>\n        From time to time, we may also use your information to contact you for market research purposes.\n        We may contact you by email, phone, fax or mail. We may use the information to customise the website\n        according to your interests.\n    </li>\n</ul>\n<h2>Security</h2>\n<p>\n    We are committed to ensuring that your information is secure. In order to prevent unauthorised access or disclosure,\n    we have put in place suitable physical, electronic and managerial procedures to safeguard and secure\n    the information we collect online.\n</p>\n<h2>How we use cookies</h2>\n<p>\n    A cookie is a small file which asks permission to be placed on your computer\'s hard drive.\n    Once you agree, the file is added and the cookie helps analyse web traffic or lets you know when you visit\n    a particular site. Cookies allow web applications to respond to you as an individual. The web application\n    can tailor its operations to your needs, likes and dislikes by gathering and remembering information about\n    your preferences.\n</p>\n<p>\n    We use traffic log cookies to identify which pages are being used. This helps us analyse data about web page traffic\n    and improve our website in order to tailor it to customer needs. We only use this information for statistical\n    analysis purposes and then the data is removed from the system.\n</p>\n<p>\n    Overall, cookies help us provide you with a better website, by enabling us to monitor which pages you find useful\n    and which you do not. A cookie in no way gives us access to your computer or any information about you,\n    other than the data you choose to share with us. You can choose to accept or decline cookies.\n    Most web browsers automatically accept cookies, but you can usually modify your browser setting\n    to decline cookies if you prefer. This may prevent you from taking full advantage of the website.\n</p>\n<h2>Links to other websites</h2>\n<p>\n    Our website may contain links to other websites of interest. However, once you have used these links\n    to leave our site, you should note that we do not have any control over that other website.\n    Therefore, we cannot be responsible for the protection and privacy of any information which you provide whilst\n    visiting such sites and such sites are not governed by this privacy statement.\n    You should exercise caution and look at the privacy statement applicable to the website in question.\n</p>\n<h2>Controlling your personal information</h2>\n<p>You may choose to restrict the collection or use of your personal information in the following ways:</p>\n<ul>\n    <li>\n        whenever you are asked to fill in a form on the website, look for the box that you can click to indicate\n        that you do not want the information to be used by anybody for direct marketing purposes\n    </li>\n    <li>\n        if you have previously agreed to us using your personal information for direct marketing purposes,\n        you may change your mind at any time by writing to or emailing us at\n        {{config path=\"trans_email/ident_general/email\"}}\n    </li>\n</ul>\n<p>\n    We will not sell, distribute or lease your personal information to third parties unless we have your permission\n    or are required by law to do so. We may use your personal information to send you promotional information\n    about third parties which we think you may find interesting if you tell us that you wish this to happen.\n</p>\n<p>\n    You may request details of personal information which we hold about you under the Data Protection Act 1998.\n    A small fee will be payable. If you would like a copy of the information held on you please write to\n    {{config path=\"general/store_information/address\"}}.\n</p>\n<p>\n    If you believe that any information we are holding on you is incorrect or incomplete,\n    please write to or email us as soon as possible, at the above address.\n    We will promptly correct any information found to be incorrect.\n</p>\n<h2><a name=\"list\"></a>List of cookies we collect</h2>\n<p>The table below lists the cookies we collect and what information they store.</p>\n<table class=\"data-table\">\n    <thead>\n        <tr>\n            <th>COOKIE name</th>\n            <th>COOKIE Description</th>\n        </tr>\n    </thead>\n    <tbody>\n        <tr>\n            <th>CART</th>\n            <td>The association with your shopping cart.</td>\n        </tr>\n        <tr>\n            <th>CATEGORY_INFO</th>\n            <td>Stores the category info on the page, that allows to display pages more quickly.</td>\n        </tr>\n        <tr>\n            <th>COMPARE</th>\n            <td>The items that you have in the Compare Products list.</td>\n        </tr>\n        <tr>\n            <th>CURRENCY</th>\n            <td>Your preferred currency</td>\n        </tr>\n        <tr>\n            <th>CUSTOMER</th>\n            <td>An encrypted version of your customer id with the store.</td>\n        </tr>\n        <tr>\n            <th>CUSTOMER_AUTH</th>\n            <td>An indicator if you are currently logged into the store.</td>\n        </tr>\n        <tr>\n            <th>CUSTOMER_INFO</th>\n            <td>An encrypted version of the customer group you belong to.</td>\n        </tr>\n        <tr>\n            <th>CUSTOMER_SEGMENT_IDS</th>\n            <td>Stores the Customer Segment ID</td>\n        </tr>\n        <tr>\n            <th>EXTERNAL_NO_CACHE</th>\n            <td>A flag, which indicates whether caching is disabled or not.</td>\n        </tr>\n        <tr>\n            <th>FRONTEND</th>\n            <td>You sesssion ID on the server.</td>\n        </tr>\n        <tr>\n            <th>GUEST-VIEW</th>\n            <td>Allows guests to edit their orders.</td>\n        </tr>\n        <tr>\n            <th>LAST_CATEGORY</th>\n            <td>The last category you visited.</td>\n        </tr>\n        <tr>\n            <th>LAST_PRODUCT</th>\n            <td>The most recent product you have viewed.</td>\n        </tr>\n        <tr>\n            <th>NEWMESSAGE</th>\n            <td>Indicates whether a new message has been received.</td>\n        </tr>\n        <tr>\n            <th>NO_CACHE</th>\n            <td>Indicates whether it is allowed to use cache.</td>\n        </tr>\n        <tr>\n            <th>PERSISTENT_SHOPPING_CART</th>\n            <td>A link to information about your cart and viewing history if you have asked the site.</td>\n        </tr>\n        <tr>\n            <th>POLL</th>\n            <td>The ID of any polls you have recently voted in.</td>\n        </tr>\n        <tr>\n            <th>POLLN</th>\n            <td>Information on what polls you have voted on.</td>\n        </tr>\n        <tr>\n            <th>RECENTLYCOMPARED</th>\n            <td>The items that you have recently compared.            </td>\n        </tr>\n        <tr>\n            <th>STF</th>\n            <td>Information on products you have emailed to friends.</td>\n        </tr>\n        <tr>\n            <th>STORE</th>\n            <td>The store view or language you have selected.</td>\n        </tr>\n        <tr>\n            <th>USER_ALLOWED_SAVE_COOKIE</th>\n            <td>Indicates whether a customer allowed to use cookies.</td>\n        </tr>\n        <tr>\n            <th>VIEWED_PRODUCT_IDS</th>\n            <td>The products that you have recently viewed.</td>\n        </tr>\n        <tr>\n            <th>WISHLIST</th>\n            <td>An encrypted list of products added to your Wishlist.</td>\n        </tr>\n        <tr>\n            <th>WISHLIST_CNT</th>\n            <td>The number of items in your Wishlist.</td>\n        </tr>\n    </tbody>\n</table>','2017-03-15 10:25:03','2017-03-15 10:25:03',1,0,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `magev1_cms_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_cms_page_store`
--

DROP TABLE IF EXISTS `magev1_cms_page_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_cms_page_store` (
  `page_id` smallint(6) NOT NULL COMMENT 'Page ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  PRIMARY KEY (`page_id`,`store_id`),
  KEY `IDX_MAGEV1_CMS_PAGE_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_MAGEV1_CMS_PAGE_STORE_PAGE_ID_MAGEV1_CMS_PAGE_PAGE_ID` FOREIGN KEY (`page_id`) REFERENCES `magev1_cms_page` (`page_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CMS_PAGE_STORE_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='CMS Page To Store Linkage Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_cms_page_store`
--

LOCK TABLES `magev1_cms_page_store` WRITE;
/*!40000 ALTER TABLE `magev1_cms_page_store` DISABLE KEYS */;
INSERT INTO `magev1_cms_page_store` VALUES (1,0),(2,0),(4,0),(5,0),(6,0);
/*!40000 ALTER TABLE `magev1_cms_page_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_core_cache`
--

DROP TABLE IF EXISTS `magev1_core_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_core_cache` (
  `id` varchar(200) NOT NULL COMMENT 'Cache Id',
  `data` mediumblob COMMENT 'Cache Data',
  `create_time` int(11) DEFAULT NULL COMMENT 'Cache Creation Time',
  `update_time` int(11) DEFAULT NULL COMMENT 'Time of Cache Updating',
  `expire_time` int(11) DEFAULT NULL COMMENT 'Cache Expiration Time',
  PRIMARY KEY (`id`),
  KEY `IDX_MAGEV1_CORE_CACHE_EXPIRE_TIME` (`expire_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Caches';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_core_cache`
--

LOCK TABLES `magev1_core_cache` WRITE;
/*!40000 ALTER TABLE `magev1_core_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_core_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_core_cache_option`
--

DROP TABLE IF EXISTS `magev1_core_cache_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_core_cache_option` (
  `code` varchar(32) NOT NULL COMMENT 'Code',
  `value` smallint(6) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache Options';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_core_cache_option`
--

LOCK TABLES `magev1_core_cache_option` WRITE;
/*!40000 ALTER TABLE `magev1_core_cache_option` DISABLE KEYS */;
INSERT INTO `magev1_core_cache_option` VALUES ('block_html',0),('collections',0),('config',0),('config_api',0),('config_api2',0),('eav',0),('layout',0),('translate',0);
/*!40000 ALTER TABLE `magev1_core_cache_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_core_cache_tag`
--

DROP TABLE IF EXISTS `magev1_core_cache_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_core_cache_tag` (
  `tag` varchar(100) NOT NULL COMMENT 'Tag',
  `cache_id` varchar(200) NOT NULL COMMENT 'Cache Id',
  PRIMARY KEY (`tag`,`cache_id`),
  KEY `IDX_MAGEV1_CORE_CACHE_TAG_CACHE_ID` (`cache_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tag Caches';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_core_cache_tag`
--

LOCK TABLES `magev1_core_cache_tag` WRITE;
/*!40000 ALTER TABLE `magev1_core_cache_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_core_cache_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_core_config_data`
--

DROP TABLE IF EXISTS `magev1_core_config_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_core_config_data` (
  `config_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Config Id',
  `scope` varchar(8) NOT NULL DEFAULT 'default' COMMENT 'Config Scope',
  `scope_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Config Scope Id',
  `path` varchar(255) NOT NULL DEFAULT 'general' COMMENT 'Config Path',
  `value` text COMMENT 'Config Value',
  PRIMARY KEY (`config_id`),
  UNIQUE KEY `UNQ_MAGEV1_CORE_CONFIG_DATA_SCOPE_SCOPE_ID_PATH` (`scope`,`scope_id`,`path`)
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8 COMMENT='Config Data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_core_config_data`
--

LOCK TABLES `magev1_core_config_data` WRITE;
/*!40000 ALTER TABLE `magev1_core_config_data` DISABLE KEYS */;
INSERT INTO `magev1_core_config_data` VALUES (1,'default',0,'general/region/display_all','1'),(2,'default',0,'general/region/state_required','AT,CA,EE,FI,FR,DE,LV,LT,RO,ES,CH,US'),(3,'default',0,'catalog/category/root_id','2'),(4,'default',0,'payment/paypal_express/skip_order_review_step','1'),(5,'default',0,'payment/payflow_link/mobile_optimized','1'),(6,'default',0,'payment/payflow_advanced/mobile_optimized','1'),(7,'default',0,'payment/hosted_pro/mobile_optimized','1'),(8,'default',0,'web/seo/use_rewrites','0'),(9,'default',0,'admin/dashboard/enable_charts','1'),(10,'default',0,'web/unsecure/base_url','http://localhost:1112/'),(11,'default',0,'web/secure/base_url','http://localhost:1112/'),(12,'default',0,'general/locale/code','fr_FR'),(13,'default',0,'general/locale/timezone','Europe/Paris'),(14,'default',0,'currency/options/base','EUR'),(15,'default',0,'currency/options/default','EUR'),(16,'default',0,'currency/options/allow','EUR,USD'),(17,'default',0,'design/package/name','room'),(18,'default',0,'design/package/ua_regexp','a:0:{}'),(19,'default',0,'design/theme/locale',NULL),(20,'default',0,'design/theme/template','room'),(21,'default',0,'design/theme/template_ua_regexp','a:0:{}'),(22,'default',0,'design/theme/skin','room'),(23,'default',0,'design/theme/skin_ua_regexp','a:1:{s:17:\"_1491256546063_63\";a:2:{s:6:\"regexp\";s:0:\"\";s:5:\"value\";s:0:\"\";}}'),(24,'default',0,'design/theme/layout',NULL),(25,'default',0,'design/theme/layout_ua_regexp','a:0:{}'),(26,'default',0,'design/theme/default',NULL),(27,'default',0,'design/theme/default_ua_regexp','a:0:{}'),(28,'default',0,'design/head/default_title','Magento'),(29,'default',0,'design/head/title_prefix',NULL),(30,'default',0,'design/head/title_suffix',NULL),(31,'default',0,'design/head/default_description','Default Description'),(32,'default',0,'design/head/default_keywords','La piece'),(33,'default',0,'design/head/default_robots','INDEX,FOLLOW'),(34,'default',0,'design/head/includes',NULL),(35,'default',0,'design/head/demonotice','0'),(36,'default',0,'design/header/logo_src','images/logo.gif'),(37,'default',0,'design/header/logo_alt','Aulitfinelinens'),(38,'default',0,'design/header/logo_src_small','images/logo.svg'),(39,'default',0,'design/header/welcome','Welcome !'),(40,'default',0,'design/footer/copyright','&copy; 2017 Magento Demo Store. All Rights Reserved.'),(41,'default',0,'design/footer/absolute_footer',NULL),(42,'default',0,'design/watermark/image_size',NULL),(43,'default',0,'design/watermark/image_imageOpacity',NULL),(44,'default',0,'design/watermark/image_position','stretch'),(45,'default',0,'design/watermark/small_image_size',NULL),(46,'default',0,'design/watermark/small_image_imageOpacity',NULL),(47,'default',0,'design/watermark/small_image_position','stretch'),(48,'default',0,'design/watermark/thumbnail_size',NULL),(49,'default',0,'design/watermark/thumbnail_imageOpacity',NULL),(50,'default',0,'design/watermark/thumbnail_position','stretch'),(51,'default',0,'design/pagination/pagination_frame','5'),(52,'default',0,'design/pagination/pagination_frame_skip',NULL),(53,'default',0,'design/pagination/anchor_text_for_previous',NULL),(54,'default',0,'design/pagination/anchor_text_for_next',NULL),(55,'default',0,'design/email/logo_alt',NULL),(56,'default',0,'design/email/logo_width',NULL),(57,'default',0,'design/email/logo_height',NULL),(58,'default',0,'design/email/header','design_email_header'),(59,'default',0,'design/email/footer','design_email_footer'),(60,'default',0,'design/email/css_non_inline','email-non-inline.css'),(61,'default',0,'easypathhints/option/active','1'),(62,'default',0,'easypathhints/option/code',NULL),(63,'default',0,'advanced/modules_disable_output/Cm_RedisSession','0'),(64,'default',0,'advanced/modules_disable_output/Diva_Adminpanel','0'),(65,'default',0,'advanced/modules_disable_output/Diva_Handle','0'),(66,'default',0,'advanced/modules_disable_output/Diva_MenuImage','0'),(67,'default',0,'advanced/modules_disable_output/Diva_Tools','0'),(68,'default',0,'advanced/modules_disable_output/MagePsycho_Easypathhints','0'),(69,'default',0,'advanced/modules_disable_output/Mage_Admin','0'),(70,'default',0,'advanced/modules_disable_output/Mage_AdminNotification','0'),(71,'default',0,'advanced/modules_disable_output/Mage_Api','0'),(72,'default',0,'advanced/modules_disable_output/Mage_Api2','0'),(73,'default',0,'advanced/modules_disable_output/Mage_Authorizenet','0'),(74,'default',0,'advanced/modules_disable_output/Mage_Backup','0'),(75,'default',0,'advanced/modules_disable_output/Mage_Bundle','0'),(76,'default',0,'advanced/modules_disable_output/Mage_Captcha','0'),(77,'default',0,'advanced/modules_disable_output/Mage_Catalog','0'),(78,'default',0,'advanced/modules_disable_output/Mage_CatalogIndex','0'),(79,'default',0,'advanced/modules_disable_output/Mage_CatalogInventory','0'),(80,'default',0,'advanced/modules_disable_output/Mage_CatalogRule','0'),(81,'default',0,'advanced/modules_disable_output/Mage_CatalogSearch','0'),(82,'default',0,'advanced/modules_disable_output/Mage_Centinel','0'),(83,'default',0,'advanced/modules_disable_output/Mage_Checkout','0'),(84,'default',0,'advanced/modules_disable_output/Mage_Cms','0'),(85,'default',0,'advanced/modules_disable_output/Mage_Compiler','0'),(86,'default',0,'advanced/modules_disable_output/Mage_ConfigurableSwatches','0'),(87,'default',0,'advanced/modules_disable_output/Mage_Connect','0'),(88,'default',0,'advanced/modules_disable_output/Mage_Contacts','0'),(89,'default',0,'advanced/modules_disable_output/Mage_Core','0'),(90,'default',0,'advanced/modules_disable_output/Mage_Cron','0'),(91,'default',0,'advanced/modules_disable_output/Mage_CurrencySymbol','0'),(92,'default',0,'advanced/modules_disable_output/Mage_Customer','0'),(93,'default',0,'advanced/modules_disable_output/Mage_Dataflow','0'),(94,'default',0,'advanced/modules_disable_output/Mage_Directory','0'),(95,'default',0,'advanced/modules_disable_output/Mage_Downloadable','0'),(96,'default',0,'advanced/modules_disable_output/Mage_Eav','0'),(97,'default',0,'advanced/modules_disable_output/Mage_GiftMessage','0'),(98,'default',0,'advanced/modules_disable_output/Mage_GoogleAnalytics','0'),(99,'default',0,'advanced/modules_disable_output/Mage_GoogleCheckout','0'),(100,'default',0,'advanced/modules_disable_output/Mage_ImportExport','0'),(101,'default',0,'advanced/modules_disable_output/Mage_Index','0'),(102,'default',0,'advanced/modules_disable_output/Mage_Install','0'),(103,'default',0,'advanced/modules_disable_output/Mage_Log','0'),(104,'default',0,'advanced/modules_disable_output/Mage_Media','0'),(105,'default',0,'advanced/modules_disable_output/Mage_Newsletter','1'),(106,'default',0,'advanced/modules_disable_output/Mage_Oauth','0'),(107,'default',0,'advanced/modules_disable_output/Mage_Page','0'),(108,'default',0,'advanced/modules_disable_output/Mage_PageCache','0'),(109,'default',0,'advanced/modules_disable_output/Mage_Paygate','0'),(110,'default',0,'advanced/modules_disable_output/Mage_Payment','0'),(111,'default',0,'advanced/modules_disable_output/Mage_Paypal','0'),(112,'default',0,'advanced/modules_disable_output/Mage_PaypalUk','0'),(113,'default',0,'advanced/modules_disable_output/Mage_Persistent','0'),(114,'default',0,'advanced/modules_disable_output/Mage_Poll','0'),(115,'default',0,'advanced/modules_disable_output/Mage_ProductAlert','0'),(116,'default',0,'advanced/modules_disable_output/Mage_Rating','0'),(117,'default',0,'advanced/modules_disable_output/Mage_Reports','0'),(118,'default',0,'advanced/modules_disable_output/Mage_Review','0'),(119,'default',0,'advanced/modules_disable_output/Mage_Rss','0'),(120,'default',0,'advanced/modules_disable_output/Mage_Rule','0'),(121,'default',0,'advanced/modules_disable_output/Mage_Sales','0'),(122,'default',0,'advanced/modules_disable_output/Mage_SalesRule','0'),(123,'default',0,'advanced/modules_disable_output/Mage_Sendfriend','0'),(124,'default',0,'advanced/modules_disable_output/Mage_Shipping','0'),(125,'default',0,'advanced/modules_disable_output/Mage_Sitemap','0'),(126,'default',0,'advanced/modules_disable_output/Mage_Tag','1'),(127,'default',0,'advanced/modules_disable_output/Mage_Tax','0'),(128,'default',0,'advanced/modules_disable_output/Mage_Uploader','0'),(129,'default',0,'advanced/modules_disable_output/Mage_Usa','0'),(130,'default',0,'advanced/modules_disable_output/Mage_Weee','0'),(131,'default',0,'advanced/modules_disable_output/Mage_Widget','0'),(132,'default',0,'advanced/modules_disable_output/Mage_Wishlist','1'),(133,'default',0,'advanced/modules_disable_output/Mage_XmlConnect','0'),(134,'default',0,'advanced/modules_disable_output/Phoenix_Moneybookers','0'),(135,'default',0,'general/country/default','FR'),(136,'default',0,'general/country/allow','FR,GB'),(137,'default',0,'general/country/optional_zip_countries','HK,IE,MO,PA'),(138,'default',0,'general/country/eu_countries','AT,BE,BG,CY,CZ,DK,EE,FI,FR,DE,GR,HU,IE,IT,LV,LT,LU,MT,NL,PL,PT,RO,SK,SI,ES,SE,GB'),(139,'default',0,'general/locale/firstday','0'),(140,'default',0,'general/locale/weekend','0,6'),(141,'default',0,'general/store_information/name',NULL),(142,'default',0,'general/store_information/phone',NULL),(143,'default',0,'general/store_information/hours',NULL),(144,'default',0,'general/store_information/merchant_country',NULL),(145,'default',0,'general/store_information/merchant_vat_number',NULL),(146,'default',0,'general/store_information/address',NULL),(147,'stores',2,'general/locale/code','fr_FR'),(148,'stores',2,'general/locale/firstday','1'),(149,'stores',2,'general/locale/weekend','0,6'),(150,'default',0,'advanced/modules_disable_output/Inchoo_PHP7','1'),(151,'websites',1,'dev/debug/template_hints','0'),(152,'websites',1,'dev/debug/template_hints_blocks','0'),(153,'default',0,'dev/restrict/allow_ips',NULL),(154,'default',0,'dev/debug/profiler','0'),(155,'default',0,'dev/template/allow_symlink','0'),(156,'default',0,'dev/translate_inline/active','0'),(157,'default',0,'dev/translate_inline/active_admin','0'),(158,'default',0,'dev/log/active','0'),(159,'default',0,'dev/log/file','system.log'),(160,'default',0,'dev/log/exception_file','exception.log'),(161,'default',0,'dev/js/merge_files','0'),(162,'default',0,'dev/css/merge_css_files','0'),(163,'default',0,'currency/webservicex/timeout','100'),(164,'default',0,'currency/import/enabled','0'),(165,'default',0,'currency/import/service','webservicex'),(166,'default',0,'crontab/jobs/currency_rates_update/schedule/cron_expr','0 0 * * *'),(167,'default',0,'currency/import/time','00,00,00'),(168,'default',0,'currency/import/frequency','D'),(169,'default',0,'currency/import/error_email',NULL),(170,'default',0,'currency/import/error_email_identity','general'),(171,'default',0,'currency/import/error_email_template','currency_import_error_email_template'),(172,'default',0,'web/url/use_store','0'),(173,'default',0,'web/url/redirect_to_base','1'),(174,'default',0,'web/unsecure/base_link_url','{{unsecure_base_url}}'),(175,'default',0,'web/unsecure/base_skin_url','{{unsecure_base_url}}skin/'),(176,'default',0,'web/unsecure/base_media_url','{{unsecure_base_url}}media/'),(177,'default',0,'web/unsecure/base_js_url','{{unsecure_base_url}}js/'),(178,'default',0,'web/secure/base_link_url','{{secure_base_url}}'),(179,'default',0,'web/secure/base_skin_url','{{secure_base_url}}skin/'),(180,'default',0,'web/secure/base_media_url','{{secure_base_url}}media/'),(181,'default',0,'web/secure/base_js_url','{{secure_base_url}}js/'),(182,'default',0,'web/secure/use_in_frontend','0'),(183,'default',0,'web/secure/use_in_adminhtml','0'),(184,'default',0,'web/secure/offloader_header','SSL_OFFLOADED'),(185,'default',0,'web/default/front','cms'),(186,'default',0,'web/default/cms_home_page','home'),(187,'default',0,'web/default/no_route','cms/index/noRoute'),(188,'default',0,'web/default/cms_no_route','no-route'),(189,'default',0,'web/default/cms_no_cookies','enable-cookies'),(190,'default',0,'web/default/show_cms_breadcrumbs','1'),(191,'default',0,'web/polls/poll_check_by_ip','0'),(192,'default',0,'web/cookie/cookie_lifetime','3600'),(193,'default',0,'web/cookie/cookie_path',NULL),(194,'default',0,'web/cookie/cookie_domain',NULL),(195,'default',0,'web/cookie/cookie_httponly','1'),(196,'default',0,'web/cookie/cookie_restriction','0'),(197,'default',0,'web/session/use_remote_addr','0'),(198,'default',0,'web/session/use_http_via','0'),(199,'default',0,'web/session/use_http_x_forwarded_for','0'),(200,'default',0,'web/session/use_http_user_agent','0'),(201,'default',0,'web/session/use_frontend_sid','1'),(202,'default',0,'web/browser_capabilities/cookies','1'),(203,'default',0,'web/browser_capabilities/javascript','1');
/*!40000 ALTER TABLE `magev1_core_config_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_core_email_queue`
--

DROP TABLE IF EXISTS `magev1_core_email_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_core_email_queue` (
  `message_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Message Id',
  `entity_id` int(10) unsigned DEFAULT NULL COMMENT 'Entity ID',
  `entity_type` varchar(128) DEFAULT NULL COMMENT 'Entity Type',
  `event_type` varchar(128) DEFAULT NULL COMMENT 'Event Type',
  `message_body_hash` varchar(64) NOT NULL COMMENT 'Message Body Hash',
  `message_body` mediumtext NOT NULL COMMENT 'Message Body',
  `message_parameters` text NOT NULL COMMENT 'Message Parameters',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Creation Time',
  `processed_at` timestamp NULL DEFAULT NULL COMMENT 'Finish Time',
  PRIMARY KEY (`message_id`),
  KEY `DE5764585C9C1844DC47417BF6BF8747` (`entity_id`,`entity_type`,`event_type`,`message_body_hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Email Queue';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_core_email_queue`
--

LOCK TABLES `magev1_core_email_queue` WRITE;
/*!40000 ALTER TABLE `magev1_core_email_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_core_email_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_core_email_queue_recipients`
--

DROP TABLE IF EXISTS `magev1_core_email_queue_recipients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_core_email_queue_recipients` (
  `recipient_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Recipient Id',
  `message_id` int(10) unsigned NOT NULL COMMENT 'Message ID',
  `recipient_email` varchar(128) NOT NULL COMMENT 'Recipient Email',
  `recipient_name` varchar(255) NOT NULL COMMENT 'Recipient Name',
  `email_type` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Email Type',
  PRIMARY KEY (`recipient_id`),
  UNIQUE KEY `23EAC3B5564B654AE5EBD46E7441F23B` (`message_id`,`recipient_email`,`email_type`),
  KEY `IDX_MAGEV1_CORE_EMAIL_QUEUE_RECIPIENTS_RECIPIENT_EMAIL` (`recipient_email`),
  KEY `IDX_MAGEV1_CORE_EMAIL_QUEUE_RECIPIENTS_EMAIL_TYPE` (`email_type`),
  CONSTRAINT `FK_8847C4A737F6D5B299FF3535813ED159` FOREIGN KEY (`message_id`) REFERENCES `magev1_core_email_queue` (`message_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Email Queue';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_core_email_queue_recipients`
--

LOCK TABLES `magev1_core_email_queue_recipients` WRITE;
/*!40000 ALTER TABLE `magev1_core_email_queue_recipients` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_core_email_queue_recipients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_core_email_template`
--

DROP TABLE IF EXISTS `magev1_core_email_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_core_email_template` (
  `template_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Template Id',
  `template_code` varchar(150) NOT NULL COMMENT 'Template Name',
  `template_text` text NOT NULL COMMENT 'Template Content',
  `template_styles` text COMMENT 'Templste Styles',
  `template_type` int(10) unsigned DEFAULT NULL COMMENT 'Template Type',
  `template_subject` varchar(200) NOT NULL COMMENT 'Template Subject',
  `template_sender_name` varchar(200) DEFAULT NULL COMMENT 'Template Sender Name',
  `template_sender_email` varchar(200) DEFAULT NULL COMMENT 'Template Sender Email',
  `added_at` timestamp NULL DEFAULT NULL COMMENT 'Date of Template Creation',
  `modified_at` timestamp NULL DEFAULT NULL COMMENT 'Date of Template Modification',
  `orig_template_code` varchar(200) DEFAULT NULL COMMENT 'Original Template Code',
  `orig_template_variables` text COMMENT 'Original Template Variables',
  PRIMARY KEY (`template_id`),
  UNIQUE KEY `UNQ_MAGEV1_CORE_EMAIL_TEMPLATE_TEMPLATE_CODE` (`template_code`),
  KEY `IDX_MAGEV1_CORE_EMAIL_TEMPLATE_ADDED_AT` (`added_at`),
  KEY `IDX_MAGEV1_CORE_EMAIL_TEMPLATE_MODIFIED_AT` (`modified_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Email Templates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_core_email_template`
--

LOCK TABLES `magev1_core_email_template` WRITE;
/*!40000 ALTER TABLE `magev1_core_email_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_core_email_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_core_flag`
--

DROP TABLE IF EXISTS `magev1_core_flag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_core_flag` (
  `flag_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Flag Id',
  `flag_code` varchar(255) NOT NULL COMMENT 'Flag Code',
  `state` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Flag State',
  `flag_data` text COMMENT 'Flag Data',
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date of Last Flag Update',
  PRIMARY KEY (`flag_id`),
  KEY `IDX_MAGEV1_CORE_FLAG_LAST_UPDATE` (`last_update`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Flag';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_core_flag`
--

LOCK TABLES `magev1_core_flag` WRITE;
/*!40000 ALTER TABLE `magev1_core_flag` DISABLE KEYS */;
INSERT INTO `magev1_core_flag` VALUES (1,'admin_notification_survey',0,'a:1:{s:13:\"survey_viewed\";b:1;}','2017-03-15 10:27:13'),(2,'catalog_product_flat',0,'a:2:{s:8:\"is_built\";b:1;s:16:\"is_store_built_1\";b:1;}','2017-03-15 13:22:15');
/*!40000 ALTER TABLE `magev1_core_flag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_core_layout_link`
--

DROP TABLE IF EXISTS `magev1_core_layout_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_core_layout_link` (
  `layout_link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `area` varchar(64) DEFAULT NULL COMMENT 'Area',
  `package` varchar(64) DEFAULT NULL COMMENT 'Package',
  `theme` varchar(64) DEFAULT NULL COMMENT 'Theme',
  `layout_update_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Layout Update Id',
  PRIMARY KEY (`layout_link_id`),
  UNIQUE KEY `UNQ_MAGEV1_CORE_LYT_LNK_STORE_ID_PACKAGE_THEME_LYT_UPDATE_ID` (`store_id`,`package`,`theme`,`layout_update_id`),
  KEY `IDX_MAGEV1_CORE_LAYOUT_LINK_LAYOUT_UPDATE_ID` (`layout_update_id`),
  CONSTRAINT `FK_6C766A7333F8F2B327B49B569AF5BBD5` FOREIGN KEY (`layout_update_id`) REFERENCES `magev1_core_layout_update` (`layout_update_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CORE_LAYOUT_LINK_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Layout Link';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_core_layout_link`
--

LOCK TABLES `magev1_core_layout_link` WRITE;
/*!40000 ALTER TABLE `magev1_core_layout_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_core_layout_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_core_layout_update`
--

DROP TABLE IF EXISTS `magev1_core_layout_update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_core_layout_update` (
  `layout_update_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Layout Update Id',
  `handle` varchar(255) DEFAULT NULL COMMENT 'Handle',
  `xml` text COMMENT 'Xml',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`layout_update_id`),
  KEY `IDX_MAGEV1_CORE_LAYOUT_UPDATE_HANDLE` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Layout Updates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_core_layout_update`
--

LOCK TABLES `magev1_core_layout_update` WRITE;
/*!40000 ALTER TABLE `magev1_core_layout_update` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_core_layout_update` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_core_resource`
--

DROP TABLE IF EXISTS `magev1_core_resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_core_resource` (
  `code` varchar(50) NOT NULL COMMENT 'Resource Code',
  `version` varchar(50) DEFAULT NULL COMMENT 'Resource Version',
  `data_version` varchar(50) DEFAULT NULL COMMENT 'Data Version',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Resources';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_core_resource`
--

LOCK TABLES `magev1_core_resource` WRITE;
/*!40000 ALTER TABLE `magev1_core_resource` DISABLE KEYS */;
INSERT INTO `magev1_core_resource` VALUES ('adminnotification_setup','1.6.0.0','1.6.0.0'),('admin_setup','1.6.1.2','1.6.1.2'),('api2_setup','1.0.0.0','1.0.0.0'),('api_setup','1.6.0.1','1.6.0.1'),('backup_setup','1.6.0.0','1.6.0.0'),('bundle_setup','1.6.0.0.1','1.6.0.0.1'),('captcha_setup','1.7.0.0.0','1.7.0.0.0'),('catalogindex_setup','1.6.0.0','1.6.0.0'),('cataloginventory_setup','1.6.0.0.2','1.6.0.0.2'),('catalogrule_setup','1.6.0.3','1.6.0.3'),('catalogsearch_setup','1.8.2.0','1.8.2.0'),('catalog_setup','1.6.0.0.19.1.5','1.6.0.0.19.1.5'),('checkout_setup','1.6.0.0','1.6.0.0'),('cms_setup','1.6.0.0.2','1.6.0.0.2'),('compiler_setup','1.6.0.0','1.6.0.0'),('contacts_setup','1.6.0.0','1.6.0.0'),('core_setup','1.6.0.6','1.6.0.6'),('cron_setup','1.6.0.0','1.6.0.0'),('customer_setup','1.6.2.0.5','1.6.2.0.5'),('dataflow_setup','1.6.0.0','1.6.0.0'),('directory_setup','1.6.0.3','1.6.0.3'),('downloadable_setup','1.6.0.0.2','1.6.0.0.2'),('eav_setup','1.6.0.1','1.6.0.1'),('giftmessage_setup','1.6.0.0','1.6.0.0'),('googleanalytics_setup','1.6.0.0','1.6.0.0'),('importexport_setup','1.6.0.2','1.6.0.2'),('index_setup','1.6.0.0','1.6.0.0'),('log_setup','1.6.1.1','1.6.1.1'),('moneybookers_setup','1.6.0.0','1.6.0.0'),('newsletter_setup','1.6.0.2','1.6.0.2'),('oauth_setup','1.0.0.0','1.0.0.0'),('paygate_setup','1.6.0.0','1.6.0.0'),('payment_setup','1.6.0.0','1.6.0.0'),('paypaluk_setup','1.6.0.0','1.6.0.0'),('paypal_setup','1.6.0.6','1.6.0.6'),('persistent_setup','1.0.0.0','1.0.0.0'),('poll_setup','1.6.0.1','1.6.0.1'),('productalert_setup','1.6.0.0','1.6.0.0'),('rating_setup','1.6.0.1','1.6.0.1'),('reports_setup','1.6.0.0.1','1.6.0.0.1'),('review_setup','1.6.0.0','1.6.0.0'),('rss_setup','1.6.0.0','1.6.0.0'),('salesrule_setup','1.6.0.3','1.6.0.3'),('sales_setup','1.6.0.10','1.6.0.10'),('sendfriend_setup','1.6.0.1','1.6.0.1'),('shipping_setup','1.6.0.0','1.6.0.0'),('sitemap_setup','1.6.0.0','1.6.0.0'),('tag_setup','1.6.0.0','1.6.0.0'),('tax_setup','1.6.0.4','1.6.0.4'),('usa_setup','1.6.0.3','1.6.0.3'),('weee_setup','1.6.0.0','1.6.0.0'),('widget_setup','1.6.0.0','1.6.0.0'),('wishlist_setup','1.6.0.0','1.6.0.0');
/*!40000 ALTER TABLE `magev1_core_resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_core_session`
--

DROP TABLE IF EXISTS `magev1_core_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_core_session` (
  `session_id` varchar(255) NOT NULL COMMENT 'Session Id',
  `session_expires` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Date of Session Expiration',
  `session_data` mediumblob NOT NULL COMMENT 'Session Data',
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Database Sessions Storage';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_core_session`
--

LOCK TABLES `magev1_core_session` WRITE;
/*!40000 ALTER TABLE `magev1_core_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_core_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_core_store`
--

DROP TABLE IF EXISTS `magev1_core_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_core_store` (
  `store_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Store Id',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Group Id',
  `name` varchar(255) NOT NULL COMMENT 'Store Name',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Sort Order',
  `is_active` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Activity',
  PRIMARY KEY (`store_id`),
  UNIQUE KEY `UNQ_MAGEV1_CORE_STORE_CODE` (`code`),
  KEY `IDX_MAGEV1_CORE_STORE_WEBSITE_ID` (`website_id`),
  KEY `IDX_MAGEV1_CORE_STORE_IS_ACTIVE_SORT_ORDER` (`is_active`,`sort_order`),
  KEY `IDX_MAGEV1_CORE_STORE_GROUP_ID` (`group_id`),
  CONSTRAINT `FK_MAGEV1_CORE_STORE_GROUP_ID_MAGEV1_CORE_STORE_GROUP_GROUP_ID` FOREIGN KEY (`group_id`) REFERENCES `magev1_core_store_group` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CORE_STORE_WEBSITE_ID_MAGEV1_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `magev1_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Stores';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_core_store`
--

LOCK TABLES `magev1_core_store` WRITE;
/*!40000 ALTER TABLE `magev1_core_store` DISABLE KEYS */;
INSERT INTO `magev1_core_store` VALUES (0,'admin',0,0,'Admin',0,1),(1,'default',1,1,'English',0,1),(2,'french',1,1,'FranÃ§ais',0,1);
/*!40000 ALTER TABLE `magev1_core_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_core_store_group`
--

DROP TABLE IF EXISTS `magev1_core_store_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_core_store_group` (
  `group_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Group Id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `name` varchar(255) NOT NULL COMMENT 'Store Group Name',
  `root_category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Root Category Id',
  `default_store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Default Store Id',
  PRIMARY KEY (`group_id`),
  KEY `IDX_MAGEV1_CORE_STORE_GROUP_WEBSITE_ID` (`website_id`),
  KEY `IDX_MAGEV1_CORE_STORE_GROUP_DEFAULT_STORE_ID` (`default_store_id`),
  CONSTRAINT `FK_MAGEV1_CORE_STORE_GROUP_WS_ID_MAGEV1_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `magev1_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Store Groups';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_core_store_group`
--

LOCK TABLES `magev1_core_store_group` WRITE;
/*!40000 ALTER TABLE `magev1_core_store_group` DISABLE KEYS */;
INSERT INTO `magev1_core_store_group` VALUES (0,0,'Default',0,0),(1,1,'Main Website Store',2,1);
/*!40000 ALTER TABLE `magev1_core_store_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_core_translate`
--

DROP TABLE IF EXISTS `magev1_core_translate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_core_translate` (
  `key_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Key Id of Translation',
  `string` varchar(255) NOT NULL DEFAULT 'Translate String' COMMENT 'Translation String',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `translate` varchar(255) DEFAULT NULL COMMENT 'Translate',
  `locale` varchar(20) NOT NULL DEFAULT 'en_US' COMMENT 'Locale',
  `crc_string` bigint(20) NOT NULL DEFAULT '1591228201' COMMENT 'Translation String CRC32 Hash',
  PRIMARY KEY (`key_id`),
  UNIQUE KEY `UNQ_MAGEV1_CORE_TRANSLATE_STORE_ID_LOCALE_CRC_STRING_STRING` (`store_id`,`locale`,`crc_string`,`string`),
  KEY `IDX_MAGEV1_CORE_TRANSLATE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_MAGEV1_CORE_TRANSLATE_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Translations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_core_translate`
--

LOCK TABLES `magev1_core_translate` WRITE;
/*!40000 ALTER TABLE `magev1_core_translate` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_core_translate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_core_url_rewrite`
--

DROP TABLE IF EXISTS `magev1_core_url_rewrite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_core_url_rewrite` (
  `url_rewrite_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rewrite Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `id_path` varchar(255) DEFAULT NULL COMMENT 'Id Path',
  `request_path` varchar(255) DEFAULT NULL COMMENT 'Request Path',
  `target_path` varchar(255) DEFAULT NULL COMMENT 'Target Path',
  `is_system` smallint(5) unsigned DEFAULT '1' COMMENT 'Defines is Rewrite System',
  `options` varchar(255) DEFAULT NULL COMMENT 'Options',
  `description` varchar(255) DEFAULT NULL COMMENT 'Deascription',
  `category_id` int(10) unsigned DEFAULT NULL COMMENT 'Category Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  PRIMARY KEY (`url_rewrite_id`),
  UNIQUE KEY `UNQ_MAGEV1_CORE_URL_REWRITE_REQUEST_PATH_STORE_ID` (`request_path`,`store_id`),
  UNIQUE KEY `UNQ_MAGEV1_CORE_URL_REWRITE_ID_PATH_IS_SYSTEM_STORE_ID` (`id_path`,`is_system`,`store_id`),
  KEY `IDX_MAGEV1_CORE_URL_REWRITE_TARGET_PATH_STORE_ID` (`target_path`,`store_id`),
  KEY `IDX_MAGEV1_CORE_URL_REWRITE_ID_PATH` (`id_path`),
  KEY `IDX_MAGEV1_CORE_URL_REWRITE_STORE_ID` (`store_id`),
  KEY `FK_MAGEV1_CORE_URL_REWRITE_CTGR_ID_MAGEV1_CAT_CTGR_ENTT_ENTT_ID` (`category_id`),
  KEY `FK_MAGEV1_CORE_URL_REWRITE_PRD_ID_MAGEV1_CAT_CTGR_ENTT_ENTT_ID` (`product_id`),
  CONSTRAINT `FK_MAGEV1_CORE_URL_REWRITE_CTGR_ID_MAGEV1_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`category_id`) REFERENCES `magev1_catalog_category_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CORE_URL_REWRITE_PRD_ID_MAGEV1_CAT_CTGR_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CORE_URL_REWRITE_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=420 DEFAULT CHARSET=utf8 COMMENT='Url Rewrites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_core_url_rewrite`
--

LOCK TABLES `magev1_core_url_rewrite` WRITE;
/*!40000 ALTER TABLE `magev1_core_url_rewrite` DISABLE KEYS */;
INSERT INTO `magev1_core_url_rewrite` VALUES (330,1,'category/17','les-pieces.html','catalog/category/view/id/17',1,NULL,NULL,17,NULL),(331,2,'category/17','les-pieces.html','catalog/category/view/id/17',1,NULL,NULL,17,NULL),(345,1,'36347600_1491348969','chambre.html','les-pieces.html',0,'RP',NULL,17,NULL),(347,2,'36717000_1491348969','chambre.html','les-pieces.html',0,'RP',NULL,17,NULL),(364,1,'category/19','les-pieces/barroque.html','catalog/category/view/id/19',1,NULL,NULL,19,NULL),(365,2,'category/19','les-pieces/barroque.html','catalog/category/view/id/19',1,NULL,NULL,19,NULL),(370,1,'product/15/19','les-pieces/barroque/piece-barroque.html','catalog/product/view/id/15/category/19',1,NULL,NULL,19,15),(371,1,'product/15','piece-barroque.html','catalog/product/view/id/15',1,NULL,NULL,NULL,15),(372,2,'product/15/19','les-pieces/barroque/piece-barroque.html','catalog/product/view/id/15/category/19',1,NULL,NULL,19,15),(373,2,'product/15','piece-barroque.html','catalog/product/view/id/15',1,NULL,NULL,NULL,15),(375,1,'product/14','meuble.html','catalog/product/view/id/14',1,NULL,NULL,NULL,14),(377,2,'product/14','meuble.html','catalog/product/view/id/14',1,NULL,NULL,NULL,14),(380,1,'category/21','les-produits.html','catalog/category/view/id/21',1,NULL,NULL,21,NULL),(382,1,'product/14/21','les-produits/meuble.html','catalog/product/view/id/14/category/21',1,NULL,NULL,21,14),(383,2,'category/21','les-produits.html','catalog/category/view/id/21',1,NULL,NULL,21,NULL),(385,2,'product/14/21','les-produits/meuble.html','catalog/product/view/id/14/category/21',1,NULL,NULL,21,14),(386,1,'product/16/21','les-produits/meuble-16.html','catalog/product/view/id/16/category/21',1,NULL,NULL,21,16),(387,1,'product/16','meuble-16.html','catalog/product/view/id/16',1,NULL,NULL,NULL,16),(388,2,'product/16/21','les-produits/meuble-16.html','catalog/product/view/id/16/category/21',1,NULL,NULL,21,16),(389,2,'product/16','meuble-16.html','catalog/product/view/id/16',1,NULL,NULL,NULL,16),(412,1,'product/18/19','les-pieces/barroque/piece-barroque-18.html','catalog/product/view/id/18/category/19',1,NULL,NULL,19,18),(413,1,'product/18','piece-barroque-18.html','catalog/product/view/id/18',1,NULL,NULL,NULL,18),(414,2,'product/18/19','les-pieces/barroque/piece-barroque-18.html','catalog/product/view/id/18/category/19',1,NULL,NULL,19,18),(415,2,'product/18','piece-barroque-18.html','catalog/product/view/id/18',1,NULL,NULL,NULL,18),(416,1,'product/13/21','les-produits/fauteuil.html','catalog/product/view/id/13/category/21',1,NULL,NULL,21,13),(417,1,'product/13','fauteuil.html','catalog/product/view/id/13',1,NULL,NULL,NULL,13),(418,2,'product/13/21','les-produits/fauteuil.html','catalog/product/view/id/13/category/21',1,NULL,NULL,21,13),(419,2,'product/13','fauteuil.html','catalog/product/view/id/13',1,NULL,NULL,NULL,13);
/*!40000 ALTER TABLE `magev1_core_url_rewrite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_core_variable`
--

DROP TABLE IF EXISTS `magev1_core_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_core_variable` (
  `variable_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Variable Id',
  `code` varchar(255) DEFAULT NULL COMMENT 'Variable Code',
  `name` varchar(255) DEFAULT NULL COMMENT 'Variable Name',
  PRIMARY KEY (`variable_id`),
  UNIQUE KEY `UNQ_MAGEV1_CORE_VARIABLE_CODE` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Variables';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_core_variable`
--

LOCK TABLES `magev1_core_variable` WRITE;
/*!40000 ALTER TABLE `magev1_core_variable` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_core_variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_core_variable_value`
--

DROP TABLE IF EXISTS `magev1_core_variable_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_core_variable_value` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Variable Value Id',
  `variable_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Variable Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `plain_value` text COMMENT 'Plain Text Value',
  `html_value` text COMMENT 'Html Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_MAGEV1_CORE_VARIABLE_VALUE_VARIABLE_ID_STORE_ID` (`variable_id`,`store_id`),
  KEY `IDX_MAGEV1_CORE_VARIABLE_VALUE_VARIABLE_ID` (`variable_id`),
  KEY `IDX_MAGEV1_CORE_VARIABLE_VALUE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_A9654A6E4EAFF34C160E857119DA4A68` FOREIGN KEY (`variable_id`) REFERENCES `magev1_core_variable` (`variable_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CORE_VARIABLE_VAL_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Variable Value';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_core_variable_value`
--

LOCK TABLES `magev1_core_variable_value` WRITE;
/*!40000 ALTER TABLE `magev1_core_variable_value` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_core_variable_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_core_website`
--

DROP TABLE IF EXISTS `magev1_core_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_core_website` (
  `website_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Website Id',
  `code` varchar(32) DEFAULT NULL COMMENT 'Code',
  `name` varchar(64) DEFAULT NULL COMMENT 'Website Name',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `default_group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Default Group Id',
  `is_default` smallint(5) unsigned DEFAULT '0' COMMENT 'Defines Is Website Default',
  PRIMARY KEY (`website_id`),
  UNIQUE KEY `UNQ_MAGEV1_CORE_WEBSITE_CODE` (`code`),
  KEY `IDX_MAGEV1_CORE_WEBSITE_SORT_ORDER` (`sort_order`),
  KEY `IDX_MAGEV1_CORE_WEBSITE_DEFAULT_GROUP_ID` (`default_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Websites';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_core_website`
--

LOCK TABLES `magev1_core_website` WRITE;
/*!40000 ALTER TABLE `magev1_core_website` DISABLE KEYS */;
INSERT INTO `magev1_core_website` VALUES (0,'admin','Admin',0,0,0),(1,'base','Main Website',0,1,1);
/*!40000 ALTER TABLE `magev1_core_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_coupon_aggregated`
--

DROP TABLE IF EXISTS `magev1_coupon_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_coupon_aggregated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date NOT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT 'Coupon Code',
  `coupon_uses` int(11) NOT NULL DEFAULT '0' COMMENT 'Coupon Uses',
  `subtotal_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `total_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount',
  `subtotal_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount Actual',
  `discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount Actual',
  `total_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount Actual',
  `rule_name` varchar(255) DEFAULT NULL COMMENT 'Rule Name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_MAGEV1_COUPON_AGGRED_PERIOD_STORE_ID_ORDER_STS_COUPON_CODE` (`period`,`store_id`,`order_status`,`coupon_code`),
  KEY `IDX_MAGEV1_COUPON_AGGREGATED_STORE_ID` (`store_id`),
  KEY `IDX_MAGEV1_COUPON_AGGREGATED_RULE_NAME` (`rule_name`),
  CONSTRAINT `FK_MAGEV1_COUPON_AGGREGATED_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Coupon Aggregated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_coupon_aggregated`
--

LOCK TABLES `magev1_coupon_aggregated` WRITE;
/*!40000 ALTER TABLE `magev1_coupon_aggregated` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_coupon_aggregated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_coupon_aggregated_order`
--

DROP TABLE IF EXISTS `magev1_coupon_aggregated_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_coupon_aggregated_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date NOT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT 'Coupon Code',
  `coupon_uses` int(11) NOT NULL DEFAULT '0' COMMENT 'Coupon Uses',
  `subtotal_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `total_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount',
  `rule_name` varchar(255) DEFAULT NULL COMMENT 'Rule Name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `C7F6C53221A0D6C2F742A98E5406D26D` (`period`,`store_id`,`order_status`,`coupon_code`),
  KEY `IDX_MAGEV1_COUPON_AGGREGATED_ORDER_STORE_ID` (`store_id`),
  KEY `IDX_MAGEV1_COUPON_AGGREGATED_ORDER_RULE_NAME` (`rule_name`),
  CONSTRAINT `FK_DDCBC41C4BDF78EFB189EBC3A72A5817` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Coupon Aggregated Order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_coupon_aggregated_order`
--

LOCK TABLES `magev1_coupon_aggregated_order` WRITE;
/*!40000 ALTER TABLE `magev1_coupon_aggregated_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_coupon_aggregated_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_coupon_aggregated_updated`
--

DROP TABLE IF EXISTS `magev1_coupon_aggregated_updated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_coupon_aggregated_updated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date NOT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `coupon_code` varchar(50) DEFAULT NULL COMMENT 'Coupon Code',
  `coupon_uses` int(11) NOT NULL DEFAULT '0' COMMENT 'Coupon Uses',
  `subtotal_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `total_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount',
  `subtotal_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal Amount Actual',
  `discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount Actual',
  `total_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Amount Actual',
  `rule_name` varchar(255) DEFAULT NULL COMMENT 'Rule Name',
  PRIMARY KEY (`id`),
  UNIQUE KEY `6F7C9AC9570A7E33EC845F6F390F9C04` (`period`,`store_id`,`order_status`,`coupon_code`),
  KEY `IDX_MAGEV1_COUPON_AGGREGATED_UPDATED_STORE_ID` (`store_id`),
  KEY `IDX_MAGEV1_COUPON_AGGREGATED_UPDATED_RULE_NAME` (`rule_name`),
  CONSTRAINT `FK_3466849CE0B6A3CA6BFBE4ED21ADC13B` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Magev1 Coupon Aggregated Updated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_coupon_aggregated_updated`
--

LOCK TABLES `magev1_coupon_aggregated_updated` WRITE;
/*!40000 ALTER TABLE `magev1_coupon_aggregated_updated` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_coupon_aggregated_updated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_cron_schedule`
--

DROP TABLE IF EXISTS `magev1_cron_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_cron_schedule` (
  `schedule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Schedule Id',
  `job_code` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Job Code',
  `status` varchar(7) NOT NULL DEFAULT 'pending' COMMENT 'Status',
  `messages` text COMMENT 'Messages',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Created At',
  `scheduled_at` timestamp NULL DEFAULT NULL COMMENT 'Scheduled At',
  `executed_at` timestamp NULL DEFAULT NULL COMMENT 'Executed At',
  `finished_at` timestamp NULL DEFAULT NULL COMMENT 'Finished At',
  PRIMARY KEY (`schedule_id`),
  KEY `IDX_MAGEV1_CRON_SCHEDULE_JOB_CODE` (`job_code`),
  KEY `IDX_MAGEV1_CRON_SCHEDULE_SCHEDULED_AT_STATUS` (`scheduled_at`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cron Schedule';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_cron_schedule`
--

LOCK TABLES `magev1_cron_schedule` WRITE;
/*!40000 ALTER TABLE `magev1_cron_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_cron_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_customer_address_entity`
--

DROP TABLE IF EXISTS `magev1_customer_address_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_customer_address_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Id',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Updated At',
  `is_active` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Active',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_MAGEV1_CUSTOMER_ADDRESS_ENTITY_PARENT_ID` (`parent_id`),
  CONSTRAINT `FK_MAGEV1_CSTR_ADDR_ENTT_PARENT_ID_MAGEV1_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`parent_id`) REFERENCES `magev1_customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_customer_address_entity`
--

LOCK TABLES `magev1_customer_address_entity` WRITE;
/*!40000 ALTER TABLE `magev1_customer_address_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_customer_address_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_customer_address_entity_datetime`
--

DROP TABLE IF EXISTS `magev1_customer_address_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_customer_address_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_MAGEV1_CSTR_ADDR_ENTT_DTIME_ENTT_ID_ATTR_ID` (`entity_id`,`attribute_id`),
  KEY `IDX_MAGEV1_CUSTOMER_ADDRESS_ENTITY_DATETIME_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_MAGEV1_CUSTOMER_ADDRESS_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_MAGEV1_CUSTOMER_ADDRESS_ENTITY_DATETIME_ENTITY_ID` (`entity_id`),
  KEY `IDX_MAGEV1_CSTR_ADDR_ENTT_DTIME_ENTT_ID_ATTR_ID_VAL` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `FK_93F8D0EFE02A7E7F014061E759ACF886` FOREIGN KEY (`entity_type_id`) REFERENCES `magev1_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_D1B85C89DFF71489F53B5DB28962574D` FOREIGN KEY (`entity_id`) REFERENCES `magev1_customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CSTR_ADDR_ENTT_DTIME_ATTR_ID_MAGEV1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `magev1_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Datetime';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_customer_address_entity_datetime`
--

LOCK TABLES `magev1_customer_address_entity_datetime` WRITE;
/*!40000 ALTER TABLE `magev1_customer_address_entity_datetime` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_customer_address_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_customer_address_entity_decimal`
--

DROP TABLE IF EXISTS `magev1_customer_address_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_customer_address_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_MAGEV1_CSTR_ADDR_ENTT_DEC_ENTT_ID_ATTR_ID` (`entity_id`,`attribute_id`),
  KEY `IDX_MAGEV1_CUSTOMER_ADDRESS_ENTITY_DECIMAL_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_MAGEV1_CUSTOMER_ADDRESS_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_MAGEV1_CUSTOMER_ADDRESS_ENTITY_DECIMAL_ENTITY_ID` (`entity_id`),
  KEY `IDX_MAGEV1_CSTR_ADDR_ENTT_DEC_ENTT_ID_ATTR_ID_VAL` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `FK_0D48108BC6ED7BE0A105F9F528DA4514` FOREIGN KEY (`entity_id`) REFERENCES `magev1_customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_9260FAA830475D7FA4A9D241FDB55D31` FOREIGN KEY (`entity_type_id`) REFERENCES `magev1_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CSTR_ADDR_ENTT_DEC_ATTR_ID_MAGEV1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `magev1_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Decimal';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_customer_address_entity_decimal`
--

LOCK TABLES `magev1_customer_address_entity_decimal` WRITE;
/*!40000 ALTER TABLE `magev1_customer_address_entity_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_customer_address_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_customer_address_entity_int`
--

DROP TABLE IF EXISTS `magev1_customer_address_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_customer_address_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` int(11) NOT NULL DEFAULT '0' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_MAGEV1_CUSTOMER_ADDRESS_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `IDX_MAGEV1_CUSTOMER_ADDRESS_ENTITY_INT_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_MAGEV1_CUSTOMER_ADDRESS_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_MAGEV1_CUSTOMER_ADDRESS_ENTITY_INT_ENTITY_ID` (`entity_id`),
  KEY `IDX_MAGEV1_CSTR_ADDR_ENTT_INT_ENTT_ID_ATTR_ID_VAL` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `FK_27E53972DFB18E3B60074EC50AEDE40C` FOREIGN KEY (`entity_type_id`) REFERENCES `magev1_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_FB1B12EE60B068109C84482066D4892B` FOREIGN KEY (`entity_id`) REFERENCES `magev1_customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CSTR_ADDR_ENTT_INT_ATTR_ID_MAGEV1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `magev1_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Int';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_customer_address_entity_int`
--

LOCK TABLES `magev1_customer_address_entity_int` WRITE;
/*!40000 ALTER TABLE `magev1_customer_address_entity_int` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_customer_address_entity_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_customer_address_entity_text`
--

DROP TABLE IF EXISTS `magev1_customer_address_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_customer_address_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` text NOT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_MAGEV1_CUSTOMER_ADDRESS_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `IDX_MAGEV1_CUSTOMER_ADDRESS_ENTITY_TEXT_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_MAGEV1_CUSTOMER_ADDRESS_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_MAGEV1_CUSTOMER_ADDRESS_ENTITY_TEXT_ENTITY_ID` (`entity_id`),
  CONSTRAINT `FK_912538579FB7873D8E5CBD2B1D88DBE2` FOREIGN KEY (`entity_id`) REFERENCES `magev1_customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_F450C2FE51EB6444237E0B006B67B2EB` FOREIGN KEY (`entity_type_id`) REFERENCES `magev1_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CSTR_ADDR_ENTT_TEXT_ATTR_ID_MAGEV1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `magev1_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Text';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_customer_address_entity_text`
--

LOCK TABLES `magev1_customer_address_entity_text` WRITE;
/*!40000 ALTER TABLE `magev1_customer_address_entity_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_customer_address_entity_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_customer_address_entity_varchar`
--

DROP TABLE IF EXISTS `magev1_customer_address_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_customer_address_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_MAGEV1_CSTR_ADDR_ENTT_VCHR_ENTT_ID_ATTR_ID` (`entity_id`,`attribute_id`),
  KEY `IDX_MAGEV1_CUSTOMER_ADDRESS_ENTITY_VARCHAR_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_MAGEV1_CUSTOMER_ADDRESS_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_MAGEV1_CUSTOMER_ADDRESS_ENTITY_VARCHAR_ENTITY_ID` (`entity_id`),
  KEY `IDX_MAGEV1_CSTR_ADDR_ENTT_VCHR_ENTT_ID_ATTR_ID_VAL` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `FK_EB4EAD11F656850DF791438F3E3FC3EB` FOREIGN KEY (`entity_type_id`) REFERENCES `magev1_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_F445AE97AA40E2C4321E9F42A7D82B67` FOREIGN KEY (`entity_id`) REFERENCES `magev1_customer_address_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CSTR_ADDR_ENTT_VCHR_ATTR_ID_MAGEV1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `magev1_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Address Entity Varchar';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_customer_address_entity_varchar`
--

LOCK TABLES `magev1_customer_address_entity_varchar` WRITE;
/*!40000 ALTER TABLE `magev1_customer_address_entity_varchar` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_customer_address_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_customer_eav_attribute`
--

DROP TABLE IF EXISTS `magev1_customer_eav_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_customer_eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  `is_visible` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Visible',
  `input_filter` varchar(255) DEFAULT NULL COMMENT 'Input Filter',
  `multiline_count` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Multiline Count',
  `validate_rules` text COMMENT 'Validate Rules',
  `is_system` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is System',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `data_model` varchar(255) DEFAULT NULL COMMENT 'Data Model',
  PRIMARY KEY (`attribute_id`),
  CONSTRAINT `FK_MAGEV1_CSTR_EAV_ATTR_ATTR_ID_MAGEV1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `magev1_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Eav Attribute';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_customer_eav_attribute`
--

LOCK TABLES `magev1_customer_eav_attribute` WRITE;
/*!40000 ALTER TABLE `magev1_customer_eav_attribute` DISABLE KEYS */;
INSERT INTO `magev1_customer_eav_attribute` VALUES (1,1,NULL,0,NULL,1,10,NULL),(2,0,NULL,0,NULL,1,0,NULL),(3,1,NULL,0,NULL,1,20,NULL),(4,0,NULL,0,NULL,0,30,NULL),(5,1,NULL,0,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',1,40,NULL),(6,1,NULL,0,NULL,0,50,NULL),(7,1,NULL,0,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',1,60,NULL),(8,0,NULL,0,NULL,0,70,NULL),(9,1,NULL,0,'a:1:{s:16:\"input_validation\";s:5:\"email\";}',1,80,NULL),(10,1,NULL,0,NULL,1,25,NULL),(11,0,'date',0,'a:1:{s:16:\"input_validation\";s:4:\"date\";}',0,90,NULL),(12,0,NULL,0,NULL,1,0,NULL),(13,0,NULL,0,NULL,1,0,NULL),(14,0,NULL,0,NULL,1,0,NULL),(15,0,NULL,0,'a:1:{s:15:\"max_text_length\";i:255;}',0,100,NULL),(16,0,NULL,0,NULL,1,0,NULL),(17,0,'datetime',0,NULL,0,0,NULL),(18,0,NULL,0,'a:0:{}',0,110,NULL),(19,0,NULL,0,NULL,0,10,NULL),(20,1,NULL,0,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',1,20,NULL),(21,1,NULL,0,NULL,0,30,NULL),(22,1,NULL,0,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',1,40,NULL),(23,0,NULL,0,NULL,0,50,NULL),(24,1,NULL,0,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',1,60,NULL),(25,1,NULL,2,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',1,70,NULL),(26,1,NULL,0,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',1,80,NULL),(27,1,NULL,0,NULL,1,90,NULL),(28,1,NULL,0,NULL,1,100,NULL),(29,1,NULL,0,NULL,1,100,NULL),(30,1,NULL,0,'a:0:{}',1,110,'customer/attribute_data_postcode'),(31,1,NULL,0,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',1,120,NULL),(32,1,NULL,0,'a:2:{s:15:\"max_text_length\";i:255;s:15:\"min_text_length\";i:1;}',1,130,NULL),(33,0,NULL,0,NULL,1,0,NULL),(34,0,NULL,0,'a:1:{s:16:\"input_validation\";s:4:\"date\";}',1,0,NULL),(35,1,NULL,0,NULL,1,28,NULL),(36,1,NULL,0,NULL,1,140,NULL),(37,0,NULL,0,NULL,1,0,NULL),(38,0,NULL,0,NULL,1,0,NULL),(39,0,NULL,0,NULL,1,0,NULL),(40,0,NULL,0,NULL,1,0,NULL);
/*!40000 ALTER TABLE `magev1_customer_eav_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_customer_eav_attribute_website`
--

DROP TABLE IF EXISTS `magev1_customer_eav_attribute_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_customer_eav_attribute_website` (
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `is_visible` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Visible',
  `is_required` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Required',
  `default_value` text COMMENT 'Default Value',
  `multiline_count` smallint(5) unsigned DEFAULT NULL COMMENT 'Multiline Count',
  PRIMARY KEY (`attribute_id`,`website_id`),
  KEY `IDX_MAGEV1_CUSTOMER_EAV_ATTRIBUTE_WEBSITE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `FK_MAGEV1_CSTR_EAV_ATTR_WS_ATTR_ID_MAGEV1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `magev1_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CSTR_EAV_ATTR_WS_WS_ID_MAGEV1_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `magev1_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Eav Attribute Website';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_customer_eav_attribute_website`
--

LOCK TABLES `magev1_customer_eav_attribute_website` WRITE;
/*!40000 ALTER TABLE `magev1_customer_eav_attribute_website` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_customer_eav_attribute_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_customer_entity`
--

DROP TABLE IF EXISTS `magev1_customer_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_customer_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set Id',
  `website_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Website Id',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Group Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `store_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Store Id',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Updated At',
  `is_active` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Active',
  `disable_auto_group_change` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Disable automatic group change based on VAT ID',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_MAGEV1_CUSTOMER_ENTITY_EMAIL_WEBSITE_ID` (`email`,`website_id`),
  KEY `IDX_MAGEV1_CUSTOMER_ENTITY_STORE_ID` (`store_id`),
  KEY `IDX_MAGEV1_CUSTOMER_ENTITY_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_MAGEV1_CUSTOMER_ENTITY_EMAIL_WEBSITE_ID` (`email`,`website_id`),
  KEY `IDX_MAGEV1_CUSTOMER_ENTITY_WEBSITE_ID` (`website_id`),
  CONSTRAINT `FK_MAGEV1_CSTR_ENTT_WS_ID_MAGEV1_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `magev1_core_website` (`website_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CUSTOMER_ENTITY_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_customer_entity`
--

LOCK TABLES `magev1_customer_entity` WRITE;
/*!40000 ALTER TABLE `magev1_customer_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_customer_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_customer_entity_datetime`
--

DROP TABLE IF EXISTS `magev1_customer_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_customer_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_MAGEV1_CUSTOMER_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `IDX_MAGEV1_CUSTOMER_ENTITY_DATETIME_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_MAGEV1_CUSTOMER_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_MAGEV1_CUSTOMER_ENTITY_DATETIME_ENTITY_ID` (`entity_id`),
  KEY `IDX_MAGEV1_CUSTOMER_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `FK_40AA14E00F127D4D621B20C01FCA790E` FOREIGN KEY (`entity_type_id`) REFERENCES `magev1_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CSTR_ENTT_DTIME_ATTR_ID_MAGEV1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `magev1_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CSTR_ENTT_DTIME_ENTT_ID_MAGEV1_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `magev1_customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Datetime';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_customer_entity_datetime`
--

LOCK TABLES `magev1_customer_entity_datetime` WRITE;
/*!40000 ALTER TABLE `magev1_customer_entity_datetime` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_customer_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_customer_entity_decimal`
--

DROP TABLE IF EXISTS `magev1_customer_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_customer_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_MAGEV1_CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `IDX_MAGEV1_CUSTOMER_ENTITY_DECIMAL_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_MAGEV1_CUSTOMER_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_MAGEV1_CUSTOMER_ENTITY_DECIMAL_ENTITY_ID` (`entity_id`),
  KEY `IDX_MAGEV1_CUSTOMER_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `FK_FCB847E36C09E2D45D41971C18D28BE9` FOREIGN KEY (`entity_type_id`) REFERENCES `magev1_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CSTR_ENTT_DEC_ATTR_ID_MAGEV1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `magev1_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CSTR_ENTT_DEC_ENTT_ID_MAGEV1_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `magev1_customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Decimal';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_customer_entity_decimal`
--

LOCK TABLES `magev1_customer_entity_decimal` WRITE;
/*!40000 ALTER TABLE `magev1_customer_entity_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_customer_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_customer_entity_int`
--

DROP TABLE IF EXISTS `magev1_customer_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_customer_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` int(11) NOT NULL DEFAULT '0' COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_MAGEV1_CUSTOMER_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `IDX_MAGEV1_CUSTOMER_ENTITY_INT_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_MAGEV1_CUSTOMER_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_MAGEV1_CUSTOMER_ENTITY_INT_ENTITY_ID` (`entity_id`),
  KEY `IDX_MAGEV1_CUSTOMER_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `FK_C08EE243CE9B0675F5542B88E9647CAE` FOREIGN KEY (`entity_type_id`) REFERENCES `magev1_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CSTR_ENTT_INT_ATTR_ID_MAGEV1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `magev1_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CSTR_ENTT_INT_ENTT_ID_MAGEV1_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `magev1_customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Int';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_customer_entity_int`
--

LOCK TABLES `magev1_customer_entity_int` WRITE;
/*!40000 ALTER TABLE `magev1_customer_entity_int` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_customer_entity_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_customer_entity_text`
--

DROP TABLE IF EXISTS `magev1_customer_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_customer_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` text NOT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_MAGEV1_CUSTOMER_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `IDX_MAGEV1_CUSTOMER_ENTITY_TEXT_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_MAGEV1_CUSTOMER_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_MAGEV1_CUSTOMER_ENTITY_TEXT_ENTITY_ID` (`entity_id`),
  CONSTRAINT `FK_2D422733544CBA6E6DD1D609A56039C4` FOREIGN KEY (`entity_type_id`) REFERENCES `magev1_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CSTR_ENTT_TEXT_ATTR_ID_MAGEV1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `magev1_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CSTR_ENTT_TEXT_ENTT_ID_MAGEV1_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `magev1_customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Text';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_customer_entity_text`
--

LOCK TABLES `magev1_customer_entity_text` WRITE;
/*!40000 ALTER TABLE `magev1_customer_entity_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_customer_entity_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_customer_entity_varchar`
--

DROP TABLE IF EXISTS `magev1_customer_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_customer_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_MAGEV1_CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID` (`entity_id`,`attribute_id`),
  KEY `IDX_MAGEV1_CUSTOMER_ENTITY_VARCHAR_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_MAGEV1_CUSTOMER_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_MAGEV1_CUSTOMER_ENTITY_VARCHAR_ENTITY_ID` (`entity_id`),
  KEY `IDX_MAGEV1_CUSTOMER_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_VALUE` (`entity_id`,`attribute_id`,`value`),
  CONSTRAINT `FK_A52F714A588655629EAD387E1C446659` FOREIGN KEY (`entity_type_id`) REFERENCES `magev1_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CSTR_ENTT_VCHR_ATTR_ID_MAGEV1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `magev1_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_CSTR_ENTT_VCHR_ENTT_ID_MAGEV1_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `magev1_customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Entity Varchar';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_customer_entity_varchar`
--

LOCK TABLES `magev1_customer_entity_varchar` WRITE;
/*!40000 ALTER TABLE `magev1_customer_entity_varchar` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_customer_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_customer_flowpassword`
--

DROP TABLE IF EXISTS `magev1_customer_flowpassword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_customer_flowpassword` (
  `flowpassword_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Flow password Id',
  `ip` varchar(50) NOT NULL COMMENT 'User IP',
  `email` varchar(255) NOT NULL COMMENT 'Requested email for change',
  `requested_date` varchar(255) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Requested date for change',
  PRIMARY KEY (`flowpassword_id`),
  KEY `IDX_MAGEV1_CUSTOMER_FLOWPASSWORD_EMAIL` (`email`),
  KEY `IDX_MAGEV1_CUSTOMER_FLOWPASSWORD_IP` (`ip`),
  KEY `IDX_MAGEV1_CUSTOMER_FLOWPASSWORD_REQUESTED_DATE` (`requested_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer flow password';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_customer_flowpassword`
--

LOCK TABLES `magev1_customer_flowpassword` WRITE;
/*!40000 ALTER TABLE `magev1_customer_flowpassword` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_customer_flowpassword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_customer_form_attribute`
--

DROP TABLE IF EXISTS `magev1_customer_form_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_customer_form_attribute` (
  `form_code` varchar(32) NOT NULL COMMENT 'Form Code',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  PRIMARY KEY (`form_code`,`attribute_id`),
  KEY `IDX_MAGEV1_CUSTOMER_FORM_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `FK_MAGEV1_CSTR_FORM_ATTR_ATTR_ID_MAGEV1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `magev1_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customer Form Attribute';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_customer_form_attribute`
--

LOCK TABLES `magev1_customer_form_attribute` WRITE;
/*!40000 ALTER TABLE `magev1_customer_form_attribute` DISABLE KEYS */;
INSERT INTO `magev1_customer_form_attribute` VALUES ('adminhtml_customer',1),('adminhtml_customer',3),('adminhtml_customer',4),('checkout_register',4),('customer_account_create',4),('customer_account_edit',4),('adminhtml_customer',5),('checkout_register',5),('customer_account_create',5),('customer_account_edit',5),('adminhtml_customer',6),('checkout_register',6),('customer_account_create',6),('customer_account_edit',6),('adminhtml_customer',7),('checkout_register',7),('customer_account_create',7),('customer_account_edit',7),('adminhtml_customer',8),('checkout_register',8),('customer_account_create',8),('customer_account_edit',8),('adminhtml_checkout',9),('adminhtml_customer',9),('checkout_register',9),('customer_account_create',9),('customer_account_edit',9),('adminhtml_checkout',10),('adminhtml_customer',10),('adminhtml_checkout',11),('adminhtml_customer',11),('checkout_register',11),('customer_account_create',11),('customer_account_edit',11),('adminhtml_checkout',15),('adminhtml_customer',15),('checkout_register',15),('customer_account_create',15),('customer_account_edit',15),('adminhtml_customer',17),('checkout_register',17),('customer_account_create',17),('customer_account_edit',17),('adminhtml_checkout',18),('adminhtml_customer',18),('checkout_register',18),('customer_account_create',18),('customer_account_edit',18),('adminhtml_customer_address',19),('customer_address_edit',19),('customer_register_address',19),('adminhtml_customer_address',20),('customer_address_edit',20),('customer_register_address',20),('adminhtml_customer_address',21),('customer_address_edit',21),('customer_register_address',21),('adminhtml_customer_address',22),('customer_address_edit',22),('customer_register_address',22),('adminhtml_customer_address',23),('customer_address_edit',23),('customer_register_address',23),('adminhtml_customer_address',24),('customer_address_edit',24),('customer_register_address',24),('adminhtml_customer_address',25),('customer_address_edit',25),('customer_register_address',25),('adminhtml_customer_address',26),('customer_address_edit',26),('customer_register_address',26),('adminhtml_customer_address',27),('customer_address_edit',27),('customer_register_address',27),('adminhtml_customer_address',28),('customer_address_edit',28),('customer_register_address',28),('adminhtml_customer_address',29),('customer_address_edit',29),('customer_register_address',29),('adminhtml_customer_address',30),('customer_address_edit',30),('customer_register_address',30),('adminhtml_customer_address',31),('customer_address_edit',31),('customer_register_address',31),('adminhtml_customer_address',32),('customer_address_edit',32),('customer_register_address',32),('adminhtml_customer',35),('adminhtml_customer_address',36),('customer_address_edit',36),('customer_register_address',36);
/*!40000 ALTER TABLE `magev1_customer_form_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_customer_group`
--

DROP TABLE IF EXISTS `magev1_customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_customer_group` (
  `customer_group_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Customer Group Id',
  `customer_group_code` varchar(32) NOT NULL COMMENT 'Customer Group Code',
  `tax_class_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Tax Class Id',
  PRIMARY KEY (`customer_group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Customer Group';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_customer_group`
--

LOCK TABLES `magev1_customer_group` WRITE;
/*!40000 ALTER TABLE `magev1_customer_group` DISABLE KEYS */;
INSERT INTO `magev1_customer_group` VALUES (0,'NOT LOGGED IN',3),(1,'General',3),(2,'Wholesale',3),(3,'Retailer',3);
/*!40000 ALTER TABLE `magev1_customer_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_dataflow_batch`
--

DROP TABLE IF EXISTS `magev1_dataflow_batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_dataflow_batch` (
  `batch_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Batch Id',
  `profile_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Profile ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `adapter` varchar(128) DEFAULT NULL COMMENT 'Adapter',
  `params` text COMMENT 'Parameters',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  PRIMARY KEY (`batch_id`),
  KEY `IDX_MAGEV1_DATAFLOW_BATCH_PROFILE_ID` (`profile_id`),
  KEY `IDX_MAGEV1_DATAFLOW_BATCH_STORE_ID` (`store_id`),
  KEY `IDX_MAGEV1_DATAFLOW_BATCH_CREATED_AT` (`created_at`),
  CONSTRAINT `FK_A0198ED7FBBD07713A49FF2E28DEA468` FOREIGN KEY (`profile_id`) REFERENCES `magev1_dataflow_profile` (`profile_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_MAGEV1_DATAFLOW_BATCH_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dataflow Batch';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_dataflow_batch`
--

LOCK TABLES `magev1_dataflow_batch` WRITE;
/*!40000 ALTER TABLE `magev1_dataflow_batch` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_dataflow_batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_dataflow_batch_export`
--

DROP TABLE IF EXISTS `magev1_dataflow_batch_export`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_dataflow_batch_export` (
  `batch_export_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Batch Export Id',
  `batch_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Batch Id',
  `batch_data` longtext COMMENT 'Batch Data',
  `status` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Status',
  PRIMARY KEY (`batch_export_id`),
  KEY `IDX_MAGEV1_DATAFLOW_BATCH_EXPORT_BATCH_ID` (`batch_id`),
  CONSTRAINT `FK_551CBB66F01EC064079336CB448B063E` FOREIGN KEY (`batch_id`) REFERENCES `magev1_dataflow_batch` (`batch_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dataflow Batch Export';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_dataflow_batch_export`
--

LOCK TABLES `magev1_dataflow_batch_export` WRITE;
/*!40000 ALTER TABLE `magev1_dataflow_batch_export` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_dataflow_batch_export` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_dataflow_batch_import`
--

DROP TABLE IF EXISTS `magev1_dataflow_batch_import`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_dataflow_batch_import` (
  `batch_import_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Batch Import Id',
  `batch_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Batch Id',
  `batch_data` longtext COMMENT 'Batch Data',
  `status` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Status',
  PRIMARY KEY (`batch_import_id`),
  KEY `IDX_MAGEV1_DATAFLOW_BATCH_IMPORT_BATCH_ID` (`batch_id`),
  CONSTRAINT `FK_6E9A675E967AA028E57F1EE9471ED22F` FOREIGN KEY (`batch_id`) REFERENCES `magev1_dataflow_batch` (`batch_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dataflow Batch Import';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_dataflow_batch_import`
--

LOCK TABLES `magev1_dataflow_batch_import` WRITE;
/*!40000 ALTER TABLE `magev1_dataflow_batch_import` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_dataflow_batch_import` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_dataflow_import_data`
--

DROP TABLE IF EXISTS `magev1_dataflow_import_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_dataflow_import_data` (
  `import_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Import Id',
  `session_id` int(11) DEFAULT NULL COMMENT 'Session Id',
  `serial_number` int(11) NOT NULL DEFAULT '0' COMMENT 'Serial Number',
  `value` text COMMENT 'Value',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT 'Status',
  PRIMARY KEY (`import_id`),
  KEY `IDX_MAGEV1_DATAFLOW_IMPORT_DATA_SESSION_ID` (`session_id`),
  CONSTRAINT `FK_3D4F7EEC4EF39E99CAB8EFEC6D6D2D07` FOREIGN KEY (`session_id`) REFERENCES `magev1_dataflow_session` (`session_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dataflow Import Data';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_dataflow_import_data`
--

LOCK TABLES `magev1_dataflow_import_data` WRITE;
/*!40000 ALTER TABLE `magev1_dataflow_import_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_dataflow_import_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_dataflow_profile`
--

DROP TABLE IF EXISTS `magev1_dataflow_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_dataflow_profile` (
  `profile_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Profile Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `actions_xml` text COMMENT 'Actions Xml',
  `gui_data` text COMMENT 'Gui Data',
  `direction` varchar(6) DEFAULT NULL COMMENT 'Direction',
  `entity_type` varchar(64) DEFAULT NULL COMMENT 'Entity Type',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `data_transfer` varchar(11) DEFAULT NULL COMMENT 'Data Transfer',
  PRIMARY KEY (`profile_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Dataflow Profile';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_dataflow_profile`
--

LOCK TABLES `magev1_dataflow_profile` WRITE;
/*!40000 ALTER TABLE `magev1_dataflow_profile` DISABLE KEYS */;
INSERT INTO `magev1_dataflow_profile` VALUES (1,'Export All Products','2017-03-15 10:24:57','2017-03-15 10:24:57','<action type=\"catalog/convert_adapter_product\" method=\"load\">\\r\\n    <var name=\"store\"><![CDATA[0]]></var>\\r\\n</action>\\r\\n\\r\\n<action type=\"catalog/convert_parser_product\" method=\"unparse\">\\r\\n    <var name=\"store\"><![CDATA[0]]></var>\\r\\n</action>\\r\\n\\r\\n<action type=\"dataflow/convert_mapper_column\" method=\"map\">\\r\\n</action>\\r\\n\\r\\n<action type=\"dataflow/convert_parser_csv\" method=\"unparse\">\\r\\n    <var name=\"delimiter\"><![CDATA[,]]></var>\\r\\n    <var name=\"enclose\"><![CDATA[\"]]></var>\\r\\n    <var name=\"fieldnames\">true</var>\\r\\n</action>\\r\\n\\r\\n<action type=\"dataflow/convert_adapter_io\" method=\"save\">\\r\\n    <var name=\"type\">file</var>\\r\\n    <var name=\"path\">var/export</var>\\r\\n    <var name=\"filename\"><![CDATA[export_all_products.csv]]></var>\\r\\n</action>\\r\\n\\r\\n','a:5:{s:4:\"file\";a:7:{s:4:\"type\";s:4:\"file\";s:8:\"filename\";s:23:\"export_all_products.csv\";s:4:\"path\";s:10:\"var/export\";s:4:\"host\";s:0:\"\";s:4:\"user\";s:0:\"\";s:8:\"password\";s:0:\"\";s:7:\"passive\";s:0:\"\";}s:5:\"parse\";a:5:{s:4:\"type\";s:3:\"csv\";s:12:\"single_sheet\";s:0:\"\";s:9:\"delimiter\";s:1:\",\";s:7:\"enclose\";s:1:\"\"\";s:10:\"fieldnames\";s:4:\"true\";}s:3:\"map\";a:3:{s:14:\"only_specified\";s:0:\"\";s:7:\"product\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}s:8:\"customer\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}}s:7:\"product\";a:1:{s:6:\"filter\";a:8:{s:4:\"name\";s:0:\"\";s:3:\"sku\";s:0:\"\";s:4:\"type\";s:1:\"0\";s:13:\"attribute_set\";s:0:\"\";s:5:\"price\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:3:\"qty\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:10:\"visibility\";s:1:\"0\";s:6:\"status\";s:1:\"0\";}}s:8:\"customer\";a:1:{s:6:\"filter\";a:10:{s:9:\"firstname\";s:0:\"\";s:8:\"lastname\";s:0:\"\";s:5:\"email\";s:0:\"\";s:5:\"group\";s:1:\"0\";s:10:\"adressType\";s:15:\"default_billing\";s:9:\"telephone\";s:0:\"\";s:8:\"postcode\";s:0:\"\";s:7:\"country\";s:0:\"\";s:6:\"region\";s:0:\"\";s:10:\"created_at\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}}}}','export','product',0,'file'),(2,'Export Product Stocks','2017-03-15 10:24:57','2017-03-15 10:24:57','<action type=\"catalog/convert_adapter_product\" method=\"load\">\\r\\n    <var name=\"store\"><![CDATA[0]]></var>\\r\\n</action>\\r\\n\\r\\n<action type=\"catalog/convert_parser_product\" method=\"unparse\">\\r\\n    <var name=\"store\"><![CDATA[0]]></var>\\r\\n</action>\\r\\n\\r\\n<action type=\"dataflow/convert_mapper_column\" method=\"map\">\\r\\n</action>\\r\\n\\r\\n<action type=\"dataflow/convert_parser_csv\" method=\"unparse\">\\r\\n    <var name=\"delimiter\"><![CDATA[,]]></var>\\r\\n    <var name=\"enclose\"><![CDATA[\"]]></var>\\r\\n    <var name=\"fieldnames\">true</var>\\r\\n</action>\\r\\n\\r\\n<action type=\"dataflow/convert_adapter_io\" method=\"save\">\\r\\n    <var name=\"type\">file</var>\\r\\n    <var name=\"path\">var/export</var>\\r\\n    <var name=\"filename\"><![CDATA[export_all_products.csv]]></var>\\r\\n</action>\\r\\n\\r\\n','a:5:{s:4:\"file\";a:7:{s:4:\"type\";s:4:\"file\";s:8:\"filename\";s:25:\"export_product_stocks.csv\";s:4:\"path\";s:10:\"var/export\";s:4:\"host\";s:0:\"\";s:4:\"user\";s:0:\"\";s:8:\"password\";s:0:\"\";s:7:\"passive\";s:0:\"\";}s:5:\"parse\";a:5:{s:4:\"type\";s:3:\"csv\";s:12:\"single_sheet\";s:0:\"\";s:9:\"delimiter\";s:1:\",\";s:7:\"enclose\";s:1:\"\"\";s:10:\"fieldnames\";s:4:\"true\";}s:3:\"map\";a:3:{s:14:\"only_specified\";s:4:\"true\";s:7:\"product\";a:2:{s:2:\"db\";a:4:{i:1;s:5:\"store\";i:2;s:3:\"sku\";i:3;s:3:\"qty\";i:4;s:11:\"is_in_stock\";}s:4:\"file\";a:4:{i:1;s:5:\"store\";i:2;s:3:\"sku\";i:3;s:3:\"qty\";i:4;s:11:\"is_in_stock\";}}s:8:\"customer\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}}s:7:\"product\";a:1:{s:6:\"filter\";a:8:{s:4:\"name\";s:0:\"\";s:3:\"sku\";s:0:\"\";s:4:\"type\";s:1:\"0\";s:13:\"attribute_set\";s:0:\"\";s:5:\"price\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:3:\"qty\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:10:\"visibility\";s:1:\"0\";s:6:\"status\";s:1:\"0\";}}s:8:\"customer\";a:1:{s:6:\"filter\";a:10:{s:9:\"firstname\";s:0:\"\";s:8:\"lastname\";s:0:\"\";s:5:\"email\";s:0:\"\";s:5:\"group\";s:1:\"0\";s:10:\"adressType\";s:15:\"default_billing\";s:9:\"telephone\";s:0:\"\";s:8:\"postcode\";s:0:\"\";s:7:\"country\";s:0:\"\";s:6:\"region\";s:0:\"\";s:10:\"created_at\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}}}}','export','product',0,'file'),(3,'Import All Products','2017-03-15 10:24:57','2017-03-15 10:24:57','<action type=\"dataflow/convert_parser_csv\" method=\"parse\">\\r\\n    <var name=\"delimiter\"><![CDATA[,]]></var>\\r\\n    <var name=\"enclose\"><![CDATA[\"]]></var>\\r\\n    <var name=\"fieldnames\">true</var>\\r\\n    <var name=\"store\"><![CDATA[0]]></var>\\r\\n    <var name=\"adapter\">catalog/convert_adapter_product</var>\\r\\n    <var name=\"method\">parse</var>\\r\\n</action>','a:5:{s:4:\"file\";a:7:{s:4:\"type\";s:4:\"file\";s:8:\"filename\";s:23:\"export_all_products.csv\";s:4:\"path\";s:10:\"var/export\";s:4:\"host\";s:0:\"\";s:4:\"user\";s:0:\"\";s:8:\"password\";s:0:\"\";s:7:\"passive\";s:0:\"\";}s:5:\"parse\";a:5:{s:4:\"type\";s:3:\"csv\";s:12:\"single_sheet\";s:0:\"\";s:9:\"delimiter\";s:1:\",\";s:7:\"enclose\";s:1:\"\"\";s:10:\"fieldnames\";s:4:\"true\";}s:3:\"map\";a:3:{s:14:\"only_specified\";s:0:\"\";s:7:\"product\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}s:8:\"customer\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}}s:7:\"product\";a:1:{s:6:\"filter\";a:8:{s:4:\"name\";s:0:\"\";s:3:\"sku\";s:0:\"\";s:4:\"type\";s:1:\"0\";s:13:\"attribute_set\";s:0:\"\";s:5:\"price\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:3:\"qty\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:10:\"visibility\";s:1:\"0\";s:6:\"status\";s:1:\"0\";}}s:8:\"customer\";a:1:{s:6:\"filter\";a:10:{s:9:\"firstname\";s:0:\"\";s:8:\"lastname\";s:0:\"\";s:5:\"email\";s:0:\"\";s:5:\"group\";s:1:\"0\";s:10:\"adressType\";s:15:\"default_billing\";s:9:\"telephone\";s:0:\"\";s:8:\"postcode\";s:0:\"\";s:7:\"country\";s:0:\"\";s:6:\"region\";s:0:\"\";s:10:\"created_at\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}}}}','import','product',0,'interactive'),(4,'Import Product Stocks','2017-03-15 10:24:57','2017-03-15 10:24:57','<action type=\"dataflow/convert_parser_csv\" method=\"parse\">\\r\\n    <var name=\"delimiter\"><![CDATA[,]]></var>\\r\\n    <var name=\"enclose\"><![CDATA[\"]]></var>\\r\\n    <var name=\"fieldnames\">true</var>\\r\\n    <var name=\"store\"><![CDATA[0]]></var>\\r\\n    <var name=\"adapter\">catalog/convert_adapter_product</var>\\r\\n    <var name=\"method\">parse</var>\\r\\n</action>','a:5:{s:4:\"file\";a:7:{s:4:\"type\";s:4:\"file\";s:8:\"filename\";s:18:\"export_product.csv\";s:4:\"path\";s:10:\"var/export\";s:4:\"host\";s:0:\"\";s:4:\"user\";s:0:\"\";s:8:\"password\";s:0:\"\";s:7:\"passive\";s:0:\"\";}s:5:\"parse\";a:5:{s:4:\"type\";s:3:\"csv\";s:12:\"single_sheet\";s:0:\"\";s:9:\"delimiter\";s:1:\",\";s:7:\"enclose\";s:1:\"\"\";s:10:\"fieldnames\";s:4:\"true\";}s:3:\"map\";a:3:{s:14:\"only_specified\";s:0:\"\";s:7:\"product\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}s:8:\"customer\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}}s:7:\"product\";a:1:{s:6:\"filter\";a:8:{s:4:\"name\";s:0:\"\";s:3:\"sku\";s:0:\"\";s:4:\"type\";s:1:\"0\";s:13:\"attribute_set\";s:0:\"\";s:5:\"price\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:3:\"qty\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:10:\"visibility\";s:1:\"0\";s:6:\"status\";s:1:\"0\";}}s:8:\"customer\";a:1:{s:6:\"filter\";a:10:{s:9:\"firstname\";s:0:\"\";s:8:\"lastname\";s:0:\"\";s:5:\"email\";s:0:\"\";s:5:\"group\";s:1:\"0\";s:10:\"adressType\";s:15:\"default_billing\";s:9:\"telephone\";s:0:\"\";s:8:\"postcode\";s:0:\"\";s:7:\"country\";s:0:\"\";s:6:\"region\";s:0:\"\";s:10:\"created_at\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}}}}','import','product',0,'interactive'),(5,'Export Customers','2017-03-15 10:24:57','2017-03-15 10:24:57','<action type=\"customer/convert_adapter_customer\" method=\"load\">\\r\\n    <var name=\"store\"><![CDATA[0]]></var>\\r\\n    <var name=\"filter/adressType\"><![CDATA[default_billing]]></var>\\r\\n</action>\\r\\n\\r\\n<action type=\"customer/convert_parser_customer\" method=\"unparse\">\\r\\n    <var name=\"store\"><![CDATA[0]]></var>\\r\\n</action>\\r\\n\\r\\n<action type=\"dataflow/convert_mapper_column\" method=\"map\">\\r\\n</action>\\r\\n\\r\\n<action type=\"dataflow/convert_parser_csv\" method=\"unparse\">\\r\\n    <var name=\"delimiter\"><![CDATA[,]]></var>\\r\\n    <var name=\"enclose\"><![CDATA[\"]]></var>\\r\\n    <var name=\"fieldnames\">true</var>\\r\\n</action>\\r\\n\\r\\n<action type=\"dataflow/convert_adapter_io\" method=\"save\">\\r\\n    <var name=\"type\">file</var>\\r\\n    <var name=\"path\">var/export</var>\\r\\n    <var name=\"filename\"><![CDATA[export_customers.csv]]></var>\\r\\n</action>\\r\\n\\r\\n','a:5:{s:4:\"file\";a:7:{s:4:\"type\";s:4:\"file\";s:8:\"filename\";s:20:\"export_customers.csv\";s:4:\"path\";s:10:\"var/export\";s:4:\"host\";s:0:\"\";s:4:\"user\";s:0:\"\";s:8:\"password\";s:0:\"\";s:7:\"passive\";s:0:\"\";}s:5:\"parse\";a:5:{s:4:\"type\";s:3:\"csv\";s:12:\"single_sheet\";s:0:\"\";s:9:\"delimiter\";s:1:\",\";s:7:\"enclose\";s:1:\"\"\";s:10:\"fieldnames\";s:4:\"true\";}s:3:\"map\";a:3:{s:14:\"only_specified\";s:0:\"\";s:7:\"product\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}s:8:\"customer\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}}s:7:\"product\";a:1:{s:6:\"filter\";a:8:{s:4:\"name\";s:0:\"\";s:3:\"sku\";s:0:\"\";s:4:\"type\";s:1:\"0\";s:13:\"attribute_set\";s:0:\"\";s:5:\"price\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:3:\"qty\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:10:\"visibility\";s:1:\"0\";s:6:\"status\";s:1:\"0\";}}s:8:\"customer\";a:1:{s:6:\"filter\";a:10:{s:9:\"firstname\";s:0:\"\";s:8:\"lastname\";s:0:\"\";s:5:\"email\";s:0:\"\";s:5:\"group\";s:1:\"0\";s:10:\"adressType\";s:15:\"default_billing\";s:9:\"telephone\";s:0:\"\";s:8:\"postcode\";s:0:\"\";s:7:\"country\";s:0:\"\";s:6:\"region\";s:0:\"\";s:10:\"created_at\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}}}}','export','customer',0,'file'),(6,'Import Customers','2017-03-15 10:24:57','2017-03-15 10:24:57','<action type=\"dataflow/convert_parser_csv\" method=\"parse\">\\r\\n    <var name=\"delimiter\"><![CDATA[,]]></var>\\r\\n    <var name=\"enclose\"><![CDATA[\"]]></var>\\r\\n    <var name=\"fieldnames\">true</var>\\r\\n    <var name=\"store\"><![CDATA[0]]></var>\\r\\n    <var name=\"adapter\">customer/convert_adapter_customer</var>\\r\\n    <var name=\"method\">parse</var>\\r\\n</action>','a:5:{s:4:\"file\";a:7:{s:4:\"type\";s:4:\"file\";s:8:\"filename\";s:19:\"export_customer.csv\";s:4:\"path\";s:10:\"var/export\";s:4:\"host\";s:0:\"\";s:4:\"user\";s:0:\"\";s:8:\"password\";s:0:\"\";s:7:\"passive\";s:0:\"\";}s:5:\"parse\";a:5:{s:4:\"type\";s:3:\"csv\";s:12:\"single_sheet\";s:0:\"\";s:9:\"delimiter\";s:1:\",\";s:7:\"enclose\";s:1:\"\"\";s:10:\"fieldnames\";s:4:\"true\";}s:3:\"map\";a:3:{s:14:\"only_specified\";s:0:\"\";s:7:\"product\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}s:8:\"customer\";a:2:{s:2:\"db\";a:0:{}s:4:\"file\";a:0:{}}}s:7:\"product\";a:1:{s:6:\"filter\";a:8:{s:4:\"name\";s:0:\"\";s:3:\"sku\";s:0:\"\";s:4:\"type\";s:1:\"0\";s:13:\"attribute_set\";s:0:\"\";s:5:\"price\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:3:\"qty\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}s:10:\"visibility\";s:1:\"0\";s:6:\"status\";s:1:\"0\";}}s:8:\"customer\";a:1:{s:6:\"filter\";a:10:{s:9:\"firstname\";s:0:\"\";s:8:\"lastname\";s:0:\"\";s:5:\"email\";s:0:\"\";s:5:\"group\";s:1:\"0\";s:10:\"adressType\";s:15:\"default_billing\";s:9:\"telephone\";s:0:\"\";s:8:\"postcode\";s:0:\"\";s:7:\"country\";s:0:\"\";s:6:\"region\";s:0:\"\";s:10:\"created_at\";a:2:{s:4:\"from\";s:0:\"\";s:2:\"to\";s:0:\"\";}}}}','import','customer',0,'interactive');
/*!40000 ALTER TABLE `magev1_dataflow_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_dataflow_profile_history`
--

DROP TABLE IF EXISTS `magev1_dataflow_profile_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_dataflow_profile_history` (
  `history_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'History Id',
  `profile_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Profile Id',
  `action_code` varchar(64) DEFAULT NULL COMMENT 'Action Code',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'User Id',
  `performed_at` timestamp NULL DEFAULT NULL COMMENT 'Performed At',
  PRIMARY KEY (`history_id`),
  KEY `IDX_MAGEV1_DATAFLOW_PROFILE_HISTORY_PROFILE_ID` (`profile_id`),
  CONSTRAINT `FK_8164B33949BEE536AE846A454A8EF631` FOREIGN KEY (`profile_id`) REFERENCES `magev1_dataflow_profile` (`profile_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Dataflow Profile History';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_dataflow_profile_history`
--

LOCK TABLES `magev1_dataflow_profile_history` WRITE;
/*!40000 ALTER TABLE `magev1_dataflow_profile_history` DISABLE KEYS */;
INSERT INTO `magev1_dataflow_profile_history` VALUES (1,1,'create',0,'2017-03-15 10:24:57'),(2,2,'create',0,'2017-03-15 10:24:57'),(3,3,'create',0,'2017-03-15 10:24:57'),(4,4,'create',0,'2017-03-15 10:24:57'),(5,5,'create',0,'2017-03-15 10:24:57'),(6,6,'create',0,'2017-03-15 10:24:57');
/*!40000 ALTER TABLE `magev1_dataflow_profile_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_dataflow_session`
--

DROP TABLE IF EXISTS `magev1_dataflow_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_dataflow_session` (
  `session_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Session Id',
  `user_id` int(11) NOT NULL COMMENT 'User Id',
  `created_date` timestamp NULL DEFAULT NULL COMMENT 'Created Date',
  `file` varchar(255) DEFAULT NULL COMMENT 'File',
  `type` varchar(32) DEFAULT NULL COMMENT 'Type',
  `direction` varchar(32) DEFAULT NULL COMMENT 'Direction',
  `comment` varchar(255) DEFAULT NULL COMMENT 'Comment',
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Dataflow Session';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_dataflow_session`
--

LOCK TABLES `magev1_dataflow_session` WRITE;
/*!40000 ALTER TABLE `magev1_dataflow_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_dataflow_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_design_change`
--

DROP TABLE IF EXISTS `magev1_design_change`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_design_change` (
  `design_change_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Design Change Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `design` varchar(255) DEFAULT NULL COMMENT 'Design',
  `date_from` date DEFAULT NULL COMMENT 'First Date of Design Activity',
  `date_to` date DEFAULT NULL COMMENT 'Last Date of Design Activity',
  PRIMARY KEY (`design_change_id`),
  KEY `IDX_MAGEV1_DESIGN_CHANGE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_MAGEV1_DESIGN_CHANGE_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Design Changes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_design_change`
--

LOCK TABLES `magev1_design_change` WRITE;
/*!40000 ALTER TABLE `magev1_design_change` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_design_change` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_directory_country`
--

DROP TABLE IF EXISTS `magev1_directory_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_directory_country` (
  `country_id` varchar(2) NOT NULL DEFAULT '' COMMENT 'Country Id in ISO-2',
  `iso2_code` varchar(2) DEFAULT NULL COMMENT 'Country ISO-2 format',
  `iso3_code` varchar(3) DEFAULT NULL COMMENT 'Country ISO-3',
  PRIMARY KEY (`country_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Country';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_directory_country`
--

LOCK TABLES `magev1_directory_country` WRITE;
/*!40000 ALTER TABLE `magev1_directory_country` DISABLE KEYS */;
INSERT INTO `magev1_directory_country` VALUES ('AD','AD','AND'),('AE','AE','ARE'),('AF','AF','AFG'),('AG','AG','ATG'),('AI','AI','AIA'),('AL','AL','ALB'),('AM','AM','ARM'),('AN','AN','ANT'),('AO','AO','AGO'),('AQ','AQ','ATA'),('AR','AR','ARG'),('AS','AS','ASM'),('AT','AT','AUT'),('AU','AU','AUS'),('AW','AW','ABW'),('AX','AX','ALA'),('AZ','AZ','AZE'),('BA','BA','BIH'),('BB','BB','BRB'),('BD','BD','BGD'),('BE','BE','BEL'),('BF','BF','BFA'),('BG','BG','BGR'),('BH','BH','BHR'),('BI','BI','BDI'),('BJ','BJ','BEN'),('BL','BL','BLM'),('BM','BM','BMU'),('BN','BN','BRN'),('BO','BO','BOL'),('BR','BR','BRA'),('BS','BS','BHS'),('BT','BT','BTN'),('BV','BV','BVT'),('BW','BW','BWA'),('BY','BY','BLR'),('BZ','BZ','BLZ'),('CA','CA','CAN'),('CC','CC','CCK'),('CD','CD','COD'),('CF','CF','CAF'),('CG','CG','COG'),('CH','CH','CHE'),('CI','CI','CIV'),('CK','CK','COK'),('CL','CL','CHL'),('CM','CM','CMR'),('CN','CN','CHN'),('CO','CO','COL'),('CR','CR','CRI'),('CU','CU','CUB'),('CV','CV','CPV'),('CX','CX','CXR'),('CY','CY','CYP'),('CZ','CZ','CZE'),('DE','DE','DEU'),('DJ','DJ','DJI'),('DK','DK','DNK'),('DM','DM','DMA'),('DO','DO','DOM'),('DZ','DZ','DZA'),('EC','EC','ECU'),('EE','EE','EST'),('EG','EG','EGY'),('EH','EH','ESH'),('ER','ER','ERI'),('ES','ES','ESP'),('ET','ET','ETH'),('FI','FI','FIN'),('FJ','FJ','FJI'),('FK','FK','FLK'),('FM','FM','FSM'),('FO','FO','FRO'),('FR','FR','FRA'),('GA','GA','GAB'),('GB','GB','GBR'),('GD','GD','GRD'),('GE','GE','GEO'),('GF','GF','GUF'),('GG','GG','GGY'),('GH','GH','GHA'),('GI','GI','GIB'),('GL','GL','GRL'),('GM','GM','GMB'),('GN','GN','GIN'),('GP','GP','GLP'),('GQ','GQ','GNQ'),('GR','GR','GRC'),('GS','GS','SGS'),('GT','GT','GTM'),('GU','GU','GUM'),('GW','GW','GNB'),('GY','GY','GUY'),('HK','HK','HKG'),('HM','HM','HMD'),('HN','HN','HND'),('HR','HR','HRV'),('HT','HT','HTI'),('HU','HU','HUN'),('ID','ID','IDN'),('IE','IE','IRL'),('IL','IL','ISR'),('IM','IM','IMN'),('IN','IN','IND'),('IO','IO','IOT'),('IQ','IQ','IRQ'),('IR','IR','IRN'),('IS','IS','ISL'),('IT','IT','ITA'),('JE','JE','JEY'),('JM','JM','JAM'),('JO','JO','JOR'),('JP','JP','JPN'),('KE','KE','KEN'),('KG','KG','KGZ'),('KH','KH','KHM'),('KI','KI','KIR'),('KM','KM','COM'),('KN','KN','KNA'),('KP','KP','PRK'),('KR','KR','KOR'),('KW','KW','KWT'),('KY','KY','CYM'),('KZ','KZ','KAZ'),('LA','LA','LAO'),('LB','LB','LBN'),('LC','LC','LCA'),('LI','LI','LIE'),('LK','LK','LKA'),('LR','LR','LBR'),('LS','LS','LSO'),('LT','LT','LTU'),('LU','LU','LUX'),('LV','LV','LVA'),('LY','LY','LBY'),('MA','MA','MAR'),('MC','MC','MCO'),('MD','MD','MDA'),('ME','ME','MNE'),('MF','MF','MAF'),('MG','MG','MDG'),('MH','MH','MHL'),('MK','MK','MKD'),('ML','ML','MLI'),('MM','MM','MMR'),('MN','MN','MNG'),('MO','MO','MAC'),('MP','MP','MNP'),('MQ','MQ','MTQ'),('MR','MR','MRT'),('MS','MS','MSR'),('MT','MT','MLT'),('MU','MU','MUS'),('MV','MV','MDV'),('MW','MW','MWI'),('MX','MX','MEX'),('MY','MY','MYS'),('MZ','MZ','MOZ'),('NA','NA','NAM'),('NC','NC','NCL'),('NE','NE','NER'),('NF','NF','NFK'),('NG','NG','NGA'),('NI','NI','NIC'),('NL','NL','NLD'),('NO','NO','NOR'),('NP','NP','NPL'),('NR','NR','NRU'),('NU','NU','NIU'),('NZ','NZ','NZL'),('OM','OM','OMN'),('PA','PA','PAN'),('PE','PE','PER'),('PF','PF','PYF'),('PG','PG','PNG'),('PH','PH','PHL'),('PK','PK','PAK'),('PL','PL','POL'),('PM','PM','SPM'),('PN','PN','PCN'),('PR','PR','PRI'),('PS','PS','PSE'),('PT','PT','PRT'),('PW','PW','PLW'),('PY','PY','PRY'),('QA','QA','QAT'),('RE','RE','REU'),('RO','RO','ROU'),('RS','RS','SRB'),('RU','RU','RUS'),('RW','RW','RWA'),('SA','SA','SAU'),('SB','SB','SLB'),('SC','SC','SYC'),('SD','SD','SDN'),('SE','SE','SWE'),('SG','SG','SGP'),('SH','SH','SHN'),('SI','SI','SVN'),('SJ','SJ','SJM'),('SK','SK','SVK'),('SL','SL','SLE'),('SM','SM','SMR'),('SN','SN','SEN'),('SO','SO','SOM'),('SR','SR','SUR'),('ST','ST','STP'),('SV','SV','SLV'),('SY','SY','SYR'),('SZ','SZ','SWZ'),('TC','TC','TCA'),('TD','TD','TCD'),('TF','TF','ATF'),('TG','TG','TGO'),('TH','TH','THA'),('TJ','TJ','TJK'),('TK','TK','TKL'),('TL','TL','TLS'),('TM','TM','TKM'),('TN','TN','TUN'),('TO','TO','TON'),('TR','TR','TUR'),('TT','TT','TTO'),('TV','TV','TUV'),('TW','TW','TWN'),('TZ','TZ','TZA'),('UA','UA','UKR'),('UG','UG','UGA'),('UM','UM','UMI'),('US','US','USA'),('UY','UY','URY'),('UZ','UZ','UZB'),('VA','VA','VAT'),('VC','VC','VCT'),('VE','VE','VEN'),('VG','VG','VGB'),('VI','VI','VIR'),('VN','VN','VNM'),('VU','VU','VUT'),('WF','WF','WLF'),('WS','WS','WSM'),('YE','YE','YEM'),('YT','YT','MYT'),('ZA','ZA','ZAF'),('ZM','ZM','ZMB'),('ZW','ZW','ZWE');
/*!40000 ALTER TABLE `magev1_directory_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_directory_country_format`
--

DROP TABLE IF EXISTS `magev1_directory_country_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_directory_country_format` (
  `country_format_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Country Format Id',
  `country_id` varchar(2) DEFAULT NULL COMMENT 'Country Id in ISO-2',
  `type` varchar(30) DEFAULT NULL COMMENT 'Country Format Type',
  `format` text NOT NULL COMMENT 'Country Format',
  PRIMARY KEY (`country_format_id`),
  UNIQUE KEY `UNQ_MAGEV1_DIRECTORY_COUNTRY_FORMAT_COUNTRY_ID_TYPE` (`country_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Country Format';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_directory_country_format`
--

LOCK TABLES `magev1_directory_country_format` WRITE;
/*!40000 ALTER TABLE `magev1_directory_country_format` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_directory_country_format` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_directory_country_region`
--

DROP TABLE IF EXISTS `magev1_directory_country_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_directory_country_region` (
  `region_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Region Id',
  `country_id` varchar(4) NOT NULL DEFAULT '0' COMMENT 'Country Id in ISO-2',
  `code` varchar(32) DEFAULT NULL COMMENT 'Region code',
  `default_name` varchar(255) DEFAULT NULL COMMENT 'Region Name',
  PRIMARY KEY (`region_id`),
  KEY `IDX_MAGEV1_DIRECTORY_COUNTRY_REGION_COUNTRY_ID` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=485 DEFAULT CHARSET=utf8 COMMENT='Directory Country Region';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_directory_country_region`
--

LOCK TABLES `magev1_directory_country_region` WRITE;
/*!40000 ALTER TABLE `magev1_directory_country_region` DISABLE KEYS */;
INSERT INTO `magev1_directory_country_region` VALUES (1,'US','AL','Alabama'),(2,'US','AK','Alaska'),(3,'US','AS','American Samoa'),(4,'US','AZ','Arizona'),(5,'US','AR','Arkansas'),(6,'US','AF','Armed Forces Africa'),(7,'US','AA','Armed Forces Americas'),(8,'US','AC','Armed Forces Canada'),(9,'US','AE','Armed Forces Europe'),(10,'US','AM','Armed Forces Middle East'),(11,'US','AP','Armed Forces Pacific'),(12,'US','CA','California'),(13,'US','CO','Colorado'),(14,'US','CT','Connecticut'),(15,'US','DE','Delaware'),(16,'US','DC','District of Columbia'),(17,'US','FM','Federated States Of Micronesia'),(18,'US','FL','Florida'),(19,'US','GA','Georgia'),(20,'US','GU','Guam'),(21,'US','HI','Hawaii'),(22,'US','ID','Idaho'),(23,'US','IL','Illinois'),(24,'US','IN','Indiana'),(25,'US','IA','Iowa'),(26,'US','KS','Kansas'),(27,'US','KY','Kentucky'),(28,'US','LA','Louisiana'),(29,'US','ME','Maine'),(30,'US','MH','Marshall Islands'),(31,'US','MD','Maryland'),(32,'US','MA','Massachusetts'),(33,'US','MI','Michigan'),(34,'US','MN','Minnesota'),(35,'US','MS','Mississippi'),(36,'US','MO','Missouri'),(37,'US','MT','Montana'),(38,'US','NE','Nebraska'),(39,'US','NV','Nevada'),(40,'US','NH','New Hampshire'),(41,'US','NJ','New Jersey'),(42,'US','NM','New Mexico'),(43,'US','NY','New York'),(44,'US','NC','North Carolina'),(45,'US','ND','North Dakota'),(46,'US','MP','Northern Mariana Islands'),(47,'US','OH','Ohio'),(48,'US','OK','Oklahoma'),(49,'US','OR','Oregon'),(50,'US','PW','Palau'),(51,'US','PA','Pennsylvania'),(52,'US','PR','Puerto Rico'),(53,'US','RI','Rhode Island'),(54,'US','SC','South Carolina'),(55,'US','SD','South Dakota'),(56,'US','TN','Tennessee'),(57,'US','TX','Texas'),(58,'US','UT','Utah'),(59,'US','VT','Vermont'),(60,'US','VI','Virgin Islands'),(61,'US','VA','Virginia'),(62,'US','WA','Washington'),(63,'US','WV','West Virginia'),(64,'US','WI','Wisconsin'),(65,'US','WY','Wyoming'),(66,'CA','AB','Alberta'),(67,'CA','BC','British Columbia'),(68,'CA','MB','Manitoba'),(69,'CA','NL','Newfoundland and Labrador'),(70,'CA','NB','New Brunswick'),(71,'CA','NS','Nova Scotia'),(72,'CA','NT','Northwest Territories'),(73,'CA','NU','Nunavut'),(74,'CA','ON','Ontario'),(75,'CA','PE','Prince Edward Island'),(76,'CA','QC','Quebec'),(77,'CA','SK','Saskatchewan'),(78,'CA','YT','Yukon Territory'),(79,'DE','NDS','Niedersachsen'),(80,'DE','BAW','Baden-WÃ¼rttemberg'),(81,'DE','BAY','Bayern'),(82,'DE','BER','Berlin'),(83,'DE','BRG','Brandenburg'),(84,'DE','BRE','Bremen'),(85,'DE','HAM','Hamburg'),(86,'DE','HES','Hessen'),(87,'DE','MEC','Mecklenburg-Vorpommern'),(88,'DE','NRW','Nordrhein-Westfalen'),(89,'DE','RHE','Rheinland-Pfalz'),(90,'DE','SAR','Saarland'),(91,'DE','SAS','Sachsen'),(92,'DE','SAC','Sachsen-Anhalt'),(93,'DE','SCN','Schleswig-Holstein'),(94,'DE','THE','ThÃ¼ringen'),(95,'AT','WI','Wien'),(96,'AT','NO','NiederÃ¶sterreich'),(97,'AT','OO','OberÃ¶sterreich'),(98,'AT','SB','Salzburg'),(99,'AT','KN','KÃ¤rnten'),(100,'AT','ST','Steiermark'),(101,'AT','TI','Tirol'),(102,'AT','BL','Burgenland'),(103,'AT','VB','Vorarlberg'),(104,'CH','AG','Aargau'),(105,'CH','AI','Appenzell Innerrhoden'),(106,'CH','AR','Appenzell Ausserrhoden'),(107,'CH','BE','Bern'),(108,'CH','BL','Basel-Landschaft'),(109,'CH','BS','Basel-Stadt'),(110,'CH','FR','Freiburg'),(111,'CH','GE','Genf'),(112,'CH','GL','Glarus'),(113,'CH','GR','GraubÃ¼nden'),(114,'CH','JU','Jura'),(115,'CH','LU','Luzern'),(116,'CH','NE','Neuenburg'),(117,'CH','NW','Nidwalden'),(118,'CH','OW','Obwalden'),(119,'CH','SG','St. Gallen'),(120,'CH','SH','Schaffhausen'),(121,'CH','SO','Solothurn'),(122,'CH','SZ','Schwyz'),(123,'CH','TG','Thurgau'),(124,'CH','TI','Tessin'),(125,'CH','UR','Uri'),(126,'CH','VD','Waadt'),(127,'CH','VS','Wallis'),(128,'CH','ZG','Zug'),(129,'CH','ZH','ZÃ¼rich'),(130,'ES','A CoruÑa','A CoruÃ±a'),(131,'ES','Alava','Alava'),(132,'ES','Albacete','Albacete'),(133,'ES','Alicante','Alicante'),(134,'ES','Almeria','Almeria'),(135,'ES','Asturias','Asturias'),(136,'ES','Avila','Avila'),(137,'ES','Badajoz','Badajoz'),(138,'ES','Baleares','Baleares'),(139,'ES','Barcelona','Barcelona'),(140,'ES','Burgos','Burgos'),(141,'ES','Caceres','Caceres'),(142,'ES','Cadiz','Cadiz'),(143,'ES','Cantabria','Cantabria'),(144,'ES','Castellon','Castellon'),(145,'ES','Ceuta','Ceuta'),(146,'ES','Ciudad Real','Ciudad Real'),(147,'ES','Cordoba','Cordoba'),(148,'ES','Cuenca','Cuenca'),(149,'ES','Girona','Girona'),(150,'ES','Granada','Granada'),(151,'ES','Guadalajara','Guadalajara'),(152,'ES','Guipuzcoa','Guipuzcoa'),(153,'ES','Huelva','Huelva'),(154,'ES','Huesca','Huesca'),(155,'ES','Jaen','Jaen'),(156,'ES','La Rioja','La Rioja'),(157,'ES','Las Palmas','Las Palmas'),(158,'ES','Leon','Leon'),(159,'ES','Lleida','Lleida'),(160,'ES','Lugo','Lugo'),(161,'ES','Madrid','Madrid'),(162,'ES','Malaga','Malaga'),(163,'ES','Melilla','Melilla'),(164,'ES','Murcia','Murcia'),(165,'ES','Navarra','Navarra'),(166,'ES','Ourense','Ourense'),(167,'ES','Palencia','Palencia'),(168,'ES','Pontevedra','Pontevedra'),(169,'ES','Salamanca','Salamanca'),(170,'ES','Santa Cruz de Tenerife','Santa Cruz de Tenerife'),(171,'ES','Segovia','Segovia'),(172,'ES','Sevilla','Sevilla'),(173,'ES','Soria','Soria'),(174,'ES','Tarragona','Tarragona'),(175,'ES','Teruel','Teruel'),(176,'ES','Toledo','Toledo'),(177,'ES','Valencia','Valencia'),(178,'ES','Valladolid','Valladolid'),(179,'ES','Vizcaya','Vizcaya'),(180,'ES','Zamora','Zamora'),(181,'ES','Zaragoza','Zaragoza'),(182,'FR','1','Ain'),(183,'FR','2','Aisne'),(184,'FR','3','Allier'),(185,'FR','4','Alpes-de-Haute-Provence'),(186,'FR','5','Hautes-Alpes'),(187,'FR','6','Alpes-Maritimes'),(188,'FR','7','ArdÃ¨che'),(189,'FR','8','Ardennes'),(190,'FR','9','AriÃ¨ge'),(191,'FR','10','Aube'),(192,'FR','11','Aude'),(193,'FR','12','Aveyron'),(194,'FR','13','Bouches-du-RhÃ´ne'),(195,'FR','14','Calvados'),(196,'FR','15','Cantal'),(197,'FR','16','Charente'),(198,'FR','17','Charente-Maritime'),(199,'FR','18','Cher'),(200,'FR','19','CorrÃ¨ze'),(201,'FR','2A','Corse-du-Sud'),(202,'FR','2B','Haute-Corse'),(203,'FR','21','CÃ´te-d\'Or'),(204,'FR','22','CÃ´tes-d\'Armor'),(205,'FR','23','Creuse'),(206,'FR','24','Dordogne'),(207,'FR','25','Doubs'),(208,'FR','26','DrÃ´me'),(209,'FR','27','Eure'),(210,'FR','28','Eure-et-Loir'),(211,'FR','29','FinistÃ¨re'),(212,'FR','30','Gard'),(213,'FR','31','Haute-Garonne'),(214,'FR','32','Gers'),(215,'FR','33','Gironde'),(216,'FR','34','HÃ©rault'),(217,'FR','35','Ille-et-Vilaine'),(218,'FR','36','Indre'),(219,'FR','37','Indre-et-Loire'),(220,'FR','38','IsÃ¨re'),(221,'FR','39','Jura'),(222,'FR','40','Landes'),(223,'FR','41','Loir-et-Cher'),(224,'FR','42','Loire'),(225,'FR','43','Haute-Loire'),(226,'FR','44','Loire-Atlantique'),(227,'FR','45','Loiret'),(228,'FR','46','Lot'),(229,'FR','47','Lot-et-Garonne'),(230,'FR','48','LozÃ¨re'),(231,'FR','49','Maine-et-Loire'),(232,'FR','50','Manche'),(233,'FR','51','Marne'),(234,'FR','52','Haute-Marne'),(235,'FR','53','Mayenne'),(236,'FR','54','Meurthe-et-Moselle'),(237,'FR','55','Meuse'),(238,'FR','56','Morbihan'),(239,'FR','57','Moselle'),(240,'FR','58','NiÃ¨vre'),(241,'FR','59','Nord'),(242,'FR','60','Oise'),(243,'FR','61','Orne'),(244,'FR','62','Pas-de-Calais'),(245,'FR','63','Puy-de-DÃ´me'),(246,'FR','64','PyrÃ©nÃ©es-Atlantiques'),(247,'FR','65','Hautes-PyrÃ©nÃ©es'),(248,'FR','66','PyrÃ©nÃ©es-Orientales'),(249,'FR','67','Bas-Rhin'),(250,'FR','68','Haut-Rhin'),(251,'FR','69','RhÃ´ne'),(252,'FR','70','Haute-SaÃ´ne'),(253,'FR','71','SaÃ´ne-et-Loire'),(254,'FR','72','Sarthe'),(255,'FR','73','Savoie'),(256,'FR','74','Haute-Savoie'),(257,'FR','75','Paris'),(258,'FR','76','Seine-Maritime'),(259,'FR','77','Seine-et-Marne'),(260,'FR','78','Yvelines'),(261,'FR','79','Deux-SÃ¨vres'),(262,'FR','80','Somme'),(263,'FR','81','Tarn'),(264,'FR','82','Tarn-et-Garonne'),(265,'FR','83','Var'),(266,'FR','84','Vaucluse'),(267,'FR','85','VendÃ©e'),(268,'FR','86','Vienne'),(269,'FR','87','Haute-Vienne'),(270,'FR','88','Vosges'),(271,'FR','89','Yonne'),(272,'FR','90','Territoire-de-Belfort'),(273,'FR','91','Essonne'),(274,'FR','92','Hauts-de-Seine'),(275,'FR','93','Seine-Saint-Denis'),(276,'FR','94','Val-de-Marne'),(277,'FR','95','Val-d\'Oise'),(278,'RO','AB','Alba'),(279,'RO','AR','Arad'),(280,'RO','AG','ArgeÅŸ'),(281,'RO','BC','BacÄƒu'),(282,'RO','BH','Bihor'),(283,'RO','BN','BistriÅ£a-NÄƒsÄƒud'),(284,'RO','BT','BotoÅŸani'),(285,'RO','BV','BraÅŸov'),(286,'RO','BR','BrÄƒila'),(287,'RO','B','BucureÅŸti'),(288,'RO','BZ','BuzÄƒu'),(289,'RO','CS','CaraÅŸ-Severin'),(290,'RO','CL','CÄƒlÄƒraÅŸi'),(291,'RO','CJ','Cluj'),(292,'RO','CT','ConstanÅ£a'),(293,'RO','CV','Covasna'),(294,'RO','DB','DÃ¢mboviÅ£a'),(295,'RO','DJ','Dolj'),(296,'RO','GL','GalaÅ£i'),(297,'RO','GR','Giurgiu'),(298,'RO','GJ','Gorj'),(299,'RO','HR','Harghita'),(300,'RO','HD','Hunedoara'),(301,'RO','IL','IalomiÅ£a'),(302,'RO','IS','IaÅŸi'),(303,'RO','IF','Ilfov'),(304,'RO','MM','MaramureÅŸ'),(305,'RO','MH','MehedinÅ£i'),(306,'RO','MS','MureÅŸ'),(307,'RO','NT','NeamÅ£'),(308,'RO','OT','Olt'),(309,'RO','PH','Prahova'),(310,'RO','SM','Satu-Mare'),(311,'RO','SJ','SÄƒlaj'),(312,'RO','SB','Sibiu'),(313,'RO','SV','Suceava'),(314,'RO','TR','Teleorman'),(315,'RO','TM','TimiÅŸ'),(316,'RO','TL','Tulcea'),(317,'RO','VS','Vaslui'),(318,'RO','VL','VÃ¢lcea'),(319,'RO','VN','Vrancea'),(320,'FI','Lappi','Lappi'),(321,'FI','Pohjois-Pohjanmaa','Pohjois-Pohjanmaa'),(322,'FI','Kainuu','Kainuu'),(323,'FI','Pohjois-Karjala','Pohjois-Karjala'),(324,'FI','Pohjois-Savo','Pohjois-Savo'),(325,'FI','EtelÃ¤-Savo','EtelÃ¤-Savo'),(326,'FI','EtelÃ¤-Pohjanmaa','EtelÃ¤-Pohjanmaa'),(327,'FI','Pohjanmaa','Pohjanmaa'),(328,'FI','Pirkanmaa','Pirkanmaa'),(329,'FI','Satakunta','Satakunta'),(330,'FI','Keski-Pohjanmaa','Keski-Pohjanmaa'),(331,'FI','Keski-Suomi','Keski-Suomi'),(332,'FI','Varsinais-Suomi','Varsinais-Suomi'),(333,'FI','EtelÃ¤-Karjala','EtelÃ¤-Karjala'),(334,'FI','PÃ¤ijÃ¤t-HÃ¤me','PÃ¤ijÃ¤t-HÃ¤me'),(335,'FI','Kanta-HÃ¤me','Kanta-HÃ¤me'),(336,'FI','Uusimaa','Uusimaa'),(337,'FI','ItÃ¤-Uusimaa','ItÃ¤-Uusimaa'),(338,'FI','Kymenlaakso','Kymenlaakso'),(339,'FI','Ahvenanmaa','Ahvenanmaa'),(340,'EE','EE-37','Harjumaa'),(341,'EE','EE-39','Hiiumaa'),(342,'EE','EE-44','Ida-Virumaa'),(343,'EE','EE-49','JÃµgevamaa'),(344,'EE','EE-51','JÃ¤rvamaa'),(345,'EE','EE-57','LÃ¤Ã¤nemaa'),(346,'EE','EE-59','LÃ¤Ã¤ne-Virumaa'),(347,'EE','EE-65','PÃµlvamaa'),(348,'EE','EE-67','PÃ¤rnumaa'),(349,'EE','EE-70','Raplamaa'),(350,'EE','EE-74','Saaremaa'),(351,'EE','EE-78','Tartumaa'),(352,'EE','EE-82','Valgamaa'),(353,'EE','EE-84','Viljandimaa'),(354,'EE','EE-86','VÃµrumaa'),(355,'LV','LV-DGV','Daugavpils'),(356,'LV','LV-JEL','Jelgava'),(357,'LV','JÄ“kabpils','JÄ“kabpils'),(358,'LV','LV-JUR','JÅ«rmala'),(359,'LV','LV-LPX','LiepÄja'),(360,'LV','LV-LE','LiepÄjas novads'),(361,'LV','LV-REZ','RÄ“zekne'),(362,'LV','LV-RIX','RÄ«ga'),(363,'LV','LV-RI','RÄ«gas novads'),(364,'LV','Valmiera','Valmiera'),(365,'LV','LV-VEN','Ventspils'),(366,'LV','Aglonas novads','Aglonas novads'),(367,'LV','LV-AI','Aizkraukles novads'),(368,'LV','Aizputes novads','Aizputes novads'),(369,'LV','AknÄ«stes novads','AknÄ«stes novads'),(370,'LV','Alojas novads','Alojas novads'),(371,'LV','Alsungas novads','Alsungas novads'),(372,'LV','LV-AL','AlÅ«ksnes novads'),(373,'LV','Amatas novads','Amatas novads'),(374,'LV','Apes novads','Apes novads'),(375,'LV','Auces novads','Auces novads'),(376,'LV','BabÄ«tes novads','BabÄ«tes novads'),(377,'LV','Baldones novads','Baldones novads'),(378,'LV','Baltinavas novads','Baltinavas novads'),(379,'LV','LV-BL','Balvu novads'),(380,'LV','LV-BU','Bauskas novads'),(381,'LV','BeverÄ«nas novads','BeverÄ«nas novads'),(382,'LV','BrocÄ“nu novads','BrocÄ“nu novads'),(383,'LV','Burtnieku novads','Burtnieku novads'),(384,'LV','Carnikavas novads','Carnikavas novads'),(385,'LV','Cesvaines novads','Cesvaines novads'),(386,'LV','Ciblas novads','Ciblas novads'),(387,'LV','LV-CE','CÄ“su novads'),(388,'LV','Dagdas novads','Dagdas novads'),(389,'LV','LV-DA','Daugavpils novads'),(390,'LV','LV-DO','Dobeles novads'),(391,'LV','Dundagas novads','Dundagas novads'),(392,'LV','Durbes novads','Durbes novads'),(393,'LV','Engures novads','Engures novads'),(394,'LV','Garkalnes novads','Garkalnes novads'),(395,'LV','GrobiÅ†as novads','GrobiÅ†as novads'),(396,'LV','LV-GU','Gulbenes novads'),(397,'LV','Iecavas novads','Iecavas novads'),(398,'LV','IkÅ¡Ä·iles novads','IkÅ¡Ä·iles novads'),(399,'LV','IlÅ«kstes novads','IlÅ«kstes novads'),(400,'LV','InÄukalna novads','InÄukalna novads'),(401,'LV','Jaunjelgavas novads','Jaunjelgavas novads'),(402,'LV','Jaunpiebalgas novads','Jaunpiebalgas novads'),(403,'LV','Jaunpils novads','Jaunpils novads'),(404,'LV','LV-JL','Jelgavas novads'),(405,'LV','LV-JK','JÄ“kabpils novads'),(406,'LV','Kandavas novads','Kandavas novads'),(407,'LV','Kokneses novads','Kokneses novads'),(408,'LV','Krimuldas novads','Krimuldas novads'),(409,'LV','Krustpils novads','Krustpils novads'),(410,'LV','LV-KR','KrÄslavas novads'),(411,'LV','LV-KU','KuldÄ«gas novads'),(412,'LV','KÄrsavas novads','KÄrsavas novads'),(413,'LV','LielvÄrdes novads','LielvÄrdes novads'),(414,'LV','LV-LM','LimbaÅ¾u novads'),(415,'LV','LubÄnas novads','LubÄnas novads'),(416,'LV','LV-LU','Ludzas novads'),(417,'LV','LÄ«gatnes novads','LÄ«gatnes novads'),(418,'LV','LÄ«vÄnu novads','LÄ«vÄnu novads'),(419,'LV','LV-MA','Madonas novads'),(420,'LV','Mazsalacas novads','Mazsalacas novads'),(421,'LV','MÄlpils novads','MÄlpils novads'),(422,'LV','MÄrupes novads','MÄrupes novads'),(423,'LV','NaukÅ¡Ä“nu novads','NaukÅ¡Ä“nu novads'),(424,'LV','Neretas novads','Neretas novads'),(425,'LV','NÄ«cas novads','NÄ«cas novads'),(426,'LV','LV-OG','Ogres novads'),(427,'LV','Olaines novads','Olaines novads'),(428,'LV','Ozolnieku novads','Ozolnieku novads'),(429,'LV','LV-PR','PreiÄ¼u novads'),(430,'LV','Priekules novads','Priekules novads'),(431,'LV','PriekuÄ¼u novads','PriekuÄ¼u novads'),(432,'LV','PÄrgaujas novads','PÄrgaujas novads'),(433,'LV','PÄvilostas novads','PÄvilostas novads'),(434,'LV','PÄ¼aviÅ†u novads','PÄ¼aviÅ†u novads'),(435,'LV','Raunas novads','Raunas novads'),(436,'LV','RiebiÅ†u novads','RiebiÅ†u novads'),(437,'LV','Rojas novads','Rojas novads'),(438,'LV','RopaÅ¾u novads','RopaÅ¾u novads'),(439,'LV','Rucavas novads','Rucavas novads'),(440,'LV','RugÄju novads','RugÄju novads'),(441,'LV','RundÄles novads','RundÄles novads'),(442,'LV','LV-RE','RÄ“zeknes novads'),(443,'LV','RÅ«jienas novads','RÅ«jienas novads'),(444,'LV','SalacgrÄ«vas novads','SalacgrÄ«vas novads'),(445,'LV','Salas novads','Salas novads'),(446,'LV','Salaspils novads','Salaspils novads'),(447,'LV','LV-SA','Saldus novads'),(448,'LV','Saulkrastu novads','Saulkrastu novads'),(449,'LV','Siguldas novads','Siguldas novads'),(450,'LV','Skrundas novads','Skrundas novads'),(451,'LV','SkrÄ«veru novads','SkrÄ«veru novads'),(452,'LV','Smiltenes novads','Smiltenes novads'),(453,'LV','StopiÅ†u novads','StopiÅ†u novads'),(454,'LV','StrenÄu novads','StrenÄu novads'),(455,'LV','SÄ“jas novads','SÄ“jas novads'),(456,'LV','LV-TA','Talsu novads'),(457,'LV','LV-TU','Tukuma novads'),(458,'LV','TÄ“rvetes novads','TÄ“rvetes novads'),(459,'LV','VaiÅ†odes novads','VaiÅ†odes novads'),(460,'LV','LV-VK','Valkas novads'),(461,'LV','LV-VM','Valmieras novads'),(462,'LV','VarakÄ¼Änu novads','VarakÄ¼Änu novads'),(463,'LV','Vecpiebalgas novads','Vecpiebalgas novads'),(464,'LV','Vecumnieku novads','Vecumnieku novads'),(465,'LV','LV-VE','Ventspils novads'),(466,'LV','ViesÄ«tes novads','ViesÄ«tes novads'),(467,'LV','ViÄ¼akas novads','ViÄ¼akas novads'),(468,'LV','ViÄ¼Änu novads','ViÄ¼Änu novads'),(469,'LV','VÄrkavas novads','VÄrkavas novads'),(470,'LV','Zilupes novads','Zilupes novads'),(471,'LV','Ä€daÅ¾u novads','Ä€daÅ¾u novads'),(472,'LV','Ä’rgÄ¼u novads','Ä’rgÄ¼u novads'),(473,'LV','Ä¶eguma novads','Ä¶eguma novads'),(474,'LV','Ä¶ekavas novads','Ä¶ekavas novads'),(475,'LT','LT-AL','Alytaus Apskritis'),(476,'LT','LT-KU','Kauno Apskritis'),(477,'LT','LT-KL','KlaipÄ—dos Apskritis'),(478,'LT','LT-MR','MarijampolÄ—s Apskritis'),(479,'LT','LT-PN','PanevÄ—Å¾io Apskritis'),(480,'LT','LT-SA','Å iauliÅ³ Apskritis'),(481,'LT','LT-TA','TauragÄ—s Apskritis'),(482,'LT','LT-TE','TelÅ¡iÅ³ Apskritis'),(483,'LT','LT-UT','Utenos Apskritis'),(484,'LT','LT-VL','Vilniaus Apskritis');
/*!40000 ALTER TABLE `magev1_directory_country_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_directory_country_region_name`
--

DROP TABLE IF EXISTS `magev1_directory_country_region_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_directory_country_region_name` (
  `locale` varchar(8) NOT NULL DEFAULT '' COMMENT 'Locale',
  `region_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Region Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Region Name',
  PRIMARY KEY (`locale`,`region_id`),
  KEY `IDX_MAGEV1_DIRECTORY_COUNTRY_REGION_NAME_REGION_ID` (`region_id`),
  CONSTRAINT `FK_19162C6D836F9037328DB92F600E4A82` FOREIGN KEY (`region_id`) REFERENCES `magev1_directory_country_region` (`region_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Country Region Name';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_directory_country_region_name`
--

LOCK TABLES `magev1_directory_country_region_name` WRITE;
/*!40000 ALTER TABLE `magev1_directory_country_region_name` DISABLE KEYS */;
INSERT INTO `magev1_directory_country_region_name` VALUES ('en_US',1,'Alabama'),('en_US',2,'Alaska'),('en_US',3,'American Samoa'),('en_US',4,'Arizona'),('en_US',5,'Arkansas'),('en_US',6,'Armed Forces Africa'),('en_US',7,'Armed Forces Americas'),('en_US',8,'Armed Forces Canada'),('en_US',9,'Armed Forces Europe'),('en_US',10,'Armed Forces Middle East'),('en_US',11,'Armed Forces Pacific'),('en_US',12,'California'),('en_US',13,'Colorado'),('en_US',14,'Connecticut'),('en_US',15,'Delaware'),('en_US',16,'District of Columbia'),('en_US',17,'Federated States Of Micronesia'),('en_US',18,'Florida'),('en_US',19,'Georgia'),('en_US',20,'Guam'),('en_US',21,'Hawaii'),('en_US',22,'Idaho'),('en_US',23,'Illinois'),('en_US',24,'Indiana'),('en_US',25,'Iowa'),('en_US',26,'Kansas'),('en_US',27,'Kentucky'),('en_US',28,'Louisiana'),('en_US',29,'Maine'),('en_US',30,'Marshall Islands'),('en_US',31,'Maryland'),('en_US',32,'Massachusetts'),('en_US',33,'Michigan'),('en_US',34,'Minnesota'),('en_US',35,'Mississippi'),('en_US',36,'Missouri'),('en_US',37,'Montana'),('en_US',38,'Nebraska'),('en_US',39,'Nevada'),('en_US',40,'New Hampshire'),('en_US',41,'New Jersey'),('en_US',42,'New Mexico'),('en_US',43,'New York'),('en_US',44,'North Carolina'),('en_US',45,'North Dakota'),('en_US',46,'Northern Mariana Islands'),('en_US',47,'Ohio'),('en_US',48,'Oklahoma'),('en_US',49,'Oregon'),('en_US',50,'Palau'),('en_US',51,'Pennsylvania'),('en_US',52,'Puerto Rico'),('en_US',53,'Rhode Island'),('en_US',54,'South Carolina'),('en_US',55,'South Dakota'),('en_US',56,'Tennessee'),('en_US',57,'Texas'),('en_US',58,'Utah'),('en_US',59,'Vermont'),('en_US',60,'Virgin Islands'),('en_US',61,'Virginia'),('en_US',62,'Washington'),('en_US',63,'West Virginia'),('en_US',64,'Wisconsin'),('en_US',65,'Wyoming'),('en_US',66,'Alberta'),('en_US',67,'British Columbia'),('en_US',68,'Manitoba'),('en_US',69,'Newfoundland and Labrador'),('en_US',70,'New Brunswick'),('en_US',71,'Nova Scotia'),('en_US',72,'Northwest Territories'),('en_US',73,'Nunavut'),('en_US',74,'Ontario'),('en_US',75,'Prince Edward Island'),('en_US',76,'Quebec'),('en_US',77,'Saskatchewan'),('en_US',78,'Yukon Territory'),('en_US',79,'Niedersachsen'),('en_US',80,'Baden-WÃ¼rttemberg'),('en_US',81,'Bayern'),('en_US',82,'Berlin'),('en_US',83,'Brandenburg'),('en_US',84,'Bremen'),('en_US',85,'Hamburg'),('en_US',86,'Hessen'),('en_US',87,'Mecklenburg-Vorpommern'),('en_US',88,'Nordrhein-Westfalen'),('en_US',89,'Rheinland-Pfalz'),('en_US',90,'Saarland'),('en_US',91,'Sachsen'),('en_US',92,'Sachsen-Anhalt'),('en_US',93,'Schleswig-Holstein'),('en_US',94,'ThÃ¼ringen'),('en_US',95,'Wien'),('en_US',96,'NiederÃ¶sterreich'),('en_US',97,'OberÃ¶sterreich'),('en_US',98,'Salzburg'),('en_US',99,'KÃ¤rnten'),('en_US',100,'Steiermark'),('en_US',101,'Tirol'),('en_US',102,'Burgenland'),('en_US',103,'Vorarlberg'),('en_US',104,'Aargau'),('en_US',105,'Appenzell Innerrhoden'),('en_US',106,'Appenzell Ausserrhoden'),('en_US',107,'Bern'),('en_US',108,'Basel-Landschaft'),('en_US',109,'Basel-Stadt'),('en_US',110,'Freiburg'),('en_US',111,'Genf'),('en_US',112,'Glarus'),('en_US',113,'GraubÃ¼nden'),('en_US',114,'Jura'),('en_US',115,'Luzern'),('en_US',116,'Neuenburg'),('en_US',117,'Nidwalden'),('en_US',118,'Obwalden'),('en_US',119,'St. Gallen'),('en_US',120,'Schaffhausen'),('en_US',121,'Solothurn'),('en_US',122,'Schwyz'),('en_US',123,'Thurgau'),('en_US',124,'Tessin'),('en_US',125,'Uri'),('en_US',126,'Waadt'),('en_US',127,'Wallis'),('en_US',128,'Zug'),('en_US',129,'ZÃ¼rich'),('en_US',130,'A CoruÃ±a'),('en_US',131,'Alava'),('en_US',132,'Albacete'),('en_US',133,'Alicante'),('en_US',134,'Almeria'),('en_US',135,'Asturias'),('en_US',136,'Avila'),('en_US',137,'Badajoz'),('en_US',138,'Baleares'),('en_US',139,'Barcelona'),('en_US',140,'Burgos'),('en_US',141,'Caceres'),('en_US',142,'Cadiz'),('en_US',143,'Cantabria'),('en_US',144,'Castellon'),('en_US',145,'Ceuta'),('en_US',146,'Ciudad Real'),('en_US',147,'Cordoba'),('en_US',148,'Cuenca'),('en_US',149,'Girona'),('en_US',150,'Granada'),('en_US',151,'Guadalajara'),('en_US',152,'Guipuzcoa'),('en_US',153,'Huelva'),('en_US',154,'Huesca'),('en_US',155,'Jaen'),('en_US',156,'La Rioja'),('en_US',157,'Las Palmas'),('en_US',158,'Leon'),('en_US',159,'Lleida'),('en_US',160,'Lugo'),('en_US',161,'Madrid'),('en_US',162,'Malaga'),('en_US',163,'Melilla'),('en_US',164,'Murcia'),('en_US',165,'Navarra'),('en_US',166,'Ourense'),('en_US',167,'Palencia'),('en_US',168,'Pontevedra'),('en_US',169,'Salamanca'),('en_US',170,'Santa Cruz de Tenerife'),('en_US',171,'Segovia'),('en_US',172,'Sevilla'),('en_US',173,'Soria'),('en_US',174,'Tarragona'),('en_US',175,'Teruel'),('en_US',176,'Toledo'),('en_US',177,'Valencia'),('en_US',178,'Valladolid'),('en_US',179,'Vizcaya'),('en_US',180,'Zamora'),('en_US',181,'Zaragoza'),('en_US',182,'Ain'),('en_US',183,'Aisne'),('en_US',184,'Allier'),('en_US',185,'Alpes-de-Haute-Provence'),('en_US',186,'Hautes-Alpes'),('en_US',187,'Alpes-Maritimes'),('en_US',188,'ArdÃ¨che'),('en_US',189,'Ardennes'),('en_US',190,'AriÃ¨ge'),('en_US',191,'Aube'),('en_US',192,'Aude'),('en_US',193,'Aveyron'),('en_US',194,'Bouches-du-RhÃ´ne'),('en_US',195,'Calvados'),('en_US',196,'Cantal'),('en_US',197,'Charente'),('en_US',198,'Charente-Maritime'),('en_US',199,'Cher'),('en_US',200,'CorrÃ¨ze'),('en_US',201,'Corse-du-Sud'),('en_US',202,'Haute-Corse'),('en_US',203,'CÃ´te-d\'Or'),('en_US',204,'CÃ´tes-d\'Armor'),('en_US',205,'Creuse'),('en_US',206,'Dordogne'),('en_US',207,'Doubs'),('en_US',208,'DrÃ´me'),('en_US',209,'Eure'),('en_US',210,'Eure-et-Loir'),('en_US',211,'FinistÃ¨re'),('en_US',212,'Gard'),('en_US',213,'Haute-Garonne'),('en_US',214,'Gers'),('en_US',215,'Gironde'),('en_US',216,'HÃ©rault'),('en_US',217,'Ille-et-Vilaine'),('en_US',218,'Indre'),('en_US',219,'Indre-et-Loire'),('en_US',220,'IsÃ¨re'),('en_US',221,'Jura'),('en_US',222,'Landes'),('en_US',223,'Loir-et-Cher'),('en_US',224,'Loire'),('en_US',225,'Haute-Loire'),('en_US',226,'Loire-Atlantique'),('en_US',227,'Loiret'),('en_US',228,'Lot'),('en_US',229,'Lot-et-Garonne'),('en_US',230,'LozÃ¨re'),('en_US',231,'Maine-et-Loire'),('en_US',232,'Manche'),('en_US',233,'Marne'),('en_US',234,'Haute-Marne'),('en_US',235,'Mayenne'),('en_US',236,'Meurthe-et-Moselle'),('en_US',237,'Meuse'),('en_US',238,'Morbihan'),('en_US',239,'Moselle'),('en_US',240,'NiÃ¨vre'),('en_US',241,'Nord'),('en_US',242,'Oise'),('en_US',243,'Orne'),('en_US',244,'Pas-de-Calais'),('en_US',245,'Puy-de-DÃ´me'),('en_US',246,'PyrÃ©nÃ©es-Atlantiques'),('en_US',247,'Hautes-PyrÃ©nÃ©es'),('en_US',248,'PyrÃ©nÃ©es-Orientales'),('en_US',249,'Bas-Rhin'),('en_US',250,'Haut-Rhin'),('en_US',251,'RhÃ´ne'),('en_US',252,'Haute-SaÃ´ne'),('en_US',253,'SaÃ´ne-et-Loire'),('en_US',254,'Sarthe'),('en_US',255,'Savoie'),('en_US',256,'Haute-Savoie'),('en_US',257,'Paris'),('en_US',258,'Seine-Maritime'),('en_US',259,'Seine-et-Marne'),('en_US',260,'Yvelines'),('en_US',261,'Deux-SÃ¨vres'),('en_US',262,'Somme'),('en_US',263,'Tarn'),('en_US',264,'Tarn-et-Garonne'),('en_US',265,'Var'),('en_US',266,'Vaucluse'),('en_US',267,'VendÃ©e'),('en_US',268,'Vienne'),('en_US',269,'Haute-Vienne'),('en_US',270,'Vosges'),('en_US',271,'Yonne'),('en_US',272,'Territoire-de-Belfort'),('en_US',273,'Essonne'),('en_US',274,'Hauts-de-Seine'),('en_US',275,'Seine-Saint-Denis'),('en_US',276,'Val-de-Marne'),('en_US',277,'Val-d\'Oise'),('en_US',278,'Alba'),('en_US',279,'Arad'),('en_US',280,'ArgeÅŸ'),('en_US',281,'BacÄƒu'),('en_US',282,'Bihor'),('en_US',283,'BistriÅ£a-NÄƒsÄƒud'),('en_US',284,'BotoÅŸani'),('en_US',285,'BraÅŸov'),('en_US',286,'BrÄƒila'),('en_US',287,'BucureÅŸti'),('en_US',288,'BuzÄƒu'),('en_US',289,'CaraÅŸ-Severin'),('en_US',290,'CÄƒlÄƒraÅŸi'),('en_US',291,'Cluj'),('en_US',292,'ConstanÅ£a'),('en_US',293,'Covasna'),('en_US',294,'DÃ¢mboviÅ£a'),('en_US',295,'Dolj'),('en_US',296,'GalaÅ£i'),('en_US',297,'Giurgiu'),('en_US',298,'Gorj'),('en_US',299,'Harghita'),('en_US',300,'Hunedoara'),('en_US',301,'IalomiÅ£a'),('en_US',302,'IaÅŸi'),('en_US',303,'Ilfov'),('en_US',304,'MaramureÅŸ'),('en_US',305,'MehedinÅ£i'),('en_US',306,'MureÅŸ'),('en_US',307,'NeamÅ£'),('en_US',308,'Olt'),('en_US',309,'Prahova'),('en_US',310,'Satu-Mare'),('en_US',311,'SÄƒlaj'),('en_US',312,'Sibiu'),('en_US',313,'Suceava'),('en_US',314,'Teleorman'),('en_US',315,'TimiÅŸ'),('en_US',316,'Tulcea'),('en_US',317,'Vaslui'),('en_US',318,'VÃ¢lcea'),('en_US',319,'Vrancea'),('en_US',320,'Lappi'),('en_US',321,'Pohjois-Pohjanmaa'),('en_US',322,'Kainuu'),('en_US',323,'Pohjois-Karjala'),('en_US',324,'Pohjois-Savo'),('en_US',325,'EtelÃ¤-Savo'),('en_US',326,'EtelÃ¤-Pohjanmaa'),('en_US',327,'Pohjanmaa'),('en_US',328,'Pirkanmaa'),('en_US',329,'Satakunta'),('en_US',330,'Keski-Pohjanmaa'),('en_US',331,'Keski-Suomi'),('en_US',332,'Varsinais-Suomi'),('en_US',333,'EtelÃ¤-Karjala'),('en_US',334,'PÃ¤ijÃ¤t-HÃ¤me'),('en_US',335,'Kanta-HÃ¤me'),('en_US',336,'Uusimaa'),('en_US',337,'ItÃ¤-Uusimaa'),('en_US',338,'Kymenlaakso'),('en_US',339,'Ahvenanmaa'),('en_US',340,'Harjumaa'),('en_US',341,'Hiiumaa'),('en_US',342,'Ida-Virumaa'),('en_US',343,'JÃµgevamaa'),('en_US',344,'JÃ¤rvamaa'),('en_US',345,'LÃ¤Ã¤nemaa'),('en_US',346,'LÃ¤Ã¤ne-Virumaa'),('en_US',347,'PÃµlvamaa'),('en_US',348,'PÃ¤rnumaa'),('en_US',349,'Raplamaa'),('en_US',350,'Saaremaa'),('en_US',351,'Tartumaa'),('en_US',352,'Valgamaa'),('en_US',353,'Viljandimaa'),('en_US',354,'VÃµrumaa'),('en_US',355,'Daugavpils'),('en_US',356,'Jelgava'),('en_US',357,'JÄ“kabpils'),('en_US',358,'JÅ«rmala'),('en_US',359,'LiepÄja'),('en_US',360,'LiepÄjas novads'),('en_US',361,'RÄ“zekne'),('en_US',362,'RÄ«ga'),('en_US',363,'RÄ«gas novads'),('en_US',364,'Valmiera'),('en_US',365,'Ventspils'),('en_US',366,'Aglonas novads'),('en_US',367,'Aizkraukles novads'),('en_US',368,'Aizputes novads'),('en_US',369,'AknÄ«stes novads'),('en_US',370,'Alojas novads'),('en_US',371,'Alsungas novads'),('en_US',372,'AlÅ«ksnes novads'),('en_US',373,'Amatas novads'),('en_US',374,'Apes novads'),('en_US',375,'Auces novads'),('en_US',376,'BabÄ«tes novads'),('en_US',377,'Baldones novads'),('en_US',378,'Baltinavas novads'),('en_US',379,'Balvu novads'),('en_US',380,'Bauskas novads'),('en_US',381,'BeverÄ«nas novads'),('en_US',382,'BrocÄ“nu novads'),('en_US',383,'Burtnieku novads'),('en_US',384,'Carnikavas novads'),('en_US',385,'Cesvaines novads'),('en_US',386,'Ciblas novads'),('en_US',387,'CÄ“su novads'),('en_US',388,'Dagdas novads'),('en_US',389,'Daugavpils novads'),('en_US',390,'Dobeles novads'),('en_US',391,'Dundagas novads'),('en_US',392,'Durbes novads'),('en_US',393,'Engures novads'),('en_US',394,'Garkalnes novads'),('en_US',395,'GrobiÅ†as novads'),('en_US',396,'Gulbenes novads'),('en_US',397,'Iecavas novads'),('en_US',398,'IkÅ¡Ä·iles novads'),('en_US',399,'IlÅ«kstes novads'),('en_US',400,'InÄukalna novads'),('en_US',401,'Jaunjelgavas novads'),('en_US',402,'Jaunpiebalgas novads'),('en_US',403,'Jaunpils novads'),('en_US',404,'Jelgavas novads'),('en_US',405,'JÄ“kabpils novads'),('en_US',406,'Kandavas novads'),('en_US',407,'Kokneses novads'),('en_US',408,'Krimuldas novads'),('en_US',409,'Krustpils novads'),('en_US',410,'KrÄslavas novads'),('en_US',411,'KuldÄ«gas novads'),('en_US',412,'KÄrsavas novads'),('en_US',413,'LielvÄrdes novads'),('en_US',414,'LimbaÅ¾u novads'),('en_US',415,'LubÄnas novads'),('en_US',416,'Ludzas novads'),('en_US',417,'LÄ«gatnes novads'),('en_US',418,'LÄ«vÄnu novads'),('en_US',419,'Madonas novads'),('en_US',420,'Mazsalacas novads'),('en_US',421,'MÄlpils novads'),('en_US',422,'MÄrupes novads'),('en_US',423,'NaukÅ¡Ä“nu novads'),('en_US',424,'Neretas novads'),('en_US',425,'NÄ«cas novads'),('en_US',426,'Ogres novads'),('en_US',427,'Olaines novads'),('en_US',428,'Ozolnieku novads'),('en_US',429,'PreiÄ¼u novads'),('en_US',430,'Priekules novads'),('en_US',431,'PriekuÄ¼u novads'),('en_US',432,'PÄrgaujas novads'),('en_US',433,'PÄvilostas novads'),('en_US',434,'PÄ¼aviÅ†u novads'),('en_US',435,'Raunas novads'),('en_US',436,'RiebiÅ†u novads'),('en_US',437,'Rojas novads'),('en_US',438,'RopaÅ¾u novads'),('en_US',439,'Rucavas novads'),('en_US',440,'RugÄju novads'),('en_US',441,'RundÄles novads'),('en_US',442,'RÄ“zeknes novads'),('en_US',443,'RÅ«jienas novads'),('en_US',444,'SalacgrÄ«vas novads'),('en_US',445,'Salas novads'),('en_US',446,'Salaspils novads'),('en_US',447,'Saldus novads'),('en_US',448,'Saulkrastu novads'),('en_US',449,'Siguldas novads'),('en_US',450,'Skrundas novads'),('en_US',451,'SkrÄ«veru novads'),('en_US',452,'Smiltenes novads'),('en_US',453,'StopiÅ†u novads'),('en_US',454,'StrenÄu novads'),('en_US',455,'SÄ“jas novads'),('en_US',456,'Talsu novads'),('en_US',457,'Tukuma novads'),('en_US',458,'TÄ“rvetes novads'),('en_US',459,'VaiÅ†odes novads'),('en_US',460,'Valkas novads'),('en_US',461,'Valmieras novads'),('en_US',462,'VarakÄ¼Änu novads'),('en_US',463,'Vecpiebalgas novads'),('en_US',464,'Vecumnieku novads'),('en_US',465,'Ventspils novads'),('en_US',466,'ViesÄ«tes novads'),('en_US',467,'ViÄ¼akas novads'),('en_US',468,'ViÄ¼Änu novads'),('en_US',469,'VÄrkavas novads'),('en_US',470,'Zilupes novads'),('en_US',471,'Ä€daÅ¾u novads'),('en_US',472,'Ä’rgÄ¼u novads'),('en_US',473,'Ä¶eguma novads'),('en_US',474,'Ä¶ekavas novads'),('en_US',475,'Alytaus Apskritis'),('en_US',476,'Kauno Apskritis'),('en_US',477,'KlaipÄ—dos Apskritis'),('en_US',478,'MarijampolÄ—s Apskritis'),('en_US',479,'PanevÄ—Å¾io Apskritis'),('en_US',480,'Å iauliÅ³ Apskritis'),('en_US',481,'TauragÄ—s Apskritis'),('en_US',482,'TelÅ¡iÅ³ Apskritis'),('en_US',483,'Utenos Apskritis'),('en_US',484,'Vilniaus Apskritis');
/*!40000 ALTER TABLE `magev1_directory_country_region_name` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_directory_currency_rate`
--

DROP TABLE IF EXISTS `magev1_directory_currency_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_directory_currency_rate` (
  `currency_from` varchar(3) NOT NULL DEFAULT '' COMMENT 'Currency Code Convert From',
  `currency_to` varchar(3) NOT NULL DEFAULT '' COMMENT 'Currency Code Convert To',
  `rate` decimal(24,12) NOT NULL DEFAULT '0.000000000000' COMMENT 'Currency Conversion Rate',
  PRIMARY KEY (`currency_from`,`currency_to`),
  KEY `IDX_MAGEV1_DIRECTORY_CURRENCY_RATE_CURRENCY_TO` (`currency_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Directory Currency Rate';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_directory_currency_rate`
--

LOCK TABLES `magev1_directory_currency_rate` WRITE;
/*!40000 ALTER TABLE `magev1_directory_currency_rate` DISABLE KEYS */;
INSERT INTO `magev1_directory_currency_rate` VALUES ('EUR','EUR',1.000000000000),('EUR','USD',1.415000000000),('USD','EUR',0.706700000000),('USD','USD',1.000000000000);
/*!40000 ALTER TABLE `magev1_directory_currency_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_downloadable_link`
--

DROP TABLE IF EXISTS `magev1_downloadable_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_downloadable_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort order',
  `number_of_downloads` int(11) DEFAULT NULL COMMENT 'Number of downloads',
  `is_shareable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Shareable flag',
  `link_url` varchar(255) DEFAULT NULL COMMENT 'Link Url',
  `link_file` varchar(255) DEFAULT NULL COMMENT 'Link File',
  `link_type` varchar(20) DEFAULT NULL COMMENT 'Link Type',
  `sample_url` varchar(255) DEFAULT NULL COMMENT 'Sample Url',
  `sample_file` varchar(255) DEFAULT NULL COMMENT 'Sample File',
  `sample_type` varchar(20) DEFAULT NULL COMMENT 'Sample Type',
  PRIMARY KEY (`link_id`),
  KEY `IDX_MAGEV1_DOWNLOADABLE_LINK_PRODUCT_ID` (`product_id`),
  KEY `IDX_MAGEV1_DOWNLOADABLE_LINK_PRODUCT_ID_SORT_ORDER` (`product_id`,`sort_order`),
  CONSTRAINT `FK_MAGEV1_DL_LNK_PRD_ID_MAGEV1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_downloadable_link`
--

LOCK TABLES `magev1_downloadable_link` WRITE;
/*!40000 ALTER TABLE `magev1_downloadable_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_downloadable_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_downloadable_link_price`
--

DROP TABLE IF EXISTS `magev1_downloadable_link_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_downloadable_link_price` (
  `price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Price ID',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Link ID',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  PRIMARY KEY (`price_id`),
  KEY `IDX_MAGEV1_DOWNLOADABLE_LINK_PRICE_LINK_ID` (`link_id`),
  KEY `IDX_MAGEV1_DOWNLOADABLE_LINK_PRICE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `FK_MAGEV1_DL_LNK_PRICE_LNK_ID_MAGEV1_DL_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `magev1_downloadable_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_DL_LNK_PRICE_WS_ID_MAGEV1_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `magev1_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Price Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_downloadable_link_price`
--

LOCK TABLES `magev1_downloadable_link_price` WRITE;
/*!40000 ALTER TABLE `magev1_downloadable_link_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_downloadable_link_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_downloadable_link_purchased`
--

DROP TABLE IF EXISTS `magev1_downloadable_link_purchased`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_downloadable_link_purchased` (
  `purchased_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Purchased ID',
  `order_id` int(10) unsigned DEFAULT '0' COMMENT 'Order ID',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment ID',
  `order_item_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Order Item ID',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of creation',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date of modification',
  `customer_id` int(10) unsigned DEFAULT '0' COMMENT 'Customer ID',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product name',
  `product_sku` varchar(255) DEFAULT NULL COMMENT 'Product sku',
  `link_section_title` varchar(255) DEFAULT NULL COMMENT 'Link_section_title',
  PRIMARY KEY (`purchased_id`),
  KEY `IDX_MAGEV1_DOWNLOADABLE_LINK_PURCHASED_ORDER_ID` (`order_id`),
  KEY `IDX_MAGEV1_DOWNLOADABLE_LINK_PURCHASED_ORDER_ITEM_ID` (`order_item_id`),
  KEY `IDX_MAGEV1_DOWNLOADABLE_LINK_PURCHASED_CUSTOMER_ID` (`customer_id`),
  CONSTRAINT `FK_AAABADA1553149F0AF7C368865DD9AEA` FOREIGN KEY (`order_id`) REFERENCES `magev1_sales_flat_order` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_DL_LNK_PURCHASED_CSTR_ID_MAGEV1_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `magev1_customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Purchased Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_downloadable_link_purchased`
--

LOCK TABLES `magev1_downloadable_link_purchased` WRITE;
/*!40000 ALTER TABLE `magev1_downloadable_link_purchased` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_downloadable_link_purchased` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_downloadable_link_purchased_item`
--

DROP TABLE IF EXISTS `magev1_downloadable_link_purchased_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_downloadable_link_purchased_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item ID',
  `purchased_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Purchased ID',
  `order_item_id` int(10) unsigned DEFAULT '0' COMMENT 'Order Item ID',
  `product_id` int(10) unsigned DEFAULT '0' COMMENT 'Product ID',
  `link_hash` varchar(255) DEFAULT NULL COMMENT 'Link hash',
  `number_of_downloads_bought` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Number of downloads bought',
  `number_of_downloads_used` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Number of downloads used',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Link ID',
  `link_title` varchar(255) DEFAULT NULL COMMENT 'Link Title',
  `is_shareable` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Shareable Flag',
  `link_url` varchar(255) DEFAULT NULL COMMENT 'Link Url',
  `link_file` varchar(255) DEFAULT NULL COMMENT 'Link File',
  `link_type` varchar(255) DEFAULT NULL COMMENT 'Link Type',
  `status` varchar(50) DEFAULT NULL COMMENT 'Status',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Creation Time',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Update Time',
  PRIMARY KEY (`item_id`),
  KEY `IDX_MAGEV1_DOWNLOADABLE_LINK_PURCHASED_ITEM_LINK_HASH` (`link_hash`),
  KEY `IDX_MAGEV1_DOWNLOADABLE_LINK_PURCHASED_ITEM_ORDER_ITEM_ID` (`order_item_id`),
  KEY `IDX_MAGEV1_DOWNLOADABLE_LINK_PURCHASED_ITEM_PURCHASED_ID` (`purchased_id`),
  CONSTRAINT `FK_14D9B7BD3A6C954AB3B90562E4D3E91F` FOREIGN KEY (`order_item_id`) REFERENCES `magev1_sales_flat_order_item` (`item_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_5B73977F15B60685F0C963138779EFEC` FOREIGN KEY (`purchased_id`) REFERENCES `magev1_downloadable_link_purchased` (`purchased_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Link Purchased Item Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_downloadable_link_purchased_item`
--

LOCK TABLES `magev1_downloadable_link_purchased_item` WRITE;
/*!40000 ALTER TABLE `magev1_downloadable_link_purchased_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_downloadable_link_purchased_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_downloadable_link_title`
--

DROP TABLE IF EXISTS `magev1_downloadable_link_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_downloadable_link_title` (
  `title_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Title ID',
  `link_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Link ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`title_id`),
  UNIQUE KEY `UNQ_MAGEV1_DOWNLOADABLE_LINK_TITLE_LINK_ID_STORE_ID` (`link_id`,`store_id`),
  KEY `IDX_MAGEV1_DOWNLOADABLE_LINK_TITLE_LINK_ID` (`link_id`),
  KEY `IDX_MAGEV1_DOWNLOADABLE_LINK_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_MAGEV1_DL_LNK_TTL_LNK_ID_MAGEV1_DL_LNK_LNK_ID` FOREIGN KEY (`link_id`) REFERENCES `magev1_downloadable_link` (`link_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_DL_LNK_TTL_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link Title Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_downloadable_link_title`
--

LOCK TABLES `magev1_downloadable_link_title` WRITE;
/*!40000 ALTER TABLE `magev1_downloadable_link_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_downloadable_link_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_downloadable_sample`
--

DROP TABLE IF EXISTS `magev1_downloadable_sample`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_downloadable_sample` (
  `sample_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Sample ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `sample_url` varchar(255) DEFAULT NULL COMMENT 'Sample URL',
  `sample_file` varchar(255) DEFAULT NULL COMMENT 'Sample file',
  `sample_type` varchar(20) DEFAULT NULL COMMENT 'Sample Type',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`sample_id`),
  KEY `IDX_MAGEV1_DOWNLOADABLE_SAMPLE_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_MAGEV1_DL_SAMPLE_PRD_ID_MAGEV1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Sample Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_downloadable_sample`
--

LOCK TABLES `magev1_downloadable_sample` WRITE;
/*!40000 ALTER TABLE `magev1_downloadable_sample` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_downloadable_sample` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_downloadable_sample_title`
--

DROP TABLE IF EXISTS `magev1_downloadable_sample_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_downloadable_sample_title` (
  `title_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Title ID',
  `sample_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sample ID',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store ID',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  PRIMARY KEY (`title_id`),
  UNIQUE KEY `UNQ_MAGEV1_DOWNLOADABLE_SAMPLE_TITLE_SAMPLE_ID_STORE_ID` (`sample_id`,`store_id`),
  KEY `IDX_MAGEV1_DOWNLOADABLE_SAMPLE_TITLE_SAMPLE_ID` (`sample_id`),
  KEY `IDX_MAGEV1_DOWNLOADABLE_SAMPLE_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_MAGEV1_DL_SAMPLE_TTL_SAMPLE_ID_MAGEV1_DL_SAMPLE_SAMPLE_ID` FOREIGN KEY (`sample_id`) REFERENCES `magev1_downloadable_sample` (`sample_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_DL_SAMPLE_TTL_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Downloadable Sample Title Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_downloadable_sample_title`
--

LOCK TABLES `magev1_downloadable_sample_title` WRITE;
/*!40000 ALTER TABLE `magev1_downloadable_sample_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_downloadable_sample_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_eav_attribute`
--

DROP TABLE IF EXISTS `magev1_eav_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_eav_attribute` (
  `attribute_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_code` varchar(255) DEFAULT NULL COMMENT 'Attribute Code',
  `attribute_model` varchar(255) DEFAULT NULL COMMENT 'Attribute Model',
  `backend_model` varchar(255) DEFAULT NULL COMMENT 'Backend Model',
  `backend_type` varchar(8) NOT NULL DEFAULT 'static' COMMENT 'Backend Type',
  `backend_table` varchar(255) DEFAULT NULL COMMENT 'Backend Table',
  `frontend_model` varchar(255) DEFAULT NULL COMMENT 'Frontend Model',
  `frontend_input` varchar(50) DEFAULT NULL COMMENT 'Frontend Input',
  `frontend_label` varchar(255) DEFAULT NULL COMMENT 'Frontend Label',
  `frontend_class` varchar(255) DEFAULT NULL COMMENT 'Frontend Class',
  `source_model` varchar(255) DEFAULT NULL COMMENT 'Source Model',
  `is_required` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Defines Is Required',
  `is_user_defined` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Defines Is User Defined',
  `default_value` text COMMENT 'Default Value',
  `is_unique` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Defines Is Unique',
  `note` varchar(255) DEFAULT NULL COMMENT 'Note',
  PRIMARY KEY (`attribute_id`),
  UNIQUE KEY `UNQ_MAGEV1_EAV_ATTRIBUTE_ENTITY_TYPE_ID_ATTRIBUTE_CODE` (`entity_type_id`,`attribute_code`),
  KEY `IDX_MAGEV1_EAV_ATTRIBUTE_ENTITY_TYPE_ID` (`entity_type_id`),
  CONSTRAINT `FK_6D6FB61008BBD3568C0939DCE4F8AA97` FOREIGN KEY (`entity_type_id`) REFERENCES `magev1_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8 COMMENT='Eav Attribute';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_eav_attribute`
--

LOCK TABLES `magev1_eav_attribute` WRITE;
/*!40000 ALTER TABLE `magev1_eav_attribute` DISABLE KEYS */;
INSERT INTO `magev1_eav_attribute` VALUES (1,1,'website_id',NULL,'customer/customer_attribute_backend_website','static',NULL,NULL,'select','Associate to Website',NULL,'customer/customer_attribute_source_website',1,0,NULL,0,NULL),(2,1,'store_id',NULL,'customer/customer_attribute_backend_store','static',NULL,NULL,'select','Create In',NULL,'customer/customer_attribute_source_store',1,0,NULL,0,NULL),(3,1,'created_in',NULL,NULL,'varchar',NULL,NULL,'text','Created From',NULL,NULL,0,0,NULL,0,NULL),(4,1,'prefix',NULL,NULL,'varchar',NULL,NULL,'text','Prefix',NULL,NULL,0,0,NULL,0,NULL),(5,1,'firstname',NULL,NULL,'varchar',NULL,NULL,'text','First Name',NULL,NULL,1,0,NULL,0,NULL),(6,1,'middlename',NULL,NULL,'varchar',NULL,NULL,'text','Middle Name/Initial',NULL,NULL,0,0,NULL,0,NULL),(7,1,'lastname',NULL,NULL,'varchar',NULL,NULL,'text','Last Name',NULL,NULL,1,0,NULL,0,NULL),(8,1,'suffix',NULL,NULL,'varchar',NULL,NULL,'text','Suffix',NULL,NULL,0,0,NULL,0,NULL),(9,1,'email',NULL,NULL,'static',NULL,NULL,'text','Email',NULL,NULL,1,0,NULL,0,NULL),(10,1,'group_id',NULL,NULL,'static',NULL,NULL,'select','Group',NULL,'customer/customer_attribute_source_group',1,0,NULL,0,NULL),(11,1,'dob',NULL,'eav/entity_attribute_backend_datetime','datetime',NULL,'eav/entity_attribute_frontend_datetime','date','Date Of Birth',NULL,NULL,0,0,NULL,0,NULL),(12,1,'password_hash',NULL,'customer/customer_attribute_backend_password','varchar',NULL,NULL,'hidden',NULL,NULL,NULL,0,0,NULL,0,NULL),(13,1,'default_billing',NULL,'customer/customer_attribute_backend_billing','int',NULL,NULL,'text','Default Billing Address',NULL,NULL,0,0,NULL,0,NULL),(14,1,'default_shipping',NULL,'customer/customer_attribute_backend_shipping','int',NULL,NULL,'text','Default Shipping Address',NULL,NULL,0,0,NULL,0,NULL),(15,1,'taxvat',NULL,NULL,'varchar',NULL,NULL,'text','Tax/VAT Number',NULL,NULL,0,0,NULL,0,NULL),(16,1,'confirmation',NULL,NULL,'varchar',NULL,NULL,'text','Is Confirmed',NULL,NULL,0,0,NULL,0,NULL),(17,1,'created_at',NULL,NULL,'static',NULL,NULL,'datetime','Created At',NULL,NULL,0,0,NULL,0,NULL),(18,1,'gender',NULL,NULL,'int',NULL,NULL,'select','Gender',NULL,'eav/entity_attribute_source_table',0,0,NULL,0,NULL),(19,2,'prefix',NULL,NULL,'varchar',NULL,NULL,'text','Prefix',NULL,NULL,0,0,NULL,0,NULL),(20,2,'firstname',NULL,NULL,'varchar',NULL,NULL,'text','First Name',NULL,NULL,1,0,NULL,0,NULL),(21,2,'middlename',NULL,NULL,'varchar',NULL,NULL,'text','Middle Name/Initial',NULL,NULL,0,0,NULL,0,NULL),(22,2,'lastname',NULL,NULL,'varchar',NULL,NULL,'text','Last Name',NULL,NULL,1,0,NULL,0,NULL),(23,2,'suffix',NULL,NULL,'varchar',NULL,NULL,'text','Suffix',NULL,NULL,0,0,NULL,0,NULL),(24,2,'company',NULL,NULL,'varchar',NULL,NULL,'text','Company',NULL,NULL,0,0,NULL,0,NULL),(25,2,'street',NULL,'customer/entity_address_attribute_backend_street','text',NULL,NULL,'multiline','Street Address',NULL,NULL,1,0,NULL,0,NULL),(26,2,'city',NULL,NULL,'varchar',NULL,NULL,'text','City',NULL,NULL,1,0,NULL,0,NULL),(27,2,'country_id',NULL,NULL,'varchar',NULL,NULL,'select','Country',NULL,'customer/entity_address_attribute_source_country',1,0,NULL,0,NULL),(28,2,'region',NULL,'customer/entity_address_attribute_backend_region','varchar',NULL,NULL,'text','State/Province',NULL,NULL,0,0,NULL,0,NULL),(29,2,'region_id',NULL,NULL,'int',NULL,NULL,'hidden','State/Province',NULL,'customer/entity_address_attribute_source_region',0,0,NULL,0,NULL),(30,2,'postcode',NULL,NULL,'varchar',NULL,NULL,'text','Zip/Postal Code',NULL,NULL,1,0,NULL,0,NULL),(31,2,'telephone',NULL,NULL,'varchar',NULL,NULL,'text','Telephone',NULL,NULL,1,0,NULL,0,NULL),(32,2,'fax',NULL,NULL,'varchar',NULL,NULL,'text','Fax',NULL,NULL,0,0,NULL,0,NULL),(33,1,'rp_token',NULL,NULL,'varchar',NULL,NULL,'hidden',NULL,NULL,NULL,0,0,NULL,0,NULL),(34,1,'rp_token_created_at',NULL,NULL,'datetime',NULL,NULL,'date',NULL,NULL,NULL,0,0,NULL,0,NULL),(35,1,'disable_auto_group_change',NULL,'customer/attribute_backend_data_boolean','static',NULL,NULL,'boolean','Disable Automatic Group Change Based on VAT ID',NULL,NULL,0,0,NULL,0,NULL),(36,2,'vat_id',NULL,NULL,'varchar',NULL,NULL,'text','VAT number',NULL,NULL,0,0,NULL,0,NULL),(37,2,'vat_is_valid',NULL,NULL,'int',NULL,NULL,'text','VAT number validity',NULL,NULL,0,0,NULL,0,NULL),(38,2,'vat_request_id',NULL,NULL,'varchar',NULL,NULL,'text','VAT number validation request ID',NULL,NULL,0,0,NULL,0,NULL),(39,2,'vat_request_date',NULL,NULL,'varchar',NULL,NULL,'text','VAT number validation request date',NULL,NULL,0,0,NULL,0,NULL),(40,2,'vat_request_success',NULL,NULL,'int',NULL,NULL,'text','VAT number validation request success',NULL,NULL,0,0,NULL,0,NULL),(41,3,'name',NULL,NULL,'varchar',NULL,NULL,'text','Name',NULL,NULL,1,0,NULL,0,NULL),(42,3,'is_active',NULL,NULL,'int',NULL,NULL,'select','Is Active',NULL,'eav/entity_attribute_source_boolean',1,0,NULL,0,NULL),(43,3,'url_key',NULL,'catalog/category_attribute_backend_urlkey','varchar',NULL,NULL,'text','URL Key',NULL,NULL,0,0,NULL,0,NULL),(44,3,'description',NULL,NULL,'text',NULL,NULL,'textarea','Description',NULL,NULL,0,0,NULL,0,NULL),(45,3,'image',NULL,'catalog/category_attribute_backend_image','varchar',NULL,NULL,'image','Image',NULL,NULL,0,0,NULL,0,NULL),(46,3,'meta_title',NULL,NULL,'varchar',NULL,NULL,'text','Page Title',NULL,NULL,0,0,NULL,0,NULL),(47,3,'meta_keywords',NULL,NULL,'text',NULL,NULL,'textarea','Meta Keywords',NULL,NULL,0,0,NULL,0,NULL),(48,3,'meta_description',NULL,NULL,'text',NULL,NULL,'textarea','Meta Description',NULL,NULL,0,0,NULL,0,NULL),(49,3,'display_mode',NULL,NULL,'varchar',NULL,NULL,'select','Display Mode',NULL,'catalog/category_attribute_source_mode',0,0,NULL,0,NULL),(50,3,'landing_page',NULL,NULL,'int',NULL,NULL,'select','CMS Block',NULL,'catalog/category_attribute_source_page',0,0,NULL,0,NULL),(51,3,'is_anchor',NULL,NULL,'int',NULL,NULL,'select','Is Anchor',NULL,'eav/entity_attribute_source_boolean',0,0,NULL,0,NULL),(52,3,'path',NULL,NULL,'static',NULL,NULL,'text','Path',NULL,NULL,0,0,NULL,0,NULL),(53,3,'position',NULL,NULL,'static',NULL,NULL,'text','Position',NULL,NULL,0,0,NULL,0,NULL),(54,3,'all_children',NULL,NULL,'text',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(55,3,'path_in_store',NULL,NULL,'text',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(56,3,'children',NULL,NULL,'text',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(57,3,'url_path',NULL,NULL,'varchar',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(58,3,'custom_design',NULL,NULL,'varchar',NULL,NULL,'select','Custom Design',NULL,'core/design_source_design',0,0,NULL,0,NULL),(59,3,'custom_design_from',NULL,'eav/entity_attribute_backend_datetime','datetime',NULL,NULL,'date','Active From',NULL,NULL,0,0,NULL,0,NULL),(60,3,'custom_design_to',NULL,'eav/entity_attribute_backend_datetime','datetime',NULL,NULL,'date','Active To',NULL,NULL,0,0,NULL,0,NULL),(61,3,'page_layout',NULL,NULL,'varchar',NULL,NULL,'select','Page Layout',NULL,'catalog/category_attribute_source_layout',0,0,NULL,0,NULL),(62,3,'custom_layout_update',NULL,'catalog/attribute_backend_customlayoutupdate','text',NULL,NULL,'textarea','Custom Layout Update',NULL,NULL,0,0,NULL,0,NULL),(63,3,'level',NULL,NULL,'static',NULL,NULL,'text','Level',NULL,NULL,0,0,NULL,0,NULL),(64,3,'children_count',NULL,NULL,'static',NULL,NULL,'text','Children Count',NULL,NULL,0,0,NULL,0,NULL),(65,3,'available_sort_by',NULL,'catalog/category_attribute_backend_sortby','text',NULL,NULL,'multiselect','Available Product Listing Sort By',NULL,'catalog/category_attribute_source_sortby',1,0,NULL,0,NULL),(66,3,'default_sort_by',NULL,'catalog/category_attribute_backend_sortby','varchar',NULL,NULL,'select','Default Product Listing Sort By',NULL,'catalog/category_attribute_source_sortby',1,0,NULL,0,NULL),(67,3,'include_in_menu',NULL,NULL,'int',NULL,NULL,'select','Include in Navigation Menu',NULL,'eav/entity_attribute_source_boolean',1,0,'1',0,NULL),(68,3,'custom_use_parent_settings',NULL,NULL,'int',NULL,NULL,'select','Use Parent Category Settings',NULL,'eav/entity_attribute_source_boolean',0,0,NULL,0,NULL),(69,3,'custom_apply_to_products',NULL,NULL,'int',NULL,NULL,'select','Apply To Products',NULL,'eav/entity_attribute_source_boolean',0,0,NULL,0,NULL),(70,3,'filter_price_range',NULL,NULL,'decimal',NULL,NULL,'text','Layered Navigation Price Step',NULL,NULL,0,0,NULL,0,NULL),(71,4,'name',NULL,NULL,'varchar',NULL,NULL,'text','Name',NULL,NULL,1,0,NULL,0,NULL),(72,4,'description',NULL,NULL,'text',NULL,NULL,'textarea','Description',NULL,NULL,1,0,NULL,0,NULL),(73,4,'short_description',NULL,NULL,'text',NULL,NULL,'textarea','Short Description',NULL,NULL,1,0,NULL,0,NULL),(74,4,'sku',NULL,'catalog/product_attribute_backend_sku','static',NULL,NULL,'text','SKU',NULL,NULL,1,0,NULL,1,NULL),(75,4,'price',NULL,'catalog/product_attribute_backend_price','decimal',NULL,NULL,'price','Price',NULL,NULL,1,0,NULL,0,NULL),(76,4,'special_price',NULL,'catalog/product_attribute_backend_price','decimal',NULL,NULL,'price','Special Price','validate-special-price',NULL,0,0,NULL,0,NULL),(77,4,'special_from_date',NULL,'catalog/product_attribute_backend_startdate_specialprice','datetime',NULL,NULL,'date','Special Price From Date',NULL,NULL,0,0,NULL,0,NULL),(78,4,'special_to_date',NULL,'eav/entity_attribute_backend_datetime','datetime',NULL,NULL,'date','Special Price To Date',NULL,NULL,0,0,NULL,0,NULL),(79,4,'cost',NULL,'catalog/product_attribute_backend_price','decimal',NULL,NULL,'price','Cost',NULL,NULL,0,1,NULL,0,NULL),(80,4,'weight',NULL,NULL,'decimal',NULL,NULL,'weight','Weight',NULL,NULL,1,0,NULL,0,NULL),(81,4,'manufacturer',NULL,NULL,'int',NULL,NULL,'select','Manufacturer',NULL,NULL,0,1,NULL,0,NULL),(82,4,'meta_title',NULL,NULL,'varchar',NULL,NULL,'text','Meta Title',NULL,NULL,0,0,NULL,0,NULL),(83,4,'meta_keyword',NULL,NULL,'text',NULL,NULL,'textarea','Meta Keywords',NULL,NULL,0,0,NULL,0,NULL),(84,4,'meta_description',NULL,NULL,'varchar',NULL,NULL,'textarea','Meta Description',NULL,NULL,0,0,NULL,0,'Maximum 255 chars'),(85,4,'image',NULL,NULL,'varchar',NULL,'catalog/product_attribute_frontend_image','media_image','Base Image',NULL,NULL,0,0,NULL,0,NULL),(86,4,'small_image',NULL,NULL,'varchar',NULL,'catalog/product_attribute_frontend_image','media_image','Small Image',NULL,NULL,0,0,NULL,0,NULL),(87,4,'thumbnail',NULL,NULL,'varchar',NULL,'catalog/product_attribute_frontend_image','media_image','Thumbnail',NULL,NULL,0,0,NULL,0,NULL),(88,4,'media_gallery',NULL,'catalog/product_attribute_backend_media','varchar',NULL,NULL,'gallery','Media Gallery',NULL,NULL,0,0,NULL,0,NULL),(89,4,'old_id',NULL,NULL,'int',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(90,4,'group_price',NULL,'catalog/product_attribute_backend_groupprice','decimal',NULL,NULL,'text','Group Price',NULL,NULL,0,0,NULL,0,NULL),(91,4,'tier_price',NULL,'catalog/product_attribute_backend_tierprice','decimal',NULL,NULL,'text','Tier Price',NULL,NULL,0,0,NULL,0,NULL),(92,4,'color',NULL,NULL,'int',NULL,NULL,'select','Color',NULL,NULL,0,1,'4',0,NULL),(93,4,'news_from_date',NULL,'catalog/product_attribute_backend_startdate','datetime',NULL,NULL,'date','Set Product as New from Date',NULL,NULL,0,0,NULL,0,NULL),(94,4,'news_to_date',NULL,'eav/entity_attribute_backend_datetime','datetime',NULL,NULL,'date','Set Product as New to Date',NULL,NULL,0,0,NULL,0,NULL),(95,4,'gallery',NULL,NULL,'varchar',NULL,NULL,'gallery','Image Gallery',NULL,NULL,0,0,NULL,0,NULL),(96,4,'status',NULL,NULL,'int',NULL,NULL,'select','Status',NULL,'catalog/product_status',1,0,NULL,0,NULL),(97,4,'url_key',NULL,'catalog/product_attribute_backend_urlkey','varchar',NULL,NULL,'text','URL Key',NULL,NULL,0,0,NULL,0,NULL),(98,4,'url_path',NULL,NULL,'varchar',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(99,4,'minimal_price',NULL,NULL,'decimal',NULL,NULL,'price','Minimal Price',NULL,NULL,0,0,NULL,0,NULL),(100,4,'is_recurring',NULL,NULL,'int',NULL,NULL,'select','Enable Recurring Profile',NULL,'eav/entity_attribute_source_boolean',0,0,NULL,0,'Products with recurring profile participate in catalog as nominal items.'),(101,4,'recurring_profile',NULL,'catalog/product_attribute_backend_recurring','text',NULL,NULL,'text','Recurring Payment Profile',NULL,NULL,0,0,NULL,0,NULL),(102,4,'visibility',NULL,NULL,'int',NULL,NULL,'select','Visibility',NULL,'catalog/product_visibility',1,0,'4',0,NULL),(103,4,'custom_design',NULL,NULL,'varchar',NULL,NULL,'select','Custom Design',NULL,'core/design_source_design',0,0,NULL,0,NULL),(104,4,'custom_design_from',NULL,'catalog/product_attribute_backend_startdate','datetime',NULL,NULL,'date','Active From',NULL,NULL,0,0,NULL,0,NULL),(105,4,'custom_design_to',NULL,'eav/entity_attribute_backend_datetime','datetime',NULL,NULL,'date','Active To',NULL,NULL,0,0,NULL,0,NULL),(106,4,'custom_layout_update',NULL,'catalog/attribute_backend_customlayoutupdate','text',NULL,NULL,'textarea','Custom Layout Update',NULL,NULL,0,0,NULL,0,NULL),(107,4,'page_layout',NULL,NULL,'varchar',NULL,NULL,'select','Page Layout',NULL,'catalog/product_attribute_source_layout',0,0,NULL,0,NULL),(108,4,'category_ids',NULL,NULL,'static',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(109,4,'options_container',NULL,NULL,'varchar',NULL,NULL,'select','Display Product Options In',NULL,'catalog/entity_product_attribute_design_options_container',0,0,'container1',0,NULL),(110,4,'required_options',NULL,NULL,'static',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(111,4,'has_options',NULL,NULL,'static',NULL,NULL,'text',NULL,NULL,NULL,0,0,NULL,0,NULL),(112,4,'image_label',NULL,NULL,'varchar',NULL,NULL,'text','Image Label',NULL,NULL,0,0,NULL,0,NULL),(113,4,'small_image_label',NULL,NULL,'varchar',NULL,NULL,'text','Small Image Label',NULL,NULL,0,0,NULL,0,NULL),(114,4,'thumbnail_label',NULL,NULL,'varchar',NULL,NULL,'text','Thumbnail Label',NULL,NULL,0,0,NULL,0,NULL),(115,4,'created_at',NULL,'eav/entity_attribute_backend_time_created','static',NULL,NULL,'text',NULL,NULL,NULL,1,0,NULL,0,NULL),(116,4,'updated_at',NULL,'eav/entity_attribute_backend_time_updated','static',NULL,NULL,'text',NULL,NULL,NULL,1,0,NULL,0,NULL),(117,4,'country_of_manufacture',NULL,NULL,'varchar',NULL,NULL,'select','Country of Manufacture',NULL,'catalog/product_attribute_source_countryofmanufacture',0,0,NULL,0,NULL),(118,4,'msrp_enabled',NULL,'catalog/product_attribute_backend_msrp','varchar',NULL,NULL,'select','Apply MAP',NULL,'catalog/product_attribute_source_msrp_type_enabled',0,0,'2',0,NULL),(119,4,'msrp_display_actual_price_type',NULL,'catalog/product_attribute_backend_boolean','varchar',NULL,NULL,'select','Display Actual Price',NULL,'catalog/product_attribute_source_msrp_type_price',0,0,'4',0,NULL),(120,4,'msrp',NULL,'catalog/product_attribute_backend_price','decimal',NULL,NULL,'price','Manufacturer\'s Suggested Retail Price',NULL,NULL,0,0,NULL,0,NULL),(121,4,'tax_class_id',NULL,NULL,'int',NULL,NULL,'select','Tax Class',NULL,'tax/class_source_product',1,0,NULL,0,NULL),(122,4,'gift_message_available',NULL,'catalog/product_attribute_backend_boolean','varchar',NULL,NULL,'select','Allow Gift Message',NULL,'eav/entity_attribute_source_boolean',0,0,NULL,0,NULL),(123,4,'price_type',NULL,NULL,'int',NULL,NULL,NULL,NULL,NULL,NULL,1,0,NULL,0,NULL),(124,4,'sku_type',NULL,NULL,'int',NULL,NULL,NULL,NULL,NULL,NULL,1,0,NULL,0,NULL),(125,4,'weight_type',NULL,NULL,'int',NULL,NULL,NULL,NULL,NULL,NULL,1,0,NULL,0,NULL),(126,4,'price_view',NULL,NULL,'int',NULL,NULL,'select','Price View',NULL,'bundle/product_attribute_source_price_view',1,0,NULL,0,NULL),(127,4,'shipment_type',NULL,NULL,'int',NULL,NULL,NULL,'Shipment',NULL,NULL,1,0,NULL,0,NULL),(128,4,'links_purchased_separately',NULL,NULL,'int',NULL,NULL,NULL,'Links can be purchased separately',NULL,NULL,1,0,NULL,0,NULL),(129,4,'samples_title',NULL,NULL,'varchar',NULL,NULL,NULL,'Samples title',NULL,NULL,1,0,NULL,0,NULL),(130,4,'links_title',NULL,NULL,'varchar',NULL,NULL,NULL,'Links title',NULL,NULL,1,0,NULL,0,NULL),(131,4,'links_exist',NULL,NULL,'int',NULL,NULL,NULL,NULL,NULL,NULL,0,0,'0',0,NULL),(133,4,'surface',NULL,NULL,'varchar',NULL,NULL,'text','Surface',NULL,NULL,1,1,NULL,0,NULL),(134,4,'contributeur',NULL,NULL,'varchar',NULL,NULL,'text','Contributeur',NULL,NULL,0,1,NULL,0,NULL),(135,4,'contributor_picture',NULL,NULL,'varchar',NULL,NULL,'media_image','contributor_picture',NULL,NULL,0,1,NULL,0,NULL),(137,4,'contributor_age',NULL,NULL,'varchar',NULL,NULL,'text','contributor_age',NULL,NULL,0,1,NULL,0,NULL),(138,4,'contributor_city',NULL,NULL,'varchar',NULL,NULL,'text','contributor_city',NULL,NULL,0,1,NULL,0,NULL),(139,4,'contributor_presentation',NULL,NULL,'varchar',NULL,NULL,'text','contributor_presentation',NULL,NULL,0,1,NULL,0,NULL),(140,4,'position_y',NULL,NULL,'varchar',NULL,NULL,'text','Position Y',NULL,NULL,0,1,NULL,0,NULL),(141,4,'position_x',NULL,NULL,'varchar',NULL,NULL,'text','Position X',NULL,NULL,0,1,NULL,0,NULL);
/*!40000 ALTER TABLE `magev1_eav_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_eav_attribute_group`
--

DROP TABLE IF EXISTS `magev1_eav_attribute_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_eav_attribute_group` (
  `attribute_group_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute Group Id',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set Id',
  `attribute_group_name` varchar(255) DEFAULT NULL COMMENT 'Attribute Group Name',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `default_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Default Id',
  PRIMARY KEY (`attribute_group_id`),
  UNIQUE KEY `UNQ_MAGEV1_EAV_ATTR_GROUP_ATTR_SET_ID_ATTR_GROUP_NAME` (`attribute_set_id`,`attribute_group_name`),
  KEY `IDX_MAGEV1_EAV_ATTRIBUTE_GROUP_ATTRIBUTE_SET_ID_SORT_ORDER` (`attribute_set_id`,`sort_order`),
  CONSTRAINT `FK_93BA73872BF04A3EB6AC5709ED92C6C1` FOREIGN KEY (`attribute_set_id`) REFERENCES `magev1_eav_attribute_set` (`attribute_set_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Group';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_eav_attribute_group`
--

LOCK TABLES `magev1_eav_attribute_group` WRITE;
/*!40000 ALTER TABLE `magev1_eav_attribute_group` DISABLE KEYS */;
INSERT INTO `magev1_eav_attribute_group` VALUES (1,1,'General',1,1),(2,2,'General',1,1),(3,3,'General',10,1),(4,3,'General Information',2,0),(5,3,'Display Settings',20,0),(6,3,'Custom Design',30,0),(7,4,'General',1,1),(8,4,'Prices',2,0),(9,4,'Meta Information',3,0),(10,4,'Images',4,0),(11,4,'Recurring Profile',5,0),(12,4,'Design',6,0),(13,5,'General',1,1),(14,6,'General',1,1),(15,7,'General',1,1),(16,8,'General',1,1),(17,4,'Gift Options',7,0);
/*!40000 ALTER TABLE `magev1_eav_attribute_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_eav_attribute_label`
--

DROP TABLE IF EXISTS `magev1_eav_attribute_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_eav_attribute_label` (
  `attribute_label_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute Label Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`attribute_label_id`),
  KEY `IDX_MAGEV1_EAV_ATTRIBUTE_LABEL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_MAGEV1_EAV_ATTRIBUTE_LABEL_STORE_ID` (`store_id`),
  KEY `IDX_MAGEV1_EAV_ATTRIBUTE_LABEL_ATTRIBUTE_ID_STORE_ID` (`attribute_id`,`store_id`),
  CONSTRAINT `FK_MAGEV1_EAV_ATTR_LBL_ATTR_ID_MAGEV1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `magev1_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_EAV_ATTR_LBL_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Label';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_eav_attribute_label`
--

LOCK TABLES `magev1_eav_attribute_label` WRITE;
/*!40000 ALTER TABLE `magev1_eav_attribute_label` DISABLE KEYS */;
INSERT INTO `magev1_eav_attribute_label` VALUES (41,133,1,'Surface'),(42,133,2,'Superficie'),(43,134,1,'Contributor'),(44,134,2,'Contributeur'),(45,135,1,'contributor picture'),(46,135,2,'Photo contributeur'),(47,137,1,'contributor age'),(48,137,2,'contributeur age'),(49,138,1,'contributor city'),(50,138,2,'contributeur ville'),(51,139,1,'contributor_presentation'),(52,139,2,'contributeur presentation'),(53,140,1,'Position Y'),(54,140,2,'Position Y'),(55,141,1,'Position X'),(56,141,2,'Position X');
/*!40000 ALTER TABLE `magev1_eav_attribute_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_eav_attribute_option`
--

DROP TABLE IF EXISTS `magev1_eav_attribute_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_eav_attribute_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`option_id`),
  KEY `IDX_MAGEV1_EAV_ATTRIBUTE_OPTION_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `FK_MAGEV1_EAV_ATTR_OPT_ATTR_ID_MAGEV1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `magev1_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Option';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_eav_attribute_option`
--

LOCK TABLES `magev1_eav_attribute_option` WRITE;
/*!40000 ALTER TABLE `magev1_eav_attribute_option` DISABLE KEYS */;
INSERT INTO `magev1_eav_attribute_option` VALUES (1,18,0),(2,18,1),(3,92,0),(4,92,0),(5,92,0),(6,92,0);
/*!40000 ALTER TABLE `magev1_eav_attribute_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_eav_attribute_option_value`
--

DROP TABLE IF EXISTS `magev1_eav_attribute_option_value`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_eav_attribute_option_value` (
  `value_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Option Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Value',
  PRIMARY KEY (`value_id`),
  KEY `IDX_MAGEV1_EAV_ATTRIBUTE_OPTION_VALUE_OPTION_ID` (`option_id`),
  KEY `IDX_MAGEV1_EAV_ATTRIBUTE_OPTION_VALUE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_MAGEV1_EAV_ATTR_OPT_VAL_OPT_ID_MAGEV1_EAV_ATTR_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `magev1_eav_attribute_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_EAV_ATTR_OPT_VAL_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Option Value';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_eav_attribute_option_value`
--

LOCK TABLES `magev1_eav_attribute_option_value` WRITE;
/*!40000 ALTER TABLE `magev1_eav_attribute_option_value` DISABLE KEYS */;
INSERT INTO `magev1_eav_attribute_option_value` VALUES (1,1,0,'Male'),(2,2,0,'Female'),(3,3,0,'Iceblue'),(4,3,1,'Iceblue'),(5,4,0,'Natural'),(6,4,1,'Natural'),(7,5,0,'White'),(8,5,1,'White'),(9,6,0,'Silver'),(10,6,1,'Silver');
/*!40000 ALTER TABLE `magev1_eav_attribute_option_value` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_eav_attribute_set`
--

DROP TABLE IF EXISTS `magev1_eav_attribute_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_eav_attribute_set` (
  `attribute_set_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Attribute Set Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_set_name` varchar(255) DEFAULT NULL COMMENT 'Attribute Set Name',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`attribute_set_id`),
  UNIQUE KEY `UNQ_MAGEV1_EAV_ATTRIBUTE_SET_ENTITY_TYPE_ID_ATTRIBUTE_SET_NAME` (`entity_type_id`,`attribute_set_name`),
  KEY `IDX_MAGEV1_EAV_ATTRIBUTE_SET_ENTITY_TYPE_ID_SORT_ORDER` (`entity_type_id`,`sort_order`),
  CONSTRAINT `FK_850C636727ED8266D04783FDA380F093` FOREIGN KEY (`entity_type_id`) REFERENCES `magev1_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Eav Attribute Set';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_eav_attribute_set`
--

LOCK TABLES `magev1_eav_attribute_set` WRITE;
/*!40000 ALTER TABLE `magev1_eav_attribute_set` DISABLE KEYS */;
INSERT INTO `magev1_eav_attribute_set` VALUES (1,1,'Default',1),(2,2,'Default',1),(3,3,'Default',1),(4,4,'Default',1),(5,5,'Default',1),(6,6,'Default',1),(7,7,'Default',1),(8,8,'Default',1);
/*!40000 ALTER TABLE `magev1_eav_attribute_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_eav_entity`
--

DROP TABLE IF EXISTS `magev1_eav_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_eav_entity` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Parent Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Updated At',
  `is_active` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Defines Is Entity Active',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_MAGEV1_EAV_ENTITY_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_MAGEV1_EAV_ENTITY_STORE_ID` (`store_id`),
  CONSTRAINT `FK_D7741F43CE3E16848D5EEDD2D67ABAB9` FOREIGN KEY (`entity_type_id`) REFERENCES `magev1_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_EAV_ENTITY_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_eav_entity`
--

LOCK TABLES `magev1_eav_entity` WRITE;
/*!40000 ALTER TABLE `magev1_eav_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_eav_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_eav_entity_attribute`
--

DROP TABLE IF EXISTS `magev1_eav_entity_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_eav_entity_attribute` (
  `entity_attribute_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Attribute Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Set Id',
  `attribute_group_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Group Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `sort_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`entity_attribute_id`),
  UNIQUE KEY `UNQ_MAGEV1_EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_SET_ID_ATTRIBUTE_ID` (`attribute_set_id`,`attribute_id`),
  UNIQUE KEY `UNQ_MAGEV1_EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_GROUP_ID_ATTRIBUTE_ID` (`attribute_group_id`,`attribute_id`),
  KEY `IDX_MAGEV1_EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_SET_ID_SORT_ORDER` (`attribute_set_id`,`sort_order`),
  KEY `IDX_MAGEV1_EAV_ENTITY_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `FK_1C5E0B62F6ED5919F6450DEBA2881B98` FOREIGN KEY (`attribute_group_id`) REFERENCES `magev1_eav_attribute_group` (`attribute_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_EAV_ENTT_ATTR_ATTR_ID_MAGEV1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `magev1_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=578 DEFAULT CHARSET=utf8 COMMENT='Eav Entity Attributes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_eav_entity_attribute`
--

LOCK TABLES `magev1_eav_entity_attribute` WRITE;
/*!40000 ALTER TABLE `magev1_eav_entity_attribute` DISABLE KEYS */;
INSERT INTO `magev1_eav_entity_attribute` VALUES (1,1,1,1,1,10),(2,1,1,1,2,0),(3,1,1,1,3,20),(4,1,1,1,4,30),(5,1,1,1,5,40),(6,1,1,1,6,50),(7,1,1,1,7,60),(8,1,1,1,8,70),(9,1,1,1,9,80),(10,1,1,1,10,25),(11,1,1,1,11,90),(12,1,1,1,12,0),(13,1,1,1,13,0),(14,1,1,1,14,0),(15,1,1,1,15,100),(16,1,1,1,16,0),(17,1,1,1,17,86),(18,1,1,1,18,110),(19,2,2,2,19,10),(20,2,2,2,20,20),(21,2,2,2,21,30),(22,2,2,2,22,40),(23,2,2,2,23,50),(24,2,2,2,24,60),(25,2,2,2,25,70),(26,2,2,2,26,80),(27,2,2,2,27,90),(28,2,2,2,28,100),(29,2,2,2,29,100),(30,2,2,2,30,110),(31,2,2,2,31,120),(32,2,2,2,32,130),(33,1,1,1,33,111),(34,1,1,1,34,112),(35,1,1,1,35,28),(36,2,2,2,36,140),(37,2,2,2,37,132),(38,2,2,2,38,133),(39,2,2,2,39,134),(40,2,2,2,40,135),(41,3,3,4,41,1),(42,3,3,4,42,2),(43,3,3,4,43,3),(44,3,3,4,44,4),(45,3,3,4,45,5),(46,3,3,4,46,6),(47,3,3,4,47,7),(48,3,3,4,48,8),(49,3,3,5,49,10),(50,3,3,5,50,20),(51,3,3,5,51,30),(52,3,3,4,52,12),(53,3,3,4,53,13),(54,3,3,4,54,14),(55,3,3,4,55,15),(56,3,3,4,56,16),(57,3,3,4,57,17),(58,3,3,6,58,10),(59,3,3,6,59,30),(60,3,3,6,60,40),(61,3,3,6,61,50),(62,3,3,6,62,60),(63,3,3,4,63,24),(64,3,3,4,64,25),(65,3,3,5,65,40),(66,3,3,5,66,50),(67,3,3,4,67,10),(68,3,3,6,68,5),(69,3,3,6,69,6),(70,3,3,5,70,51),(88,4,4,7,89,6),(96,4,4,7,98,11),(97,4,4,8,99,8),(106,4,4,7,108,13),(108,4,4,7,110,14),(109,4,4,7,111,15),(110,4,4,7,112,16),(111,4,4,7,113,17),(112,4,4,7,114,18),(113,4,4,7,115,19),(114,4,4,7,116,20),(121,4,4,7,123,22),(122,4,4,7,124,23),(123,4,4,7,125,24),(125,4,4,7,127,25),(126,4,4,7,128,26),(127,4,4,7,129,27),(128,4,4,7,130,28),(129,4,4,7,131,29),(481,4,4,7,71,1),(483,4,4,7,72,11),(485,4,4,7,73,12),(487,4,4,7,74,13),(489,4,4,7,80,14),(491,4,4,7,92,8),(493,4,4,7,93,15),(495,4,4,7,94,16),(497,4,4,7,96,17),(499,4,4,7,97,18),(501,4,4,7,102,19),(503,4,4,7,117,20),(505,4,4,7,133,7),(507,4,4,7,134,2),(509,4,4,7,135,3),(511,4,4,7,137,4),(513,4,4,7,138,5),(515,4,4,7,139,6),(517,4,4,7,140,9),(519,4,4,7,141,10),(521,4,4,8,75,1),(523,4,4,8,76,3),(525,4,4,8,77,4),(527,4,4,8,78,5),(529,4,4,8,79,6),(531,4,4,8,90,2),(533,4,4,8,91,7),(535,4,4,8,118,8),(537,4,4,8,119,9),(539,4,4,8,120,10),(541,4,4,8,121,11),(543,4,4,8,126,12),(545,4,4,9,82,1),(547,4,4,9,83,2),(549,4,4,9,84,3),(551,4,4,10,85,1),(553,4,4,10,86,2),(555,4,4,10,87,3),(557,4,4,10,88,4),(559,4,4,10,95,5),(561,4,4,11,100,1),(563,4,4,11,101,2),(565,4,4,12,103,1),(567,4,4,12,104,2),(569,4,4,12,105,3),(571,4,4,12,106,4),(573,4,4,12,107,5),(575,4,4,12,109,6),(577,4,4,17,122,1);
/*!40000 ALTER TABLE `magev1_eav_entity_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_eav_entity_datetime`
--

DROP TABLE IF EXISTS `magev1_eav_entity_datetime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_eav_entity_datetime` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_MAGEV1_EAV_ENTITY_DATETIME_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_MAGEV1_EAV_ENTITY_DATETIME_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_MAGEV1_EAV_ENTITY_DATETIME_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_MAGEV1_EAV_ENTITY_DATETIME_STORE_ID` (`store_id`),
  KEY `IDX_MAGEV1_EAV_ENTITY_DATETIME_ENTITY_ID` (`entity_id`),
  KEY `IDX_MAGEV1_EAV_ENTITY_DATETIME_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `IDX_MAGEV1_EAV_ENTITY_DATETIME_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`),
  CONSTRAINT `FK_AF710A7FD50B028742FCA9FF6E2540A9` FOREIGN KEY (`entity_type_id`) REFERENCES `magev1_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_EAV_ENTT_DTIME_ENTT_ID_MAGEV1_EAV_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `magev1_eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_EAV_ENTT_DTIME_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_eav_entity_datetime`
--

LOCK TABLES `magev1_eav_entity_datetime` WRITE;
/*!40000 ALTER TABLE `magev1_eav_entity_datetime` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_eav_entity_datetime` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_eav_entity_decimal`
--

DROP TABLE IF EXISTS `magev1_eav_entity_decimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_eav_entity_decimal` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_MAGEV1_EAV_ENTITY_DECIMAL_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_MAGEV1_EAV_ENTITY_DECIMAL_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_MAGEV1_EAV_ENTITY_DECIMAL_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_MAGEV1_EAV_ENTITY_DECIMAL_STORE_ID` (`store_id`),
  KEY `IDX_MAGEV1_EAV_ENTITY_DECIMAL_ENTITY_ID` (`entity_id`),
  KEY `IDX_MAGEV1_EAV_ENTITY_DECIMAL_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `IDX_MAGEV1_EAV_ENTITY_DECIMAL_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`),
  CONSTRAINT `FK_31DA43AEAAB6BCBAEC770107B7272980` FOREIGN KEY (`entity_type_id`) REFERENCES `magev1_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_EAV_ENTITY_DECIMAL_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_EAV_ENTT_DEC_ENTT_ID_MAGEV1_EAV_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `magev1_eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_eav_entity_decimal`
--

LOCK TABLES `magev1_eav_entity_decimal` WRITE;
/*!40000 ALTER TABLE `magev1_eav_entity_decimal` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_eav_entity_decimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_eav_entity_int`
--

DROP TABLE IF EXISTS `magev1_eav_entity_int`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_eav_entity_int` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` int(11) NOT NULL DEFAULT '0' COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_MAGEV1_EAV_ENTITY_INT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_MAGEV1_EAV_ENTITY_INT_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_MAGEV1_EAV_ENTITY_INT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_MAGEV1_EAV_ENTITY_INT_STORE_ID` (`store_id`),
  KEY `IDX_MAGEV1_EAV_ENTITY_INT_ENTITY_ID` (`entity_id`),
  KEY `IDX_MAGEV1_EAV_ENTITY_INT_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `IDX_MAGEV1_EAV_ENTITY_INT_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`),
  CONSTRAINT `FK_797B5F1F03257260B815509F74528E67` FOREIGN KEY (`entity_type_id`) REFERENCES `magev1_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_EAV_ENTITY_INT_ENTITY_ID_MAGEV1_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `magev1_eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_EAV_ENTITY_INT_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_eav_entity_int`
--

LOCK TABLES `magev1_eav_entity_int` WRITE;
/*!40000 ALTER TABLE `magev1_eav_entity_int` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_eav_entity_int` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_eav_entity_store`
--

DROP TABLE IF EXISTS `magev1_eav_entity_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_eav_entity_store` (
  `entity_store_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Store Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `increment_prefix` varchar(20) DEFAULT NULL COMMENT 'Increment Prefix',
  `increment_last_id` varchar(50) DEFAULT NULL COMMENT 'Last Incremented Id',
  PRIMARY KEY (`entity_store_id`),
  KEY `IDX_MAGEV1_EAV_ENTITY_STORE_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_MAGEV1_EAV_ENTITY_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_2CC60AE4711EA41A77D5456395B22643` FOREIGN KEY (`entity_type_id`) REFERENCES `magev1_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_EAV_ENTITY_STORE_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Store';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_eav_entity_store`
--

LOCK TABLES `magev1_eav_entity_store` WRITE;
/*!40000 ALTER TABLE `magev1_eav_entity_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_eav_entity_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_eav_entity_text`
--

DROP TABLE IF EXISTS `magev1_eav_entity_text`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_eav_entity_text` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` text NOT NULL COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_MAGEV1_EAV_ENTITY_TEXT_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_MAGEV1_EAV_ENTITY_TEXT_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_MAGEV1_EAV_ENTITY_TEXT_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_MAGEV1_EAV_ENTITY_TEXT_STORE_ID` (`store_id`),
  KEY `IDX_MAGEV1_EAV_ENTITY_TEXT_ENTITY_ID` (`entity_id`),
  CONSTRAINT `FK_4DE62F86996AD411F60E8A17BE848D79` FOREIGN KEY (`entity_type_id`) REFERENCES `magev1_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_EAV_ENTITY_TEXT_ENTITY_ID_MAGEV1_EAV_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `magev1_eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_EAV_ENTITY_TEXT_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_eav_entity_text`
--

LOCK TABLES `magev1_eav_entity_text` WRITE;
/*!40000 ALTER TABLE `magev1_eav_entity_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_eav_entity_text` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_eav_entity_type`
--

DROP TABLE IF EXISTS `magev1_eav_entity_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_eav_entity_type` (
  `entity_type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Type Id',
  `entity_type_code` varchar(50) NOT NULL COMMENT 'Entity Type Code',
  `entity_model` varchar(255) NOT NULL COMMENT 'Entity Model',
  `attribute_model` varchar(255) DEFAULT NULL COMMENT 'Attribute Model',
  `entity_table` varchar(255) DEFAULT NULL COMMENT 'Entity Table',
  `value_table_prefix` varchar(255) DEFAULT NULL COMMENT 'Value Table Prefix',
  `entity_id_field` varchar(255) DEFAULT NULL COMMENT 'Entity Id Field',
  `is_data_sharing` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Defines Is Data Sharing',
  `data_sharing_key` varchar(100) DEFAULT 'default' COMMENT 'Data Sharing Key',
  `default_attribute_set_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Default Attribute Set Id',
  `increment_model` varchar(255) DEFAULT '' COMMENT 'Increment Model',
  `increment_per_store` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Increment Per Store',
  `increment_pad_length` smallint(5) unsigned NOT NULL DEFAULT '8' COMMENT 'Increment Pad Length',
  `increment_pad_char` varchar(1) NOT NULL DEFAULT '0' COMMENT 'Increment Pad Char',
  `additional_attribute_table` varchar(255) DEFAULT '' COMMENT 'Additional Attribute Table',
  `entity_attribute_collection` varchar(255) DEFAULT NULL COMMENT 'Entity Attribute Collection',
  PRIMARY KEY (`entity_type_id`),
  KEY `IDX_MAGEV1_EAV_ENTITY_TYPE_ENTITY_TYPE_CODE` (`entity_type_code`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='Eav Entity Type';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_eav_entity_type`
--

LOCK TABLES `magev1_eav_entity_type` WRITE;
/*!40000 ALTER TABLE `magev1_eav_entity_type` DISABLE KEYS */;
INSERT INTO `magev1_eav_entity_type` VALUES (1,'customer','customer/customer','customer/attribute','customer/entity',NULL,NULL,1,'default',1,'eav/entity_increment_numeric',0,8,'0','customer/eav_attribute','customer/attribute_collection'),(2,'customer_address','customer/address','customer/attribute','customer/address_entity',NULL,NULL,1,'default',2,NULL,0,8,'0','customer/eav_attribute','customer/address_attribute_collection'),(3,'catalog_category','catalog/category','catalog/resource_eav_attribute','catalog/category',NULL,NULL,1,'default',3,NULL,0,8,'0','catalog/eav_attribute','catalog/category_attribute_collection'),(4,'catalog_product','catalog/product','catalog/resource_eav_attribute','catalog/product',NULL,NULL,1,'default',4,NULL,0,8,'0','catalog/eav_attribute','catalog/product_attribute_collection'),(5,'order','sales/order',NULL,'sales/order',NULL,NULL,1,'default',0,'eav/entity_increment_numeric',1,8,'0',NULL,NULL),(6,'invoice','sales/order_invoice',NULL,'sales/invoice',NULL,NULL,1,'default',0,'eav/entity_increment_numeric',1,8,'0',NULL,NULL),(7,'creditmemo','sales/order_creditmemo',NULL,'sales/creditmemo',NULL,NULL,1,'default',0,'eav/entity_increment_numeric',1,8,'0',NULL,NULL),(8,'shipment','sales/order_shipment',NULL,'sales/shipment',NULL,NULL,1,'default',0,'eav/entity_increment_numeric',1,8,'0',NULL,NULL);
/*!40000 ALTER TABLE `magev1_eav_entity_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_eav_entity_varchar`
--

DROP TABLE IF EXISTS `magev1_eav_entity_varchar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_eav_entity_varchar` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `entity_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Type Id',
  `attribute_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Attribute Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `value` varchar(255) DEFAULT NULL COMMENT 'Attribute Value',
  PRIMARY KEY (`value_id`),
  UNIQUE KEY `UNQ_MAGEV1_EAV_ENTITY_VARCHAR_ENTITY_ID_ATTRIBUTE_ID_STORE_ID` (`entity_id`,`attribute_id`,`store_id`),
  KEY `IDX_MAGEV1_EAV_ENTITY_VARCHAR_ENTITY_TYPE_ID` (`entity_type_id`),
  KEY `IDX_MAGEV1_EAV_ENTITY_VARCHAR_ATTRIBUTE_ID` (`attribute_id`),
  KEY `IDX_MAGEV1_EAV_ENTITY_VARCHAR_STORE_ID` (`store_id`),
  KEY `IDX_MAGEV1_EAV_ENTITY_VARCHAR_ENTITY_ID` (`entity_id`),
  KEY `IDX_MAGEV1_EAV_ENTITY_VARCHAR_ATTRIBUTE_ID_VALUE` (`attribute_id`,`value`),
  KEY `IDX_MAGEV1_EAV_ENTITY_VARCHAR_ENTITY_TYPE_ID_VALUE` (`entity_type_id`,`value`),
  CONSTRAINT `FK_9E27D606854886F2EF008362ED4B033F` FOREIGN KEY (`entity_type_id`) REFERENCES `magev1_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_EAV_ENTITY_VARCHAR_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_EAV_ENTT_VCHR_ENTT_ID_MAGEV1_EAV_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `magev1_eav_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Entity Value Prefix';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_eav_entity_varchar`
--

LOCK TABLES `magev1_eav_entity_varchar` WRITE;
/*!40000 ALTER TABLE `magev1_eav_entity_varchar` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_eav_entity_varchar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_eav_form_element`
--

DROP TABLE IF EXISTS `magev1_eav_form_element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_eav_form_element` (
  `element_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Element Id',
  `type_id` smallint(5) unsigned NOT NULL COMMENT 'Type Id',
  `fieldset_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Fieldset Id',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  `sort_order` int(11) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`element_id`),
  UNIQUE KEY `UNQ_MAGEV1_EAV_FORM_ELEMENT_TYPE_ID_ATTRIBUTE_ID` (`type_id`,`attribute_id`),
  KEY `IDX_MAGEV1_EAV_FORM_ELEMENT_TYPE_ID` (`type_id`),
  KEY `IDX_MAGEV1_EAV_FORM_ELEMENT_FIELDSET_ID` (`fieldset_id`),
  KEY `IDX_MAGEV1_EAV_FORM_ELEMENT_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `FK_MAGEV1_EAV_FORM_ELEMENT_TYPE_ID_MAGEV1_EAV_FORM_TYPE_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `magev1_eav_form_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_EAV_FORM_ELM_ATTR_ID_MAGEV1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `magev1_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_EAV_FORM_ELM_FSET_ID_MAGEV1_EAV_FORM_FSET_FSET_ID` FOREIGN KEY (`fieldset_id`) REFERENCES `magev1_eav_form_fieldset` (`fieldset_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='Eav Form Element';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_eav_form_element`
--

LOCK TABLES `magev1_eav_form_element` WRITE;
/*!40000 ALTER TABLE `magev1_eav_form_element` DISABLE KEYS */;
INSERT INTO `magev1_eav_form_element` VALUES (1,1,NULL,20,0),(2,1,NULL,21,1),(3,1,NULL,22,2),(4,1,NULL,24,3),(5,1,NULL,9,4),(6,1,NULL,25,5),(7,1,NULL,26,6),(8,1,NULL,28,7),(9,1,NULL,30,8),(10,1,NULL,27,9),(11,1,NULL,31,10),(12,1,NULL,32,11),(13,2,NULL,20,0),(14,2,NULL,21,1),(15,2,NULL,22,2),(16,2,NULL,24,3),(17,2,NULL,9,4),(18,2,NULL,25,5),(19,2,NULL,26,6),(20,2,NULL,28,7),(21,2,NULL,30,8),(22,2,NULL,27,9),(23,2,NULL,31,10),(24,2,NULL,32,11),(25,3,NULL,20,0),(26,3,NULL,21,1),(27,3,NULL,22,2),(28,3,NULL,24,3),(29,3,NULL,25,4),(30,3,NULL,26,5),(31,3,NULL,28,6),(32,3,NULL,30,7),(33,3,NULL,27,8),(34,3,NULL,31,9),(35,3,NULL,32,10),(36,4,NULL,20,0),(37,4,NULL,21,1),(38,4,NULL,22,2),(39,4,NULL,24,3),(40,4,NULL,25,4),(41,4,NULL,26,5),(42,4,NULL,28,6),(43,4,NULL,30,7),(44,4,NULL,27,8),(45,4,NULL,31,9),(46,4,NULL,32,10),(47,5,1,5,0),(48,5,1,6,1),(49,5,1,7,2),(50,5,1,9,3),(51,5,2,24,0),(52,5,2,31,1),(53,5,2,25,2),(54,5,2,26,3),(55,5,2,28,4),(56,5,2,30,5),(57,5,2,27,6);
/*!40000 ALTER TABLE `magev1_eav_form_element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_eav_form_fieldset`
--

DROP TABLE IF EXISTS `magev1_eav_form_fieldset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_eav_form_fieldset` (
  `fieldset_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Fieldset Id',
  `type_id` smallint(5) unsigned NOT NULL COMMENT 'Type Id',
  `code` varchar(64) NOT NULL COMMENT 'Code',
  `sort_order` int(11) NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  PRIMARY KEY (`fieldset_id`),
  UNIQUE KEY `UNQ_MAGEV1_EAV_FORM_FIELDSET_TYPE_ID_CODE` (`type_id`,`code`),
  KEY `IDX_MAGEV1_EAV_FORM_FIELDSET_TYPE_ID` (`type_id`),
  CONSTRAINT `FK_MAGEV1_EAV_FORM_FIELDSET_TYPE_ID_MAGEV1_EAV_FORM_TYPE_TYPE_ID` FOREIGN KEY (`type_id`) REFERENCES `magev1_eav_form_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Eav Form Fieldset';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_eav_form_fieldset`
--

LOCK TABLES `magev1_eav_form_fieldset` WRITE;
/*!40000 ALTER TABLE `magev1_eav_form_fieldset` DISABLE KEYS */;
INSERT INTO `magev1_eav_form_fieldset` VALUES (1,5,'general',1),(2,5,'address',2);
/*!40000 ALTER TABLE `magev1_eav_form_fieldset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_eav_form_fieldset_label`
--

DROP TABLE IF EXISTS `magev1_eav_form_fieldset_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_eav_form_fieldset_label` (
  `fieldset_id` smallint(5) unsigned NOT NULL COMMENT 'Fieldset Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `label` varchar(255) NOT NULL COMMENT 'Label',
  PRIMARY KEY (`fieldset_id`,`store_id`),
  KEY `IDX_MAGEV1_EAV_FORM_FIELDSET_LABEL_FIELDSET_ID` (`fieldset_id`),
  KEY `IDX_MAGEV1_EAV_FORM_FIELDSET_LABEL_STORE_ID` (`store_id`),
  CONSTRAINT `FK_MAGEV1_EAV_FORM_FSET_LBL_FSET_ID_MAGEV1_EAV_FORM_FSET_FSET_ID` FOREIGN KEY (`fieldset_id`) REFERENCES `magev1_eav_form_fieldset` (`fieldset_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_EAV_FORM_FSET_LBL_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Form Fieldset Label';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_eav_form_fieldset_label`
--

LOCK TABLES `magev1_eav_form_fieldset_label` WRITE;
/*!40000 ALTER TABLE `magev1_eav_form_fieldset_label` DISABLE KEYS */;
INSERT INTO `magev1_eav_form_fieldset_label` VALUES (1,0,'Personal Information'),(2,0,'Address Information');
/*!40000 ALTER TABLE `magev1_eav_form_fieldset_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_eav_form_type`
--

DROP TABLE IF EXISTS `magev1_eav_form_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_eav_form_type` (
  `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Type Id',
  `code` varchar(64) NOT NULL COMMENT 'Code',
  `label` varchar(255) NOT NULL COMMENT 'Label',
  `is_system` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is System',
  `theme` varchar(64) DEFAULT NULL COMMENT 'Theme',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  PRIMARY KEY (`type_id`),
  UNIQUE KEY `UNQ_MAGEV1_EAV_FORM_TYPE_CODE_THEME_STORE_ID` (`code`,`theme`,`store_id`),
  KEY `IDX_MAGEV1_EAV_FORM_TYPE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_MAGEV1_EAV_FORM_TYPE_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Eav Form Type';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_eav_form_type`
--

LOCK TABLES `magev1_eav_form_type` WRITE;
/*!40000 ALTER TABLE `magev1_eav_form_type` DISABLE KEYS */;
INSERT INTO `magev1_eav_form_type` VALUES (1,'checkout_onepage_register','checkout_onepage_register',1,'',0),(2,'checkout_onepage_register_guest','checkout_onepage_register_guest',1,'',0),(3,'checkout_onepage_billing_address','checkout_onepage_billing_address',1,'',0),(4,'checkout_onepage_shipping_address','checkout_onepage_shipping_address',1,'',0),(5,'checkout_multishipping_register','checkout_multishipping_register',1,'',0);
/*!40000 ALTER TABLE `magev1_eav_form_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_eav_form_type_entity`
--

DROP TABLE IF EXISTS `magev1_eav_form_type_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_eav_form_type_entity` (
  `type_id` smallint(5) unsigned NOT NULL COMMENT 'Type Id',
  `entity_type_id` smallint(5) unsigned NOT NULL COMMENT 'Entity Type Id',
  PRIMARY KEY (`type_id`,`entity_type_id`),
  KEY `IDX_MAGEV1_EAV_FORM_TYPE_ENTITY_ENTITY_TYPE_ID` (`entity_type_id`),
  CONSTRAINT `FK_08D6B879382D8730565CF1A4019BC0C7` FOREIGN KEY (`entity_type_id`) REFERENCES `magev1_eav_entity_type` (`entity_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EF44935C2184976C3F10B6296D927477` FOREIGN KEY (`type_id`) REFERENCES `magev1_eav_form_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Eav Form Type Entity';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_eav_form_type_entity`
--

LOCK TABLES `magev1_eav_form_type_entity` WRITE;
/*!40000 ALTER TABLE `magev1_eav_form_type_entity` DISABLE KEYS */;
INSERT INTO `magev1_eav_form_type_entity` VALUES (1,1),(2,1),(5,1),(1,2),(2,2),(3,2),(4,2),(5,2);
/*!40000 ALTER TABLE `magev1_eav_form_type_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_gift_message`
--

DROP TABLE IF EXISTS `magev1_gift_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_gift_message` (
  `gift_message_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'GiftMessage Id',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer id',
  `sender` varchar(255) DEFAULT NULL COMMENT 'Sender',
  `recipient` varchar(255) DEFAULT NULL COMMENT 'Recipient',
  `message` text COMMENT 'Message',
  PRIMARY KEY (`gift_message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Gift Message';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_gift_message`
--

LOCK TABLES `magev1_gift_message` WRITE;
/*!40000 ALTER TABLE `magev1_gift_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_gift_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_importexport_importdata`
--

DROP TABLE IF EXISTS `magev1_importexport_importdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_importexport_importdata` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `entity` varchar(50) NOT NULL COMMENT 'Entity',
  `behavior` varchar(10) NOT NULL DEFAULT 'append' COMMENT 'Behavior',
  `data` longtext COMMENT 'Data',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Import Data Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_importexport_importdata`
--

LOCK TABLES `magev1_importexport_importdata` WRITE;
/*!40000 ALTER TABLE `magev1_importexport_importdata` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_importexport_importdata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_index_event`
--

DROP TABLE IF EXISTS `magev1_index_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_index_event` (
  `event_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Event Id',
  `type` varchar(64) NOT NULL COMMENT 'Type',
  `entity` varchar(64) NOT NULL COMMENT 'Entity',
  `entity_pk` bigint(20) DEFAULT NULL COMMENT 'Entity Primary Key',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Creation Time',
  `old_data` mediumtext COMMENT 'Old Data',
  `new_data` mediumtext COMMENT 'New Data',
  PRIMARY KEY (`event_id`),
  UNIQUE KEY `UNQ_MAGEV1_INDEX_EVENT_TYPE_ENTITY_ENTITY_PK` (`type`,`entity`,`entity_pk`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 COMMENT='Index Event';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_index_event`
--

LOCK TABLES `magev1_index_event` WRITE;
/*!40000 ALTER TABLE `magev1_index_event` DISABLE KEYS */;
INSERT INTO `magev1_index_event` VALUES (1,'save','catalog_category',1,'2017-03-15 10:25:03',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(2,'save','catalog_category',2,'2017-03-15 10:25:04',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(3,'save','cataloginventory_stock_item',1,'2017-03-16 09:28:55',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(4,'catalog_reindex_price','catalog_product',1,'2017-03-16 09:28:55',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(5,'save','catalog_product',1,'2017-03-16 09:28:55',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(6,'save','catalog_category',3,'2017-03-16 09:30:39',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(7,'save','catalog_category',4,'2017-03-16 10:29:55',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(8,'save','catalog_category',5,'2017-03-16 10:30:12',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(9,'save','catalog_category',6,'2017-03-16 10:30:40',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(10,'save','catalog_category',7,'2017-03-16 10:39:13',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(11,'save','catalog_category',8,'2017-03-16 10:42:30',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(12,'save','catalog_category',9,'2017-03-16 11:45:51',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(13,'save','catalog_eav_attribute',92,'2017-03-17 09:41:27',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(14,'save','cataloginventory_stock_item',2,'2017-03-17 09:44:12',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(15,'catalog_reindex_price','catalog_product',2,'2017-03-17 09:44:13',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(16,'save','catalog_product',2,'2017-03-17 09:44:13',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(17,'save','cataloginventory_stock_item',3,'2017-03-17 09:44:38',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(18,'catalog_reindex_price','catalog_product',3,'2017-03-17 09:44:38',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(19,'save','catalog_product',3,'2017-03-17 09:44:38',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(20,'save','cataloginventory_stock_item',4,'2017-03-17 09:51:25',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(21,'catalog_reindex_price','catalog_product',4,'2017-03-17 09:51:25',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(22,'save','catalog_product',4,'2017-03-17 09:51:26',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(23,'save','cataloginventory_stock_item',5,'2017-03-17 10:56:35',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(24,'catalog_reindex_price','catalog_product',5,'2017-03-17 10:56:35',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(25,'save','catalog_product',5,'2017-03-17 10:56:35',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(26,'save','cataloginventory_stock_item',6,'2017-03-17 10:56:57',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(27,'catalog_reindex_price','catalog_product',6,'2017-03-17 10:56:57',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(28,'save','catalog_product',6,'2017-03-17 10:56:57',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(29,'save','catalog_category',10,'2017-03-17 13:45:09',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(30,'save','catalog_category',11,'2017-03-21 14:28:33',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(31,'save','catalog_category',12,'2017-03-21 14:31:12',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(32,'save','catalog_category',13,'2017-03-27 09:10:57',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(33,'save','cataloginventory_stock_item',7,'2017-03-27 09:18:28',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(34,'catalog_reindex_price','catalog_product',7,'2017-03-27 09:18:28',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(35,'save','catalog_product',7,'2017-03-27 09:18:29',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(36,'save','cataloginventory_stock_item',8,'2017-03-27 09:56:54',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(37,'catalog_reindex_price','catalog_product',8,'2017-03-27 09:56:54',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(38,'save','catalog_product',8,'2017-03-27 09:56:55',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(39,'save','catalog_category',14,'2017-03-27 14:22:21',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(40,'save','catalog_eav_attribute',132,'2017-03-29 12:56:24',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(41,'save','cataloginventory_stock_item',9,'2017-03-29 13:01:49',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(42,'catalog_reindex_price','catalog_product',9,'2017-03-29 13:01:49',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(43,'save','catalog_product',9,'2017-03-29 13:01:49',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(44,'save','core_store',2,'2017-03-30 10:46:09',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(45,'save','store_group',2,'2017-03-31 12:40:52',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(46,'save','catalog_category',15,'2017-03-31 12:41:10',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(47,'save','catalog_category',16,'2017-03-31 12:41:29',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(48,'save','core_store',3,'2017-03-31 12:42:12',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(49,'save','cataloginventory_stock_item',10,'2017-04-03 12:10:55',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(50,'catalog_reindex_price','catalog_product',10,'2017-04-03 12:10:56',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(51,'save','catalog_product',10,'2017-04-03 12:10:57',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(52,'save','cataloginventory_stock_item',11,'2017-04-03 12:21:46',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(53,'catalog_reindex_price','catalog_product',11,'2017-04-03 12:21:46',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(54,'save','catalog_product',11,'2017-04-03 12:21:46',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(55,'save','catalog_category',17,'2017-04-04 17:59:52',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(56,'save','catalog_category',18,'2017-04-04 21:36:59',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(57,'delete','catalog_product',11,'2017-04-05 05:37:33',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(58,'delete','catalog_product',1,'2017-04-05 05:37:33',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(59,'delete','catalog_product',2,'2017-04-05 05:37:34',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(60,'delete','catalog_product',3,'2017-04-05 05:37:34',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(61,'delete','catalog_product',4,'2017-04-05 05:37:34',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(62,'delete','catalog_product',5,'2017-04-05 05:37:34',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(63,'delete','catalog_product',6,'2017-04-05 05:37:35',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(64,'delete','catalog_product',7,'2017-04-05 05:37:35',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(65,'delete','catalog_product',8,'2017-04-05 05:37:35',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(66,'delete','catalog_product',9,'2017-04-05 05:37:36',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(67,'delete','catalog_product',10,'2017-04-05 05:37:36',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(68,'save','cataloginventory_stock_item',12,'2017-04-05 05:45:15',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(69,'catalog_reindex_price','catalog_product',12,'2017-04-05 05:45:15',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(70,'save','catalog_product',12,'2017-04-05 05:45:15',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(71,'save','cataloginventory_stock_item',13,'2017-04-05 05:47:10',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(72,'catalog_reindex_price','catalog_product',13,'2017-04-05 05:47:10',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(73,'save','catalog_product',13,'2017-04-05 05:47:11',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(74,'save','cataloginventory_stock_item',14,'2017-04-05 05:48:31',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(75,'catalog_reindex_price','catalog_product',14,'2017-04-05 05:48:31',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(76,'save','catalog_product',14,'2017-04-05 05:48:31',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(77,'save','catalog_category',19,'2017-04-05 05:52:36',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(78,'save','cataloginventory_stock_item',15,'2017-04-05 05:55:08',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(79,'catalog_reindex_price','catalog_product',15,'2017-04-05 05:55:09',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(80,'save','catalog_product',15,'2017-04-05 05:55:09',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(81,'save','catalog_category',20,'2017-04-05 06:10:18',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(82,'save','catalog_category',21,'2017-04-05 06:11:17',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(83,'save','cataloginventory_stock_item',16,'2017-04-05 07:24:26',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(84,'catalog_reindex_price','catalog_product',16,'2017-04-05 07:24:26',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(85,'save','catalog_product',16,'2017-04-05 07:24:26',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(86,'save','cataloginventory_stock_item',17,'2017-04-05 07:29:18',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(87,'catalog_reindex_price','catalog_product',17,'2017-04-05 07:29:18',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(88,'save','catalog_product',17,'2017-04-05 07:29:19',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(89,'save','catalog_eav_attribute',133,'2017-04-05 10:52:08',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(90,'save','catalog_eav_attribute',134,'2017-04-05 10:54:06',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(91,'save','catalog_eav_attribute',135,'2017-04-05 19:02:34',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(92,'save','catalog_eav_attribute',136,'2017-04-05 19:03:34',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(93,'save','catalog_eav_attribute',137,'2017-04-05 19:04:26',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(94,'save','catalog_eav_attribute',138,'2017-04-05 19:07:02',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(95,'save','catalog_eav_attribute',139,'2017-04-05 19:07:55',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(96,'delete','catalog_eav_attribute',136,'2017-04-05 19:08:06',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";s:1:\"0\";}'),(97,'save','cataloginventory_stock_item',18,'2017-04-05 19:52:06',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(98,'catalog_reindex_price','catalog_product',18,'2017-04-05 19:52:06',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:0;}'),(99,'save','catalog_product',18,'2017-04-05 19:52:06',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:1;s:34:\"catalog_product_price_match_result\";b:1;s:24:\"catalog_url_match_result\";b:1;s:37:\"catalog_category_product_match_result\";b:1;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(100,'delete','catalog_eav_attribute',132,'2017-04-05 21:40:48',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";s:1:\"1\";}'),(101,'save','catalog_eav_attribute',140,'2017-04-05 21:41:31',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:1;}'),(102,'save','catalog_eav_attribute',141,'2017-04-05 21:42:07',NULL,'a:5:{s:35:\"cataloginventory_stock_match_result\";b:0;s:34:\"catalog_product_price_match_result\";b:0;s:24:\"catalog_url_match_result\";b:0;s:37:\"catalog_category_product_match_result\";b:0;s:35:\"catalogsearch_fulltext_match_result\";b:1;}');
/*!40000 ALTER TABLE `magev1_index_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_index_process`
--

DROP TABLE IF EXISTS `magev1_index_process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_index_process` (
  `process_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Process Id',
  `indexer_code` varchar(32) NOT NULL COMMENT 'Indexer Code',
  `status` varchar(15) NOT NULL DEFAULT 'pending' COMMENT 'Status',
  `started_at` timestamp NULL DEFAULT NULL COMMENT 'Started At',
  `ended_at` timestamp NULL DEFAULT NULL COMMENT 'Ended At',
  `mode` varchar(9) NOT NULL DEFAULT 'real_time' COMMENT 'Mode',
  PRIMARY KEY (`process_id`),
  UNIQUE KEY `UNQ_MAGEV1_INDEX_PROCESS_INDEXER_CODE` (`indexer_code`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='Index Process';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_index_process`
--

LOCK TABLES `magev1_index_process` WRITE;
/*!40000 ALTER TABLE `magev1_index_process` DISABLE KEYS */;
INSERT INTO `magev1_index_process` VALUES (1,'catalog_product_attribute','pending','2017-04-05 22:01:21','2017-04-05 22:01:21','real_time'),(2,'catalog_product_price','pending','2017-04-05 22:01:21','2017-04-05 22:01:21','real_time'),(3,'catalog_url','pending','2017-04-05 22:01:21','2017-04-05 22:01:21','real_time'),(4,'catalog_product_flat','pending','2017-03-15 13:22:14','2017-03-15 13:22:15','real_time'),(5,'catalog_category_flat','pending','2017-03-15 13:22:15','2017-03-15 13:22:15','real_time'),(6,'catalog_category_product','pending','2017-04-05 22:01:21','2017-04-05 22:01:21','real_time'),(7,'catalogsearch_fulltext','require_reindex','2017-04-05 22:01:21','2017-04-05 22:01:21','real_time'),(8,'cataloginventory_stock','pending','2017-04-05 22:01:21','2017-04-05 22:01:21','real_time'),(9,'tag_summary','pending','2017-04-05 22:01:21','2017-04-05 22:01:21','real_time');
/*!40000 ALTER TABLE `magev1_index_process` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_index_process_event`
--

DROP TABLE IF EXISTS `magev1_index_process_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_index_process_event` (
  `process_id` int(10) unsigned NOT NULL COMMENT 'Process Id',
  `event_id` bigint(20) unsigned NOT NULL COMMENT 'Event Id',
  `status` varchar(7) NOT NULL DEFAULT 'new' COMMENT 'Status',
  PRIMARY KEY (`process_id`,`event_id`),
  KEY `IDX_MAGEV1_INDEX_PROCESS_EVENT_EVENT_ID` (`event_id`),
  CONSTRAINT `FK_E4BDF8E0EA7221E72D8910C27589574B` FOREIGN KEY (`process_id`) REFERENCES `magev1_index_process` (`process_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_IDX_PROCESS_EVENT_EVENT_ID_MAGEV1_IDX_EVENT_EVENT_ID` FOREIGN KEY (`event_id`) REFERENCES `magev1_index_event` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Index Process Event';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_index_process_event`
--

LOCK TABLES `magev1_index_process_event` WRITE;
/*!40000 ALTER TABLE `magev1_index_process_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_index_process_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_log_customer`
--

DROP TABLE IF EXISTS `magev1_log_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_log_customer` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Log ID',
  `visitor_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Visitor ID',
  `customer_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Customer ID',
  `login_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Login Time',
  `logout_at` timestamp NULL DEFAULT NULL COMMENT 'Logout Time',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  PRIMARY KEY (`log_id`),
  KEY `IDX_MAGEV1_LOG_CUSTOMER_VISITOR_ID` (`visitor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log Customers Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_log_customer`
--

LOCK TABLES `magev1_log_customer` WRITE;
/*!40000 ALTER TABLE `magev1_log_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_log_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_log_quote`
--

DROP TABLE IF EXISTS `magev1_log_quote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_log_quote` (
  `quote_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote ID',
  `visitor_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Visitor ID',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Creation Time',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT 'Deletion Time',
  PRIMARY KEY (`quote_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log Quotes Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_log_quote`
--

LOCK TABLES `magev1_log_quote` WRITE;
/*!40000 ALTER TABLE `magev1_log_quote` DISABLE KEYS */;
INSERT INTO `magev1_log_quote` VALUES (1,113,'2017-03-30 08:49:38',NULL);
/*!40000 ALTER TABLE `magev1_log_quote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_log_summary`
--

DROP TABLE IF EXISTS `magev1_log_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_log_summary` (
  `summary_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Summary ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  `type_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Type ID',
  `visitor_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Visitor Count',
  `customer_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Customer Count',
  `add_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date',
  PRIMARY KEY (`summary_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log Summary Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_log_summary`
--

LOCK TABLES `magev1_log_summary` WRITE;
/*!40000 ALTER TABLE `magev1_log_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_log_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_log_summary_type`
--

DROP TABLE IF EXISTS `magev1_log_summary_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_log_summary_type` (
  `type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Type ID',
  `type_code` varchar(64) DEFAULT NULL COMMENT 'Type Code',
  `period` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Period',
  `period_type` varchar(6) NOT NULL DEFAULT 'MINUTE' COMMENT 'Period Type',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Log Summary Types Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_log_summary_type`
--

LOCK TABLES `magev1_log_summary_type` WRITE;
/*!40000 ALTER TABLE `magev1_log_summary_type` DISABLE KEYS */;
INSERT INTO `magev1_log_summary_type` VALUES (1,'hour',1,'HOUR'),(2,'day',1,'DAY');
/*!40000 ALTER TABLE `magev1_log_summary_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_log_url`
--

DROP TABLE IF EXISTS `magev1_log_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_log_url` (
  `url_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'URL ID',
  `visitor_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Visitor ID',
  `visit_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Visit Time',
  KEY `IDX_MAGEV1_LOG_URL_VISITOR_ID` (`visitor_id`),
  KEY `url_id` (`url_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log URL Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_log_url`
--

LOCK TABLES `magev1_log_url` WRITE;
/*!40000 ALTER TABLE `magev1_log_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_log_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_log_url_info`
--

DROP TABLE IF EXISTS `magev1_log_url_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_log_url_info` (
  `url_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'URL ID',
  `url` varchar(255) DEFAULT NULL COMMENT 'URL',
  `referer` varchar(255) DEFAULT NULL COMMENT 'Referrer',
  PRIMARY KEY (`url_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log URL Info Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_log_url_info`
--

LOCK TABLES `magev1_log_url_info` WRITE;
/*!40000 ALTER TABLE `magev1_log_url_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_log_url_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_log_visitor`
--

DROP TABLE IF EXISTS `magev1_log_visitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_log_visitor` (
  `visitor_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Visitor ID',
  `session_id` varchar(64) DEFAULT NULL COMMENT 'Session ID',
  `first_visit_at` timestamp NULL DEFAULT NULL COMMENT 'First Visit Time',
  `last_visit_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Last Visit Time',
  `last_url_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Last URL ID',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store ID',
  PRIMARY KEY (`visitor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=275 DEFAULT CHARSET=utf8 COMMENT='Log Visitors Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_log_visitor`
--

LOCK TABLES `magev1_log_visitor` WRITE;
/*!40000 ALTER TABLE `magev1_log_visitor` DISABLE KEYS */;
INSERT INTO `magev1_log_visitor` VALUES (1,'57pmi7qu4e7eur17potins64i1','2017-03-15 10:27:57','2017-03-15 11:11:40',0,1),(2,'c5nela7simkmn2cp38b9qvt2s1','2017-03-15 10:44:24','2017-03-15 10:44:24',0,1),(3,'0ogalorv8f951hlqt8efdab7h6','2017-03-15 10:44:25','2017-03-15 10:44:25',0,1),(4,'6ql16605cttiorocvmn90l1is5','2017-03-15 12:39:38','2017-03-15 12:39:38',0,1),(5,'fk1vljqhjh0cg5lgi752admmf6','2017-03-15 12:39:38','2017-03-15 12:39:39',0,1),(6,'qtq52m9peutvk3dgb592ebmdk7','2017-03-15 13:21:28','2017-03-15 13:22:20',0,1),(7,'k54n3pfdqhaio16njhqsjd91g6','2017-03-15 15:21:39','2017-03-15 15:37:39',0,1),(8,'6kui9qpcqao925f8e5h4oc5r12','2017-03-15 16:42:12','2017-03-15 16:42:29',0,1),(9,'gs85jkhda8m4crdm94q2e497q3','2017-03-16 07:13:18','2017-03-16 07:13:19',0,1),(10,'11gi98un2u28t6trubfbc70dn6','2017-03-16 08:17:24','2017-03-16 08:17:24',0,1),(11,'go6tur2pjf4l4cultt0gmoccs5','2017-03-16 09:19:03','2017-03-16 09:19:03',0,1),(12,'sf8nojbbvh41c76fdcl9rfe3b1','2017-03-16 09:21:31','2017-03-16 11:36:35',0,1),(13,'1kj45fg7iaerhujknr34d7fi52','2017-03-16 09:22:08','2017-03-16 09:22:09',0,1),(14,'4eiuua548gbe8bmp233rj4v375','2017-03-16 11:36:36','2017-03-16 11:49:11',0,1),(15,'p9ldvl8fmstr29udis0l6dsde7','2017-03-16 12:45:48','2017-03-16 12:45:48',0,1),(16,'9hon8lls0giu02r2fdm12u9206','2017-03-17 09:36:39','2017-03-17 09:36:41',0,1),(17,'6ike8nnr9vqmcpp5vekkunnqh5','2017-03-17 09:36:40','2017-03-17 11:00:04',0,1),(18,'3jilem0jjm2ha1a4lplp83spd1','2017-03-17 10:07:19','2017-03-17 10:07:20',0,1),(19,'tipnvnh6tbm30dr8jn1cf15lm2','2017-03-17 12:12:43','2017-03-17 13:51:06',0,1),(20,'lt5siae0rvdmnkupa1gg9hv062','2017-03-17 17:09:28','2017-03-17 17:09:30',0,1),(21,'bb45df85cceigcijdni21qv9v2','2017-03-17 20:19:03','2017-03-17 20:19:03',0,1),(22,'pg7lmla0rpja1pijndd0nr3712','2017-03-17 23:31:29','2017-03-17 23:31:30',0,1),(23,'4no9r4579tnfhq9kjbsdf2e1p0','2017-03-17 23:31:30','2017-03-17 23:31:30',0,1),(24,'iaiutehis29jbl2mrlsjdjatp3','2017-03-17 23:31:31','2017-03-17 23:31:31',0,1),(25,'ugar90q1j2f00o5pdmmgdm4kp3','2017-03-17 23:31:31','2017-03-17 23:31:31',0,1),(26,'1b138olhqmae0cofnhgr9ggo50','2017-03-18 10:30:03','2017-03-18 10:30:04',0,1),(27,'45hbl6hkf54isbumchhj2enbj7','2017-03-18 10:30:05','2017-03-18 10:30:05',0,1),(28,'7g0qkgfvmrffmf1ibfr6h4a2q2','2017-03-18 10:30:06','2017-03-18 10:30:06',0,1),(29,'vaufkmjmc1tedg576cl7r6ora6','2017-03-18 10:30:06','2017-03-18 10:30:07',0,1),(30,'mpkapu9dhggf5jr139k823khu3','2017-03-18 12:08:33','2017-03-18 12:08:33',0,1),(31,'lfvgu8hetjuqfdda63ur7tst03','2017-03-18 13:00:20','2017-03-18 13:00:21',0,1),(32,'h85eqaf77ll7q7b8dung9jppp2','2017-03-18 13:01:21','2017-03-18 13:01:21',0,1),(33,'6mecse7cj8p1hhv4st8i3pfa57','2017-03-18 13:01:22','2017-03-18 13:01:23',0,1),(34,'mptp88bdoh94ha9t3vmbhuk3n5','2017-03-18 13:01:23','2017-03-18 13:01:24',0,1),(35,'ufh26qargdluehevbf411g96b6','2017-03-18 13:01:24','2017-03-18 13:01:25',0,1),(36,'bu8t8c11c3quk8hfmqje2v5ap2','2017-03-18 13:12:51','2017-03-18 13:12:51',0,1),(37,'opufrlo194k01ugkun7t0ee3j2','2017-03-18 16:30:04','2017-03-18 16:30:04',0,1),(38,'2d8iphvvlrcmrsbsd7gu9i61b1','2017-03-19 00:09:18','2017-03-19 00:09:18',0,1),(39,'dbeb7qp99mqcjoutnne4t4fc56','2017-03-19 00:14:42','2017-03-19 00:14:42',0,1),(40,'8d7q5lq9vek5n45688tvrec900','2017-03-19 00:14:43','2017-03-19 00:14:43',0,1),(41,'fi4dj27tas88d9urtfg9tlm2o7','2017-03-19 00:14:43','2017-03-19 00:14:43',0,1),(42,'e89f6b12333lrnhmqh15891md6','2017-03-19 00:14:44','2017-03-19 00:14:44',0,1),(43,'v5nk4mepdi16h1co6v44imu1i6','2017-03-19 01:58:56','2017-03-19 01:58:57',0,1),(44,'2o7vudj4jcme06hcpknjmt54a4','2017-03-19 03:51:38','2017-03-19 03:51:38',0,1),(45,'vnppscoouqlbk1cmkqk911vdi0','2017-03-19 04:01:23','2017-03-19 04:01:23',0,1),(46,'vtio1dr9gjfibqgilfffa6les6','2017-03-19 05:24:42','2017-03-19 05:24:42',0,1),(47,'odgqa6hbmgf5qe9v564o14hk44','2017-03-19 08:50:19','2017-03-19 08:50:20',0,1),(48,'s5i8ku3qh4vltca1jqo5nr7uj4','2017-03-19 08:50:20','2017-03-19 08:50:20',0,1),(49,'ll84l3gdlia1g5to3t7bsn8pt3','2017-03-19 08:50:21','2017-03-19 08:50:21',0,1),(50,'vrhnhpejp02lhl6r1qbh29tb36','2017-03-19 08:50:21','2017-03-19 08:50:22',0,1),(51,'ntm269ro20iuecbhe0nff2ici2','2017-03-19 09:11:17','2017-03-19 09:11:17',0,1),(52,'99vi924gkh0lm13qhjgvrm4vp0','2017-03-19 12:35:44','2017-03-19 12:35:45',0,1),(53,'u7tv04bt4e4homgo3bvg2absv4','2017-03-19 15:43:12','2017-03-19 15:43:12',0,1),(54,'h9gsuu5hqj0shdl846vrm0i5c1','2017-03-20 05:05:47','2017-03-20 05:05:47',0,1),(55,'762c4vul9otadd2puhj6kuuao3','2017-03-20 09:58:44','2017-03-20 09:58:45',0,1),(56,'fgek2bbmuncn6hkhi5t8rmak62','2017-03-20 15:19:40','2017-03-20 15:52:53',0,1),(57,'dmquogelulnbe5mn966291vnc4','2017-03-20 15:27:26','2017-03-20 15:27:26',0,1),(58,'t241j3ecpvslgsouj31bebrtq7','2017-03-20 17:11:35','2017-03-20 17:11:36',0,1),(59,'t7mo1ijefkbcl565ja78iajof2','2017-03-20 18:12:36','2017-03-20 18:12:37',0,1),(60,'l8e46cl3915b27fd431fs1s4h2','2017-03-20 20:32:41','2017-03-20 20:32:41',0,1),(61,'kd3057grc952h2qbc98gtlbs32','2017-03-20 22:03:45','2017-03-20 22:03:45',0,1),(62,'0q1cm13j8fkc7ka407kp752gp5','2017-03-21 08:44:29','2017-03-21 08:44:54',0,1),(63,'jfv9vfj0p1iujtdp1erk89t2r0','2017-03-21 10:02:39','2017-03-21 11:09:44',0,1),(64,'ks6o9gsh7bbub8p25an0d4do13','2017-03-21 12:48:56','2017-03-21 12:48:56',0,1),(65,'pnm3u55ldn1fskf9eok976ugr7','2017-03-21 14:26:37','2017-03-21 14:44:30',0,1),(66,'6j9o2lqmch09897853pg2u4l91','2017-03-27 07:48:17','2017-03-27 09:11:21',0,1),(67,'gd3nachjrau4eaj3i101p30uq1','2017-03-27 08:15:29','2017-03-27 08:15:29',0,1),(68,'16ngjmjqsvskpgqtgb9f28dbn4','2017-03-27 09:11:25','2017-03-27 09:57:13',0,1),(69,'ilapem4c9mb04n5jqm10t4i2p4','2017-03-27 12:29:26','2017-03-27 12:44:26',0,1),(70,'3hbmkj369l5iedmjtj1qs13ir0','2017-03-27 14:13:49','2017-03-27 14:13:49',0,1),(71,'1oapai0piqd7umrv2o5oamf1i7','2017-03-27 14:20:36','2017-03-27 14:29:07',0,1),(72,'a1tqi496u58vj8a1ql461dedi5','2017-03-27 15:08:32','2017-03-27 15:08:32',0,1),(73,'kaihai0imicjm2j5rb368if8e1','2017-03-27 16:27:34','2017-03-27 16:27:35',0,1),(74,'lo90hvm3opum7ck18tkpmrrrm4','2017-03-27 16:28:05','2017-03-27 16:28:05',0,1),(75,'84j7084vl1ls59v1ks11g63jk3','2017-03-28 02:19:42','2017-03-28 02:19:42',0,1),(76,'aulov2k3aohbhp3isuhj7ulrh6','2017-03-28 02:39:25','2017-03-28 02:39:25',0,1),(77,'9rgdtp883pgavafi540i9br745','2017-03-28 03:57:43','2017-03-28 03:57:43',0,1),(78,'v7kria37hpem4f0grbbigb3a60','2017-03-28 03:57:43','2017-03-28 03:57:44',0,1),(79,'k06tf2791s6jivo207931seg83','2017-03-28 03:57:44','2017-03-28 03:57:44',0,1),(80,'acrjk8h742k2dpoli2jtgskj02','2017-03-28 03:57:45','2017-03-28 03:57:45',0,1),(81,'kmcnap2vvkllnsg7ucidi47tu2','2017-03-28 05:04:52','2017-03-28 05:04:52',0,1),(82,'o36gnqpp0vq294bgqtsc25du90','2017-03-28 05:04:52','2017-03-28 05:04:53',0,1),(83,'mpa060meuvmdefj25fr3khsnc6','2017-03-28 07:11:16','2017-03-28 07:11:17',0,1),(84,'ocv05g5i6ahcno5v3aeju4pb86','2017-03-28 08:22:49','2017-03-28 08:22:50',0,1),(85,'ut8ddshergfq6c80qcuk3stmb0','2017-03-28 08:22:49','2017-03-28 08:22:50',0,1),(86,'s6p5q1kug49npdcd21quqh1cm0','2017-03-28 13:48:26','2017-03-28 13:48:27',0,1),(87,'bmpp8qq0892pshb81thlrobd81','2017-03-28 19:53:59','2017-03-28 19:53:59',0,1),(88,'b4euqs801rn93gbkkbfrj49pr6','2017-03-28 20:12:44','2017-03-28 20:12:45',0,1),(89,'l7fs13om0gail3llqmjbd0m3j3','2017-03-28 22:21:19','2017-03-28 22:21:19',0,1),(90,'r0brpfg5u303mqdkmk2lb5ic93','2017-03-29 00:53:03','2017-03-29 00:53:03',0,1),(91,'nh25ls19qprfrl6sc0u9dhir52','2017-03-29 08:36:56','2017-03-29 08:36:57',0,1),(92,'g893c2sh6rm218fdggbca72ht7','2017-03-29 08:36:56','2017-03-29 08:36:57',0,1),(93,'s1qjuogl1rgmssh5bovcf4bbe0','2017-03-29 09:03:28','2017-03-29 09:03:32',0,1),(94,'kmheppgvlim0pqh9b3tgfdopd6','2017-03-29 11:03:38','2017-03-29 11:03:39',0,1),(95,'ik2tkgrf520i70u27fnc3avnd0','2017-03-29 12:49:00','2017-03-29 13:16:31',0,1),(96,'s0r88nh0gpc0nsl9cnl5j88ml3','2017-03-29 15:32:57','2017-03-29 15:32:57',0,1),(97,'u32hpso4kul0if5l0tn27uskl3','2017-03-29 18:33:33','2017-03-29 18:33:34',0,1),(98,'aodllorfkcctqgq8069stkv3m0','2017-03-29 18:58:19','2017-03-29 18:58:19',0,1),(99,'b72aq8e2k2c6ksj7sfrr2dhrs7','2017-03-29 18:58:19','2017-03-29 18:58:19',0,1),(100,'lhsp24b77kod37lje4ks3jv706','2017-03-29 18:58:20','2017-03-29 18:58:20',0,1),(101,'bbdbia6isinavgf2o1a7lb7p07','2017-03-29 18:58:20','2017-03-29 18:58:20',0,1),(102,'o5mgub6isu25og8q2441ca9is0','2017-03-29 19:12:40','2017-03-29 19:12:40',0,1),(103,'gkrkk4dblb4sgqit260s43o3k0','2017-03-29 23:08:51','2017-03-29 23:08:52',0,1),(104,'j75bkbrecqr8tia97gapbimdd1','2017-03-29 23:16:26','2017-03-29 23:16:26',0,1),(105,'3hbu5nuqn9v4o9b770ujd2u525','2017-03-30 00:20:38','2017-03-30 00:20:38',0,1),(106,'gam9o93ca7kq5hrhe72pp1u6h7','2017-03-30 01:05:35','2017-03-30 01:05:35',0,1),(107,'1m7t68qjt2163i3h62k8gr0ib4','2017-03-30 02:24:16','2017-03-30 02:24:16',0,1),(108,'7vco34979jc4gs4jbpd0o5lag3','2017-03-30 05:35:46','2017-03-30 05:35:46',0,1),(109,'pkeo25ee3v9bv3r9lf55e84a16','2017-03-30 08:04:53','2017-03-30 08:04:53',0,1),(110,'kl3t40es92fke07bfbdutbf5n3','2017-03-30 08:04:53','2017-03-30 08:04:53',0,1),(111,'ggbis3lrvs2k57refqfr5lptk5','2017-03-30 08:04:54','2017-03-30 08:04:54',0,1),(112,'tk17nqi1j5jf4j9pm7evi6f3b0','2017-03-30 08:04:54','2017-03-30 08:04:54',0,1),(113,'6rs9qk1j5ck1iec1ghee35ank3','2017-03-30 08:20:46','2017-03-30 10:56:28',0,1),(114,'6pjkedncuakv8hsdkf34mirjr0','2017-03-30 09:14:58','2017-03-30 09:14:58',0,1),(115,'q38rv6t5alusdt2fsauu6lcmu4','2017-03-30 10:52:15','2017-03-30 10:52:16',0,1),(116,'hoppa2edsgpggfe4f4r47e5of6','2017-03-30 12:38:26','2017-03-30 12:38:26',0,1),(117,'eeetcnqm5oh4sj0bfeeqhsfdn2','2017-03-30 14:36:11','2017-03-30 14:36:12',0,1),(118,'joegi830mj8utlvn2pp1hhjku6','2017-03-30 18:54:07','2017-03-30 18:54:08',0,1),(119,'rv83o2inr833bddvbhmhc3htm4','2017-03-30 20:53:12','2017-03-30 20:53:12',0,1),(120,'6u0g1a1aonrdhapq98negrmcu2','2017-03-31 02:13:43','2017-03-31 02:13:44',0,1),(121,'np9db22dm01e8eog7pui071jl2','2017-03-31 03:01:59','2017-03-31 03:02:00',0,1),(122,'uv5jui0e914fovfhm2eodt49e0','2017-03-31 05:51:25','2017-03-31 05:51:25',0,1),(123,'8mkjt3bh7er69hbj102c6jabc6','2017-03-31 07:50:57','2017-03-31 09:23:19',0,1),(124,'f0gve02qumdpmerh1n247083h5','2017-03-31 09:58:56','2017-03-31 09:58:57',0,1),(125,'fcdfjs12ebndmnjfcf1ao0bfv3','2017-03-31 09:58:58','2017-03-31 09:58:59',0,1),(126,'tp7sap73maqu44i7o9ddvosk10','2017-03-31 09:59:00','2017-03-31 09:59:01',0,1),(127,'9ak6m59nf802qhvjblhjna0k42','2017-03-31 10:03:52','2017-03-31 10:03:53',0,1),(128,'h039humtpm7s4ok49h16q5crs1','2017-03-31 10:03:54','2017-03-31 10:03:55',0,1),(129,'np2bt2ek5jgcmsled14rq6u6t5','2017-03-31 10:03:55','2017-03-31 10:03:56',0,1),(130,'jbvsh1aeqpr1f06m5k6ijlflm3','2017-03-31 10:03:57','2017-03-31 10:03:57',0,1),(131,'1peh291s0gm1f15n6qfg7at5u3','2017-03-31 10:58:07','2017-03-31 10:58:08',0,1),(132,'6baf73146oetb217hfve4siss1','2017-03-31 11:42:32','2017-03-31 12:45:23',0,1),(133,'6rau4upl9llh1ifl3e2fl0eaa7','2017-03-31 11:50:21','2017-03-31 11:50:22',0,1),(134,'1q1bq799ivja48kf7nekfi3hp2','2017-03-31 11:50:23','2017-03-31 11:50:24',0,1),(135,'7ol880okvicub6qu1af9tj22a2','2017-03-31 11:50:25','2017-03-31 11:50:26',0,1),(136,'inb0vv9bd5dk7tfcu29ji8oj03','2017-03-31 11:50:27','2017-03-31 11:50:28',0,1),(137,'ncdtosu01o1egi4054ud5cqrb5','2017-03-31 14:05:44','2017-03-31 14:05:45',0,1),(138,'lkj8e3ue0k8h1afquou79f0mi3','2017-03-31 17:00:28','2017-03-31 17:00:29',0,1),(139,'m7kk9v8p0epiu5i2aihl7t6ed3','2017-03-31 19:58:41','2017-03-31 19:58:41',0,1),(140,'17ir7bnj1tmakkmf0bf4ehcvv4','2017-03-31 20:47:51','2017-03-31 20:47:52',0,1),(141,'ulbara4vh28cauk7op9o19usg7','2017-03-31 20:47:53','2017-03-31 20:47:53',0,1),(142,'8fhab682rj3jkopg8203fb3dg0','2017-03-31 20:47:54','2017-03-31 20:47:54',0,1),(143,'hba3m40bd21lhrt2pqg1jngp57','2017-03-31 20:47:55','2017-03-31 20:47:56',0,1),(144,'jtvrb09miqiq2ej3s2jqan32p2','2017-03-31 20:47:57','2017-03-31 20:47:58',0,1),(145,'t1kr7ttq2qsm23q8neeje7c2j2','2017-03-31 20:47:59','2017-03-31 20:47:59',0,1),(146,'eto5epar4vv6665dpfl23bbnp5','2017-03-31 20:48:01','2017-03-31 20:48:01',0,1),(147,'5v0sgg3c29phmh0g47rtlvlbs2','2017-03-31 20:48:03','2017-03-31 20:48:04',0,1),(148,'ei2doadapui2lbraf2rcum9ju0','2017-03-31 20:48:05','2017-03-31 20:48:05',0,1),(149,'g9m94nl4jmiaegmqeua712ppd3','2017-03-31 20:48:07','2017-03-31 20:48:07',0,1),(150,'schn24r4tcgk7dgimd06dic050','2017-03-31 20:48:08','2017-03-31 20:48:09',0,1),(151,'kmpvga43jgov6pgbcdc4e2qm86','2017-03-31 20:48:10','2017-03-31 20:48:10',0,1),(152,'prjlmistttketorccje7q66cc5','2017-03-31 20:48:12','2017-03-31 20:48:12',0,1),(153,'8eu8blv3gbaoh60u9j4odj44h0','2017-03-31 20:48:13','2017-03-31 20:48:14',0,1),(154,'sg8n9s9eh7bv50b3qsj7d55302','2017-03-31 20:48:15','2017-03-31 20:48:15',0,1),(155,'qmrebbvt5g994sg0030ljhdfg3','2017-03-31 20:48:16','2017-03-31 20:48:17',0,1),(156,'bv9j4q2cvprrsat40iijcffg84','2017-03-31 20:48:18','2017-03-31 20:48:19',0,1),(157,'pso4ggfg8i8mshnbmdof0boe75','2017-03-31 20:48:20','2017-03-31 20:48:20',0,1),(158,'vb15baqp3vtmmiddukvckc4267','2017-03-31 20:48:21','2017-03-31 20:48:22',0,1),(159,'2errukv9iutseqfhmg235rb693','2017-03-31 20:48:23','2017-03-31 20:48:24',0,1),(160,'9lbg88h4sluq5vb548ossiidq6','2017-03-31 20:48:25','2017-03-31 20:48:25',0,1),(161,'gpecoaee7a6411sg8d7dbho671','2017-03-31 20:48:27','2017-03-31 20:48:27',0,1),(162,'o33nfnk2phc5eghabraof19ik4','2017-03-31 20:48:28','2017-03-31 20:48:29',0,1),(163,'2k1c273v3kt28evd1dfv6oj8m3','2017-03-31 20:48:31','2017-03-31 20:48:31',0,1),(164,'1limbpcfr2id5d0gqae2tqk416','2017-03-31 20:48:32','2017-03-31 20:48:33',0,1),(165,'0oqo8n1iin3var8nmeb7u19qo1','2017-03-31 20:48:34','2017-03-31 20:48:34',0,1),(166,'hebpl2d4dfpv2css0al766dvp4','2017-03-31 20:48:36','2017-03-31 20:48:36',0,1),(167,'gcnq2i1i0o5kkpnljfa5kut175','2017-03-31 20:48:37','2017-03-31 20:48:38',0,1),(168,'r4f9dbvmvmt0hrdu08kn10k2s3','2017-03-31 20:48:39','2017-03-31 20:48:40',0,1),(169,'bq1ea7vut1kfhrke7dnlme0pc6','2017-03-31 20:48:41','2017-03-31 20:48:41',0,1),(170,'ntfqvla45rs12arsshqkq5geq0','2017-03-31 20:48:43','2017-03-31 20:48:43',0,1),(171,'agp2asdio8n2n5rvcl9geag4m5','2017-03-31 20:48:44','2017-03-31 20:48:45',0,1),(172,'30o3jfgu8bs818fdgm7rnhu3f4','2017-03-31 20:48:46','2017-03-31 20:48:46',0,1),(173,'gcefmeng5j9ol09ms7lds82jk7','2017-03-31 20:48:48','2017-03-31 20:48:48',0,1),(174,'s32ngq8gdegdrf405f7j99n9f1','2017-03-31 20:48:49','2017-03-31 20:48:50',0,1),(175,'um0i78cqus031636hvpohi8mc1','2017-03-31 20:48:52','2017-03-31 20:48:52',0,1),(176,'tll38dp92r6784fj6i822tcc30','2017-03-31 20:48:53','2017-03-31 20:48:54',0,1),(177,'0ehcge2vl3k5a9nfcrl0m24kp3','2017-03-31 20:48:55','2017-03-31 20:48:55',0,1),(178,'h52mqi1s0o20poet2o1j5s4jv5','2017-03-31 20:48:57','2017-03-31 20:48:57',0,1),(179,'rhbmtv3bp8eo9pjdoeaj0e2ju4','2017-03-31 20:48:58','2017-03-31 20:48:59',0,1),(180,'4t5f1fc2vgj4i1k186k9kld1e3','2017-03-31 20:49:00','2017-03-31 20:49:00',0,1),(181,'sqt8o8er513teip1ndtfgrvoo4','2017-03-31 20:49:02','2017-03-31 20:49:02',0,1),(182,'81cfic1qgjkhuj2n6e6buccmc0','2017-03-31 20:49:04','2017-03-31 20:49:04',0,1),(183,'b6rl4kqi1usajcn09e7si57is7','2017-03-31 20:49:05','2017-03-31 20:49:06',0,1),(184,'c6l1reuhf9bcskitdr5o19d726','2017-03-31 20:49:07','2017-03-31 20:49:07',0,1),(185,'cqaj9f907a9elkar2bojfhrpq4','2017-03-31 20:49:08','2017-03-31 20:49:09',0,1),(186,'l3ifc8rjhmg0v4398jea3iiru1','2017-03-31 20:49:10','2017-03-31 20:49:11',0,1),(187,'sianlhlo7p4tkol4hm833iv1o1','2017-03-31 20:49:12','2017-03-31 20:49:12',0,1),(188,'4d67rkrcn8vnjcql41gq32i863','2017-03-31 20:49:14','2017-03-31 20:49:14',0,1),(189,'psnsf1355n357h24pssco0a5j2','2017-03-31 20:49:18','2017-03-31 20:49:19',0,1),(190,'mbk1tg5m3geaecjntn00hhmek1','2017-03-31 20:49:21','2017-03-31 20:49:21',0,1),(191,'a9mn7b0rog265frv18f7hirat6','2017-03-31 20:49:22','2017-03-31 20:49:23',0,1),(192,'j3egl5p2amer7oqq31h45i3fb5','2017-03-31 20:49:24','2017-03-31 20:49:25',0,1),(193,'kskur7ec3gc11t6s28377av1h6','2017-03-31 20:49:26','2017-03-31 20:49:26',0,1),(194,'qirsn0485qe8j3an8resadkkb5','2017-03-31 20:49:27','2017-03-31 20:49:28',0,1),(195,'fu95s4nepd07g03h6ul61pofn2','2017-03-31 20:49:29','2017-03-31 20:49:29',0,1),(196,'08rlslnav3erjk66qppdtbde81','2017-03-31 20:49:31','2017-03-31 20:49:31',0,1),(197,'83g9cnc3oh62otrd69ig7k15g2','2017-03-31 20:49:32','2017-03-31 20:49:33',0,1),(198,'kc596dgnv1f2afrebsls1e2lm0','2017-03-31 20:49:34','2017-03-31 20:49:34',0,1),(199,'kbbuben2dgflug4t4mbf789i36','2017-03-31 20:49:36','2017-03-31 20:49:36',0,1),(200,'crs855lkvklmn0a8p84mfnmuq4','2017-03-31 20:49:37','2017-03-31 20:49:38',0,1),(201,'71uafglp1j805k6d9n83phbb00','2017-03-31 20:49:39','2017-03-31 20:49:40',0,1),(202,'69t2hg9monbrq3epgebe8pbgq5','2017-03-31 20:49:41','2017-03-31 20:49:41',0,1),(203,'bldf5f707pg144cnb57rvpv635','2017-03-31 20:49:42','2017-03-31 20:49:43',0,1),(204,'fq1hepd583ecvll2e1dddu1r37','2017-03-31 20:49:44','2017-03-31 20:49:45',0,1),(205,'2gov9la10nvdoe1i87j950pk83','2017-03-31 20:49:47','2017-03-31 20:49:47',0,1),(206,'lkn6qjf62bhj6lge8lal5h5ln2','2017-03-31 20:49:48','2017-03-31 20:49:49',0,1),(207,'6rom0t00lukp85frdulnsh1r33','2017-03-31 20:49:51','2017-03-31 20:49:52',0,1),(208,'9cds07fugm5519au9lkockbsr6','2017-03-31 20:49:53','2017-03-31 20:49:53',0,1),(209,'0halhn58bd9mj2u985oj70dkm6','2017-03-31 20:49:54','2017-03-31 20:49:55',0,1),(210,'a77ub7eo5tlidjmd0tjl1outp1','2017-03-31 20:49:56','2017-03-31 20:49:56',0,1),(211,'gu7fdmssmllmgd6ca3eag58s87','2017-03-31 20:49:58','2017-03-31 20:49:58',0,1),(212,'om86ubeg8ds8j60l5hkhm66cp6','2017-03-31 20:49:59','2017-03-31 20:50:00',0,1),(213,'gq69i04u0n4p74s2socea1nm24','2017-03-31 20:50:01','2017-03-31 20:50:02',0,1),(214,'rdf8tvks6353m4hjtskdihhhd1','2017-03-31 20:50:03','2017-03-31 20:50:04',0,1),(215,'aqfcquimnr3djdo7vce6bepfl4','2017-03-31 20:50:05','2017-03-31 20:50:05',0,1),(216,'fci0sr495004rq217vt5a1llj3','2017-03-31 20:50:07','2017-03-31 20:50:07',0,1),(217,'74a2jbsr463j2icrfr0gm7nj43','2017-03-31 20:50:08','2017-03-31 20:50:09',0,1),(218,'cq4cbju2tf6asouc9hjecqnh67','2017-03-31 20:50:10','2017-03-31 20:50:11',0,1),(219,'dtdhv063bo7sqqm690i3egh9p0','2017-03-31 20:50:12','2017-03-31 20:50:12',0,1),(220,'6e7spduv7mrmq2l1v4n90ad5a1','2017-03-31 20:50:14','2017-03-31 20:50:14',0,1),(221,'5koldj5dfso1ms3kh01c7t0216','2017-03-31 20:50:16','2017-03-31 20:50:16',0,1),(222,'58qak1mmulflnsal3ogh5skmp4','2017-03-31 20:50:17','2017-03-31 20:50:18',0,1),(223,'s4hggidc8efh4p808ajf6eosf7','2017-03-31 21:41:44','2017-03-31 21:41:44',0,1),(224,'l6d9lg3bh33m7c8negeunjiar0','2017-03-31 21:58:00','2017-03-31 21:58:01',0,1),(225,'5pvo784qhk94cqu5h06eogddr4','2017-03-31 21:58:01','2017-03-31 21:58:02',0,1),(226,'0c6tffff1l9k4aib9q4bbpmdd2','2017-03-31 21:58:02','2017-03-31 21:58:03',0,1),(227,'rnvn68v05kbjc0emrrqfvc8ht0','2017-03-31 21:58:04','2017-03-31 21:58:04',0,1),(228,'hvgpln8ms9eh5kk4r6pf2jk5n0','2017-03-31 22:05:49','2017-03-31 22:05:50',0,1),(229,'v6ps5nllu3j2gpvltl1e32jc25','2017-04-01 03:49:19','2017-04-01 03:49:20',0,1),(230,'jtkrnvr6v7gd7hacn7hp1p4n33','2017-04-01 03:49:21','2017-04-01 03:49:22',0,1),(231,'9rk2632brimoqv4qb4vr19ceb7','2017-04-01 03:49:23','2017-04-01 03:49:23',0,1),(232,'lmn1tq1rf814uojel70s24k467','2017-04-01 03:51:05','2017-04-01 03:51:05',0,1),(233,'bfhpbaeigts3cl8k1kep0ctpa7','2017-04-01 03:51:07','2017-04-01 03:51:07',0,1),(234,'1jhuoccl0k9ud1fi5asjiirt73','2017-04-01 03:51:09','2017-04-01 03:51:09',0,1),(235,'9cn3koo3mo5qe556tdrdoe2rn0','2017-04-01 03:51:11','2017-04-01 03:51:11',0,1),(236,'55fgvuatvvqcenm5l6tko7nnt7','2017-04-01 06:29:11','2017-04-01 06:29:11',0,1),(237,'csqtcr0dqrlvs8a856k9f8tol6','2017-04-01 08:06:16','2017-04-01 08:06:17',0,1),(238,'f9m9frak07ijp3fc4qb3qjh300','2017-04-01 08:51:04','2017-04-01 08:51:57',0,1),(239,'ju2kos64u79bgln4l6i5shd0d1','2017-04-01 09:00:06','2017-04-01 09:00:07',0,1),(240,'pvairaq9gnosns3683rb089as2','2017-04-01 11:03:44','2017-04-01 11:03:44',0,1),(241,'1mlkv7psnopgfqn3q6lpdqf403','2017-04-01 12:23:59','2017-04-01 12:24:00',0,1),(242,'ekua0hj7qc7odsrekqsac87vt2','2017-04-01 15:10:50','2017-04-01 15:10:51',0,1),(243,'c3feeqgv0br583n53h7p22quj0','2017-04-01 16:02:26','2017-04-01 16:02:27',0,1),(244,'ope3k4hmb13a2bbhm8qgncitp1','2017-04-01 16:17:18','2017-04-01 16:17:18',0,1),(245,'0ocq9k8dkj2rp7b1405nuti0p5','2017-04-01 17:13:39','2017-04-01 17:13:40',0,1),(246,'qaheae77choi00hhr4nn0c4kk6','2017-04-01 20:03:30','2017-04-01 20:03:31',0,1),(247,'g9v7hq63qhgg00frmmp64hk9c6','2017-04-01 22:00:52','2017-04-01 22:00:52',0,1),(248,'dcrnuq7m0jj7gkllah9rg08km3','2017-04-03 09:09:24','2017-04-03 09:09:28',0,1),(249,'ng6av0put8hcfbhsne76bf58e0','2017-04-03 10:15:57','2017-04-03 10:34:11',0,1),(250,'5psnr5o81pdlc4qd4k4qj6svf1','2017-04-03 10:17:28','2017-04-03 10:17:29',0,1),(251,'9r5j6bhqv7kubu6r2j2tl6fna5','2017-04-03 11:07:13','2017-04-03 11:12:10',0,1),(252,'chc52gu6rr44almfo1rqsngjl2','2017-04-03 11:08:59','2017-04-03 11:12:33',0,1),(253,'7385591pn1sda57fo9c54r92o0','2017-04-03 11:09:35','2017-04-03 11:09:36',0,1),(254,'4q5li237uluj5u4tlnlebo6421','2017-04-03 11:09:46','2017-04-03 12:09:56',0,2),(255,'17i6e47cju7gd7ik7eqhsvjvu0','2017-04-03 11:11:51','2017-04-03 11:11:52',0,1),(256,'vp0k5im337ujn2ddrs1a3k9vj1','2017-04-03 11:12:29','2017-04-03 11:12:29',0,1),(257,'eb91aq6kub9lk1vhpkfptm9ko5','2017-04-03 11:12:31','2017-04-03 11:12:32',0,1),(258,'h8vnk1l1nqlcfef1vjt5tgl5o1','2017-04-03 11:12:31','2017-04-03 11:12:32',0,1),(259,'1av2ae29gk8i2n87pu8o44s7n6','2017-04-03 11:12:32','2017-04-03 11:12:33',0,1),(260,'c83i1h88kh6c77qmnk93246qe5','2017-04-03 11:12:32','2017-04-03 11:12:33',0,1),(261,'t0emhj2fbhcire85j5pqhc7tt5','2017-04-03 11:14:08','2017-04-03 12:40:02',0,2),(262,'abq1tn6f7boqb1h0caqoap4f57','2017-04-03 12:27:56','2017-04-03 12:28:07',0,1),(263,'4051ns2rhsd6hpmod23q7m5p45','2017-04-03 13:31:44','2017-04-03 14:59:34',0,2),(264,'6t50t6h2juhnh6vgvlgehnh311','2017-04-03 14:21:41','2017-04-03 14:21:41',0,2),(265,'immlbldfom82a08bgbvnjcnc55','2017-04-03 14:29:51','2017-04-03 14:29:52',0,1),(266,'2r6sdvmp45kkoe70ar05dqfcs5','2017-04-03 14:36:57','2017-04-03 14:36:57',0,1),(267,'lloonst7njo8eovkgusbf738b1','2017-04-03 15:24:50','2017-04-03 15:27:24',0,2),(268,'gfr9sunb9fe7p5oakvca124hu6','2017-04-03 16:50:39','2017-04-03 16:50:40',0,1),(269,'srhlpg0g673pgt64uhijd8f7v1','2017-04-03 15:03:26','2017-04-03 17:04:01',0,2),(270,'0ostlkgna6labt35dv58o9mli7','2017-04-03 19:57:07','2017-04-03 19:57:09',0,2),(271,'eb380ed7f43041bdbefaa939cd03b01b','2017-04-05 04:51:09','2017-04-05 12:16:54',0,1),(272,'de127e4fbdcf274034805eae93d75bdd','2017-04-05 12:28:50','2017-04-05 12:47:30',0,1),(273,'avvbmp5hbsk7o88asf1t04u1n0','2017-04-05 15:44:23','2017-04-05 18:09:48',0,2),(274,'gklpaamd61miedsslhm4nmgdr2','2017-04-05 18:09:48','2017-04-05 22:01:31',0,2);
/*!40000 ALTER TABLE `magev1_log_visitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_log_visitor_info`
--

DROP TABLE IF EXISTS `magev1_log_visitor_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_log_visitor_info` (
  `visitor_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Visitor ID',
  `http_referer` varchar(255) DEFAULT NULL COMMENT 'HTTP Referrer',
  `http_user_agent` varchar(255) DEFAULT NULL COMMENT 'HTTP User-Agent',
  `http_accept_charset` varchar(255) DEFAULT NULL COMMENT 'HTTP Accept-Charset',
  `http_accept_language` varchar(255) DEFAULT NULL COMMENT 'HTTP Accept-Language',
  `server_addr` varbinary(16) DEFAULT NULL,
  `remote_addr` varbinary(16) DEFAULT NULL,
  PRIMARY KEY (`visitor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log Visitor Info Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_log_visitor_info`
--

LOCK TABLES `magev1_log_visitor_info` WRITE;
/*!40000 ALTER TABLE `magev1_log_visitor_info` DISABLE KEYS */;
INSERT INTO `magev1_log_visitor_info` VALUES (1,'http://5.44.25.153/index.php/install/wizard/end/','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:52.0) Gecko/20100101 Firefox/52.0',NULL,'en-US,en;q=0.5',',™','V\Ç\Ã_'),(2,NULL,'Wget(linux)',NULL,NULL,',™','³\Ú\ìo'),(3,NULL,'Wget(linux)',NULL,NULL,',™','³\Ú\ìo'),(4,NULL,'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)',NULL,NULL,',™','u(i‡'),(5,NULL,'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)',NULL,NULL,',™','u(i‡'),(6,NULL,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:52.0) Gecko/20100101 Firefox/52.0',NULL,'en-US,en;q=0.5',',™','m\Þò«'),(7,'http://5.44.25.153/','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:52.0) Gecko/20100101 Firefox/52.0',NULL,'en-US,en;q=0.5',',™','m\Þò«'),(8,'http://5.44.25.153/customer/account/login/','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:52.0) Gecko/20100101 Firefox/52.0',NULL,'en-US,en;q=0.5',',™','m\Þò«'),(9,NULL,'Mozilla/5.0 zgrab/0.x',NULL,NULL,',™','Á?:S'),(10,NULL,NULL,NULL,NULL,',™','¹uH,'),(11,NULL,'Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04',NULL,NULL,',™','[ß…\Z'),(12,NULL,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:52.0) Gecko/20100101 Firefox/52.0',NULL,'en-US,en;q=0.5',',™','m\Þò«'),(13,NULL,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:52.0) Gecko/20100101 Firefox/52.0',NULL,'en-US,en;q=0.5',',™','m\Þò«'),(14,'http://5.44.25.153/geek.html','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:52.0) Gecko/20100101 Firefox/52.0',NULL,'en-US,en;q=0.5',',™','m\Þò«'),(15,NULL,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:52.0) Gecko/20100101 Firefox/52.0',NULL,'en-US,en;q=0.5',',™','m\Þò«'),(16,NULL,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:52.0) Gecko/20100101 Firefox/52.0',NULL,'en-US,en;q=0.5','S\Þù\è','m\Þò«'),(17,NULL,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:52.0) Gecko/20100101 Firefox/52.0',NULL,'en-US,en;q=0.5','S\Þù\è','m\Þò«'),(18,NULL,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:52.0) Gecko/20100101 Firefox/52.0',NULL,'en-US,en;q=0.5','S\Þù\è','m\Þò«'),(19,'http://83.222.249.232/towels.html','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:52.0) Gecko/20100101 Firefox/52.0',NULL,'en-US,en;q=0.5','S\Þù\è','m\Þò«'),(20,'http://83.222.249.232/towels.html','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:52.0) Gecko/20100101 Firefox/52.0',NULL,'en-US,en;q=0.5','S\Þù\è','m\Þò«'),(21,NULL,'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36',NULL,NULL,'S\Þù\è','‹¢l5'),(22,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'S\Þù\è','‚\ÓEl'),(23,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'S\Þù\è','‚\ÓEl'),(24,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'S\Þù\è','‚\ÓEl'),(25,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'S\Þù\è','‚\ÓEl'),(26,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'S\Þù\è','~yòJ'),(27,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'S\Þù\è','~yòJ'),(28,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'S\Þù\è','~yòJ'),(29,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'S\Þù\è','~yòJ'),(30,NULL,'libwww-perl/6.24',NULL,NULL,'S\Þù\è','­\Ô\Ü'),(31,NULL,'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)',NULL,NULL,'S\Þù\è','Þº:®'),(32,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'S\Þù\è','\Â\Ðü'),(33,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'S\Þù\è','\Â\Ðü'),(34,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'S\Þù\è','\Â\Ðü'),(35,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'S\Þù\è','\Â\Ðü'),(36,NULL,'Mozilla/5.0 (Windows NT 6.1; rv:9.0.1) Gecko/20100101 Firefox/12.0.1',NULL,'en-US;q=0.6,en;q=0.4','S\Þù\è','hÀ\"'),(37,NULL,'PycURL/7.19.5 libcurl/7.38.0 GnuTLS/3.3.8 zlib/1.2.8 libidn/1.29 libssh2/1.4.3 librtmp/2.3',NULL,NULL,'S\Þù\è','Ì˜\Ú1'),(38,NULL,'Wget/1.15 (linux-gnu)',NULL,NULL,'S\Þù\è','¼~N'),(39,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'S\Þù\è','\Ø®'),(40,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'S\Þù\è','\Ø®'),(41,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'S\Þù\è','\Ø®'),(42,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'S\Þù\è','\Ø®'),(43,NULL,NULL,NULL,NULL,'S\Þù\è','²\Óò£'),(44,NULL,'python-requests/2.13.0',NULL,NULL,'S\Þù\è','£¬i¡'),(45,NULL,'Scanbot',NULL,NULL,'S\Þù\è','¹n„\ç'),(46,NULL,'curl/7.19.7 (x86_64-redhat-linux-gnu) libcurl/7.19.7 NSS/3.21 Basic ECC zlib/1.2.3 libidn/1.18 libssh2/1.4.2',NULL,NULL,'S\Þù\è','ÃšÖ¢'),(47,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'S\Þù\è','»øt'),(48,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'S\Þù\è','»øt'),(49,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'S\Þù\è','»øt'),(50,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'S\Þù\è','»øt'),(51,NULL,'libwww-perl/6.24',NULL,NULL,'S\Þù\è','­\Ô\Ü'),(52,NULL,'Wget(linux)',NULL,NULL,'S\Þù\è','³Û´'),(53,NULL,'libwww-perl/6.19',NULL,NULL,'S\Þù\è','PRN¼'),(54,NULL,NULL,NULL,NULL,'S\Þù\è','4(\ãb'),(55,NULL,'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)',NULL,NULL,'S\Þù\è','oI.Z'),(56,NULL,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:52.0) Gecko/20100101 Firefox/52.0',NULL,'en-US,en;q=0.5','.r','m\Þò«'),(57,NULL,'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)',NULL,NULL,'.r','\Ï.\rö'),(58,NULL,'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36',NULL,NULL,'.r','‹¢rF'),(59,NULL,'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36',NULL,NULL,'.r','\ÆEJ'),(60,NULL,'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)',NULL,NULL,'.r','\Ï.\r\à'),(61,NULL,NULL,NULL,NULL,'.r','Uqdù'),(62,NULL,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:52.0) Gecko/20100101 Firefox/52.0',NULL,'en-US,en;q=0.5',',t','m\Þò«'),(63,NULL,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:52.0) Gecko/20100101 Firefox/52.0',NULL,'en-US,en;q=0.5',',t','m\Þò«'),(64,NULL,'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)',NULL,NULL,',t','s\ç\Þi'),(65,'http://5.44.25.116/url_test','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:52.0) Gecko/20100101 Firefox/52.0',NULL,'en-US,en;q=0.5',',t','m\Þò«'),(66,NULL,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:52.0) Gecko/20100101 Firefox/52.0',NULL,'en-US,en;q=0.5','.r&','Z&¯½'),(67,NULL,'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)',NULL,NULL,'.r&','4¥'),(68,'http://46.20.114.38/towels/bedding.html','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:52.0) Gecko/20100101 Firefox/52.0',NULL,'en-US,en;q=0.5','.r&','Z&¯½'),(69,'http://46.20.114.38/towels/au-lit-luxe-towel.html','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:52.0) Gecko/20100101 Firefox/52.0',NULL,'en-US,en;q=0.5','.r&','Z&¯½'),(70,NULL,'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)',NULL,NULL,'.r&','{ùOñ'),(71,NULL,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:52.0) Gecko/20100101 Firefox/52.0',NULL,'en-US,en;q=0.5','.r&','Z&¯½'),(72,NULL,'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36',NULL,NULL,'.r&','‹¢rF'),(73,NULL,'the beast',NULL,NULL,'.r&','gD\ß\Ò'),(74,NULL,'the beast',NULL,NULL,'.r&','gD\ß\Ò'),(75,NULL,'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.101 Safari/537.36',NULL,NULL,'.r&','nZ_£'),(76,NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36',NULL,NULL,'.r&','6\Ú@'),(77,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','r Î¢'),(78,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','r Î¢'),(79,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','r Î¢'),(80,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','r Î¢'),(81,NULL,'Mozilla/5.0',NULL,NULL,'.r&','· \å'),(82,NULL,'Mozilla/5.0',NULL,NULL,'.r&','· \å'),(83,NULL,'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.101 Safari/537.36',NULL,NULL,'.r&','nZ_£'),(84,NULL,'Mozilla/5.0',NULL,NULL,'.r&','· \å'),(85,NULL,'Mozilla/5.0',NULL,NULL,'.r&','· \å'),(86,NULL,'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)',NULL,NULL,'.r&','4¥'),(87,NULL,NULL,NULL,NULL,'.r&','¿`ùa'),(88,NULL,'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.101 Safari/537.36',NULL,NULL,'.r&','nZ_£'),(89,NULL,'Scanbot',NULL,NULL,'.r&','¹n„\è'),(90,NULL,'Mozilla/5.0',NULL,NULL,'.r&','‹¢|§'),(91,NULL,'Mozilla/5.0',NULL,NULL,'.r&','· \å'),(92,NULL,'Mozilla/5.0',NULL,NULL,'.r&','· \å'),(93,NULL,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:52.0) Gecko/20100101 Firefox/52.0',NULL,'en-US,en;q=0.5','.r&','Z&¯½'),(94,'http://httpheader.net/','Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.28) Gecko/20120306 Firefox/3.6.28 (.NET CLR 3.5.30729)','ISO-8859-1,utf-8;q=0.7,*;q=0.7','en-gb,en;q=0.5','.r&','/\Ë_A'),(95,'http://46.20.114.38/','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:52.0) Gecko/20100101 Firefox/52.0',NULL,'en-US,en;q=0.5','.r&','Z&¯½'),(96,'http://46.20.114.38','Mozilla/4.0 (compatible; MSIE 9.0; Windows NT 6.1)',NULL,'zh-cn','.r&','Þº\Ô'),(97,NULL,NULL,NULL,NULL,'.r&','¿`ùa'),(98,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','”`<'),(99,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','”`<'),(100,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','”`<'),(101,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','”`<'),(102,NULL,NULL,NULL,NULL,'.r&','PR@\á'),(103,NULL,'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/30.0.1599.101 Safari/537.36',NULL,NULL,'.r&','nZ_£'),(104,NULL,NULL,NULL,NULL,'.r&','Y£ò '),(105,NULL,NULL,NULL,NULL,'.r&','¹d¨Œ'),(106,NULL,NULL,NULL,NULL,'.r&','¹d¨Œ'),(107,NULL,'Python-urllib/3.5',NULL,NULL,'.r&','Wj‹'),(108,NULL,'curl/7.29.0',NULL,NULL,'.r&','£¬c.'),(109,NULL,'Mozilla/5.0',NULL,NULL,'.r&','<¿&N'),(110,NULL,'Mozilla/5.0',NULL,NULL,'.r&','<¿&N'),(111,NULL,'Mozilla/5.0',NULL,NULL,'.r&','<¿&N'),(112,NULL,'Mozilla/5.0',NULL,NULL,'.r&','<¿&N'),(113,'http://46.20.114.38/towels/towels.html','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:52.0) Gecko/20100101 Firefox/52.0',NULL,'en-US,en;q=0.5','.r&','Z&¯½'),(114,NULL,'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)',NULL,NULL,'.r&','E¥@ú'),(115,'http://46.20.114.38:80','Mozilla/4.0 (compatible; MSIE 9.0; Windows NT 6.1)',NULL,'zh-cn','.r&','s\Ìz8'),(116,NULL,'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36',NULL,NULL,'.r&','‹¢rF'),(117,NULL,NULL,NULL,NULL,'.r&','[\ÒhG'),(118,NULL,NULL,NULL,NULL,'.r&','Y£ò '),(119,NULL,NULL,NULL,NULL,'.r&','Y£ò '),(120,NULL,'Scanbot',NULL,NULL,'.r&','¹n„\è'),(121,NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36',NULL,NULL,'.r&','6ñ¼'),(122,NULL,NULL,NULL,NULL,'.r&','¿`ùa'),(123,'http://46.20.114.38/','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:52.0) Gecko/20100101 Firefox/52.0',NULL,'en-US,en;q=0.5','.r&','Z&¯½'),(124,'http://46.20.114.38:80/index.action','Mozilla/4.0 (compatible; MSIE 9.0; Windows NT 6.1)',NULL,'zh-cn','.r&','·>ü'),(125,'http://46.20.114.38:80/index.action','Mozilla/4.0 (compatible; MSIE 9.0; Windows NT 6.1)',NULL,'zh-cn','.r&','·>ü'),(126,'http://46.20.114.38:80/index.action','Mozilla/4.0 (compatible; MSIE 9.0; Windows NT 6.1)',NULL,'zh-cn','.r&','·>ü'),(127,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','hƒ£p'),(128,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','hƒ£p'),(129,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','hƒ£p'),(130,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','hƒ£p'),(131,NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:47.0) Gecko/20100101 Firefox/47.0',NULL,'zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3','.r&','· \å'),(132,'http://46.20.114.38/','Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:52.0) Gecko/20100101 Firefox/52.0',NULL,'en-US,en;q=0.5','.r&','Z&¯½'),(133,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','û1	'),(134,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','û1	'),(135,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','û1	'),(136,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','û1	'),(137,NULL,'gSOAP/2.8',NULL,NULL,'.r&','· \å'),(138,NULL,'gSOAP/2.8',NULL,NULL,'.r&','· \å'),(139,NULL,'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0)',NULL,NULL,'.r&','h”K'),(140,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(141,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(142,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(143,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(144,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(145,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(146,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(147,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(148,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(149,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(150,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(151,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(152,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(153,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(154,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(155,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(156,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(157,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(158,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(159,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(160,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(161,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(162,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(163,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(164,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(165,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(166,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(167,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(168,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(169,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(170,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(171,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(172,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(173,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(174,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(175,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(176,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(177,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(178,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(179,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(180,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(181,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(182,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(183,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(184,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(185,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(186,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(187,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(188,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(189,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(190,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(191,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(192,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(193,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(194,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(195,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(196,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(197,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(198,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(199,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(200,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(201,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(202,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(203,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(204,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(205,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(206,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(207,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(208,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(209,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(210,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(211,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(212,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(213,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(214,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(215,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(216,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(217,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(218,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(219,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(220,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(221,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(222,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','\ÚÍ©\Ã'),(223,NULL,NULL,NULL,NULL,'.r&','EvRn'),(224,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','ÛS\Þ'),(225,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','ÛS\Þ'),(226,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','ÛS\Þ'),(227,NULL,'Mozilla/5.0 Jorgee',NULL,NULL,'.r&','ÛS\Þ'),(228,NULL,'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36',NULL,NULL,'.r&','‹¢rF'),(229,'http://46.20.114.38:80/index.action','Mozilla/4.0 (compatible; MSIE 9.0; Windows NT 6.1)',NULL,'zh-cn','.r&','·>ü'),(230,'http://46.20.114.38:80/index.action','Mozilla/4.0 (compatible; MSIE 9.0; Windows NT 6.1)',NULL,'zh-cn','.r&','·>ü'),(231,'http://46.20.114.38:80/index.action','Mozilla/4.0 (compatible; MSIE 9.0; Windows NT 6.1)',NULL,'zh-cn','.r&','·>ü'),(232,NULL,'Wget(linux)',NULL,NULL,'.r&','³Úµ>'),(233,NULL,'Wget(linux)',NULL,NULL,'.r&','³Úµ>'),(234,NULL,'Wget(linux)',NULL,NULL,'.r&','³Úµ>'),(235,NULL,'Wget(linux)',NULL,NULL,'.r&','³Úµ>'),(236,NULL,'curl/7.29.0',NULL,NULL,'.r&','¹(©'),(237,'http://46.20.114.38','Mozilla/4.0 (compatible; MSIE 9.0; Windows NT 6.1)',NULL,'zh-cn','.r&','$\ë5\è'),(238,NULL,'Mozilla/5.0 (Windows NT 5.1; rv:9.0.1) Gecko/20100101 Firefox/9.0.1',NULL,'en-US;q=0.6,en;q=0.4','.r&','4\Í'),(239,NULL,'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:33.0) Gecko/20100101 Firefox/33.0',NULL,NULL,'.r&','/\\&l'),(240,NULL,'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0)',NULL,NULL,'.r&','h”Kd'),(241,NULL,'Python-urllib/3.4',NULL,NULL,'.r&','NúT'),(242,NULL,'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)',NULL,NULL,'.r&','¶`Á '),(243,'http://46.20.114.38:80','Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Win64; x64; Trident/5.0)',NULL,'en-US,en;q=0.5','.r&','¶0i\Ò'),(244,NULL,'Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0)',NULL,NULL,'.r&','÷X#'),(245,NULL,'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.6) Gecko/20070725 Firefox/2.0.0.6',NULL,NULL,'.r&','PR@F'),(246,NULL,'WinInet',NULL,NULL,'.r&','Q\ÓbZ'),(247,NULL,'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)',NULL,NULL,'.r&','4£\"'),(248,NULL,'Wget(linux)',NULL,NULL,',\æ','º\ÌDo'),(249,NULL,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:51.0) Gecko/20100101 Firefox/51.0',NULL,'en-US,en;q=0.5',',\æ','Ÿ´ð®'),(250,NULL,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:51.0) Gecko/20100101 Firefox/51.0',NULL,'en-US,en;q=0.5',',\æ','Ÿ´ð®'),(251,NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36',NULL,'en-US,en;q=0.8,fr-FR;q=0.6,fr;q=0.4',',\æ','Ÿ´ð®'),(252,NULL,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:52.0) Gecko/20100101 Firefox/52.0',NULL,'en-US,en;q=0.5',',\æ','Ÿ´ð®'),(253,NULL,'facebookexternalhit/1.1',NULL,NULL,',\æ','\rbt'),(254,NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36',NULL,'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4',',\æ','Ÿ´ð®'),(255,NULL,'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)',NULL,NULL,',\æ','­üX”'),(256,NULL,'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)',NULL,NULL,',\æ','­ü|y'),(257,NULL,'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)',NULL,NULL,',\æ','\rq¬'),(258,NULL,'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)',NULL,NULL,',\æ','E«\æn'),(259,NULL,'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)',NULL,NULL,',\æ','E«\æq'),(260,NULL,'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)',NULL,NULL,',\æ','­üZf'),(261,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36',NULL,'fr,fr-FR;q=0.8,en;q=0.6',',\æ','Ÿ´ð®'),(262,NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.98 Safari/537.36',NULL,'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4,it;q=0.2,de;q=0.2',',\æ','Ÿ´ð®'),(263,NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36',NULL,'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4',',\æ','Ÿ´ð®'),(264,NULL,'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36',NULL,'fr,fr-FR;q=0.8,en;q=0.6',',\æ','Ÿ´ð®'),(265,NULL,'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36',NULL,NULL,',\æ','‹¢l5'),(266,NULL,'curl/7.17.1 (mips-unknown-linux-gnu) libcurl/7.17.1 OpenSSL/0.9.8i zlib/1.2.3',NULL,NULL,',\æ','X‡³3'),(267,NULL,'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:51.0) Gecko/20100101 Firefox/51.0',NULL,'en-US,en;q=0.5',',\æ','Ÿ´ð®'),(268,NULL,'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36',NULL,'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4',',\æ','V\Æ\Ó'),(269,NULL,'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36',NULL,'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4','','\0\0'),(270,NULL,'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36',NULL,'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4','','\0\0'),(271,NULL,'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36',NULL,'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4','','\0\0'),(272,NULL,'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36',NULL,'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0','\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(273,NULL,'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36',NULL,'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4','','\0\0'),(274,'http://localhost:1112/','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.110 Safari/537.36',NULL,'fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4','','\0\0');
/*!40000 ALTER TABLE `magev1_log_visitor_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_log_visitor_online`
--

DROP TABLE IF EXISTS `magev1_log_visitor_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_log_visitor_online` (
  `visitor_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Visitor ID',
  `visitor_type` varchar(1) NOT NULL COMMENT 'Visitor Type',
  `remote_addr` varbinary(16) DEFAULT NULL,
  `first_visit_at` timestamp NULL DEFAULT NULL COMMENT 'First Visit Time',
  `last_visit_at` timestamp NULL DEFAULT NULL COMMENT 'Last Visit Time',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer ID',
  `last_url` varchar(255) DEFAULT NULL COMMENT 'Last URL',
  PRIMARY KEY (`visitor_id`),
  KEY `IDX_MAGEV1_LOG_VISITOR_ONLINE_VISITOR_TYPE` (`visitor_type`),
  KEY `IDX_MAGEV1_LOG_VISITOR_ONLINE_FIRST_VISIT_AT_LAST_VISIT_AT` (`first_visit_at`,`last_visit_at`),
  KEY `IDX_MAGEV1_LOG_VISITOR_ONLINE_CUSTOMER_ID` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Log Visitor Online Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_log_visitor_online`
--

LOCK TABLES `magev1_log_visitor_online` WRITE;
/*!40000 ALTER TABLE `magev1_log_visitor_online` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_log_visitor_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_newsletter_problem`
--

DROP TABLE IF EXISTS `magev1_newsletter_problem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_newsletter_problem` (
  `problem_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Problem Id',
  `subscriber_id` int(10) unsigned DEFAULT NULL COMMENT 'Subscriber Id',
  `queue_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Queue Id',
  `problem_error_code` int(10) unsigned DEFAULT '0' COMMENT 'Problem Error Code',
  `problem_error_text` varchar(200) DEFAULT NULL COMMENT 'Problem Error Text',
  PRIMARY KEY (`problem_id`),
  KEY `IDX_MAGEV1_NEWSLETTER_PROBLEM_SUBSCRIBER_ID` (`subscriber_id`),
  KEY `IDX_MAGEV1_NEWSLETTER_PROBLEM_QUEUE_ID` (`queue_id`),
  CONSTRAINT `FK_833DF3B980CEFE75DB0CBC892BC2FB95` FOREIGN KEY (`subscriber_id`) REFERENCES `magev1_newsletter_subscriber` (`subscriber_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_NLTTR_PROBLEM_QUEUE_ID_MAGEV1_NLTTR_QUEUE_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `magev1_newsletter_queue` (`queue_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Problems';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_newsletter_problem`
--

LOCK TABLES `magev1_newsletter_problem` WRITE;
/*!40000 ALTER TABLE `magev1_newsletter_problem` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_newsletter_problem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_newsletter_queue`
--

DROP TABLE IF EXISTS `magev1_newsletter_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_newsletter_queue` (
  `queue_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Queue Id',
  `template_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Template Id',
  `newsletter_type` int(11) DEFAULT NULL COMMENT 'Newsletter Type',
  `newsletter_text` text COMMENT 'Newsletter Text',
  `newsletter_styles` text COMMENT 'Newsletter Styles',
  `newsletter_subject` varchar(200) DEFAULT NULL COMMENT 'Newsletter Subject',
  `newsletter_sender_name` varchar(200) DEFAULT NULL COMMENT 'Newsletter Sender Name',
  `newsletter_sender_email` varchar(200) DEFAULT NULL COMMENT 'Newsletter Sender Email',
  `queue_status` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Queue Status',
  `queue_start_at` timestamp NULL DEFAULT NULL COMMENT 'Queue Start At',
  `queue_finish_at` timestamp NULL DEFAULT NULL COMMENT 'Queue Finish At',
  PRIMARY KEY (`queue_id`),
  KEY `IDX_MAGEV1_NEWSLETTER_QUEUE_TEMPLATE_ID` (`template_id`),
  CONSTRAINT `FK_687A5AB98DDAABAEBC85AE3CA99B287D` FOREIGN KEY (`template_id`) REFERENCES `magev1_newsletter_template` (`template_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Queue';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_newsletter_queue`
--

LOCK TABLES `magev1_newsletter_queue` WRITE;
/*!40000 ALTER TABLE `magev1_newsletter_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_newsletter_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_newsletter_queue_link`
--

DROP TABLE IF EXISTS `magev1_newsletter_queue_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_newsletter_queue_link` (
  `queue_link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Queue Link Id',
  `queue_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Queue Id',
  `subscriber_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Subscriber Id',
  `letter_sent_at` timestamp NULL DEFAULT NULL COMMENT 'Letter Sent At',
  PRIMARY KEY (`queue_link_id`),
  KEY `IDX_MAGEV1_NEWSLETTER_QUEUE_LINK_SUBSCRIBER_ID` (`subscriber_id`),
  KEY `IDX_MAGEV1_NEWSLETTER_QUEUE_LINK_QUEUE_ID` (`queue_id`),
  KEY `IDX_MAGEV1_NEWSLETTER_QUEUE_LINK_QUEUE_ID_LETTER_SENT_AT` (`queue_id`,`letter_sent_at`),
  CONSTRAINT `FK_13D7A3817B23500E90EA80D5BEDE4C94` FOREIGN KEY (`subscriber_id`) REFERENCES `magev1_newsletter_subscriber` (`subscriber_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_NLTTR_QUEUE_LNK_QUEUE_ID_MAGEV1_NLTTR_QUEUE_QUEUE_ID` FOREIGN KEY (`queue_id`) REFERENCES `magev1_newsletter_queue` (`queue_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Queue Link';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_newsletter_queue_link`
--

LOCK TABLES `magev1_newsletter_queue_link` WRITE;
/*!40000 ALTER TABLE `magev1_newsletter_queue_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_newsletter_queue_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_newsletter_queue_store_link`
--

DROP TABLE IF EXISTS `magev1_newsletter_queue_store_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_newsletter_queue_store_link` (
  `queue_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Queue Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  PRIMARY KEY (`queue_id`,`store_id`),
  KEY `IDX_MAGEV1_NEWSLETTER_QUEUE_STORE_LINK_STORE_ID` (`store_id`),
  CONSTRAINT `FK_AACD9C1480F0B031002AD4D68A67BB6E` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EFF85576768857692039282D36245E08` FOREIGN KEY (`queue_id`) REFERENCES `magev1_newsletter_queue` (`queue_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Queue Store Link';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_newsletter_queue_store_link`
--

LOCK TABLES `magev1_newsletter_queue_store_link` WRITE;
/*!40000 ALTER TABLE `magev1_newsletter_queue_store_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_newsletter_queue_store_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_newsletter_subscriber`
--

DROP TABLE IF EXISTS `magev1_newsletter_subscriber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_newsletter_subscriber` (
  `subscriber_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Subscriber Id',
  `store_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Store Id',
  `change_status_at` timestamp NULL DEFAULT NULL COMMENT 'Change Status At',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Id',
  `subscriber_email` varchar(150) DEFAULT NULL COMMENT 'Subscriber Email',
  `subscriber_status` int(11) NOT NULL DEFAULT '0' COMMENT 'Subscriber Status',
  `subscriber_confirm_code` varchar(32) DEFAULT 'NULL' COMMENT 'Subscriber Confirm Code',
  PRIMARY KEY (`subscriber_id`),
  KEY `IDX_MAGEV1_NEWSLETTER_SUBSCRIBER_CUSTOMER_ID` (`customer_id`),
  KEY `IDX_MAGEV1_NEWSLETTER_SUBSCRIBER_STORE_ID` (`store_id`),
  CONSTRAINT `FK_MAGEV1_NLTTR_SUBSCRIBER_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter Subscriber';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_newsletter_subscriber`
--

LOCK TABLES `magev1_newsletter_subscriber` WRITE;
/*!40000 ALTER TABLE `magev1_newsletter_subscriber` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_newsletter_subscriber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_newsletter_template`
--

DROP TABLE IF EXISTS `magev1_newsletter_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_newsletter_template` (
  `template_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Template Id',
  `template_code` varchar(150) DEFAULT NULL COMMENT 'Template Code',
  `template_text` text COMMENT 'Template Text',
  `template_text_preprocessed` text COMMENT 'Template Text Preprocessed',
  `template_styles` text COMMENT 'Template Styles',
  `template_type` int(10) unsigned DEFAULT NULL COMMENT 'Template Type',
  `template_subject` varchar(200) DEFAULT NULL COMMENT 'Template Subject',
  `template_sender_name` varchar(200) DEFAULT NULL COMMENT 'Template Sender Name',
  `template_sender_email` varchar(200) DEFAULT NULL COMMENT 'Template Sender Email',
  `template_actual` smallint(5) unsigned DEFAULT '1' COMMENT 'Template Actual',
  `added_at` timestamp NULL DEFAULT NULL COMMENT 'Added At',
  `modified_at` timestamp NULL DEFAULT NULL COMMENT 'Modified At',
  PRIMARY KEY (`template_id`),
  KEY `IDX_MAGEV1_NEWSLETTER_TEMPLATE_TEMPLATE_ACTUAL` (`template_actual`),
  KEY `IDX_MAGEV1_NEWSLETTER_TEMPLATE_ADDED_AT` (`added_at`),
  KEY `IDX_MAGEV1_NEWSLETTER_TEMPLATE_MODIFIED_AT` (`modified_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Newsletter Template';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_newsletter_template`
--

LOCK TABLES `magev1_newsletter_template` WRITE;
/*!40000 ALTER TABLE `magev1_newsletter_template` DISABLE KEYS */;
INSERT INTO `magev1_newsletter_template` VALUES (1,'Example Newsletter Template','{{template config_path=\"design/email/header\"}}\n{{inlinecss file=\"email-inline.css\"}}\n\n<table cellpadding=\"0\" cellspacing=\"0\" border=\"0\">\n<tr>\n    <td class=\"full\">\n        <table class=\"columns\">\n            <tr>\n                <td class=\"email-heading\">\n                    <h1>Welcome</h1>\n                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,\n                    sed do eiusmod tempor incididunt ut labore et.</p>\n                </td>\n                <td class=\"store-info\">\n                    <h4>Contact Us</h4>\n                    <p>\n                        {{depend store_phone}}\n                        <b>Call Us:</b>\n                        <a href=\"tel:{{var phone}}\">{{var store_phone}}</a><br>\n                        {{/depend}}\n                        {{depend store_hours}}\n                        <span class=\"no-link\">{{var store_hours}}</span><br>\n                        {{/depend}}\n                        {{depend store_email}}\n                        <b>Email:</b> <a href=\"mailto:{{var store_email}}\">{{var store_email}}</a>\n                        {{/depend}}\n                    </p>\n                </td>\n            </tr>\n        </table>\n    </td>\n</tr>\n<tr>\n    <td class=\"full\">\n        <table class=\"columns\">\n            <tr>\n                <td>\n                    <img width=\"600\" src=\"http://placehold.it/600x200\" class=\"main-image\">\n                </td>\n                <td class=\"expander\"></td>\n            </tr>\n        </table>\n        <table class=\"columns\">\n            <tr>\n                <td class=\"panel\">\n                    <p>Phasellus dictum sapien a neque luctus cursus. Pellentesque sem dolor, fringilla et pharetra\n                    vitae. <a href=\"#\">Click it! &raquo;</a></p>\n                </td>\n                <td class=\"expander\"></td>\n            </tr>\n        </table>\n    </td>\n</tr>\n<tr>\n    <td>\n        <table class=\"row\">\n            <tr>\n                <td class=\"half left wrapper\">\n                    <table class=\"columns\">\n                        <tr>\n                            <td>\n                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor\n                                incididunt ut labore et. Lorem ipsum dolor sit amet, consectetur adipisicing elit,\n                                sed do eiusmod tempor incididunt ut labore et. Lorem ipsum dolor sit amet.</p>\n                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor\n                                incididunt ut labore et. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed\n                                do eiusmod tempor incididunt ut labore et. Lorem ipsum dolor sit amet.</p>\n                                <table class=\"button\">\n                                    <tr>\n                                        <td>\n                                            <a href=\"#\">Click Me!</a>\n                                        </td>\n                                    </tr>\n                                </table>\n                            </td>\n                            <td class=\"expander\"></td>\n                        </tr>\n                    </table>\n                </td>\n                <td class=\"half right wrapper last\">\n                    <table class=\"columns\">\n                        <tr>\n                            <td class=\"panel sidebar-links\">\n                                <h6>Header Thing</h6>\n                                <p>Sub-head or something</p>\n                                <table>\n                                    <tr>\n                                        <td>\n                                            <p><a href=\"#\">Just a Plain Link &raquo;</a></p>\n                                        </td>\n                                    </tr>\n                                    <tr>\n                                        <td>\n                                            <hr/>\n                                        </td>\n                                    </tr>\n                                    <tr>\n                                        <td>\n                                            <p><a href=\"#\">Just a Plain Link &raquo;</a></p>\n                                        </td>\n                                    </tr>\n                                    <tr>\n                                        <td>\n                                            <hr/>\n                                        </td>\n                                    </tr>\n                                    <tr>\n                                        <td>\n                                            <p><a href=\"#\">Just a Plain Link &raquo;</a></p>\n                                        </td>\n                                    </tr>\n                                    <tr>\n                                        <td>\n                                            <hr/>\n                                        </td>\n                                    </tr>\n                                    <tr>\n                                        <td>\n                                            <p><a href=\"#\">Just a Plain Link &raquo;</a></p>\n                                        </td>\n                                    </tr>\n                                    <tr>\n                                        <td>\n                                            <hr/>\n                                        </td>\n                                    </tr>\n                                    <tr>\n                                        <td>\n                                            <p><a href=\"#\">Just a Plain Link &raquo;</a></p>\n                                        </td>\n                                    </tr>\n                                    <tr>\n                                        <td>\n                                            <hr/>\n                                        </td>\n                                    </tr>\n                                    <tr>\n                                        <td>\n                                            <p><a href=\"#\">Just a Plain Link &raquo;</a></p>\n                                        </td>\n                                    </tr>\n                                    <tr>\n                                        <td>\n                                            <hr/>\n                                        </td>\n                                    </tr>\n                                    <tr>\n                                        <td>\n                                            <p><a href=\"#\">Just a Plain Link &raquo;</a></p>\n                                        </td>\n                                    </tr>\n                                    <tr><td>&nbsp;</td></tr>\n                                </table>\n                            </td>\n                            <td class=\"expander\"></td>\n                        </tr>\n                    </table>\n                    <br>\n                    <table class=\"columns\">\n                        <tr>\n                            <td class=\"panel\">\n                                <h6>Connect With Us:</h6>\n                                <table class=\"social-button facebook\">\n                                    <tr>\n                                        <td>\n                                            <a href=\"#\">Facebook</a>\n                                        </td>\n                                    </tr>\n                                </table>\n                                <hr>\n                                <table class=\"social-button twitter\">\n                                    <tr>\n                                        <td>\n                                            <a href=\"#\">Twitter</a>\n                                        </td>\n                                    </tr>\n                                </table>\n                                <hr>\n                                <table class=\"social-button google-plus\">\n                                    <tr>\n                                        <td>\n                                            <a href=\"#\">Google +</a>\n                                        </td>\n                                    </tr>\n                                </table>\n                                <br>\n                                <h6>Contact Info:</h6>\n                                {{depend store_phone}}\n                                <p>\n                                    <b>Call Us:</b>\n                                    <a href=\"tel:{{var phone}}\">{{var store_phone}}</a>\n                                </p>\n                                {{/depend}}\n                                {{depend store_hours}}\n                                <p><span class=\"no-link\">{{var store_hours}}</span><br></p>\n                                {{/depend}}\n                                {{depend store_email}}\n                                <p><b>Email:</b> <a href=\"mailto:{{var store_email}}\">{{var store_email}}</a></p>\n                                {{/depend}}\n                            </td>\n                            <td class=\"expander\"></td>\n                        </tr>\n                    </table>\n                </td>\n            </tr>\n        </table>\n        <table class=\"row\">\n            <tr>\n                <td class=\"full wrapper\">\n                    {{block type=\"catalog/product_new\" template=\"email/catalog/product/new.phtml\" products_count=\"4\"\n                    column_count=\"4\" }}\n                </td>\n            </tr>\n        </table>\n        <table class=\"row\">\n            <tr>\n                <td class=\"full wrapper last\">\n                    <table class=\"columns\">\n                        <tr>\n                            <td align=\"center\">\n                                <center>\n                                    <p><a href=\"#\">Terms</a> | <a href=\"#\">Privacy</a> | <a href=\"#\">Unsubscribe</a></p>\n                                </center>\n                            </td>\n                            <td class=\"expander\"></td>\n                        </tr>\n                    </table>\n                </td>\n            </tr>\n        </table>\n    </td>\n</tr>\n</table>\n\n{{template config_path=\"design/email/footer\"}}',NULL,NULL,2,'Example Subject','Owner','owner@example.com',1,'2017-03-15 10:25:09','2017-03-15 10:25:09');
/*!40000 ALTER TABLE `magev1_newsletter_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_oauth_consumer`
--

DROP TABLE IF EXISTS `magev1_oauth_consumer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_oauth_consumer` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `name` varchar(255) NOT NULL COMMENT 'Name of consumer',
  `key` varchar(32) NOT NULL COMMENT 'Key code',
  `secret` varchar(32) NOT NULL COMMENT 'Secret code',
  `callback_url` varchar(255) DEFAULT NULL COMMENT 'Callback URL',
  `rejected_callback_url` varchar(255) NOT NULL COMMENT 'Rejected callback URL',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_MAGEV1_MAGEV1_OAUTH_CONSUMER_KEY` (`key`),
  UNIQUE KEY `UNQ_MAGEV1_MAGEV1_OAUTH_CONSUMER_SECRET` (`secret`),
  KEY `IDX_MAGEV1_OAUTH_CONSUMER_CREATED_AT` (`created_at`),
  KEY `IDX_MAGEV1_OAUTH_CONSUMER_UPDATED_AT` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='OAuth Consumers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_oauth_consumer`
--

LOCK TABLES `magev1_oauth_consumer` WRITE;
/*!40000 ALTER TABLE `magev1_oauth_consumer` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_oauth_consumer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_oauth_nonce`
--

DROP TABLE IF EXISTS `magev1_oauth_nonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_oauth_nonce` (
  `nonce` varchar(32) NOT NULL COMMENT 'Nonce String',
  `timestamp` int(10) unsigned NOT NULL COMMENT 'Nonce Timestamp',
  UNIQUE KEY `UNQ_MAGEV1_MAGEV1_OAUTH_NONCE_NONCE` (`nonce`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='magev1_oauth_nonce';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_oauth_nonce`
--

LOCK TABLES `magev1_oauth_nonce` WRITE;
/*!40000 ALTER TABLE `magev1_oauth_nonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_oauth_nonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_oauth_token`
--

DROP TABLE IF EXISTS `magev1_oauth_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_oauth_token` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity ID',
  `consumer_id` int(10) unsigned NOT NULL COMMENT 'Consumer ID',
  `admin_id` int(10) unsigned DEFAULT NULL COMMENT 'Admin user ID',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer user ID',
  `type` varchar(16) NOT NULL COMMENT 'Token Type',
  `token` varchar(32) NOT NULL COMMENT 'Token',
  `secret` varchar(32) NOT NULL COMMENT 'Token Secret',
  `verifier` varchar(32) DEFAULT NULL COMMENT 'Token Verifier',
  `callback_url` varchar(255) NOT NULL COMMENT 'Token Callback URL',
  `revoked` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Token revoked',
  `authorized` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Token authorized',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Token creation timestamp',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_MAGEV1_MAGEV1_OAUTH_TOKEN_TOKEN` (`token`),
  KEY `IDX_MAGEV1_MAGEV1_OAUTH_TOKEN_CONSUMER_ID` (`consumer_id`),
  KEY `FK_MAGEV1_OAUTH_TOKEN_ADMIN_ID_MAGEV1_MAGEV1_ADMIN_USER_USER_ID` (`admin_id`),
  KEY `FK_MAGEV1_OAUTH_TOKEN_CSTR_ID_MAGEV1_MAGEV1_CSTR_ENTT_ENTT_ID` (`customer_id`),
  CONSTRAINT `FK_MAGEV1_OAUTH_TOKEN_ADMIN_ID_MAGEV1_MAGEV1_ADMIN_USER_USER_ID` FOREIGN KEY (`admin_id`) REFERENCES `magev1_admin_user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_OAUTH_TOKEN_CONSUMER_ID_MAGEV1_OAUTH_CONSUMER_ENTT_ID` FOREIGN KEY (`consumer_id`) REFERENCES `magev1_oauth_consumer` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_OAUTH_TOKEN_CSTR_ID_MAGEV1_MAGEV1_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `magev1_customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='OAuth Tokens';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_oauth_token`
--

LOCK TABLES `magev1_oauth_token` WRITE;
/*!40000 ALTER TABLE `magev1_oauth_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_oauth_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_paypal_cert`
--

DROP TABLE IF EXISTS `magev1_paypal_cert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_paypal_cert` (
  `cert_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Cert Id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `content` text COMMENT 'Content',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  PRIMARY KEY (`cert_id`),
  KEY `IDX_MAGEV1_PAYPAL_CERT_WEBSITE_ID` (`website_id`),
  CONSTRAINT `FK_MAGEV1_PAYPAL_CERT_WEBSITE_ID_MAGEV1_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `magev1_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Paypal Certificate Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_paypal_cert`
--

LOCK TABLES `magev1_paypal_cert` WRITE;
/*!40000 ALTER TABLE `magev1_paypal_cert` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_paypal_cert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_paypal_payment_transaction`
--

DROP TABLE IF EXISTS `magev1_paypal_payment_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_paypal_payment_transaction` (
  `transaction_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `txn_id` varchar(100) DEFAULT NULL COMMENT 'Txn Id',
  `additional_information` blob COMMENT 'Additional Information',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  PRIMARY KEY (`transaction_id`),
  UNIQUE KEY `UNQ_MAGEV1_PAYPAL_PAYMENT_TRANSACTION_TXN_ID` (`txn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='PayPal Payflow Link Payment Transaction';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_paypal_payment_transaction`
--

LOCK TABLES `magev1_paypal_payment_transaction` WRITE;
/*!40000 ALTER TABLE `magev1_paypal_payment_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_paypal_payment_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_paypal_settlement_report`
--

DROP TABLE IF EXISTS `magev1_paypal_settlement_report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_paypal_settlement_report` (
  `report_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Report Id',
  `report_date` timestamp NULL DEFAULT NULL COMMENT 'Report Date',
  `account_id` varchar(64) DEFAULT NULL COMMENT 'Account Id',
  `filename` varchar(24) DEFAULT NULL COMMENT 'Filename',
  `last_modified` timestamp NULL DEFAULT NULL COMMENT 'Last Modified',
  PRIMARY KEY (`report_id`),
  UNIQUE KEY `UNQ_MAGEV1_PAYPAL_SETTLEMENT_REPORT_REPORT_DATE_ACCOUNT_ID` (`report_date`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Paypal Settlement Report Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_paypal_settlement_report`
--

LOCK TABLES `magev1_paypal_settlement_report` WRITE;
/*!40000 ALTER TABLE `magev1_paypal_settlement_report` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_paypal_settlement_report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_paypal_settlement_report_row`
--

DROP TABLE IF EXISTS `magev1_paypal_settlement_report_row`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_paypal_settlement_report_row` (
  `row_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Row Id',
  `report_id` int(10) unsigned NOT NULL COMMENT 'Report Id',
  `transaction_id` varchar(19) DEFAULT NULL COMMENT 'Transaction Id',
  `invoice_id` varchar(127) DEFAULT NULL COMMENT 'Invoice Id',
  `paypal_reference_id` varchar(19) DEFAULT NULL COMMENT 'Paypal Reference Id',
  `paypal_reference_id_type` varchar(3) DEFAULT NULL COMMENT 'Paypal Reference Id Type',
  `transaction_event_code` varchar(5) DEFAULT NULL COMMENT 'Transaction Event Code',
  `transaction_initiation_date` timestamp NULL DEFAULT NULL COMMENT 'Transaction Initiation Date',
  `transaction_completion_date` timestamp NULL DEFAULT NULL COMMENT 'Transaction Completion Date',
  `transaction_debit_or_credit` varchar(2) NOT NULL DEFAULT 'CR' COMMENT 'Transaction Debit Or Credit',
  `gross_transaction_amount` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Gross Transaction Amount',
  `gross_transaction_currency` varchar(3) DEFAULT '' COMMENT 'Gross Transaction Currency',
  `fee_debit_or_credit` varchar(2) DEFAULT NULL COMMENT 'Fee Debit Or Credit',
  `fee_amount` decimal(20,6) NOT NULL DEFAULT '0.000000' COMMENT 'Fee Amount',
  `fee_currency` varchar(3) DEFAULT NULL COMMENT 'Fee Currency',
  `custom_field` varchar(255) DEFAULT NULL COMMENT 'Custom Field',
  `consumer_id` varchar(127) DEFAULT NULL COMMENT 'Consumer Id',
  `payment_tracking_id` varchar(255) DEFAULT NULL COMMENT 'Payment Tracking ID',
  `store_id` varchar(50) DEFAULT NULL COMMENT 'Store ID',
  PRIMARY KEY (`row_id`),
  KEY `IDX_MAGEV1_PAYPAL_SETTLEMENT_REPORT_ROW_REPORT_ID` (`report_id`),
  CONSTRAINT `FK_BD4FF5EA5E82A1DFCC83A897B9839EF3` FOREIGN KEY (`report_id`) REFERENCES `magev1_paypal_settlement_report` (`report_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Paypal Settlement Report Row Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_paypal_settlement_report_row`
--

LOCK TABLES `magev1_paypal_settlement_report_row` WRITE;
/*!40000 ALTER TABLE `magev1_paypal_settlement_report_row` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_paypal_settlement_report_row` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_permission_block`
--

DROP TABLE IF EXISTS `magev1_permission_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_permission_block` (
  `block_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Block ID',
  `block_name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Block Name',
  `is_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Mark that block can be processed by filters',
  PRIMARY KEY (`block_id`),
  UNIQUE KEY `UNQ_MAGEV1_PERMISSION_BLOCK_BLOCK_NAME` (`block_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='System blocks that can be processed via content filter';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_permission_block`
--

LOCK TABLES `magev1_permission_block` WRITE;
/*!40000 ALTER TABLE `magev1_permission_block` DISABLE KEYS */;
INSERT INTO `magev1_permission_block` VALUES (1,'core/template',1),(2,'catalog/product_new',1);
/*!40000 ALTER TABLE `magev1_permission_block` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_permission_variable`
--

DROP TABLE IF EXISTS `magev1_permission_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_permission_variable` (
  `variable_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Variable ID',
  `variable_name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Config Path',
  `is_allowed` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Mark that config can be processed by filters',
  PRIMARY KEY (`variable_id`,`variable_name`),
  UNIQUE KEY `UNQ_MAGEV1_PERMISSION_VARIABLE_VARIABLE_NAME` (`variable_name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='System variables that can be processed via content filter';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_permission_variable`
--

LOCK TABLES `magev1_permission_variable` WRITE;
/*!40000 ALTER TABLE `magev1_permission_variable` DISABLE KEYS */;
INSERT INTO `magev1_permission_variable` VALUES (1,'trans_email/ident_support/name',1),(2,'trans_email/ident_support/email',1),(3,'web/unsecure/base_url',1),(4,'web/secure/base_url',1),(5,'trans_email/ident_general/name',1),(6,'trans_email/ident_general/email',1),(7,'trans_email/ident_sales/name',1),(8,'trans_email/ident_sales/email',1),(9,'trans_email/ident_custom1/name',1),(10,'trans_email/ident_custom1/email',1),(11,'trans_email/ident_custom2/name',1),(12,'trans_email/ident_custom2/email',1),(13,'general/store_information/name',1),(14,'general/store_information/phone',1),(15,'general/store_information/address',1);
/*!40000 ALTER TABLE `magev1_permission_variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_persistent_session`
--

DROP TABLE IF EXISTS `magev1_persistent_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_persistent_session` (
  `persistent_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Session id',
  `key` varchar(50) NOT NULL COMMENT 'Unique cookie key',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  `info` text COMMENT 'Session Data',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  PRIMARY KEY (`persistent_id`),
  UNIQUE KEY `IDX_MAGEV1_PERSISTENT_SESSION_KEY` (`key`),
  UNIQUE KEY `IDX_MAGEV1_PERSISTENT_SESSION_CUSTOMER_ID` (`customer_id`),
  KEY `IDX_MAGEV1_PERSISTENT_SESSION_UPDATED_AT` (`updated_at`),
  KEY `FK_MAGEV1_PERSISTENT_SESS_WS_ID_MAGEV1_CORE_WS_WS_ID` (`website_id`),
  CONSTRAINT `FK_MAGEV1_PERSISTENT_SESS_CSTR_ID_MAGEV1_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `magev1_customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_MAGEV1_PERSISTENT_SESS_WS_ID_MAGEV1_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `magev1_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Persistent Session';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_persistent_session`
--

LOCK TABLES `magev1_persistent_session` WRITE;
/*!40000 ALTER TABLE `magev1_persistent_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_persistent_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_poll`
--

DROP TABLE IF EXISTS `magev1_poll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_poll` (
  `poll_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Poll Id',
  `poll_title` varchar(255) DEFAULT NULL COMMENT 'Poll title',
  `votes_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Votes Count',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store id',
  `date_posted` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Date posted',
  `date_closed` timestamp NULL DEFAULT NULL COMMENT 'Date closed',
  `active` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Is active',
  `closed` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is closed',
  `answers_display` smallint(6) DEFAULT NULL COMMENT 'Answers display',
  PRIMARY KEY (`poll_id`),
  KEY `IDX_MAGEV1_POLL_STORE_ID` (`store_id`),
  CONSTRAINT `FK_MAGEV1_POLL_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Poll';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_poll`
--

LOCK TABLES `magev1_poll` WRITE;
/*!40000 ALTER TABLE `magev1_poll` DISABLE KEYS */;
INSERT INTO `magev1_poll` VALUES (1,'What is your favorite color',7,0,'2017-03-15 10:25:06',NULL,1,0,NULL);
/*!40000 ALTER TABLE `magev1_poll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_poll_answer`
--

DROP TABLE IF EXISTS `magev1_poll_answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_poll_answer` (
  `answer_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Answer Id',
  `poll_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Poll Id',
  `answer_title` varchar(255) DEFAULT NULL COMMENT 'Answer title',
  `votes_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Votes Count',
  `answer_order` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Answers display',
  PRIMARY KEY (`answer_id`),
  KEY `IDX_MAGEV1_POLL_ANSWER_POLL_ID` (`poll_id`),
  CONSTRAINT `FK_MAGEV1_POLL_ANSWER_POLL_ID_MAGEV1_POLL_POLL_ID` FOREIGN KEY (`poll_id`) REFERENCES `magev1_poll` (`poll_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Poll Answers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_poll_answer`
--

LOCK TABLES `magev1_poll_answer` WRITE;
/*!40000 ALTER TABLE `magev1_poll_answer` DISABLE KEYS */;
INSERT INTO `magev1_poll_answer` VALUES (1,1,'Green',4,0),(2,1,'Red',1,0),(3,1,'Black',0,0),(4,1,'Magenta',2,0);
/*!40000 ALTER TABLE `magev1_poll_answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_poll_store`
--

DROP TABLE IF EXISTS `magev1_poll_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_poll_store` (
  `poll_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Poll Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store id',
  PRIMARY KEY (`poll_id`,`store_id`),
  KEY `IDX_MAGEV1_POLL_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_MAGEV1_POLL_STORE_POLL_ID_MAGEV1_POLL_POLL_ID` FOREIGN KEY (`poll_id`) REFERENCES `magev1_poll` (`poll_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_POLL_STORE_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Poll Store';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_poll_store`
--

LOCK TABLES `magev1_poll_store` WRITE;
/*!40000 ALTER TABLE `magev1_poll_store` DISABLE KEYS */;
INSERT INTO `magev1_poll_store` VALUES (1,1);
/*!40000 ALTER TABLE `magev1_poll_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_poll_vote`
--

DROP TABLE IF EXISTS `magev1_poll_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_poll_vote` (
  `vote_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Vote Id',
  `poll_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Poll Id',
  `poll_answer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Poll answer id',
  `ip_address` varbinary(16) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL COMMENT 'Customer id',
  `vote_time` timestamp NULL DEFAULT NULL COMMENT 'Date closed',
  PRIMARY KEY (`vote_id`),
  KEY `IDX_MAGEV1_POLL_VOTE_POLL_ANSWER_ID` (`poll_answer_id`),
  CONSTRAINT `FK_MAGEV1_POLL_VOTE_POLL_ANSWER_ID_MAGEV1_POLL_ANSWER_ANSWER_ID` FOREIGN KEY (`poll_answer_id`) REFERENCES `magev1_poll_answer` (`answer_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Poll Vote';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_poll_vote`
--

LOCK TABLES `magev1_poll_vote` WRITE;
/*!40000 ALTER TABLE `magev1_poll_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_poll_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_product_alert_price`
--

DROP TABLE IF EXISTS `magev1_product_alert_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_product_alert_price` (
  `alert_price_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product alert price id',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product id',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price amount',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website id',
  `add_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Product alert add date',
  `last_send_date` timestamp NULL DEFAULT NULL COMMENT 'Product alert last send date',
  `send_count` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Product alert send count',
  `status` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Product alert status',
  PRIMARY KEY (`alert_price_id`),
  KEY `IDX_MAGEV1_PRODUCT_ALERT_PRICE_CUSTOMER_ID` (`customer_id`),
  KEY `IDX_MAGEV1_PRODUCT_ALERT_PRICE_PRODUCT_ID` (`product_id`),
  KEY `IDX_MAGEV1_PRODUCT_ALERT_PRICE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `FK_MAGEV1_PRD_ALERT_PRICE_CSTR_ID_MAGEV1_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `magev1_customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_PRD_ALERT_PRICE_PRD_ID_MAGEV1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_PRD_ALERT_PRICE_WS_ID_MAGEV1_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `magev1_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Product Alert Price';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_product_alert_price`
--

LOCK TABLES `magev1_product_alert_price` WRITE;
/*!40000 ALTER TABLE `magev1_product_alert_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_product_alert_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_product_alert_stock`
--

DROP TABLE IF EXISTS `magev1_product_alert_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_product_alert_stock` (
  `alert_stock_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Product alert stock id',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website id',
  `add_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Product alert add date',
  `send_date` timestamp NULL DEFAULT NULL COMMENT 'Product alert send date',
  `send_count` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Send Count',
  `status` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Product alert status',
  PRIMARY KEY (`alert_stock_id`),
  KEY `IDX_MAGEV1_PRODUCT_ALERT_STOCK_CUSTOMER_ID` (`customer_id`),
  KEY `IDX_MAGEV1_PRODUCT_ALERT_STOCK_PRODUCT_ID` (`product_id`),
  KEY `IDX_MAGEV1_PRODUCT_ALERT_STOCK_WEBSITE_ID` (`website_id`),
  CONSTRAINT `FK_MAGEV1_PRD_ALERT_STOCK_CSTR_ID_MAGEV1_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `magev1_customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_PRD_ALERT_STOCK_PRD_ID_MAGEV1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_PRD_ALERT_STOCK_WS_ID_MAGEV1_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `magev1_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Product Alert Stock';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_product_alert_stock`
--

LOCK TABLES `magev1_product_alert_stock` WRITE;
/*!40000 ALTER TABLE `magev1_product_alert_stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_product_alert_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_rating`
--

DROP TABLE IF EXISTS `magev1_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_rating` (
  `rating_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rating Id',
  `entity_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `rating_code` varchar(64) NOT NULL COMMENT 'Rating Code',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Position On Frontend',
  PRIMARY KEY (`rating_id`),
  UNIQUE KEY `UNQ_MAGEV1_RATING_RATING_CODE` (`rating_code`),
  KEY `IDX_MAGEV1_RATING_ENTITY_ID` (`entity_id`),
  CONSTRAINT `FK_MAGEV1_RATING_ENTITY_ID_MAGEV1_RATING_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `magev1_rating_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Ratings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_rating`
--

LOCK TABLES `magev1_rating` WRITE;
/*!40000 ALTER TABLE `magev1_rating` DISABLE KEYS */;
INSERT INTO `magev1_rating` VALUES (1,1,'Quality',0),(2,1,'Value',0),(3,1,'Price',0);
/*!40000 ALTER TABLE `magev1_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_rating_entity`
--

DROP TABLE IF EXISTS `magev1_rating_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_rating_entity` (
  `entity_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `entity_code` varchar(64) NOT NULL COMMENT 'Entity Code',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_MAGEV1_RATING_ENTITY_ENTITY_CODE` (`entity_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Rating entities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_rating_entity`
--

LOCK TABLES `magev1_rating_entity` WRITE;
/*!40000 ALTER TABLE `magev1_rating_entity` DISABLE KEYS */;
INSERT INTO `magev1_rating_entity` VALUES (1,'product'),(2,'product_review'),(3,'review');
/*!40000 ALTER TABLE `magev1_rating_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_rating_option`
--

DROP TABLE IF EXISTS `magev1_rating_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_rating_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rating Option Id',
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Id',
  `code` varchar(32) NOT NULL COMMENT 'Rating Option Code',
  `value` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Option Value',
  `position` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Ration option position on frontend',
  PRIMARY KEY (`option_id`),
  KEY `IDX_MAGEV1_RATING_OPTION_RATING_ID` (`rating_id`),
  CONSTRAINT `FK_MAGEV1_RATING_OPTION_RATING_ID_MAGEV1_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `magev1_rating` (`rating_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='Rating options';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_rating_option`
--

LOCK TABLES `magev1_rating_option` WRITE;
/*!40000 ALTER TABLE `magev1_rating_option` DISABLE KEYS */;
INSERT INTO `magev1_rating_option` VALUES (1,1,'1',1,1),(2,1,'2',2,2),(3,1,'3',3,3),(4,1,'4',4,4),(5,1,'5',5,5),(6,2,'1',1,1),(7,2,'2',2,2),(8,2,'3',3,3),(9,2,'4',4,4),(10,2,'5',5,5),(11,3,'1',1,1),(12,3,'2',2,2),(13,3,'3',3,3),(14,3,'4',4,4),(15,3,'5',5,5);
/*!40000 ALTER TABLE `magev1_rating_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_rating_option_vote`
--

DROP TABLE IF EXISTS `magev1_rating_option_vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_rating_option_vote` (
  `vote_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Vote id',
  `option_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Vote option id',
  `remote_ip` varchar(50) DEFAULT NULL,
  `remote_ip_long` varbinary(16) DEFAULT NULL,
  `customer_id` int(10) unsigned DEFAULT '0' COMMENT 'Customer Id',
  `entity_pk_value` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Product id',
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating id',
  `review_id` bigint(20) unsigned DEFAULT NULL COMMENT 'Review id',
  `percent` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Percent amount',
  `value` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Vote option value',
  PRIMARY KEY (`vote_id`),
  KEY `IDX_MAGEV1_RATING_OPTION_VOTE_OPTION_ID` (`option_id`),
  KEY `FK_MAGEV1_RATING_OPTION_VOTE_REVIEW_ID_MAGEV1_REVIEW_REVIEW_ID` (`review_id`),
  CONSTRAINT `FK_MAGEV1_RATING_OPTION_VOTE_REVIEW_ID_MAGEV1_REVIEW_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `magev1_review` (`review_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_RATING_OPT_VOTE_OPT_ID_MAGEV1_RATING_OPT_OPT_ID` FOREIGN KEY (`option_id`) REFERENCES `magev1_rating_option` (`option_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating option values';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_rating_option_vote`
--

LOCK TABLES `magev1_rating_option_vote` WRITE;
/*!40000 ALTER TABLE `magev1_rating_option_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_rating_option_vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_rating_option_vote_aggregated`
--

DROP TABLE IF EXISTS `magev1_rating_option_vote_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_rating_option_vote_aggregated` (
  `primary_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Vote aggregation id',
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating id',
  `entity_pk_value` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Product id',
  `vote_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Vote dty',
  `vote_value_sum` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'General vote sum',
  `percent` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Vote percent',
  `percent_approved` smallint(6) DEFAULT '0' COMMENT 'Vote percent approved by admin',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  PRIMARY KEY (`primary_id`),
  KEY `IDX_MAGEV1_RATING_OPTION_VOTE_AGGREGATED_RATING_ID` (`rating_id`),
  KEY `IDX_MAGEV1_RATING_OPTION_VOTE_AGGREGATED_STORE_ID` (`store_id`),
  CONSTRAINT `FK_081EBF39CD2E91CB068C362FBFCEE750` FOREIGN KEY (`rating_id`) REFERENCES `magev1_rating` (`rating_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_13E1AAA774DCF6B5712D21CCC07C5ED2` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating vote aggregated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_rating_option_vote_aggregated`
--

LOCK TABLES `magev1_rating_option_vote_aggregated` WRITE;
/*!40000 ALTER TABLE `magev1_rating_option_vote_aggregated` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_rating_option_vote_aggregated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_rating_store`
--

DROP TABLE IF EXISTS `magev1_rating_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_rating_store` (
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store id',
  PRIMARY KEY (`rating_id`,`store_id`),
  KEY `IDX_MAGEV1_RATING_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_MAGEV1_RATING_STORE_RATING_ID_MAGEV1_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `magev1_rating` (`rating_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_MAGEV1_RATING_STORE_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating Store';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_rating_store`
--

LOCK TABLES `magev1_rating_store` WRITE;
/*!40000 ALTER TABLE `magev1_rating_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_rating_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_rating_title`
--

DROP TABLE IF EXISTS `magev1_rating_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_rating_title` (
  `rating_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `value` varchar(255) NOT NULL COMMENT 'Rating Label',
  PRIMARY KEY (`rating_id`,`store_id`),
  KEY `IDX_MAGEV1_RATING_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_MAGEV1_RATING_TITLE_RATING_ID_MAGEV1_RATING_RATING_ID` FOREIGN KEY (`rating_id`) REFERENCES `magev1_rating` (`rating_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_RATING_TITLE_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rating Title';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_rating_title`
--

LOCK TABLES `magev1_rating_title` WRITE;
/*!40000 ALTER TABLE `magev1_rating_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_rating_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_report_compared_product_index`
--

DROP TABLE IF EXISTS `magev1_report_compared_product_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_report_compared_product_index` (
  `index_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Index Id',
  `visitor_id` int(10) unsigned DEFAULT NULL COMMENT 'Visitor Id',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `added_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Added At',
  PRIMARY KEY (`index_id`),
  UNIQUE KEY `UNQ_MAGEV1_REPORT_COMPARED_PRODUCT_INDEX_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  UNIQUE KEY `UNQ_MAGEV1_REPORT_COMPARED_PRODUCT_INDEX_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  KEY `IDX_MAGEV1_REPORT_COMPARED_PRODUCT_INDEX_STORE_ID` (`store_id`),
  KEY `IDX_MAGEV1_REPORT_COMPARED_PRODUCT_INDEX_ADDED_AT` (`added_at`),
  KEY `IDX_MAGEV1_REPORT_COMPARED_PRODUCT_INDEX_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_7705D1AAE981C80EC376CC9876F20F58` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_REPORT_CMPD_PRD_IDX_CSTR_ID_MAGEV1_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `magev1_customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_REPORT_CMPD_PRD_IDX_PRD_ID_MAGEV1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Reports Compared Product Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_report_compared_product_index`
--

LOCK TABLES `magev1_report_compared_product_index` WRITE;
/*!40000 ALTER TABLE `magev1_report_compared_product_index` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_report_compared_product_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_report_event`
--

DROP TABLE IF EXISTS `magev1_report_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_report_event` (
  `event_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Event Id',
  `logged_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Logged At',
  `event_type_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Event Type Id',
  `object_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Object Id',
  `subject_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Subject Id',
  `subtype` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Subtype',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  PRIMARY KEY (`event_id`),
  KEY `IDX_MAGEV1_REPORT_EVENT_EVENT_TYPE_ID` (`event_type_id`),
  KEY `IDX_MAGEV1_REPORT_EVENT_SUBJECT_ID` (`subject_id`),
  KEY `IDX_MAGEV1_REPORT_EVENT_OBJECT_ID` (`object_id`),
  KEY `IDX_MAGEV1_REPORT_EVENT_SUBTYPE` (`subtype`),
  KEY `IDX_MAGEV1_REPORT_EVENT_STORE_ID` (`store_id`),
  CONSTRAINT `FK_B69D8F0EBA662467CFE68441DA56D45B` FOREIGN KEY (`event_type_id`) REFERENCES `magev1_report_event_types` (`event_type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_REPORT_EVENT_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=428 DEFAULT CHARSET=utf8 COMMENT='Reports Event Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_report_event`
--

LOCK TABLES `magev1_report_event` WRITE;
/*!40000 ALTER TABLE `magev1_report_event` DISABLE KEYS */;
INSERT INTO `magev1_report_event` VALUES (1,'2017-03-16 11:36:47',1,1,14,1,1),(2,'2017-03-17 09:55:38',1,4,17,1,1),(3,'2017-03-17 10:00:32',1,4,17,1,1),(4,'2017-03-17 10:00:39',1,4,17,1,1),(5,'2017-03-17 10:00:51',1,4,17,1,1),(6,'2017-03-17 10:01:29',1,4,17,1,1),(7,'2017-03-17 10:01:59',1,4,17,1,1),(8,'2017-03-17 10:04:16',1,4,17,1,1),(9,'2017-03-17 10:05:46',1,4,17,1,1),(10,'2017-03-17 10:05:49',1,4,17,1,1),(11,'2017-03-17 10:08:21',1,4,17,1,1),(12,'2017-03-17 10:08:26',1,4,17,1,1),(13,'2017-03-17 10:08:33',1,4,17,1,1),(14,'2017-03-17 10:08:36',1,4,17,1,1),(15,'2017-03-17 10:08:41',1,4,17,1,1),(16,'2017-03-17 10:10:37',1,4,17,1,1),(17,'2017-03-17 10:11:05',1,4,17,1,1),(18,'2017-03-17 10:11:12',1,4,17,1,1),(19,'2017-03-17 10:11:33',1,4,17,1,1),(20,'2017-03-17 10:12:02',1,4,17,1,1),(21,'2017-03-17 10:12:07',1,4,17,1,1),(22,'2017-03-17 10:12:34',1,4,17,1,1),(23,'2017-03-17 10:16:26',1,4,17,1,1),(24,'2017-03-17 10:16:33',1,4,17,1,1),(25,'2017-03-17 10:16:56',1,4,17,1,1),(26,'2017-03-17 10:17:47',1,4,17,1,1),(27,'2017-03-17 10:18:19',1,4,17,1,1),(28,'2017-03-17 10:21:23',1,4,17,1,1),(29,'2017-03-17 10:21:51',1,4,17,1,1),(30,'2017-03-17 10:21:54',1,4,17,1,1),(31,'2017-03-17 10:21:56',1,4,17,1,1),(32,'2017-03-17 10:58:50',1,4,17,1,1),(33,'2017-03-17 10:59:13',1,4,17,1,1),(34,'2017-03-17 10:59:40',1,4,17,1,1),(35,'2017-03-17 12:12:43',1,4,19,1,1),(36,'2017-03-17 17:09:29',1,4,20,1,1),(37,'2017-03-20 15:52:47',1,4,56,1,1),(38,'2017-03-27 07:54:05',1,4,66,1,1),(39,'2017-03-27 09:18:37',1,7,68,1,1),(40,'2017-03-27 09:19:05',1,7,68,1,1),(41,'2017-03-27 09:19:22',1,7,68,1,1),(42,'2017-03-27 09:19:26',1,7,68,1,1),(43,'2017-03-27 09:20:39',1,7,68,1,1),(44,'2017-03-27 09:21:03',1,4,68,1,1),(45,'2017-03-27 09:21:14',1,7,68,1,1),(46,'2017-03-27 09:24:45',1,7,68,1,1),(47,'2017-03-27 09:26:13',1,4,68,1,1),(48,'2017-03-27 09:27:53',1,4,68,1,1),(49,'2017-03-27 09:27:58',1,4,68,1,1),(50,'2017-03-27 09:28:04',1,4,68,1,1),(51,'2017-03-27 09:29:12',1,4,68,1,1),(52,'2017-03-27 09:29:15',1,4,68,1,1),(53,'2017-03-27 09:29:18',1,4,68,1,1),(54,'2017-03-27 09:29:20',1,4,68,1,1),(55,'2017-03-27 09:29:24',1,4,68,1,1),(56,'2017-03-27 09:29:44',1,4,68,1,1),(57,'2017-03-27 09:29:56',1,4,68,1,1),(58,'2017-03-27 09:30:05',1,7,68,1,1),(59,'2017-03-27 09:30:16',1,7,68,1,1),(60,'2017-03-27 09:30:46',1,7,68,1,1),(61,'2017-03-27 09:31:22',1,7,68,1,1),(62,'2017-03-27 09:31:52',1,7,68,1,1),(63,'2017-03-27 09:31:56',1,7,68,1,1),(64,'2017-03-27 09:32:03',1,4,68,1,1),(65,'2017-03-27 09:32:13',1,7,68,1,1),(66,'2017-03-27 09:33:03',1,7,68,1,1),(67,'2017-03-27 09:34:16',1,7,68,1,1),(68,'2017-03-27 09:34:20',1,7,68,1,1),(69,'2017-03-27 09:57:12',1,8,68,1,1),(70,'2017-03-27 12:43:53',1,8,69,1,1),(71,'2017-03-27 12:44:26',1,8,69,1,1),(72,'2017-03-29 13:16:11',1,6,95,1,1),(73,'2017-03-30 08:48:51',1,5,113,1,1),(74,'2017-03-30 08:49:32',1,5,113,1,1),(75,'2017-03-30 08:49:38',4,5,113,1,1),(76,'2017-03-30 08:49:43',1,5,113,1,1),(77,'2017-03-30 08:49:48',4,5,113,1,1),(78,'2017-03-30 08:54:47',1,5,113,1,1),(79,'2017-03-30 09:08:34',1,4,113,1,1),(80,'2017-03-30 09:16:55',1,5,113,1,1),(81,'2017-03-30 09:18:18',1,5,113,1,1),(82,'2017-03-30 10:11:26',1,5,113,1,1),(83,'2017-03-31 11:55:52',1,4,132,1,2),(84,'2017-03-31 12:03:16',1,4,132,1,2),(85,'2017-03-31 12:04:08',1,4,132,1,2),(86,'2017-03-31 12:07:12',1,4,132,1,2),(87,'2017-03-31 12:07:22',1,4,132,1,2),(88,'2017-03-31 12:08:56',1,4,132,1,2),(89,'2017-03-31 12:10:24',1,4,132,1,2),(90,'2017-03-31 12:26:23',1,4,132,1,2),(91,'2017-03-31 12:28:28',1,4,132,1,2),(92,'2017-03-31 12:36:50',1,4,132,1,1),(93,'2017-03-31 12:36:55',1,4,132,1,1),(94,'2017-03-31 12:36:59',1,4,132,1,1),(95,'2017-03-31 12:38:00',1,4,132,1,1),(96,'2017-03-31 12:38:28',1,4,132,1,1),(97,'2017-03-31 12:38:44',1,4,132,1,1),(98,'2017-03-31 12:39:43',1,4,132,1,1),(99,'2017-04-03 12:39:23',1,9,261,1,2),(100,'2017-04-05 09:48:05',1,15,271,1,1),(101,'2017-04-05 09:48:30',1,15,271,1,1),(102,'2017-04-05 09:48:35',1,14,271,1,1),(103,'2017-04-05 09:48:43',1,15,271,1,1),(104,'2017-04-05 09:52:13',1,14,271,1,1),(105,'2017-04-05 09:52:40',1,16,271,1,1),(106,'2017-04-05 10:24:12',1,15,271,1,1),(107,'2017-04-05 11:08:08',1,16,271,1,1),(108,'2017-04-05 11:08:55',1,15,271,1,1),(109,'2017-04-05 11:13:14',1,15,271,1,1),(110,'2017-04-05 11:21:15',1,15,271,1,1),(111,'2017-04-05 11:22:54',1,15,271,1,1),(112,'2017-04-05 11:25:05',1,15,271,1,1),(113,'2017-04-05 11:26:43',1,15,271,1,1),(114,'2017-04-05 11:30:37',1,15,271,1,1),(115,'2017-04-05 11:32:56',1,15,271,1,1),(116,'2017-04-05 11:33:39',1,15,271,1,1),(117,'2017-04-05 11:34:03',1,15,271,1,1),(118,'2017-04-05 11:35:49',1,15,271,1,1),(119,'2017-04-05 11:36:17',1,15,271,1,1),(120,'2017-04-05 11:37:07',1,15,271,1,1),(121,'2017-04-05 11:37:37',1,15,271,1,1),(122,'2017-04-05 11:37:56',1,15,271,1,1),(123,'2017-04-05 11:43:29',1,15,271,1,1),(124,'2017-04-05 11:43:58',1,15,271,1,1),(125,'2017-04-05 11:44:15',1,15,271,1,1),(126,'2017-04-05 11:46:30',1,15,271,1,1),(127,'2017-04-05 11:48:16',1,15,271,1,1),(128,'2017-04-05 11:50:03',1,15,271,1,1),(129,'2017-04-05 11:53:19',1,15,271,1,1),(130,'2017-04-05 11:54:20',1,15,271,1,1),(131,'2017-04-05 11:55:05',1,15,271,1,1),(132,'2017-04-05 11:55:13',1,15,271,1,1),(133,'2017-04-05 11:55:34',1,15,271,1,1),(134,'2017-04-05 11:56:08',1,15,271,1,1),(135,'2017-04-05 11:56:11',1,15,271,1,1),(136,'2017-04-05 11:57:30',1,15,271,1,1),(137,'2017-04-05 12:03:54',1,15,271,1,1),(138,'2017-04-05 12:07:18',1,15,271,1,1),(139,'2017-04-05 12:07:56',1,15,271,1,1),(140,'2017-04-05 12:15:36',1,15,271,1,1),(141,'2017-04-05 12:16:54',1,15,271,1,1),(142,'2017-04-05 12:47:30',1,14,272,1,1),(143,'2017-04-05 17:07:32',1,14,273,1,2),(144,'2017-04-05 17:07:37',1,16,273,1,2),(145,'2017-04-05 17:08:08',1,15,273,1,2),(146,'2017-04-05 17:15:54',1,15,273,1,2),(147,'2017-04-05 17:15:55',1,15,273,1,2),(148,'2017-04-05 17:16:39',1,15,273,1,2),(149,'2017-04-05 17:16:40',1,15,273,1,2),(150,'2017-04-05 17:16:57',1,15,273,1,2),(151,'2017-04-05 17:16:58',1,15,273,1,2),(152,'2017-04-05 17:16:59',1,15,273,1,2),(153,'2017-04-05 17:17:05',1,15,273,1,2),(154,'2017-04-05 17:17:06',1,15,273,1,2),(155,'2017-04-05 17:17:28',1,15,273,1,2),(156,'2017-04-05 17:17:29',1,15,273,1,2),(157,'2017-04-05 17:17:43',1,15,273,1,2),(158,'2017-04-05 17:18:06',1,15,273,1,2),(159,'2017-04-05 17:18:07',1,15,273,1,2),(160,'2017-04-05 17:18:08',1,15,273,1,2),(161,'2017-04-05 17:18:18',1,15,273,1,2),(162,'2017-04-05 17:18:19',1,15,273,1,2),(163,'2017-04-05 17:18:19',1,15,273,1,2),(164,'2017-04-05 17:18:41',1,15,273,1,2),(165,'2017-04-05 17:18:42',1,15,273,1,2),(166,'2017-04-05 17:21:58',1,15,273,1,2),(167,'2017-04-05 17:22:00',1,15,273,1,2),(168,'2017-04-05 17:24:58',1,15,273,1,2),(169,'2017-04-05 17:24:59',1,15,273,1,2),(170,'2017-04-05 17:25:16',1,15,273,1,2),(171,'2017-04-05 17:26:27',1,15,273,1,2),(172,'2017-04-05 17:26:37',1,15,273,1,2),(173,'2017-04-05 17:27:03',1,15,273,1,2),(174,'2017-04-05 17:27:04',1,15,273,1,2),(175,'2017-04-05 17:27:05',1,15,273,1,2),(176,'2017-04-05 17:27:31',1,15,273,1,2),(177,'2017-04-05 17:30:11',1,15,273,1,2),(178,'2017-04-05 17:32:46',1,15,273,1,2),(179,'2017-04-05 17:34:34',1,15,273,1,2),(180,'2017-04-05 17:35:15',1,15,273,1,2),(181,'2017-04-05 17:36:03',1,15,273,1,2),(182,'2017-04-05 17:36:38',1,15,273,1,2),(183,'2017-04-05 17:37:07',1,15,273,1,2),(184,'2017-04-05 17:38:14',1,15,273,1,2),(185,'2017-04-05 17:38:33',1,15,273,1,2),(186,'2017-04-05 17:40:00',1,15,273,1,2),(187,'2017-04-05 17:40:07',1,15,273,1,2),(188,'2017-04-05 17:40:09',1,15,273,1,2),(189,'2017-04-05 17:41:02',1,15,273,1,2),(190,'2017-04-05 17:41:03',1,15,273,1,2),(191,'2017-04-05 17:41:33',1,15,273,1,2),(192,'2017-04-05 17:41:34',1,15,273,1,2),(193,'2017-04-05 17:41:34',1,15,273,1,2),(194,'2017-04-05 17:45:17',1,15,273,1,2),(195,'2017-04-05 17:45:18',1,15,273,1,2),(196,'2017-04-05 17:46:34',1,15,273,1,2),(197,'2017-04-05 17:49:01',1,15,273,1,2),(198,'2017-04-05 17:53:58',1,15,273,1,2),(199,'2017-04-05 17:54:33',1,15,273,1,2),(200,'2017-04-05 17:56:55',1,15,273,1,2),(201,'2017-04-05 17:57:49',1,15,273,1,2),(202,'2017-04-05 17:57:51',1,15,273,1,2),(203,'2017-04-05 18:02:07',1,15,273,1,2),(204,'2017-04-05 18:03:16',1,15,273,1,2),(205,'2017-04-05 18:04:07',1,15,273,1,2),(206,'2017-04-05 18:04:08',1,15,273,1,2),(207,'2017-04-05 18:04:34',1,15,273,1,2),(208,'2017-04-05 18:07:34',1,15,273,1,2),(209,'2017-04-05 18:07:36',1,15,273,1,2),(210,'2017-04-05 18:07:48',1,15,273,1,2),(211,'2017-04-05 18:09:48',1,15,273,1,2),(212,'2017-04-05 18:10:06',1,15,274,1,2),(213,'2017-04-05 18:10:37',1,15,274,1,2),(214,'2017-04-05 18:10:40',1,15,274,1,2),(215,'2017-04-05 18:10:47',1,15,274,1,2),(216,'2017-04-05 18:12:08',1,15,274,1,2),(217,'2017-04-05 18:14:26',1,15,274,1,2),(218,'2017-04-05 18:15:18',1,15,274,1,2),(219,'2017-04-05 18:15:19',1,15,274,1,2),(220,'2017-04-05 18:15:32',1,15,274,1,2),(221,'2017-04-05 18:15:33',1,15,274,1,2),(222,'2017-04-05 18:16:49',1,15,274,1,2),(223,'2017-04-05 18:19:40',1,15,274,1,2),(224,'2017-04-05 18:20:03',1,15,274,1,2),(225,'2017-04-05 18:21:33',1,15,274,1,2),(226,'2017-04-05 18:22:21',1,15,274,1,2),(227,'2017-04-05 18:24:05',1,15,274,1,2),(228,'2017-04-05 18:30:12',1,15,274,1,2),(229,'2017-04-05 18:30:32',1,15,274,1,2),(230,'2017-04-05 18:31:40',1,15,274,1,2),(231,'2017-04-05 18:35:39',1,15,274,1,2),(232,'2017-04-05 18:38:06',1,15,274,1,2),(233,'2017-04-05 18:38:27',1,15,274,1,2),(234,'2017-04-05 18:43:14',1,15,274,1,2),(235,'2017-04-05 18:43:40',1,15,274,1,2),(236,'2017-04-05 18:46:07',1,15,274,1,2),(237,'2017-04-05 18:47:35',1,15,274,1,2),(238,'2017-04-05 18:47:36',1,15,274,1,2),(239,'2017-04-05 18:47:54',1,15,274,1,2),(240,'2017-04-05 18:58:06',1,15,274,1,2),(241,'2017-04-05 19:00:16',1,15,274,1,2),(242,'2017-04-05 19:00:17',1,15,274,1,2),(243,'2017-04-05 19:00:31',1,15,274,1,2),(244,'2017-04-05 19:01:16',1,15,274,1,2),(245,'2017-04-05 19:05:16',1,16,274,1,2),(246,'2017-04-05 19:06:06',1,15,274,1,2),(247,'2017-04-05 19:12:01',1,15,274,1,2),(248,'2017-04-05 19:12:21',1,15,274,1,2),(249,'2017-04-05 19:13:24',1,15,274,1,2),(250,'2017-04-05 19:13:25',1,15,274,1,2),(251,'2017-04-05 19:13:44',1,15,274,1,2),(252,'2017-04-05 19:13:45',1,15,274,1,2),(253,'2017-04-05 19:13:51',1,15,274,1,2),(254,'2017-04-05 19:13:52',1,15,274,1,2),(255,'2017-04-05 19:13:52',1,15,274,1,2),(256,'2017-04-05 19:14:12',1,15,274,1,2),(257,'2017-04-05 19:14:13',1,15,274,1,2),(258,'2017-04-05 19:14:20',1,15,274,1,2),(259,'2017-04-05 19:14:27',1,15,274,1,2),(260,'2017-04-05 19:14:32',1,15,274,1,2),(261,'2017-04-05 19:14:33',1,15,274,1,2),(262,'2017-04-05 19:14:43',1,15,274,1,2),(263,'2017-04-05 19:15:11',1,15,274,1,2),(264,'2017-04-05 19:15:22',1,15,274,1,2),(265,'2017-04-05 19:15:23',1,15,274,1,2),(266,'2017-04-05 19:15:29',1,15,274,1,2),(267,'2017-04-05 19:15:52',1,15,274,1,2),(268,'2017-04-05 19:15:54',1,15,274,1,2),(269,'2017-04-05 19:17:03',1,15,274,1,2),(270,'2017-04-05 19:17:18',1,15,274,1,2),(271,'2017-04-05 19:17:30',1,15,274,1,2),(272,'2017-04-05 19:17:53',1,15,274,1,2),(273,'2017-04-05 19:21:10',1,15,274,1,2),(274,'2017-04-05 19:22:47',1,15,274,1,2),(275,'2017-04-05 19:22:48',1,15,274,1,2),(276,'2017-04-05 19:23:19',1,15,274,1,2),(277,'2017-04-05 19:23:21',1,15,274,1,2),(278,'2017-04-05 19:24:24',1,15,274,1,2),(279,'2017-04-05 19:29:34',1,15,274,1,2),(280,'2017-04-05 19:31:41',1,15,274,1,2),(281,'2017-04-05 19:32:15',1,15,274,1,2),(282,'2017-04-05 19:34:28',1,15,274,1,2),(283,'2017-04-05 19:39:23',1,15,274,1,2),(284,'2017-04-05 19:42:14',1,15,274,1,2),(285,'2017-04-05 19:42:33',1,15,274,1,2),(286,'2017-04-05 19:47:46',1,15,274,1,2),(287,'2017-04-05 19:48:08',1,15,274,1,2),(288,'2017-04-05 19:48:38',1,15,274,1,2),(289,'2017-04-05 19:49:39',1,15,274,1,2),(290,'2017-04-05 19:50:06',1,15,274,1,2),(291,'2017-04-05 19:54:13',1,15,274,1,2),(292,'2017-04-05 19:54:55',1,15,274,1,2),(293,'2017-04-05 19:57:23',1,15,274,1,2),(294,'2017-04-05 19:58:46',1,15,274,1,2),(295,'2017-04-05 19:59:03',1,15,274,1,2),(296,'2017-04-05 19:59:12',1,15,274,1,2),(297,'2017-04-05 19:59:20',1,15,274,1,2),(298,'2017-04-05 19:59:33',1,15,274,1,2),(299,'2017-04-05 20:03:23',1,15,274,1,2),(300,'2017-04-05 20:03:26',1,15,274,1,2),(301,'2017-04-05 20:03:27',1,15,274,1,2),(302,'2017-04-05 20:03:28',1,15,274,1,2),(303,'2017-04-05 20:03:39',1,15,274,1,2),(304,'2017-04-05 20:03:46',1,15,274,1,2),(305,'2017-04-05 20:03:53',1,15,274,1,2),(306,'2017-04-05 20:05:55',1,15,274,1,2),(307,'2017-04-05 20:06:14',1,15,274,1,2),(308,'2017-04-05 20:06:24',1,15,274,1,2),(309,'2017-04-05 20:06:57',1,15,274,1,2),(310,'2017-04-05 20:07:52',1,15,274,1,2),(311,'2017-04-05 20:09:04',1,15,274,1,2),(312,'2017-04-05 20:09:06',1,18,274,1,2),(313,'2017-04-05 20:11:33',1,18,274,1,2),(314,'2017-04-05 20:12:39',1,18,274,1,2),(315,'2017-04-05 20:25:59',1,15,274,1,2),(316,'2017-04-05 20:28:03',1,15,274,1,2),(317,'2017-04-05 20:28:20',1,15,274,1,2),(318,'2017-04-05 20:30:01',1,15,274,1,2),(319,'2017-04-05 20:30:28',1,15,274,1,2),(320,'2017-04-05 20:30:28',1,15,274,1,2),(321,'2017-04-05 20:31:18',1,15,274,1,2),(322,'2017-04-05 20:31:29',1,15,274,1,2),(323,'2017-04-05 20:31:58',1,15,274,1,2),(324,'2017-04-05 20:32:30',1,15,274,1,2),(325,'2017-04-05 20:32:37',1,15,274,1,2),(326,'2017-04-05 20:32:45',1,15,274,1,2),(327,'2017-04-05 20:32:58',1,15,274,1,2),(328,'2017-04-05 20:33:50',1,15,274,1,2),(329,'2017-04-05 20:33:52',1,14,274,1,2),(330,'2017-04-05 20:33:54',1,15,274,1,2),(331,'2017-04-05 20:33:56',1,15,274,1,2),(332,'2017-04-05 20:35:39',1,15,274,1,2),(333,'2017-04-05 20:35:40',1,15,274,1,2),(334,'2017-04-05 20:35:54',1,15,274,1,2),(335,'2017-04-05 20:35:56',1,15,274,1,2),(336,'2017-04-05 20:36:49',1,15,274,1,2),(337,'2017-04-05 20:38:05',1,15,274,1,2),(338,'2017-04-05 20:38:46',1,15,274,1,2),(339,'2017-04-05 20:38:53',1,15,274,1,2),(340,'2017-04-05 20:38:56',1,15,274,1,2),(341,'2017-04-05 20:38:57',1,14,274,1,2),(342,'2017-04-05 20:39:11',1,15,274,1,2),(343,'2017-04-05 20:42:41',1,15,274,1,2),(344,'2017-04-05 20:42:43',1,15,274,1,2),(345,'2017-04-05 20:43:28',1,15,274,1,2),(346,'2017-04-05 20:43:52',1,15,274,1,2),(347,'2017-04-05 20:44:23',1,15,274,1,2),(348,'2017-04-05 20:44:54',1,15,274,1,2),(349,'2017-04-05 20:44:55',1,15,274,1,2),(350,'2017-04-05 20:45:33',1,15,274,1,2),(351,'2017-04-05 20:47:35',1,15,274,1,2),(352,'2017-04-05 20:48:57',1,15,274,1,2),(353,'2017-04-05 20:50:15',1,15,274,1,2),(354,'2017-04-05 20:51:58',1,15,274,1,2),(355,'2017-04-05 20:52:25',1,15,274,1,2),(356,'2017-04-05 20:53:01',1,15,274,1,2),(357,'2017-04-05 20:53:02',1,15,274,1,2),(358,'2017-04-05 20:54:48',1,15,274,1,2),(359,'2017-04-05 20:55:41',1,15,274,1,2),(360,'2017-04-05 20:56:42',1,15,274,1,2),(361,'2017-04-05 20:56:59',1,15,274,1,2),(362,'2017-04-05 20:58:42',1,15,274,1,2),(363,'2017-04-05 20:59:23',1,15,274,1,2),(364,'2017-04-05 20:59:25',1,15,274,1,2),(365,'2017-04-05 20:59:26',1,15,274,1,2),(366,'2017-04-05 20:59:26',1,15,274,1,2),(367,'2017-04-05 21:00:13',1,15,274,1,2),(368,'2017-04-05 21:02:58',1,15,274,1,2),(369,'2017-04-05 21:03:09',1,15,274,1,2),(370,'2017-04-05 21:03:10',1,15,274,1,2),(371,'2017-04-05 21:03:17',1,15,274,1,2),(372,'2017-04-05 21:03:35',1,15,274,1,2),(373,'2017-04-05 21:05:41',1,15,274,1,2),(374,'2017-04-05 21:07:21',1,15,274,1,2),(375,'2017-04-05 21:07:22',1,15,274,1,2),(376,'2017-04-05 21:07:55',1,15,274,1,2),(377,'2017-04-05 21:10:37',1,15,274,1,2),(378,'2017-04-05 21:10:47',1,15,274,1,2),(379,'2017-04-05 21:10:48',1,15,274,1,2),(380,'2017-04-05 21:10:57',1,15,274,1,2),(381,'2017-04-05 21:11:23',1,15,274,1,2),(382,'2017-04-05 21:11:25',1,15,274,1,2),(383,'2017-04-05 21:11:25',1,15,274,1,2),(384,'2017-04-05 21:12:16',1,15,274,1,2),(385,'2017-04-05 21:12:17',1,15,274,1,2),(386,'2017-04-05 21:12:18',1,15,274,1,2),(387,'2017-04-05 21:12:55',1,15,274,1,2),(388,'2017-04-05 21:13:13',1,15,274,1,2),(389,'2017-04-05 21:15:21',1,15,274,1,2),(390,'2017-04-05 21:15:47',1,15,274,1,2),(391,'2017-04-05 21:15:56',1,15,274,1,2),(392,'2017-04-05 21:16:02',1,15,274,1,2),(393,'2017-04-05 21:16:07',1,15,274,1,2),(394,'2017-04-05 21:17:14',1,15,274,1,2),(395,'2017-04-05 21:19:41',1,15,274,1,2),(396,'2017-04-05 21:19:43',1,15,274,1,2),(397,'2017-04-05 21:19:49',1,15,274,1,2),(398,'2017-04-05 21:22:24',1,15,274,1,2),(399,'2017-04-05 21:23:53',1,15,274,1,2),(400,'2017-04-05 21:23:58',1,15,274,1,2),(401,'2017-04-05 21:29:24',1,15,274,1,2),(402,'2017-04-05 21:29:26',1,15,274,1,2),(403,'2017-04-05 21:29:45',1,15,274,1,2),(404,'2017-04-05 21:30:58',1,15,274,1,2),(405,'2017-04-05 21:30:59',1,15,274,1,2),(406,'2017-04-05 21:31:00',1,15,274,1,2),(407,'2017-04-05 21:31:45',1,15,274,1,2),(408,'2017-04-05 21:32:40',1,15,274,1,2),(409,'2017-04-05 21:32:41',1,15,274,1,2),(410,'2017-04-05 21:33:00',1,15,274,1,2),(411,'2017-04-05 21:33:03',1,15,274,1,2),(412,'2017-04-05 21:33:28',1,15,274,1,2),(413,'2017-04-05 21:34:31',1,15,274,1,2),(414,'2017-04-05 21:35:12',1,15,274,1,2),(415,'2017-04-05 21:35:38',1,15,274,1,2),(416,'2017-04-05 21:36:22',1,15,274,1,2),(417,'2017-04-05 21:36:43',1,15,274,1,2),(418,'2017-04-05 21:37:20',1,15,274,1,2),(419,'2017-04-05 21:45:11',1,15,274,1,2),(420,'2017-04-05 21:45:28',1,15,274,1,2),(421,'2017-04-05 21:59:45',1,15,274,1,2),(422,'2017-04-05 21:59:49',1,14,274,1,2),(423,'2017-04-05 21:59:53',1,15,274,1,2),(424,'2017-04-05 22:00:41',1,15,274,1,2),(425,'2017-04-05 22:00:57',1,15,274,1,2),(426,'2017-04-05 22:01:27',1,15,274,1,2),(427,'2017-04-05 22:01:31',1,13,274,1,2);
/*!40000 ALTER TABLE `magev1_report_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_report_event_types`
--

DROP TABLE IF EXISTS `magev1_report_event_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_report_event_types` (
  `event_type_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Event Type Id',
  `event_name` varchar(64) NOT NULL COMMENT 'Event Name',
  `customer_login` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Login',
  PRIMARY KEY (`event_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Reports Event Type Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_report_event_types`
--

LOCK TABLES `magev1_report_event_types` WRITE;
/*!40000 ALTER TABLE `magev1_report_event_types` DISABLE KEYS */;
INSERT INTO `magev1_report_event_types` VALUES (1,'catalog_product_view',0),(2,'sendfriend_product',0),(3,'catalog_product_compare_add_product',0),(4,'checkout_cart_add_product',0),(5,'wishlist_add_product',0),(6,'wishlist_share',0);
/*!40000 ALTER TABLE `magev1_report_event_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_report_viewed_product_aggregated_daily`
--

DROP TABLE IF EXISTS `magev1_report_viewed_product_aggregated_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_report_viewed_product_aggregated_daily` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `views_num` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of Views',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_MAGEV1_REPORT_VIEWED_PRD_AGGRED_DAILY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `IDX_MAGEV1_REPORT_VIEWED_PRODUCT_AGGREGATED_DAILY_STORE_ID` (`store_id`),
  KEY `IDX_MAGEV1_REPORT_VIEWED_PRODUCT_AGGREGATED_DAILY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_166BB67053E0604101A107083BF82552` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_2FCA8F2292C7C0C6F71B67853E178FE7` FOREIGN KEY (`product_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Most Viewed Products Aggregated Daily';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_report_viewed_product_aggregated_daily`
--

LOCK TABLES `magev1_report_viewed_product_aggregated_daily` WRITE;
/*!40000 ALTER TABLE `magev1_report_viewed_product_aggregated_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_report_viewed_product_aggregated_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_report_viewed_product_aggregated_monthly`
--

DROP TABLE IF EXISTS `magev1_report_viewed_product_aggregated_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_report_viewed_product_aggregated_monthly` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `views_num` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of Views',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `07606BF83A5B3A9539197899EF833A44` (`period`,`store_id`,`product_id`),
  KEY `IDX_MAGEV1_REPORT_VIEWED_PRODUCT_AGGREGATED_MONTHLY_STORE_ID` (`store_id`),
  KEY `IDX_MAGEV1_REPORT_VIEWED_PRODUCT_AGGREGATED_MONTHLY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_864CFEF6A0D43F5D47C74F7D98D57F92` FOREIGN KEY (`product_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_E4F65DADB01031E60A2CA19361BB4A47` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Most Viewed Products Aggregated Monthly';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_report_viewed_product_aggregated_monthly`
--

LOCK TABLES `magev1_report_viewed_product_aggregated_monthly` WRITE;
/*!40000 ALTER TABLE `magev1_report_viewed_product_aggregated_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_report_viewed_product_aggregated_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_report_viewed_product_aggregated_yearly`
--

DROP TABLE IF EXISTS `magev1_report_viewed_product_aggregated_yearly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_report_viewed_product_aggregated_yearly` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `views_num` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of Views',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `4B94DC08EA0BDD5D9FD5A25A9A4992A2` (`period`,`store_id`,`product_id`),
  KEY `IDX_MAGEV1_REPORT_VIEWED_PRODUCT_AGGREGATED_YEARLY_STORE_ID` (`store_id`),
  KEY `IDX_MAGEV1_REPORT_VIEWED_PRODUCT_AGGREGATED_YEARLY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_6F0BD8848A0029247D1A1012DD7C741E` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_FAEF079E66FCEB5038F6ED92FFAEFE86` FOREIGN KEY (`product_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Most Viewed Products Aggregated Yearly';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_report_viewed_product_aggregated_yearly`
--

LOCK TABLES `magev1_report_viewed_product_aggregated_yearly` WRITE;
/*!40000 ALTER TABLE `magev1_report_viewed_product_aggregated_yearly` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_report_viewed_product_aggregated_yearly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_report_viewed_product_index`
--

DROP TABLE IF EXISTS `magev1_report_viewed_product_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_report_viewed_product_index` (
  `index_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Index Id',
  `visitor_id` int(10) unsigned DEFAULT NULL COMMENT 'Visitor Id',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `added_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Added At',
  PRIMARY KEY (`index_id`),
  UNIQUE KEY `UNQ_MAGEV1_REPORT_VIEWED_PRODUCT_INDEX_VISITOR_ID_PRODUCT_ID` (`visitor_id`,`product_id`),
  UNIQUE KEY `UNQ_MAGEV1_REPORT_VIEWED_PRODUCT_INDEX_CUSTOMER_ID_PRODUCT_ID` (`customer_id`,`product_id`),
  KEY `IDX_MAGEV1_REPORT_VIEWED_PRODUCT_INDEX_STORE_ID` (`store_id`),
  KEY `IDX_MAGEV1_REPORT_VIEWED_PRODUCT_INDEX_ADDED_AT` (`added_at`),
  KEY `IDX_MAGEV1_REPORT_VIEWED_PRODUCT_INDEX_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_3F77BF5495DFFEBA76658A3518789E00` FOREIGN KEY (`product_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_72439F483EB599A70996EFE3A6A352AE` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_REPORT_VIEWED_PRD_IDX_CSTR_ID_MAGEV1_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `magev1_customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=412 DEFAULT CHARSET=utf8 COMMENT='Reports Viewed Product Index Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_report_viewed_product_index`
--

LOCK TABLES `magev1_report_viewed_product_index` WRITE;
/*!40000 ALTER TABLE `magev1_report_viewed_product_index` DISABLE KEYS */;
INSERT INTO `magev1_report_viewed_product_index` VALUES (84,271,NULL,15,1,'2017-04-05 12:16:53'),(86,271,NULL,14,1,'2017-04-05 09:52:13'),(89,271,NULL,16,1,'2017-04-05 11:08:08'),(126,272,NULL,14,1,'2017-04-05 12:47:30'),(127,273,NULL,14,2,'2017-04-05 17:07:32'),(128,273,NULL,16,2,'2017-04-05 17:07:37'),(129,273,NULL,15,2,'2017-04-05 18:09:48'),(196,274,NULL,15,2,'2017-04-05 22:01:27'),(229,274,NULL,16,2,'2017-04-05 19:05:16'),(296,274,NULL,18,2,'2017-04-05 20:12:39'),(313,274,NULL,14,2,'2017-04-05 21:59:49'),(411,274,NULL,13,2,'2017-04-05 22:01:31');
/*!40000 ALTER TABLE `magev1_report_viewed_product_index` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_review`
--

DROP TABLE IF EXISTS `magev1_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_review` (
  `review_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Review id',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Review create date',
  `entity_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity id',
  `entity_pk_value` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product id',
  `status_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Status code',
  PRIMARY KEY (`review_id`),
  KEY `IDX_MAGEV1_REVIEW_ENTITY_ID` (`entity_id`),
  KEY `IDX_MAGEV1_REVIEW_STATUS_ID` (`status_id`),
  KEY `IDX_MAGEV1_REVIEW_ENTITY_PK_VALUE` (`entity_pk_value`),
  CONSTRAINT `FK_MAGEV1_REVIEW_ENTITY_ID_MAGEV1_REVIEW_ENTITY_ENTITY_ID` FOREIGN KEY (`entity_id`) REFERENCES `magev1_review_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_REVIEW_STATUS_ID_MAGEV1_REVIEW_STATUS_STATUS_ID` FOREIGN KEY (`status_id`) REFERENCES `magev1_review_status` (`status_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review base information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_review`
--

LOCK TABLES `magev1_review` WRITE;
/*!40000 ALTER TABLE `magev1_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_review_detail`
--

DROP TABLE IF EXISTS `magev1_review_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_review_detail` (
  `detail_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Review detail id',
  `review_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'Review id',
  `store_id` smallint(5) unsigned DEFAULT '0' COMMENT 'Store id',
  `title` varchar(255) NOT NULL COMMENT 'Title',
  `detail` text NOT NULL COMMENT 'Detail description',
  `nickname` varchar(128) NOT NULL COMMENT 'User nickname',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  PRIMARY KEY (`detail_id`),
  KEY `IDX_MAGEV1_REVIEW_DETAIL_REVIEW_ID` (`review_id`),
  KEY `IDX_MAGEV1_REVIEW_DETAIL_STORE_ID` (`store_id`),
  KEY `IDX_MAGEV1_REVIEW_DETAIL_CUSTOMER_ID` (`customer_id`),
  CONSTRAINT `FK_MAGEV1_REVIEW_DETAIL_CSTR_ID_MAGEV1_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `magev1_customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_REVIEW_DETAIL_REVIEW_ID_MAGEV1_REVIEW_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `magev1_review` (`review_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_REVIEW_DETAIL_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review detail information';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_review_detail`
--

LOCK TABLES `magev1_review_detail` WRITE;
/*!40000 ALTER TABLE `magev1_review_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_review_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_review_entity`
--

DROP TABLE IF EXISTS `magev1_review_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_review_entity` (
  `entity_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Review entity id',
  `entity_code` varchar(32) NOT NULL COMMENT 'Review entity code',
  PRIMARY KEY (`entity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Review entities';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_review_entity`
--

LOCK TABLES `magev1_review_entity` WRITE;
/*!40000 ALTER TABLE `magev1_review_entity` DISABLE KEYS */;
INSERT INTO `magev1_review_entity` VALUES (1,'product'),(2,'customer'),(3,'category');
/*!40000 ALTER TABLE `magev1_review_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_review_entity_summary`
--

DROP TABLE IF EXISTS `magev1_review_entity_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_review_entity_summary` (
  `primary_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Summary review entity id',
  `entity_pk_value` bigint(20) NOT NULL DEFAULT '0' COMMENT 'Product id',
  `entity_type` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Entity type id',
  `reviews_count` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Qty of reviews',
  `rating_summary` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Summarized rating',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store id',
  PRIMARY KEY (`primary_id`),
  KEY `IDX_MAGEV1_REVIEW_ENTITY_SUMMARY_STORE_ID` (`store_id`),
  CONSTRAINT `FK_111402E422355DD0071205E3187251C0` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review aggregates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_review_entity_summary`
--

LOCK TABLES `magev1_review_entity_summary` WRITE;
/*!40000 ALTER TABLE `magev1_review_entity_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_review_entity_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_review_status`
--

DROP TABLE IF EXISTS `magev1_review_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_review_status` (
  `status_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Status id',
  `status_code` varchar(32) NOT NULL COMMENT 'Status code',
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Review statuses';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_review_status`
--

LOCK TABLES `magev1_review_status` WRITE;
/*!40000 ALTER TABLE `magev1_review_status` DISABLE KEYS */;
INSERT INTO `magev1_review_status` VALUES (1,'Approved'),(2,'Pending'),(3,'Not Approved');
/*!40000 ALTER TABLE `magev1_review_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_review_store`
--

DROP TABLE IF EXISTS `magev1_review_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_review_store` (
  `review_id` bigint(20) unsigned NOT NULL COMMENT 'Review Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  PRIMARY KEY (`review_id`,`store_id`),
  KEY `IDX_MAGEV1_REVIEW_STORE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_MAGEV1_REVIEW_STORE_REVIEW_ID_MAGEV1_REVIEW_REVIEW_ID` FOREIGN KEY (`review_id`) REFERENCES `magev1_review` (`review_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_REVIEW_STORE_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Review Store';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_review_store`
--

LOCK TABLES `magev1_review_store` WRITE;
/*!40000 ALTER TABLE `magev1_review_store` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_review_store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_sales_bestsellers_aggregated_daily`
--

DROP TABLE IF EXISTS `magev1_sales_bestsellers_aggregated_daily`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_sales_bestsellers_aggregated_daily` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_type_id` varchar(32) NOT NULL DEFAULT 'simple' COMMENT 'Product Type Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_MAGEV1_SALES_BESTSELLERS_AGGRED_DAILY_PERIOD_STORE_ID_PRD_ID` (`period`,`store_id`,`product_id`),
  KEY `IDX_MAGEV1_SALES_BESTSELLERS_AGGREGATED_DAILY_STORE_ID` (`store_id`),
  KEY `IDX_MAGEV1_SALES_BESTSELLERS_AGGREGATED_DAILY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_99014881ECF0769B656E5EBA2ABFF2B1` FOREIGN KEY (`product_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_9C628FEC4E7DA6B9F8168C872A13FA43` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Bestsellers Aggregated Daily';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_sales_bestsellers_aggregated_daily`
--

LOCK TABLES `magev1_sales_bestsellers_aggregated_daily` WRITE;
/*!40000 ALTER TABLE `magev1_sales_bestsellers_aggregated_daily` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_sales_bestsellers_aggregated_daily` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_sales_bestsellers_aggregated_monthly`
--

DROP TABLE IF EXISTS `magev1_sales_bestsellers_aggregated_monthly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_sales_bestsellers_aggregated_monthly` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_type_id` varchar(32) NOT NULL DEFAULT 'simple' COMMENT 'Product Type Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `3E3ED4CDA5F076435EEE8B5370DE843B` (`period`,`store_id`,`product_id`),
  KEY `IDX_MAGEV1_SALES_BESTSELLERS_AGGREGATED_MONTHLY_STORE_ID` (`store_id`),
  KEY `IDX_MAGEV1_SALES_BESTSELLERS_AGGREGATED_MONTHLY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_0C7448C214A15F52FAAD690FD9861CB5` FOREIGN KEY (`product_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_E928C69095DF19F2E7A9CAE42D6C1FD6` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Bestsellers Aggregated Monthly';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_sales_bestsellers_aggregated_monthly`
--

LOCK TABLES `magev1_sales_bestsellers_aggregated_monthly` WRITE;
/*!40000 ALTER TABLE `magev1_sales_bestsellers_aggregated_monthly` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_sales_bestsellers_aggregated_monthly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_sales_bestsellers_aggregated_yearly`
--

DROP TABLE IF EXISTS `magev1_sales_bestsellers_aggregated_yearly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_sales_bestsellers_aggregated_yearly` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_type_id` varchar(32) NOT NULL DEFAULT 'simple' COMMENT 'Product Type Id',
  `product_name` varchar(255) DEFAULT NULL COMMENT 'Product Name',
  `product_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Product Price',
  `qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `rating_pos` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Rating Pos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `E10034B0205CA18AD370D6B9D628AAAD` (`period`,`store_id`,`product_id`),
  KEY `IDX_MAGEV1_SALES_BESTSELLERS_AGGREGATED_YEARLY_STORE_ID` (`store_id`),
  KEY `IDX_MAGEV1_SALES_BESTSELLERS_AGGREGATED_YEARLY_PRODUCT_ID` (`product_id`),
  CONSTRAINT `FK_2F2D3C8F358D3CB3D07F3A1775500F4F` FOREIGN KEY (`product_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_FACC108B485C3D92AE300F5CD37AAA61` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Bestsellers Aggregated Yearly';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_sales_bestsellers_aggregated_yearly`
--

LOCK TABLES `magev1_sales_bestsellers_aggregated_yearly` WRITE;
/*!40000 ALTER TABLE `magev1_sales_bestsellers_aggregated_yearly` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_sales_bestsellers_aggregated_yearly` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_sales_billing_agreement`
--

DROP TABLE IF EXISTS `magev1_sales_billing_agreement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_sales_billing_agreement` (
  `agreement_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Agreement Id',
  `customer_id` int(10) unsigned NOT NULL COMMENT 'Customer Id',
  `method_code` varchar(32) NOT NULL COMMENT 'Method Code',
  `reference_id` varchar(32) NOT NULL COMMENT 'Reference Id',
  `status` varchar(20) NOT NULL COMMENT 'Status',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `agreement_label` varchar(255) DEFAULT NULL COMMENT 'Agreement Label',
  PRIMARY KEY (`agreement_id`),
  KEY `IDX_MAGEV1_SALES_BILLING_AGREEMENT_CUSTOMER_ID` (`customer_id`),
  KEY `IDX_MAGEV1_SALES_BILLING_AGREEMENT_STORE_ID` (`store_id`),
  CONSTRAINT `FK_MAGEV1_SALES_BILLING_AGRT_CSTR_ID_MAGEV1_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `magev1_customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_SALES_BILLING_AGRT_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Billing Agreement';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_sales_billing_agreement`
--

LOCK TABLES `magev1_sales_billing_agreement` WRITE;
/*!40000 ALTER TABLE `magev1_sales_billing_agreement` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_sales_billing_agreement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_sales_billing_agreement_order`
--

DROP TABLE IF EXISTS `magev1_sales_billing_agreement_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_sales_billing_agreement_order` (
  `agreement_id` int(10) unsigned NOT NULL COMMENT 'Agreement Id',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  PRIMARY KEY (`agreement_id`,`order_id`),
  KEY `IDX_MAGEV1_SALES_BILLING_AGREEMENT_ORDER_ORDER_ID` (`order_id`),
  CONSTRAINT `FK_8C89E890C20F0435148633AB8BFC8058` FOREIGN KEY (`order_id`) REFERENCES `magev1_sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_DAE760704D04E3E706925DD9C507B900` FOREIGN KEY (`agreement_id`) REFERENCES `magev1_sales_billing_agreement` (`agreement_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Billing Agreement Order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_sales_billing_agreement_order`
--

LOCK TABLES `magev1_sales_billing_agreement_order` WRITE;
/*!40000 ALTER TABLE `magev1_sales_billing_agreement_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_sales_billing_agreement_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_sales_flat_creditmemo`
--

DROP TABLE IF EXISTS `magev1_sales_flat_creditmemo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_sales_flat_creditmemo` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Positive',
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `store_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `base_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `base_adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment Negative',
  `base_subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Incl Tax',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Negative',
  `base_shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `store_to_base_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_adjustment` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment',
  `base_subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `adjustment` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `base_adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment Positive',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `email_sent` smallint(5) unsigned DEFAULT NULL COMMENT 'Email Sent',
  `creditmemo_status` int(11) DEFAULT NULL COMMENT 'Creditmemo Status',
  `state` int(11) DEFAULT NULL COMMENT 'State',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address Id',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address Id',
  `invoice_id` int(11) DEFAULT NULL COMMENT 'Invoice Id',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `transaction_id` varchar(255) DEFAULT NULL COMMENT 'Transaction Id',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `shipping_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Hidden Tax Amount',
  `base_shipping_hidden_tax_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Hidden Tax Amount',
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_MAGEV1_SALES_FLAT_CREDITMEMO_INCREMENT_ID` (`increment_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_CREDITMEMO_STORE_ID` (`store_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_CREDITMEMO_ORDER_ID` (`order_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_CREDITMEMO_CREDITMEMO_STATUS` (`creditmemo_status`),
  KEY `IDX_MAGEV1_SALES_FLAT_CREDITMEMO_STATE` (`state`),
  KEY `IDX_MAGEV1_SALES_FLAT_CREDITMEMO_CREATED_AT` (`created_at`),
  CONSTRAINT `FK_3CA9202379D357BBAF0EC0A8C3881119` FOREIGN KEY (`order_id`) REFERENCES `magev1_sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_801F972DBC8DC632E4EC6ABF53DA05D3` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_sales_flat_creditmemo`
--

LOCK TABLES `magev1_sales_flat_creditmemo` WRITE;
/*!40000 ALTER TABLE `magev1_sales_flat_creditmemo` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_sales_flat_creditmemo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_sales_flat_creditmemo_comment`
--

DROP TABLE IF EXISTS `magev1_sales_flat_creditmemo_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_sales_flat_creditmemo_comment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `is_customer_notified` int(11) DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_CREDITMEMO_COMMENT_CREATED_AT` (`created_at`),
  KEY `IDX_MAGEV1_SALES_FLAT_CREDITMEMO_COMMENT_PARENT_ID` (`parent_id`),
  CONSTRAINT `FK_C36E1328161E4663FFB5FABF9D0DD4AA` FOREIGN KEY (`parent_id`) REFERENCES `magev1_sales_flat_creditmemo` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo Comment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_sales_flat_creditmemo_comment`
--

LOCK TABLES `magev1_sales_flat_creditmemo_comment` WRITE;
/*!40000 ALTER TABLE `magev1_sales_flat_creditmemo_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_sales_flat_creditmemo_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_sales_flat_creditmemo_grid`
--

DROP TABLE IF EXISTS `magev1_sales_flat_creditmemo_grid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_sales_flat_creditmemo_grid` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `store_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `base_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `store_to_base_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `creditmemo_status` int(11) DEFAULT NULL COMMENT 'Creditmemo Status',
  `state` int(11) DEFAULT NULL COMMENT 'State',
  `invoice_id` int(11) DEFAULT NULL COMMENT 'Invoice Id',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment Id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `order_created_at` timestamp NULL DEFAULT NULL COMMENT 'Order Created At',
  `billing_name` varchar(255) DEFAULT NULL COMMENT 'Billing Name',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_MAGEV1_SALES_FLAT_CREDITMEMO_GRID_INCREMENT_ID` (`increment_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_CREDITMEMO_GRID_STORE_ID` (`store_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_CREDITMEMO_GRID_GRAND_TOTAL` (`grand_total`),
  KEY `IDX_MAGEV1_SALES_FLAT_CREDITMEMO_GRID_BASE_GRAND_TOTAL` (`base_grand_total`),
  KEY `IDX_MAGEV1_SALES_FLAT_CREDITMEMO_GRID_ORDER_ID` (`order_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_CREDITMEMO_GRID_CREDITMEMO_STATUS` (`creditmemo_status`),
  KEY `IDX_MAGEV1_SALES_FLAT_CREDITMEMO_GRID_STATE` (`state`),
  KEY `IDX_MAGEV1_SALES_FLAT_CREDITMEMO_GRID_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_CREDITMEMO_GRID_CREATED_AT` (`created_at`),
  KEY `IDX_MAGEV1_SALES_FLAT_CREDITMEMO_GRID_ORDER_CREATED_AT` (`order_created_at`),
  KEY `IDX_MAGEV1_SALES_FLAT_CREDITMEMO_GRID_BILLING_NAME` (`billing_name`),
  CONSTRAINT `FK_67146E70593340A4B0D19170BF7CAF16` FOREIGN KEY (`entity_id`) REFERENCES `magev1_sales_flat_creditmemo` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_FC5128ACB507821F93ED2233ECEE9841` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo Grid';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_sales_flat_creditmemo_grid`
--

LOCK TABLES `magev1_sales_flat_creditmemo_grid` WRITE;
/*!40000 ALTER TABLE `magev1_sales_flat_creditmemo_grid` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_sales_flat_creditmemo_grid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_sales_flat_creditmemo_item`
--

DROP TABLE IF EXISTS `magev1_sales_flat_creditmemo_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_sales_flat_creditmemo_item` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `base_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Price',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `base_row_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `row_total` decimal(12,4) DEFAULT NULL COMMENT 'Row Total',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `product_id` int(11) DEFAULT NULL COMMENT 'Product Id',
  `order_item_id` int(11) DEFAULT NULL COMMENT 'Order Item Id',
  `additional_data` text COMMENT 'Additional Data',
  `description` text COMMENT 'Description',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_CREDITMEMO_ITEM_PARENT_ID` (`parent_id`),
  CONSTRAINT `FK_EEA29F3AAC89832BCF90ABE8807F4147` FOREIGN KEY (`parent_id`) REFERENCES `magev1_sales_flat_creditmemo` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Creditmemo Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_sales_flat_creditmemo_item`
--

LOCK TABLES `magev1_sales_flat_creditmemo_item` WRITE;
/*!40000 ALTER TABLE `magev1_sales_flat_creditmemo_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_sales_flat_creditmemo_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_sales_flat_invoice`
--

DROP TABLE IF EXISTS `magev1_sales_flat_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_sales_flat_invoice` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `store_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `base_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `base_subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Incl Tax',
  `store_to_base_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `base_shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `total_qty` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `base_subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address Id',
  `is_used_for_refund` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Used For Refund',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `email_sent` smallint(5) unsigned DEFAULT NULL COMMENT 'Email Sent',
  `can_void_flag` smallint(5) unsigned DEFAULT NULL COMMENT 'Can Void Flag',
  `state` int(11) DEFAULT NULL COMMENT 'State',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address Id',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `transaction_id` varchar(255) DEFAULT NULL COMMENT 'Transaction Id',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `shipping_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Hidden Tax Amount',
  `base_shipping_hidden_tax_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Hidden Tax Amount',
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `base_total_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Refunded',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_MAGEV1_SALES_FLAT_INVOICE_INCREMENT_ID` (`increment_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_INVOICE_STORE_ID` (`store_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_INVOICE_GRAND_TOTAL` (`grand_total`),
  KEY `IDX_MAGEV1_SALES_FLAT_INVOICE_ORDER_ID` (`order_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_INVOICE_STATE` (`state`),
  KEY `IDX_MAGEV1_SALES_FLAT_INVOICE_CREATED_AT` (`created_at`),
  CONSTRAINT `FK_76770B38EEEBE55D5AB521BD97915E07` FOREIGN KEY (`order_id`) REFERENCES `magev1_sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_SALES_FLAT_INVOICE_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_sales_flat_invoice`
--

LOCK TABLES `magev1_sales_flat_invoice` WRITE;
/*!40000 ALTER TABLE `magev1_sales_flat_invoice` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_sales_flat_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_sales_flat_invoice_comment`
--

DROP TABLE IF EXISTS `magev1_sales_flat_invoice_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_sales_flat_invoice_comment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `is_customer_notified` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_INVOICE_COMMENT_CREATED_AT` (`created_at`),
  KEY `IDX_MAGEV1_SALES_FLAT_INVOICE_COMMENT_PARENT_ID` (`parent_id`),
  CONSTRAINT `FK_524548ACC9A545EB31370DE154FE7853` FOREIGN KEY (`parent_id`) REFERENCES `magev1_sales_flat_invoice` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice Comment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_sales_flat_invoice_comment`
--

LOCK TABLES `magev1_sales_flat_invoice_comment` WRITE;
/*!40000 ALTER TABLE `magev1_sales_flat_invoice_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_sales_flat_invoice_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_sales_flat_invoice_grid`
--

DROP TABLE IF EXISTS `magev1_sales_flat_invoice_grid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_sales_flat_invoice_grid` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `state` int(11) DEFAULT NULL COMMENT 'State',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `order_currency_code` varchar(3) DEFAULT NULL COMMENT 'Order Currency Code',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment Id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `order_created_at` timestamp NULL DEFAULT NULL COMMENT 'Order Created At',
  `billing_name` varchar(255) DEFAULT NULL COMMENT 'Billing Name',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_MAGEV1_SALES_FLAT_INVOICE_GRID_INCREMENT_ID` (`increment_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_INVOICE_GRID_STORE_ID` (`store_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_INVOICE_GRID_GRAND_TOTAL` (`grand_total`),
  KEY `IDX_MAGEV1_SALES_FLAT_INVOICE_GRID_ORDER_ID` (`order_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_INVOICE_GRID_STATE` (`state`),
  KEY `IDX_MAGEV1_SALES_FLAT_INVOICE_GRID_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_INVOICE_GRID_CREATED_AT` (`created_at`),
  KEY `IDX_MAGEV1_SALES_FLAT_INVOICE_GRID_ORDER_CREATED_AT` (`order_created_at`),
  KEY `IDX_MAGEV1_SALES_FLAT_INVOICE_GRID_BILLING_NAME` (`billing_name`),
  CONSTRAINT `FK_2FECE76BF5BFA834AC5F542B740013D5` FOREIGN KEY (`entity_id`) REFERENCES `magev1_sales_flat_invoice` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ADFAEBAE66DA04C95131CA16FC6F6E80` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice Grid';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_sales_flat_invoice_grid`
--

LOCK TABLES `magev1_sales_flat_invoice_grid` WRITE;
/*!40000 ALTER TABLE `magev1_sales_flat_invoice_grid` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_sales_flat_invoice_grid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_sales_flat_invoice_item`
--

DROP TABLE IF EXISTS `magev1_sales_flat_invoice_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_sales_flat_invoice_item` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `base_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Price',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `base_row_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `row_total` decimal(12,4) DEFAULT NULL COMMENT 'Row Total',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `product_id` int(11) DEFAULT NULL COMMENT 'Product Id',
  `order_item_id` int(11) DEFAULT NULL COMMENT 'Order Item Id',
  `additional_data` text COMMENT 'Additional Data',
  `description` text COMMENT 'Description',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_INVOICE_ITEM_PARENT_ID` (`parent_id`),
  CONSTRAINT `FK_4F76F93E01AAD01948225B65B76030A4` FOREIGN KEY (`parent_id`) REFERENCES `magev1_sales_flat_invoice` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Invoice Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_sales_flat_invoice_item`
--

LOCK TABLES `magev1_sales_flat_invoice_item` WRITE;
/*!40000 ALTER TABLE `magev1_sales_flat_invoice_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_sales_flat_invoice_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_sales_flat_order`
--

DROP TABLE IF EXISTS `magev1_sales_flat_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_sales_flat_order` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `state` varchar(32) DEFAULT NULL COMMENT 'State',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `coupon_code` varchar(255) DEFAULT NULL COMMENT 'Coupon Code',
  `protect_code` varchar(255) DEFAULT NULL COMMENT 'Protect Code',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `is_virtual` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Virtual',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `base_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Amount',
  `base_discount_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Canceled',
  `base_discount_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Invoiced',
  `base_discount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Refunded',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `base_shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `base_shipping_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Canceled',
  `base_shipping_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Invoiced',
  `base_shipping_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Refunded',
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `base_shipping_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Refunded',
  `base_subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `base_subtotal_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Canceled',
  `base_subtotal_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Invoiced',
  `base_subtotal_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Refunded',
  `base_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Amount',
  `base_tax_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Canceled',
  `base_tax_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Invoiced',
  `base_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Refunded',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Order Rate',
  `base_total_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Canceled',
  `base_total_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Invoiced',
  `base_total_invoiced_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Invoiced Cost',
  `base_total_offline_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Offline Refunded',
  `base_total_online_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Online Refunded',
  `base_total_paid` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Paid',
  `base_total_qty_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Qty Ordered',
  `base_total_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Refunded',
  `discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Discount Amount',
  `discount_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Discount Canceled',
  `discount_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Discount Invoiced',
  `discount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Discount Refunded',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `shipping_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Canceled',
  `shipping_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Invoiced',
  `shipping_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Refunded',
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `shipping_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Refunded',
  `store_to_base_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Base Rate',
  `store_to_order_rate` decimal(12,4) DEFAULT NULL COMMENT 'Store To Order Rate',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `subtotal_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Canceled',
  `subtotal_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Invoiced',
  `subtotal_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Refunded',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `tax_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Tax Canceled',
  `tax_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Tax Invoiced',
  `tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Tax Refunded',
  `total_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Total Canceled',
  `total_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Total Invoiced',
  `total_offline_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Total Offline Refunded',
  `total_online_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Total Online Refunded',
  `total_paid` decimal(12,4) DEFAULT NULL COMMENT 'Total Paid',
  `total_qty_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty Ordered',
  `total_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Total Refunded',
  `can_ship_partially` smallint(5) unsigned DEFAULT NULL COMMENT 'Can Ship Partially',
  `can_ship_partially_item` smallint(5) unsigned DEFAULT NULL COMMENT 'Can Ship Partially Item',
  `customer_is_guest` smallint(5) unsigned DEFAULT NULL COMMENT 'Customer Is Guest',
  `customer_note_notify` smallint(5) unsigned DEFAULT NULL COMMENT 'Customer Note Notify',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address Id',
  `customer_group_id` smallint(6) DEFAULT NULL COMMENT 'Customer Group Id',
  `edit_increment` int(11) DEFAULT NULL COMMENT 'Edit Increment',
  `email_sent` smallint(5) unsigned DEFAULT NULL COMMENT 'Email Sent',
  `forced_shipment_with_invoice` smallint(5) unsigned DEFAULT NULL COMMENT 'Forced Do Shipment With Invoice',
  `payment_auth_expiration` int(11) DEFAULT NULL COMMENT 'Payment Authorization Expiration',
  `quote_address_id` int(11) DEFAULT NULL COMMENT 'Quote Address Id',
  `quote_id` int(11) DEFAULT NULL COMMENT 'Quote Id',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address Id',
  `adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Negative',
  `adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Adjustment Positive',
  `base_adjustment_negative` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment Negative',
  `base_adjustment_positive` decimal(12,4) DEFAULT NULL COMMENT 'Base Adjustment Positive',
  `base_shipping_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Discount Amount',
  `base_subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Incl Tax',
  `base_total_due` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Due',
  `payment_authorization_amount` decimal(12,4) DEFAULT NULL COMMENT 'Payment Authorization Amount',
  `shipping_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Discount Amount',
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `total_due` decimal(12,4) DEFAULT NULL COMMENT 'Total Due',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'Weight',
  `customer_dob` datetime DEFAULT NULL COMMENT 'Customer Dob',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `applied_rule_ids` varchar(255) DEFAULT NULL COMMENT 'Applied Rule Ids',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `customer_email` varchar(255) DEFAULT NULL COMMENT 'Customer Email',
  `customer_firstname` varchar(255) DEFAULT NULL COMMENT 'Customer Firstname',
  `customer_lastname` varchar(255) DEFAULT NULL COMMENT 'Customer Lastname',
  `customer_middlename` varchar(255) DEFAULT NULL COMMENT 'Customer Middlename',
  `customer_prefix` varchar(255) DEFAULT NULL COMMENT 'Customer Prefix',
  `customer_suffix` varchar(255) DEFAULT NULL COMMENT 'Customer Suffix',
  `customer_taxvat` varchar(255) DEFAULT NULL COMMENT 'Customer Taxvat',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `ext_customer_id` varchar(255) DEFAULT NULL COMMENT 'Ext Customer Id',
  `ext_order_id` varchar(255) DEFAULT NULL COMMENT 'Ext Order Id',
  `global_currency_code` varchar(3) DEFAULT NULL COMMENT 'Global Currency Code',
  `hold_before_state` varchar(255) DEFAULT NULL COMMENT 'Hold Before State',
  `hold_before_status` varchar(255) DEFAULT NULL COMMENT 'Hold Before Status',
  `order_currency_code` varchar(255) DEFAULT NULL COMMENT 'Order Currency Code',
  `original_increment_id` varchar(50) DEFAULT NULL COMMENT 'Original Increment Id',
  `relation_child_id` varchar(32) DEFAULT NULL COMMENT 'Relation Child Id',
  `relation_child_real_id` varchar(32) DEFAULT NULL COMMENT 'Relation Child Real Id',
  `relation_parent_id` varchar(32) DEFAULT NULL COMMENT 'Relation Parent Id',
  `relation_parent_real_id` varchar(32) DEFAULT NULL COMMENT 'Relation Parent Real Id',
  `remote_ip` varchar(255) DEFAULT NULL COMMENT 'Remote Ip',
  `shipping_method` varchar(255) DEFAULT NULL COMMENT 'Shipping Method',
  `store_currency_code` varchar(3) DEFAULT NULL COMMENT 'Store Currency Code',
  `store_name` varchar(255) DEFAULT NULL COMMENT 'Store Name',
  `x_forwarded_for` varchar(255) DEFAULT NULL COMMENT 'X Forwarded For',
  `customer_note` text COMMENT 'Customer Note',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `total_item_count` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Total Item Count',
  `customer_gender` int(11) DEFAULT NULL COMMENT 'Customer Gender',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `shipping_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Hidden Tax Amount',
  `base_shipping_hidden_tax_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Hidden Tax Amount',
  `hidden_tax_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Invoiced',
  `base_hidden_tax_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Invoiced',
  `hidden_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Refunded',
  `base_hidden_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Refunded',
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `coupon_rule_name` varchar(255) DEFAULT NULL COMMENT 'Coupon Sales Rule Name',
  `paypal_ipn_customer_notified` int(11) DEFAULT '0' COMMENT 'Paypal Ipn Customer Notified',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_MAGEV1_SALES_FLAT_ORDER_INCREMENT_ID` (`increment_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_ORDER_STATUS` (`status`),
  KEY `IDX_MAGEV1_SALES_FLAT_ORDER_STATE` (`state`),
  KEY `IDX_MAGEV1_SALES_FLAT_ORDER_STORE_ID` (`store_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_ORDER_CREATED_AT` (`created_at`),
  KEY `IDX_MAGEV1_SALES_FLAT_ORDER_CUSTOMER_ID` (`customer_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_ORDER_EXT_ORDER_ID` (`ext_order_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_ORDER_QUOTE_ID` (`quote_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_ORDER_UPDATED_AT` (`updated_at`),
  CONSTRAINT `FK_MAGEV1_SALES_FLAT_ORDER_CSTR_ID_MAGEV1_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `magev1_customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_SALES_FLAT_ORDER_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_sales_flat_order`
--

LOCK TABLES `magev1_sales_flat_order` WRITE;
/*!40000 ALTER TABLE `magev1_sales_flat_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_sales_flat_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_sales_flat_order_address`
--

DROP TABLE IF EXISTS `magev1_sales_flat_order_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_sales_flat_order_address` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Id',
  `customer_address_id` int(11) DEFAULT NULL COMMENT 'Customer Address Id',
  `quote_address_id` int(11) DEFAULT NULL COMMENT 'Quote Address Id',
  `region_id` int(11) DEFAULT NULL COMMENT 'Region Id',
  `customer_id` int(11) DEFAULT NULL COMMENT 'Customer Id',
  `fax` varchar(255) DEFAULT NULL COMMENT 'Fax',
  `region` varchar(255) DEFAULT NULL COMMENT 'Region',
  `postcode` varchar(255) DEFAULT NULL COMMENT 'Postcode',
  `lastname` varchar(255) DEFAULT NULL COMMENT 'Lastname',
  `street` varchar(255) DEFAULT NULL COMMENT 'Street',
  `city` varchar(255) DEFAULT NULL COMMENT 'City',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `telephone` varchar(255) DEFAULT NULL COMMENT 'Telephone',
  `country_id` varchar(2) DEFAULT NULL COMMENT 'Country Id',
  `firstname` varchar(255) DEFAULT NULL COMMENT 'Firstname',
  `address_type` varchar(255) DEFAULT NULL COMMENT 'Address Type',
  `prefix` varchar(255) DEFAULT NULL COMMENT 'Prefix',
  `middlename` varchar(255) DEFAULT NULL COMMENT 'Middlename',
  `suffix` varchar(255) DEFAULT NULL COMMENT 'Suffix',
  `company` varchar(255) DEFAULT NULL COMMENT 'Company',
  `vat_id` text COMMENT 'Vat Id',
  `vat_is_valid` smallint(6) DEFAULT NULL COMMENT 'Vat Is Valid',
  `vat_request_id` text COMMENT 'Vat Request Id',
  `vat_request_date` text COMMENT 'Vat Request Date',
  `vat_request_success` smallint(6) DEFAULT NULL COMMENT 'Vat Request Success',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_ORDER_ADDRESS_PARENT_ID` (`parent_id`),
  CONSTRAINT `FK_AABB1715F7B39C804A610BDB3E10F374` FOREIGN KEY (`parent_id`) REFERENCES `magev1_sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Address';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_sales_flat_order_address`
--

LOCK TABLES `magev1_sales_flat_order_address` WRITE;
/*!40000 ALTER TABLE `magev1_sales_flat_order_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_sales_flat_order_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_sales_flat_order_grid`
--

DROP TABLE IF EXISTS `magev1_sales_flat_order_grid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_sales_flat_order_grid` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `store_name` varchar(255) DEFAULT NULL COMMENT 'Store Name',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `base_grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Base Grand Total',
  `base_total_paid` decimal(12,4) DEFAULT NULL COMMENT 'Base Total Paid',
  `grand_total` decimal(12,4) DEFAULT NULL COMMENT 'Grand Total',
  `total_paid` decimal(12,4) DEFAULT NULL COMMENT 'Total Paid',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `base_currency_code` varchar(3) DEFAULT NULL COMMENT 'Base Currency Code',
  `order_currency_code` varchar(255) DEFAULT NULL COMMENT 'Order Currency Code',
  `shipping_name` varchar(255) DEFAULT NULL COMMENT 'Shipping Name',
  `billing_name` varchar(255) DEFAULT NULL COMMENT 'Billing Name',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_MAGEV1_SALES_FLAT_ORDER_GRID_INCREMENT_ID` (`increment_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_ORDER_GRID_STATUS` (`status`),
  KEY `IDX_MAGEV1_SALES_FLAT_ORDER_GRID_STORE_ID` (`store_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_ORDER_GRID_BASE_GRAND_TOTAL` (`base_grand_total`),
  KEY `IDX_MAGEV1_SALES_FLAT_ORDER_GRID_BASE_TOTAL_PAID` (`base_total_paid`),
  KEY `IDX_MAGEV1_SALES_FLAT_ORDER_GRID_GRAND_TOTAL` (`grand_total`),
  KEY `IDX_MAGEV1_SALES_FLAT_ORDER_GRID_TOTAL_PAID` (`total_paid`),
  KEY `IDX_MAGEV1_SALES_FLAT_ORDER_GRID_SHIPPING_NAME` (`shipping_name`),
  KEY `IDX_MAGEV1_SALES_FLAT_ORDER_GRID_BILLING_NAME` (`billing_name`),
  KEY `IDX_MAGEV1_SALES_FLAT_ORDER_GRID_CREATED_AT` (`created_at`),
  KEY `IDX_MAGEV1_SALES_FLAT_ORDER_GRID_CUSTOMER_ID` (`customer_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_ORDER_GRID_UPDATED_AT` (`updated_at`),
  CONSTRAINT `FK_29D0818282A3557AF6D3A03264D0A676` FOREIGN KEY (`entity_id`) REFERENCES `magev1_sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_3EF58014837DC7ACD3C0A6BCABA9E533` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_SALES_FLAT_ORDER_GRID_CSTR_ID_MAGEV1_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `magev1_customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Grid';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_sales_flat_order_grid`
--

LOCK TABLES `magev1_sales_flat_order_grid` WRITE;
/*!40000 ALTER TABLE `magev1_sales_flat_order_grid` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_sales_flat_order_grid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_sales_flat_order_item`
--

DROP TABLE IF EXISTS `magev1_sales_flat_order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_sales_flat_order_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item Id',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Order Id',
  `parent_item_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Item Id',
  `quote_item_id` int(10) unsigned DEFAULT NULL COMMENT 'Quote Item Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Updated At',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `product_type` varchar(255) DEFAULT NULL COMMENT 'Product Type',
  `product_options` text COMMENT 'Product Options',
  `weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Weight',
  `is_virtual` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Virtual',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `applied_rule_ids` text COMMENT 'Applied Rule Ids',
  `additional_data` text COMMENT 'Additional Data',
  `free_shipping` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Free Shipping',
  `is_qty_decimal` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Qty Decimal',
  `no_discount` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'No Discount',
  `qty_backordered` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Backordered',
  `qty_canceled` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Canceled',
  `qty_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Invoiced',
  `qty_ordered` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Ordered',
  `qty_refunded` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Refunded',
  `qty_shipped` decimal(12,4) DEFAULT '0.0000' COMMENT 'Qty Shipped',
  `base_cost` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Cost',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Price',
  `original_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Price',
  `base_original_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Original Price',
  `tax_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Percent',
  `tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Amount',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `tax_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Invoiced',
  `base_tax_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Tax Invoiced',
  `discount_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Percent',
  `discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Amount',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `discount_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Invoiced',
  `base_discount_invoiced` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Discount Invoiced',
  `amount_refunded` decimal(12,4) DEFAULT '0.0000' COMMENT 'Amount Refunded',
  `base_amount_refunded` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Amount Refunded',
  `row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Total',
  `base_row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Total',
  `row_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Invoiced',
  `base_row_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Invoiced',
  `row_weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Weight',
  `base_tax_before_discount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Before Discount',
  `tax_before_discount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Before Discount',
  `ext_order_item_id` varchar(255) DEFAULT NULL COMMENT 'Ext Order Item Id',
  `locked_do_invoice` smallint(5) unsigned DEFAULT NULL COMMENT 'Locked Do Invoice',
  `locked_do_ship` smallint(5) unsigned DEFAULT NULL COMMENT 'Locked Do Ship',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `hidden_tax_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Invoiced',
  `base_hidden_tax_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Invoiced',
  `hidden_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Refunded',
  `base_hidden_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Refunded',
  `is_nominal` int(11) NOT NULL DEFAULT '0' COMMENT 'Is Nominal',
  `tax_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Tax Canceled',
  `hidden_tax_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Canceled',
  `tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Tax Refunded',
  `base_tax_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Refunded',
  `discount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Discount Refunded',
  `base_discount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Discount Refunded',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  `gift_message_available` int(11) DEFAULT NULL COMMENT 'Gift Message Available',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  PRIMARY KEY (`item_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_ORDER_ITEM_ORDER_ID` (`order_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_ORDER_ITEM_STORE_ID` (`store_id`),
  CONSTRAINT `FK_4D8B455ACC30CA6A70E7178861062033` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_CF128E9A6E41B7D6AC07E718DE7F0362` FOREIGN KEY (`order_id`) REFERENCES `magev1_sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_sales_flat_order_item`
--

LOCK TABLES `magev1_sales_flat_order_item` WRITE;
/*!40000 ALTER TABLE `magev1_sales_flat_order_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_sales_flat_order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_sales_flat_order_payment`
--

DROP TABLE IF EXISTS `magev1_sales_flat_order_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_sales_flat_order_payment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `base_shipping_captured` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Captured',
  `shipping_captured` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Captured',
  `amount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Amount Refunded',
  `base_amount_paid` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Paid',
  `amount_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Amount Canceled',
  `base_amount_authorized` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Authorized',
  `base_amount_paid_online` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Paid Online',
  `base_amount_refunded_online` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Refunded Online',
  `base_shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Amount',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `amount_paid` decimal(12,4) DEFAULT NULL COMMENT 'Amount Paid',
  `amount_authorized` decimal(12,4) DEFAULT NULL COMMENT 'Amount Authorized',
  `base_amount_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Ordered',
  `base_shipping_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Refunded',
  `shipping_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Refunded',
  `base_amount_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Refunded',
  `amount_ordered` decimal(12,4) DEFAULT NULL COMMENT 'Amount Ordered',
  `base_amount_canceled` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount Canceled',
  `quote_payment_id` int(11) DEFAULT NULL COMMENT 'Quote Payment Id',
  `additional_data` text COMMENT 'Additional Data',
  `cc_exp_month` varchar(255) DEFAULT NULL COMMENT 'Cc Exp Month',
  `cc_ss_start_year` varchar(255) DEFAULT NULL COMMENT 'Cc Ss Start Year',
  `echeck_bank_name` varchar(255) DEFAULT NULL COMMENT 'Echeck Bank Name',
  `method` varchar(255) DEFAULT NULL COMMENT 'Method',
  `cc_debug_request_body` varchar(255) DEFAULT NULL COMMENT 'Cc Debug Request Body',
  `cc_secure_verify` varchar(255) DEFAULT NULL COMMENT 'Cc Secure Verify',
  `protection_eligibility` varchar(255) DEFAULT NULL COMMENT 'Protection Eligibility',
  `cc_approval` varchar(255) DEFAULT NULL COMMENT 'Cc Approval',
  `cc_last4` varchar(255) DEFAULT NULL COMMENT 'Cc Last4',
  `cc_status_description` varchar(255) DEFAULT NULL COMMENT 'Cc Status Description',
  `echeck_type` varchar(255) DEFAULT NULL COMMENT 'Echeck Type',
  `cc_debug_response_serialized` varchar(255) DEFAULT NULL COMMENT 'Cc Debug Response Serialized',
  `cc_ss_start_month` varchar(255) DEFAULT NULL COMMENT 'Cc Ss Start Month',
  `echeck_account_type` varchar(255) DEFAULT NULL COMMENT 'Echeck Account Type',
  `last_trans_id` varchar(255) DEFAULT NULL COMMENT 'Last Trans Id',
  `cc_cid_status` varchar(255) DEFAULT NULL COMMENT 'Cc Cid Status',
  `cc_owner` varchar(255) DEFAULT NULL COMMENT 'Cc Owner',
  `cc_type` varchar(255) DEFAULT NULL COMMENT 'Cc Type',
  `po_number` varchar(255) DEFAULT NULL COMMENT 'Po Number',
  `cc_exp_year` varchar(255) DEFAULT NULL COMMENT 'Cc Exp Year',
  `cc_status` varchar(255) DEFAULT NULL COMMENT 'Cc Status',
  `echeck_routing_number` varchar(255) DEFAULT NULL COMMENT 'Echeck Routing Number',
  `account_status` varchar(255) DEFAULT NULL COMMENT 'Account Status',
  `anet_trans_method` varchar(255) DEFAULT NULL COMMENT 'Anet Trans Method',
  `cc_debug_response_body` varchar(255) DEFAULT NULL COMMENT 'Cc Debug Response Body',
  `cc_ss_issue` varchar(255) DEFAULT NULL COMMENT 'Cc Ss Issue',
  `echeck_account_name` varchar(255) DEFAULT NULL COMMENT 'Echeck Account Name',
  `cc_avs_status` varchar(255) DEFAULT NULL COMMENT 'Cc Avs Status',
  `cc_number_enc` varchar(255) DEFAULT NULL COMMENT 'Cc Number Enc',
  `cc_trans_id` varchar(255) DEFAULT NULL COMMENT 'Cc Trans Id',
  `paybox_request_number` varchar(255) DEFAULT NULL COMMENT 'Paybox Request Number',
  `address_status` varchar(255) DEFAULT NULL COMMENT 'Address Status',
  `additional_information` text COMMENT 'Additional Information',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_ORDER_PAYMENT_PARENT_ID` (`parent_id`),
  CONSTRAINT `FK_68ECBF5F3CBDABA301E702DEEFA54FBD` FOREIGN KEY (`parent_id`) REFERENCES `magev1_sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Payment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_sales_flat_order_payment`
--

LOCK TABLES `magev1_sales_flat_order_payment` WRITE;
/*!40000 ALTER TABLE `magev1_sales_flat_order_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_sales_flat_order_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_sales_flat_order_status_history`
--

DROP TABLE IF EXISTS `magev1_sales_flat_order_status_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_sales_flat_order_status_history` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `is_customer_notified` int(11) DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `status` varchar(32) DEFAULT NULL COMMENT 'Status',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `entity_name` varchar(32) DEFAULT NULL COMMENT 'Shows what entity history is bind to.',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_ORDER_STATUS_HISTORY_PARENT_ID` (`parent_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_ORDER_STATUS_HISTORY_CREATED_AT` (`created_at`),
  CONSTRAINT `FK_570B6C6B1955BA1297BD14182187AB9F` FOREIGN KEY (`parent_id`) REFERENCES `magev1_sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Order Status History';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_sales_flat_order_status_history`
--

LOCK TABLES `magev1_sales_flat_order_status_history` WRITE;
/*!40000 ALTER TABLE `magev1_sales_flat_order_status_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_sales_flat_order_status_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_sales_flat_quote`
--

DROP TABLE IF EXISTS `magev1_sales_flat_quote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_sales_flat_quote` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Updated At',
  `converted_at` timestamp NULL DEFAULT NULL COMMENT 'Converted At',
  `is_active` smallint(5) unsigned DEFAULT '1' COMMENT 'Is Active',
  `is_virtual` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Virtual',
  `is_multi_shipping` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Multi Shipping',
  `items_count` int(10) unsigned DEFAULT '0' COMMENT 'Items Count',
  `items_qty` decimal(12,4) DEFAULT '0.0000' COMMENT 'Items Qty',
  `orig_order_id` int(10) unsigned DEFAULT '0' COMMENT 'Orig Order Id',
  `store_to_base_rate` decimal(12,4) DEFAULT '0.0000' COMMENT 'Store To Base Rate',
  `store_to_quote_rate` decimal(12,4) DEFAULT '0.0000' COMMENT 'Store To Quote Rate',
  `base_currency_code` varchar(255) DEFAULT NULL COMMENT 'Base Currency Code',
  `store_currency_code` varchar(255) DEFAULT NULL COMMENT 'Store Currency Code',
  `quote_currency_code` varchar(255) DEFAULT NULL COMMENT 'Quote Currency Code',
  `grand_total` decimal(12,4) DEFAULT '0.0000' COMMENT 'Grand Total',
  `base_grand_total` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Grand Total',
  `checkout_method` varchar(255) DEFAULT NULL COMMENT 'Checkout Method',
  `customer_id` int(10) unsigned DEFAULT '0' COMMENT 'Customer Id',
  `customer_tax_class_id` int(10) unsigned DEFAULT '0' COMMENT 'Customer Tax Class Id',
  `customer_group_id` int(10) unsigned DEFAULT '0' COMMENT 'Customer Group Id',
  `customer_email` varchar(255) DEFAULT NULL COMMENT 'Customer Email',
  `customer_prefix` varchar(40) DEFAULT NULL COMMENT 'Customer Prefix',
  `customer_firstname` varchar(255) DEFAULT NULL COMMENT 'Customer Firstname',
  `customer_middlename` varchar(40) DEFAULT NULL COMMENT 'Customer Middlename',
  `customer_lastname` varchar(255) DEFAULT NULL COMMENT 'Customer Lastname',
  `customer_suffix` varchar(40) DEFAULT NULL COMMENT 'Customer Suffix',
  `customer_dob` datetime DEFAULT NULL COMMENT 'Customer Dob',
  `customer_note` varchar(255) DEFAULT NULL COMMENT 'Customer Note',
  `customer_note_notify` smallint(5) unsigned DEFAULT '1' COMMENT 'Customer Note Notify',
  `customer_is_guest` smallint(5) unsigned DEFAULT '0' COMMENT 'Customer Is Guest',
  `remote_ip` varchar(255) DEFAULT NULL COMMENT 'Remote Ip',
  `applied_rule_ids` varchar(255) DEFAULT NULL COMMENT 'Applied Rule Ids',
  `reserved_order_id` varchar(64) DEFAULT NULL COMMENT 'Reserved Order Id',
  `password_hash` varchar(255) DEFAULT NULL COMMENT 'Password Hash',
  `coupon_code` varchar(255) DEFAULT NULL COMMENT 'Coupon Code',
  `global_currency_code` varchar(255) DEFAULT NULL COMMENT 'Global Currency Code',
  `base_to_global_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Global Rate',
  `base_to_quote_rate` decimal(12,4) DEFAULT NULL COMMENT 'Base To Quote Rate',
  `customer_taxvat` varchar(255) DEFAULT NULL COMMENT 'Customer Taxvat',
  `customer_gender` varchar(255) DEFAULT NULL COMMENT 'Customer Gender',
  `subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal',
  `base_subtotal` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal',
  `subtotal_with_discount` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal With Discount',
  `base_subtotal_with_discount` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal With Discount',
  `is_changed` int(10) unsigned DEFAULT NULL COMMENT 'Is Changed',
  `trigger_recollect` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Trigger Recollect',
  `ext_shipping_info` text COMMENT 'Ext Shipping Info',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  `is_persistent` smallint(5) unsigned DEFAULT '0' COMMENT 'Is Quote Persistent',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_QUOTE_CUSTOMER_ID_STORE_ID_IS_ACTIVE` (`customer_id`,`store_id`,`is_active`),
  KEY `IDX_MAGEV1_SALES_FLAT_QUOTE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_MAGEV1_SALES_FLAT_QUOTE_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_sales_flat_quote`
--

LOCK TABLES `magev1_sales_flat_quote` WRITE;
/*!40000 ALTER TABLE `magev1_sales_flat_quote` DISABLE KEYS */;
INSERT INTO `magev1_sales_flat_quote` VALUES (1,1,'2017-03-30 08:49:38','2017-03-30 08:50:45',NULL,1,0,0,1,1.0000,0,1.0000,1.0000,'EUR','EUR','EUR',46.0000,46.0000,NULL,NULL,3,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,'90.38.175.189',NULL,NULL,NULL,NULL,'EUR',1.0000,1.0000,NULL,NULL,46.0000,46.0000,46.0000,46.0000,1,0,NULL,NULL,0);
/*!40000 ALTER TABLE `magev1_sales_flat_quote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_sales_flat_quote_address`
--

DROP TABLE IF EXISTS `magev1_sales_flat_quote_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_sales_flat_quote_address` (
  `address_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Address Id',
  `quote_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Id',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Updated At',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `save_in_address_book` smallint(6) DEFAULT '0' COMMENT 'Save In Address Book',
  `customer_address_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Address Id',
  `address_type` varchar(255) DEFAULT NULL COMMENT 'Address Type',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email',
  `prefix` varchar(40) DEFAULT NULL COMMENT 'Prefix',
  `firstname` varchar(255) DEFAULT NULL COMMENT 'Firstname',
  `middlename` varchar(40) DEFAULT NULL COMMENT 'Middlename',
  `lastname` varchar(255) DEFAULT NULL COMMENT 'Lastname',
  `suffix` varchar(40) DEFAULT NULL COMMENT 'Suffix',
  `company` varchar(255) DEFAULT NULL COMMENT 'Company',
  `street` varchar(255) DEFAULT NULL COMMENT 'Street',
  `city` varchar(255) DEFAULT NULL COMMENT 'City',
  `region` varchar(255) DEFAULT NULL COMMENT 'Region',
  `region_id` int(10) unsigned DEFAULT NULL COMMENT 'Region Id',
  `postcode` varchar(255) DEFAULT NULL COMMENT 'Postcode',
  `country_id` varchar(255) DEFAULT NULL COMMENT 'Country Id',
  `telephone` varchar(255) DEFAULT NULL COMMENT 'Telephone',
  `fax` varchar(255) DEFAULT NULL COMMENT 'Fax',
  `same_as_billing` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Same As Billing',
  `free_shipping` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Free Shipping',
  `collect_shipping_rates` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Collect Shipping Rates',
  `shipping_method` varchar(255) DEFAULT NULL COMMENT 'Shipping Method',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `weight` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Weight',
  `subtotal` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal',
  `base_subtotal` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Subtotal',
  `subtotal_with_discount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Subtotal With Discount',
  `base_subtotal_with_discount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Subtotal With Discount',
  `tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Tax Amount',
  `base_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Shipping Amount',
  `base_shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Shipping Amount',
  `shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Tax Amount',
  `base_shipping_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Tax Amount',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `grand_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Grand Total',
  `base_grand_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Grand Total',
  `customer_notes` text COMMENT 'Customer Notes',
  `applied_taxes` text COMMENT 'Applied Taxes',
  `discount_description` varchar(255) DEFAULT NULL COMMENT 'Discount Description',
  `shipping_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Discount Amount',
  `base_shipping_discount_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Discount Amount',
  `subtotal_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Subtotal Incl Tax',
  `base_subtotal_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Subtotal Total Incl Tax',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `shipping_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Hidden Tax Amount',
  `base_shipping_hidden_tax_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Hidden Tax Amount',
  `shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Incl Tax',
  `base_shipping_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Shipping Incl Tax',
  `vat_id` text COMMENT 'Vat Id',
  `vat_is_valid` smallint(6) DEFAULT NULL COMMENT 'Vat Is Valid',
  `vat_request_id` text COMMENT 'Vat Request Id',
  `vat_request_date` text COMMENT 'Vat Request Date',
  `vat_request_success` smallint(6) DEFAULT NULL COMMENT 'Vat Request Success',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  PRIMARY KEY (`address_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_QUOTE_ADDRESS_QUOTE_ID` (`quote_id`),
  CONSTRAINT `FK_21E6DFD2F383CE3627530218F98F1ED8` FOREIGN KEY (`quote_id`) REFERENCES `magev1_sales_flat_quote` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Address';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_sales_flat_quote_address`
--

LOCK TABLES `magev1_sales_flat_quote_address` WRITE;
/*!40000 ALTER TABLE `magev1_sales_flat_quote_address` DISABLE KEYS */;
INSERT INTO `magev1_sales_flat_quote_address` VALUES (1,1,'2017-03-30 08:49:38','2017-03-30 08:50:45',NULL,0,NULL,'billing',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,NULL,NULL,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,NULL,'a:0:{}',NULL,NULL,NULL,0.0000,NULL,NULL,NULL,NULL,NULL,0.0000,0.0000,NULL,NULL,NULL,NULL,NULL,NULL),(2,1,'2017-03-30 08:49:38','2017-03-30 08:50:45',NULL,0,NULL,'shipping',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,0,NULL,NULL,0.8000,46.0000,46.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,0.0000,46.0000,46.0000,NULL,'a:0:{}',NULL,0.0000,0.0000,46.0000,NULL,0.0000,0.0000,0.0000,NULL,0.0000,0.0000,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `magev1_sales_flat_quote_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_sales_flat_quote_address_item`
--

DROP TABLE IF EXISTS `magev1_sales_flat_quote_address_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_sales_flat_quote_address_item` (
  `address_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Address Item Id',
  `parent_item_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Item Id',
  `quote_address_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Address Id',
  `quote_item_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Item Id',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Updated At',
  `applied_rule_ids` text COMMENT 'Applied Rule Ids',
  `additional_data` text COMMENT 'Additional Data',
  `weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Weight',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Amount',
  `tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Amount',
  `row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Total',
  `base_row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Total',
  `row_total_with_discount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Total With Discount',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `row_weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Weight',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `super_product_id` int(10) unsigned DEFAULT NULL COMMENT 'Super Product Id',
  `parent_product_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Product Id',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `image` varchar(255) DEFAULT NULL COMMENT 'Image',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `free_shipping` int(10) unsigned DEFAULT NULL COMMENT 'Free Shipping',
  `is_qty_decimal` int(10) unsigned DEFAULT NULL COMMENT 'Is Qty Decimal',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `discount_percent` decimal(12,4) DEFAULT NULL COMMENT 'Discount Percent',
  `no_discount` int(10) unsigned DEFAULT NULL COMMENT 'No Discount',
  `tax_percent` decimal(12,4) DEFAULT NULL COMMENT 'Tax Percent',
  `base_price` decimal(12,4) DEFAULT NULL COMMENT 'Base Price',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  PRIMARY KEY (`address_item_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_QUOTE_ADDRESS_ITEM_QUOTE_ADDRESS_ID` (`quote_address_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_QUOTE_ADDRESS_ITEM_PARENT_ITEM_ID` (`parent_item_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_QUOTE_ADDRESS_ITEM_QUOTE_ITEM_ID` (`quote_item_id`),
  CONSTRAINT `FK_629D40B2EDED2E3015683F72CC3CE0D7` FOREIGN KEY (`parent_item_id`) REFERENCES `magev1_sales_flat_quote_address_item` (`address_item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_7832BF6E19972101C89247BB77D62942` FOREIGN KEY (`quote_address_id`) REFERENCES `magev1_sales_flat_quote_address` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_F9C7E802D9F607FC9BF2821E035EE504` FOREIGN KEY (`quote_item_id`) REFERENCES `magev1_sales_flat_quote_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Address Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_sales_flat_quote_address_item`
--

LOCK TABLES `magev1_sales_flat_quote_address_item` WRITE;
/*!40000 ALTER TABLE `magev1_sales_flat_quote_address_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_sales_flat_quote_address_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_sales_flat_quote_item`
--

DROP TABLE IF EXISTS `magev1_sales_flat_quote_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_sales_flat_quote_item` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item Id',
  `quote_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Id',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Updated At',
  `product_id` int(10) unsigned DEFAULT NULL COMMENT 'Product Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `parent_item_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Item Id',
  `is_virtual` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Virtual',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `applied_rule_ids` text COMMENT 'Applied Rule Ids',
  `additional_data` text COMMENT 'Additional Data',
  `free_shipping` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Free Shipping',
  `is_qty_decimal` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Qty Decimal',
  `no_discount` smallint(5) unsigned DEFAULT '0' COMMENT 'No Discount',
  `weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Weight',
  `qty` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Qty',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `base_price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Price',
  `custom_price` decimal(12,4) DEFAULT NULL COMMENT 'Custom Price',
  `discount_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Percent',
  `discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Discount Amount',
  `base_discount_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Discount Amount',
  `tax_percent` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Percent',
  `tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Tax Amount',
  `base_tax_amount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Base Tax Amount',
  `row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Row Total',
  `base_row_total` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Base Row Total',
  `row_total_with_discount` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Total With Discount',
  `row_weight` decimal(12,4) DEFAULT '0.0000' COMMENT 'Row Weight',
  `product_type` varchar(255) DEFAULT NULL COMMENT 'Product Type',
  `base_tax_before_discount` decimal(12,4) DEFAULT NULL COMMENT 'Base Tax Before Discount',
  `tax_before_discount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Before Discount',
  `original_custom_price` decimal(12,4) DEFAULT NULL COMMENT 'Original Custom Price',
  `redirect_url` varchar(255) DEFAULT NULL COMMENT 'Redirect Url',
  `base_cost` decimal(12,4) DEFAULT NULL COMMENT 'Base Cost',
  `price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Price Incl Tax',
  `base_price_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Price Incl Tax',
  `row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Row Total Incl Tax',
  `base_row_total_incl_tax` decimal(12,4) DEFAULT NULL COMMENT 'Base Row Total Incl Tax',
  `hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Hidden Tax Amount',
  `base_hidden_tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Hidden Tax Amount',
  `gift_message_id` int(11) DEFAULT NULL COMMENT 'Gift Message Id',
  `weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Disposition',
  `weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Row Disposition',
  `base_weee_tax_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Disposition',
  `base_weee_tax_row_disposition` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Row Disposition',
  `weee_tax_applied` text COMMENT 'Weee Tax Applied',
  `weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Amount',
  `weee_tax_applied_row_amount` decimal(12,4) DEFAULT NULL COMMENT 'Weee Tax Applied Row Amount',
  `base_weee_tax_applied_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Amount',
  `base_weee_tax_applied_row_amnt` decimal(12,4) DEFAULT NULL COMMENT 'Base Weee Tax Applied Row Amnt',
  PRIMARY KEY (`item_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_QUOTE_ITEM_PARENT_ITEM_ID` (`parent_item_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_QUOTE_ITEM_PRODUCT_ID` (`product_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_QUOTE_ITEM_QUOTE_ID` (`quote_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_QUOTE_ITEM_STORE_ID` (`store_id`),
  CONSTRAINT `FK_0622FF28DAB51CE73C28AE1E494C9784` FOREIGN KEY (`parent_item_id`) REFERENCES `magev1_sales_flat_quote_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_0D7024C4038E1910C8D8ACE9C374D90E` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_7DA0E857902F2B52F3C44C3E6967C284` FOREIGN KEY (`quote_id`) REFERENCES `magev1_sales_flat_quote` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_B144AAF93998FB5DF562EF0B68439A88` FOREIGN KEY (`product_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_sales_flat_quote_item`
--

LOCK TABLES `magev1_sales_flat_quote_item` WRITE;
/*!40000 ALTER TABLE `magev1_sales_flat_quote_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_sales_flat_quote_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_sales_flat_quote_item_option`
--

DROP TABLE IF EXISTS `magev1_sales_flat_quote_item_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_sales_flat_quote_item_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Id',
  `item_id` int(10) unsigned NOT NULL COMMENT 'Item Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `value` text COMMENT 'Value',
  PRIMARY KEY (`option_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_QUOTE_ITEM_OPTION_ITEM_ID` (`item_id`),
  CONSTRAINT `FK_389CDA1BCCB21F16C80DC2520160B590` FOREIGN KEY (`item_id`) REFERENCES `magev1_sales_flat_quote_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Item Option';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_sales_flat_quote_item_option`
--

LOCK TABLES `magev1_sales_flat_quote_item_option` WRITE;
/*!40000 ALTER TABLE `magev1_sales_flat_quote_item_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_sales_flat_quote_item_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_sales_flat_quote_payment`
--

DROP TABLE IF EXISTS `magev1_sales_flat_quote_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_sales_flat_quote_payment` (
  `payment_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Payment Id',
  `quote_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Quote Id',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Updated At',
  `method` varchar(255) DEFAULT NULL COMMENT 'Method',
  `cc_type` varchar(255) DEFAULT NULL COMMENT 'Cc Type',
  `cc_number_enc` varchar(255) DEFAULT NULL COMMENT 'Cc Number Enc',
  `cc_last4` varchar(255) DEFAULT NULL COMMENT 'Cc Last4',
  `cc_cid_enc` varchar(255) DEFAULT NULL COMMENT 'Cc Cid Enc',
  `cc_owner` varchar(255) DEFAULT NULL COMMENT 'Cc Owner',
  `cc_exp_month` smallint(5) unsigned DEFAULT '0' COMMENT 'Cc Exp Month',
  `cc_exp_year` smallint(5) unsigned DEFAULT '0' COMMENT 'Cc Exp Year',
  `cc_ss_owner` varchar(255) DEFAULT NULL COMMENT 'Cc Ss Owner',
  `cc_ss_start_month` smallint(5) unsigned DEFAULT '0' COMMENT 'Cc Ss Start Month',
  `cc_ss_start_year` smallint(5) unsigned DEFAULT '0' COMMENT 'Cc Ss Start Year',
  `po_number` varchar(255) DEFAULT NULL COMMENT 'Po Number',
  `additional_data` text COMMENT 'Additional Data',
  `cc_ss_issue` varchar(255) DEFAULT NULL COMMENT 'Cc Ss Issue',
  `additional_information` text COMMENT 'Additional Information',
  `paypal_payer_id` varchar(255) DEFAULT NULL COMMENT 'Paypal Payer Id',
  `paypal_payer_status` varchar(255) DEFAULT NULL COMMENT 'Paypal Payer Status',
  `paypal_correlation_id` varchar(255) DEFAULT NULL COMMENT 'Paypal Correlation Id',
  PRIMARY KEY (`payment_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_QUOTE_PAYMENT_QUOTE_ID` (`quote_id`),
  CONSTRAINT `FK_B91BF09967550C5E45C20E2B146009EF` FOREIGN KEY (`quote_id`) REFERENCES `magev1_sales_flat_quote` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Payment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_sales_flat_quote_payment`
--

LOCK TABLES `magev1_sales_flat_quote_payment` WRITE;
/*!40000 ALTER TABLE `magev1_sales_flat_quote_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_sales_flat_quote_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_sales_flat_quote_shipping_rate`
--

DROP TABLE IF EXISTS `magev1_sales_flat_quote_shipping_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_sales_flat_quote_shipping_rate` (
  `rate_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rate Id',
  `address_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Address Id',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Created At',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Updated At',
  `carrier` varchar(255) DEFAULT NULL COMMENT 'Carrier',
  `carrier_title` varchar(255) DEFAULT NULL COMMENT 'Carrier Title',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `method` varchar(255) DEFAULT NULL COMMENT 'Method',
  `method_description` text COMMENT 'Method Description',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `error_message` text COMMENT 'Error Message',
  `method_title` text COMMENT 'Method Title',
  PRIMARY KEY (`rate_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_QUOTE_SHIPPING_RATE_ADDRESS_ID` (`address_id`),
  CONSTRAINT `FK_357565A6ADEA0F1AB91E2F63CA531E35` FOREIGN KEY (`address_id`) REFERENCES `magev1_sales_flat_quote_address` (`address_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Quote Shipping Rate';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_sales_flat_quote_shipping_rate`
--

LOCK TABLES `magev1_sales_flat_quote_shipping_rate` WRITE;
/*!40000 ALTER TABLE `magev1_sales_flat_quote_shipping_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_sales_flat_quote_shipping_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_sales_flat_shipment`
--

DROP TABLE IF EXISTS `magev1_sales_flat_shipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_sales_flat_shipment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `total_weight` decimal(12,4) DEFAULT NULL COMMENT 'Total Weight',
  `total_qty` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty',
  `email_sent` smallint(5) unsigned DEFAULT NULL COMMENT 'Email Sent',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `customer_id` int(11) DEFAULT NULL COMMENT 'Customer Id',
  `shipping_address_id` int(11) DEFAULT NULL COMMENT 'Shipping Address Id',
  `billing_address_id` int(11) DEFAULT NULL COMMENT 'Billing Address Id',
  `shipment_status` int(11) DEFAULT NULL COMMENT 'Shipment Status',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `packages` text COMMENT 'Packed Products in Packages',
  `shipping_label` mediumblob COMMENT 'Shipping Label Content',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_MAGEV1_SALES_FLAT_SHIPMENT_INCREMENT_ID` (`increment_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_SHIPMENT_STORE_ID` (`store_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_SHIPMENT_TOTAL_QTY` (`total_qty`),
  KEY `IDX_MAGEV1_SALES_FLAT_SHIPMENT_ORDER_ID` (`order_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_SHIPMENT_CREATED_AT` (`created_at`),
  KEY `IDX_MAGEV1_SALES_FLAT_SHIPMENT_UPDATED_AT` (`updated_at`),
  CONSTRAINT `FK_8353D61A51D4DD4E28FAE90965B90CFA` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_F952C1B2515E60B8F0CE7C1FB536D1C3` FOREIGN KEY (`order_id`) REFERENCES `magev1_sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_sales_flat_shipment`
--

LOCK TABLES `magev1_sales_flat_shipment` WRITE;
/*!40000 ALTER TABLE `magev1_sales_flat_shipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_sales_flat_shipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_sales_flat_shipment_comment`
--

DROP TABLE IF EXISTS `magev1_sales_flat_shipment_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_sales_flat_shipment_comment` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `is_customer_notified` int(11) DEFAULT NULL COMMENT 'Is Customer Notified',
  `is_visible_on_front` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Visible On Front',
  `comment` text COMMENT 'Comment',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_SHIPMENT_COMMENT_CREATED_AT` (`created_at`),
  KEY `IDX_MAGEV1_SALES_FLAT_SHIPMENT_COMMENT_PARENT_ID` (`parent_id`),
  CONSTRAINT `FK_C1FEC396CE09B6CEA236F7C208F71EB3` FOREIGN KEY (`parent_id`) REFERENCES `magev1_sales_flat_shipment` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Comment';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_sales_flat_shipment_comment`
--

LOCK TABLES `magev1_sales_flat_shipment_comment` WRITE;
/*!40000 ALTER TABLE `magev1_sales_flat_shipment_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_sales_flat_shipment_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_sales_flat_shipment_grid`
--

DROP TABLE IF EXISTS `magev1_sales_flat_shipment_grid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_sales_flat_shipment_grid` (
  `entity_id` int(10) unsigned NOT NULL COMMENT 'Entity Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `total_qty` decimal(12,4) DEFAULT NULL COMMENT 'Total Qty',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `shipment_status` int(11) DEFAULT NULL COMMENT 'Shipment Status',
  `increment_id` varchar(50) DEFAULT NULL COMMENT 'Increment Id',
  `order_increment_id` varchar(50) DEFAULT NULL COMMENT 'Order Increment Id',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `order_created_at` timestamp NULL DEFAULT NULL COMMENT 'Order Created At',
  `shipping_name` varchar(255) DEFAULT NULL COMMENT 'Shipping Name',
  PRIMARY KEY (`entity_id`),
  UNIQUE KEY `UNQ_MAGEV1_SALES_FLAT_SHIPMENT_GRID_INCREMENT_ID` (`increment_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_SHIPMENT_GRID_STORE_ID` (`store_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_SHIPMENT_GRID_TOTAL_QTY` (`total_qty`),
  KEY `IDX_MAGEV1_SALES_FLAT_SHIPMENT_GRID_ORDER_ID` (`order_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_SHIPMENT_GRID_SHIPMENT_STATUS` (`shipment_status`),
  KEY `IDX_MAGEV1_SALES_FLAT_SHIPMENT_GRID_ORDER_INCREMENT_ID` (`order_increment_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_SHIPMENT_GRID_CREATED_AT` (`created_at`),
  KEY `IDX_MAGEV1_SALES_FLAT_SHIPMENT_GRID_ORDER_CREATED_AT` (`order_created_at`),
  KEY `IDX_MAGEV1_SALES_FLAT_SHIPMENT_GRID_SHIPPING_NAME` (`shipping_name`),
  CONSTRAINT `FK_79C6F9CC02D50163651C25F5C1B5B481` FOREIGN KEY (`entity_id`) REFERENCES `magev1_sales_flat_shipment` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_851C86BFBFAC57B4EFFE53A945A2FBA5` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Grid';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_sales_flat_shipment_grid`
--

LOCK TABLES `magev1_sales_flat_shipment_grid` WRITE;
/*!40000 ALTER TABLE `magev1_sales_flat_shipment_grid` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_sales_flat_shipment_grid` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_sales_flat_shipment_item`
--

DROP TABLE IF EXISTS `magev1_sales_flat_shipment_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_sales_flat_shipment_item` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `row_total` decimal(12,4) DEFAULT NULL COMMENT 'Row Total',
  `price` decimal(12,4) DEFAULT NULL COMMENT 'Price',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'Weight',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `product_id` int(11) DEFAULT NULL COMMENT 'Product Id',
  `order_item_id` int(11) DEFAULT NULL COMMENT 'Order Item Id',
  `additional_data` text COMMENT 'Additional Data',
  `description` text COMMENT 'Description',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `sku` varchar(255) DEFAULT NULL COMMENT 'Sku',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_SHIPMENT_ITEM_PARENT_ID` (`parent_id`),
  CONSTRAINT `FK_386704F99623BF43E58C3CA79616F9A6` FOREIGN KEY (`parent_id`) REFERENCES `magev1_sales_flat_shipment` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_sales_flat_shipment_item`
--

LOCK TABLES `magev1_sales_flat_shipment_item` WRITE;
/*!40000 ALTER TABLE `magev1_sales_flat_shipment_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_sales_flat_shipment_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_sales_flat_shipment_track`
--

DROP TABLE IF EXISTS `magev1_sales_flat_shipment_track`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_sales_flat_shipment_track` (
  `entity_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Entity Id',
  `parent_id` int(10) unsigned NOT NULL COMMENT 'Parent Id',
  `weight` decimal(12,4) DEFAULT NULL COMMENT 'Weight',
  `qty` decimal(12,4) DEFAULT NULL COMMENT 'Qty',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `track_number` text COMMENT 'Number',
  `description` text COMMENT 'Description',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `carrier_code` varchar(32) DEFAULT NULL COMMENT 'Carrier Code',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  PRIMARY KEY (`entity_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_SHIPMENT_TRACK_PARENT_ID` (`parent_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_SHIPMENT_TRACK_ORDER_ID` (`order_id`),
  KEY `IDX_MAGEV1_SALES_FLAT_SHIPMENT_TRACK_CREATED_AT` (`created_at`),
  CONSTRAINT `FK_957FD5D22455F211DC2883446F6ECB0C` FOREIGN KEY (`parent_id`) REFERENCES `magev1_sales_flat_shipment` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Flat Shipment Track';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_sales_flat_shipment_track`
--

LOCK TABLES `magev1_sales_flat_shipment_track` WRITE;
/*!40000 ALTER TABLE `magev1_sales_flat_shipment_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_sales_flat_shipment_track` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_sales_invoiced_aggregated`
--

DROP TABLE IF EXISTS `magev1_sales_invoiced_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_sales_invoiced_aggregated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `orders_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Orders Invoiced',
  `invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced',
  `invoiced_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Captured',
  `invoiced_not_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Not Captured',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_MAGEV1_SALES_INVOICED_AGGRED_PERIOD_STORE_ID_ORDER_STS` (`period`,`store_id`,`order_status`),
  KEY `IDX_MAGEV1_SALES_INVOICED_AGGREGATED_STORE_ID` (`store_id`),
  CONSTRAINT `FK_516E95B851DC40DE94BB2C4DA67AAA66` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Invoiced Aggregated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_sales_invoiced_aggregated`
--

LOCK TABLES `magev1_sales_invoiced_aggregated` WRITE;
/*!40000 ALTER TABLE `magev1_sales_invoiced_aggregated` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_sales_invoiced_aggregated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_sales_invoiced_aggregated_order`
--

DROP TABLE IF EXISTS `magev1_sales_invoiced_aggregated_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_sales_invoiced_aggregated_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) NOT NULL DEFAULT '' COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `orders_invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Orders Invoiced',
  `invoiced` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced',
  `invoiced_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Captured',
  `invoiced_not_captured` decimal(12,4) DEFAULT NULL COMMENT 'Invoiced Not Captured',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_MAGEV1_SALES_INVOICED_AGGRED_ORDER_PERIOD_STORE_ID_ORDER_STS` (`period`,`store_id`,`order_status`),
  KEY `IDX_MAGEV1_SALES_INVOICED_AGGREGATED_ORDER_STORE_ID` (`store_id`),
  CONSTRAINT `FK_9065B9DBD53B0B57672DA820522BFA10` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Invoiced Aggregated Order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_sales_invoiced_aggregated_order`
--

LOCK TABLES `magev1_sales_invoiced_aggregated_order` WRITE;
/*!40000 ALTER TABLE `magev1_sales_invoiced_aggregated_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_sales_invoiced_aggregated_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_sales_order_aggregated_created`
--

DROP TABLE IF EXISTS `magev1_sales_order_aggregated_created`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_sales_order_aggregated_created` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) NOT NULL DEFAULT '' COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Ordered',
  `total_qty_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Invoiced',
  `total_income_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Income Amount',
  `total_revenue_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Revenue Amount',
  `total_profit_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Profit Amount',
  `total_invoiced_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Invoiced Amount',
  `total_canceled_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Canceled Amount',
  `total_paid_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Paid Amount',
  `total_refunded_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Refunded Amount',
  `total_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount',
  `total_tax_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount Actual',
  `total_shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount',
  `total_shipping_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount Actual',
  `total_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount',
  `total_discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_MAGEV1_SALES_ORDER_AGGRED_CREATED_PERIOD_STORE_ID_ORDER_STS` (`period`,`store_id`,`order_status`),
  KEY `IDX_MAGEV1_SALES_ORDER_AGGREGATED_CREATED_STORE_ID` (`store_id`),
  CONSTRAINT `FK_60CAE1EA0DFF3D966DA371F5E3FA5532` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Aggregated Created';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_sales_order_aggregated_created`
--

LOCK TABLES `magev1_sales_order_aggregated_created` WRITE;
/*!40000 ALTER TABLE `magev1_sales_order_aggregated_created` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_sales_order_aggregated_created` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_sales_order_aggregated_updated`
--

DROP TABLE IF EXISTS `magev1_sales_order_aggregated_updated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_sales_order_aggregated_updated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_qty_ordered` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Ordered',
  `total_qty_invoiced` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Qty Invoiced',
  `total_income_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Income Amount',
  `total_revenue_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Revenue Amount',
  `total_profit_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Profit Amount',
  `total_invoiced_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Invoiced Amount',
  `total_canceled_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Canceled Amount',
  `total_paid_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Paid Amount',
  `total_refunded_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Refunded Amount',
  `total_tax_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount',
  `total_tax_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Tax Amount Actual',
  `total_shipping_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount',
  `total_shipping_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Shipping Amount Actual',
  `total_discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount',
  `total_discount_amount_actual` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Total Discount Amount Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_MAGEV1_SALES_ORDER_AGGRED_UPDATED_PERIOD_STORE_ID_ORDER_STS` (`period`,`store_id`,`order_status`),
  KEY `IDX_MAGEV1_SALES_ORDER_AGGREGATED_UPDATED_STORE_ID` (`store_id`),
  CONSTRAINT `FK_55AFEAF45AB3A48C78D6DB9B19607579` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Magev1 Sales Order Aggregated Updated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_sales_order_aggregated_updated`
--

LOCK TABLES `magev1_sales_order_aggregated_updated` WRITE;
/*!40000 ALTER TABLE `magev1_sales_order_aggregated_updated` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_sales_order_aggregated_updated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_sales_order_status`
--

DROP TABLE IF EXISTS `magev1_sales_order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_sales_order_status` (
  `status` varchar(32) NOT NULL COMMENT 'Status',
  `label` varchar(128) NOT NULL COMMENT 'Label',
  PRIMARY KEY (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Status Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_sales_order_status`
--

LOCK TABLES `magev1_sales_order_status` WRITE;
/*!40000 ALTER TABLE `magev1_sales_order_status` DISABLE KEYS */;
INSERT INTO `magev1_sales_order_status` VALUES ('canceled','Canceled'),('closed','Closed'),('complete','Complete'),('fraud','Suspected Fraud'),('holded','On Hold'),('payment_review','Payment Review'),('paypal_canceled_reversal','PayPal Canceled Reversal'),('paypal_reversed','PayPal Reversed'),('pending','Pending'),('pending_payment','Pending Payment'),('pending_paypal','Pending PayPal'),('processing','Processing');
/*!40000 ALTER TABLE `magev1_sales_order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_sales_order_status_label`
--

DROP TABLE IF EXISTS `magev1_sales_order_status_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_sales_order_status_label` (
  `status` varchar(32) NOT NULL COMMENT 'Status',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `label` varchar(128) NOT NULL COMMENT 'Label',
  PRIMARY KEY (`status`,`store_id`),
  KEY `IDX_MAGEV1_SALES_ORDER_STATUS_LABEL_STORE_ID` (`store_id`),
  CONSTRAINT `FK_C0D5D39BC0CC58F82DD53F4084F4696C` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_SALES_ORDER_STS_LBL_STS_MAGEV1_SALES_ORDER_STS_STS` FOREIGN KEY (`status`) REFERENCES `magev1_sales_order_status` (`status`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Status Label Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_sales_order_status_label`
--

LOCK TABLES `magev1_sales_order_status_label` WRITE;
/*!40000 ALTER TABLE `magev1_sales_order_status_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_sales_order_status_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_sales_order_status_state`
--

DROP TABLE IF EXISTS `magev1_sales_order_status_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_sales_order_status_state` (
  `status` varchar(32) NOT NULL COMMENT 'Status',
  `state` varchar(32) NOT NULL COMMENT 'Label',
  `is_default` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Is Default',
  PRIMARY KEY (`status`,`state`),
  CONSTRAINT `FK_MAGEV1_SALES_ORDER_STS_STATE_STS_MAGEV1_SALES_ORDER_STS_STS` FOREIGN KEY (`status`) REFERENCES `magev1_sales_order_status` (`status`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Status Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_sales_order_status_state`
--

LOCK TABLES `magev1_sales_order_status_state` WRITE;
/*!40000 ALTER TABLE `magev1_sales_order_status_state` DISABLE KEYS */;
INSERT INTO `magev1_sales_order_status_state` VALUES ('canceled','canceled',1),('closed','closed',1),('complete','complete',1),('fraud','payment_review',0),('holded','holded',1),('payment_review','payment_review',1),('pending','new',1),('pending_payment','pending_payment',1),('processing','processing',1);
/*!40000 ALTER TABLE `magev1_sales_order_status_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_sales_order_tax`
--

DROP TABLE IF EXISTS `magev1_sales_order_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_sales_order_tax` (
  `tax_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tax Id',
  `order_id` int(10) unsigned NOT NULL COMMENT 'Order Id',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `title` varchar(255) DEFAULT NULL COMMENT 'Title',
  `percent` decimal(12,4) DEFAULT NULL COMMENT 'Percent',
  `amount` decimal(12,4) DEFAULT NULL COMMENT 'Amount',
  `priority` int(11) NOT NULL COMMENT 'Priority',
  `position` int(11) NOT NULL COMMENT 'Position',
  `base_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Amount',
  `process` smallint(6) NOT NULL COMMENT 'Process',
  `base_real_amount` decimal(12,4) DEFAULT NULL COMMENT 'Base Real Amount',
  `hidden` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Hidden',
  PRIMARY KEY (`tax_id`),
  KEY `IDX_MAGEV1_SALES_ORDER_TAX_ORDER_ID_PRIORITY_POSITION` (`order_id`,`priority`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Tax Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_sales_order_tax`
--

LOCK TABLES `magev1_sales_order_tax` WRITE;
/*!40000 ALTER TABLE `magev1_sales_order_tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_sales_order_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_sales_order_tax_item`
--

DROP TABLE IF EXISTS `magev1_sales_order_tax_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_sales_order_tax_item` (
  `tax_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tax Item Id',
  `tax_id` int(10) unsigned NOT NULL COMMENT 'Tax Id',
  `item_id` int(10) unsigned NOT NULL COMMENT 'Item Id',
  `tax_percent` decimal(12,4) NOT NULL COMMENT 'Real Tax Percent For Item',
  PRIMARY KEY (`tax_item_id`),
  UNIQUE KEY `UNQ_MAGEV1_SALES_ORDER_TAX_ITEM_TAX_ID_ITEM_ID` (`tax_id`,`item_id`),
  KEY `IDX_MAGEV1_SALES_ORDER_TAX_ITEM_TAX_ID` (`tax_id`),
  KEY `IDX_MAGEV1_SALES_ORDER_TAX_ITEM_ITEM_ID` (`item_id`),
  CONSTRAINT `FK_0EF470894C227B95842C0A698B2E167C` FOREIGN KEY (`tax_id`) REFERENCES `magev1_sales_order_tax` (`tax_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EB4A098BCFACFB90221D6074E75BCE0C` FOREIGN KEY (`item_id`) REFERENCES `magev1_sales_flat_order_item` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Order Tax Item';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_sales_order_tax_item`
--

LOCK TABLES `magev1_sales_order_tax_item` WRITE;
/*!40000 ALTER TABLE `magev1_sales_order_tax_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_sales_order_tax_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_sales_payment_transaction`
--

DROP TABLE IF EXISTS `magev1_sales_payment_transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_sales_payment_transaction` (
  `transaction_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Transaction Id',
  `parent_id` int(10) unsigned DEFAULT NULL COMMENT 'Parent Id',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Order Id',
  `payment_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Payment Id',
  `txn_id` varchar(100) DEFAULT NULL COMMENT 'Txn Id',
  `parent_txn_id` varchar(100) DEFAULT NULL COMMENT 'Parent Txn Id',
  `txn_type` varchar(15) DEFAULT NULL COMMENT 'Txn Type',
  `is_closed` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Closed',
  `additional_information` blob COMMENT 'Additional Information',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  PRIMARY KEY (`transaction_id`),
  UNIQUE KEY `UNQ_MAGEV1_SALES_PAYMENT_TRANSACTION_ORDER_ID_PAYMENT_ID_TXN_ID` (`order_id`,`payment_id`,`txn_id`),
  KEY `IDX_MAGEV1_SALES_PAYMENT_TRANSACTION_ORDER_ID` (`order_id`),
  KEY `IDX_MAGEV1_SALES_PAYMENT_TRANSACTION_PARENT_ID` (`parent_id`),
  KEY `IDX_MAGEV1_SALES_PAYMENT_TRANSACTION_PAYMENT_ID` (`payment_id`),
  CONSTRAINT `FK_0CC36B76B88E5EC5BD1790954B97CAB0` FOREIGN KEY (`order_id`) REFERENCES `magev1_sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_8724F59621F96B9E87B28B4F5B02C2B3` FOREIGN KEY (`payment_id`) REFERENCES `magev1_sales_flat_order_payment` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_A5F7F0049A0FAF91DDFE6AB99B51AB73` FOREIGN KEY (`parent_id`) REFERENCES `magev1_sales_payment_transaction` (`transaction_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Payment Transaction';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_sales_payment_transaction`
--

LOCK TABLES `magev1_sales_payment_transaction` WRITE;
/*!40000 ALTER TABLE `magev1_sales_payment_transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_sales_payment_transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_sales_recurring_profile`
--

DROP TABLE IF EXISTS `magev1_sales_recurring_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_sales_recurring_profile` (
  `profile_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Profile Id',
  `state` varchar(20) NOT NULL COMMENT 'State',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `method_code` varchar(32) NOT NULL COMMENT 'Method Code',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Created At',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Updated At',
  `reference_id` varchar(32) DEFAULT NULL COMMENT 'Reference Id',
  `subscriber_name` varchar(150) DEFAULT NULL COMMENT 'Subscriber Name',
  `start_datetime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'Start Datetime',
  `internal_reference_id` varchar(42) NOT NULL COMMENT 'Internal Reference Id',
  `schedule_description` varchar(255) NOT NULL COMMENT 'Schedule Description',
  `suspension_threshold` smallint(5) unsigned DEFAULT NULL COMMENT 'Suspension Threshold',
  `bill_failed_later` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Bill Failed Later',
  `period_unit` varchar(20) NOT NULL COMMENT 'Period Unit',
  `period_frequency` smallint(5) unsigned DEFAULT NULL COMMENT 'Period Frequency',
  `period_max_cycles` smallint(5) unsigned DEFAULT NULL COMMENT 'Period Max Cycles',
  `billing_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Billing Amount',
  `trial_period_unit` varchar(20) DEFAULT NULL COMMENT 'Trial Period Unit',
  `trial_period_frequency` smallint(5) unsigned DEFAULT NULL COMMENT 'Trial Period Frequency',
  `trial_period_max_cycles` smallint(5) unsigned DEFAULT NULL COMMENT 'Trial Period Max Cycles',
  `trial_billing_amount` text COMMENT 'Trial Billing Amount',
  `currency_code` varchar(3) NOT NULL COMMENT 'Currency Code',
  `shipping_amount` decimal(12,4) DEFAULT NULL COMMENT 'Shipping Amount',
  `tax_amount` decimal(12,4) DEFAULT NULL COMMENT 'Tax Amount',
  `init_amount` decimal(12,4) DEFAULT NULL COMMENT 'Init Amount',
  `init_may_fail` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Init May Fail',
  `order_info` text NOT NULL COMMENT 'Order Info',
  `order_item_info` text NOT NULL COMMENT 'Order Item Info',
  `billing_address_info` text NOT NULL COMMENT 'Billing Address Info',
  `shipping_address_info` text COMMENT 'Shipping Address Info',
  `profile_vendor_info` text COMMENT 'Profile Vendor Info',
  `additional_info` text COMMENT 'Additional Info',
  PRIMARY KEY (`profile_id`),
  UNIQUE KEY `UNQ_MAGEV1_SALES_RECURRING_PROFILE_INTERNAL_REFERENCE_ID` (`internal_reference_id`),
  KEY `IDX_MAGEV1_SALES_RECURRING_PROFILE_CUSTOMER_ID` (`customer_id`),
  KEY `IDX_MAGEV1_SALES_RECURRING_PROFILE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_9357146B39EF208D19348689B95D4F4B` FOREIGN KEY (`customer_id`) REFERENCES `magev1_customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_E3AFE9B97907CFA5634ADDAF6364B16E` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Recurring Profile';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_sales_recurring_profile`
--

LOCK TABLES `magev1_sales_recurring_profile` WRITE;
/*!40000 ALTER TABLE `magev1_sales_recurring_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_sales_recurring_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_sales_recurring_profile_order`
--

DROP TABLE IF EXISTS `magev1_sales_recurring_profile_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_sales_recurring_profile_order` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Link Id',
  `profile_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Profile Id',
  `order_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Order Id',
  PRIMARY KEY (`link_id`),
  UNIQUE KEY `UNQ_MAGEV1_SALES_RECURRING_PROFILE_ORDER_PROFILE_ID_ORDER_ID` (`profile_id`,`order_id`),
  KEY `IDX_MAGEV1_SALES_RECURRING_PROFILE_ORDER_ORDER_ID` (`order_id`),
  CONSTRAINT `FK_B7C497B3B6611ED77F0E174438B6A307` FOREIGN KEY (`order_id`) REFERENCES `magev1_sales_flat_order` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_D4C8651A550F03F0BD42BC782D7C5D2C` FOREIGN KEY (`profile_id`) REFERENCES `magev1_sales_recurring_profile` (`profile_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Recurring Profile Order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_sales_recurring_profile_order`
--

LOCK TABLES `magev1_sales_recurring_profile_order` WRITE;
/*!40000 ALTER TABLE `magev1_sales_recurring_profile_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_sales_recurring_profile_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_sales_refunded_aggregated`
--

DROP TABLE IF EXISTS `magev1_sales_refunded_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_sales_refunded_aggregated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) NOT NULL DEFAULT '' COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `refunded` decimal(12,4) DEFAULT NULL COMMENT 'Refunded',
  `online_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Online Refunded',
  `offline_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Offline Refunded',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_MAGEV1_SALES_REFUNDED_AGGRED_PERIOD_STORE_ID_ORDER_STS` (`period`,`store_id`,`order_status`),
  KEY `IDX_MAGEV1_SALES_REFUNDED_AGGREGATED_STORE_ID` (`store_id`),
  CONSTRAINT `FK_3D6A53717068F38700B91FC4C683125C` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Refunded Aggregated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_sales_refunded_aggregated`
--

LOCK TABLES `magev1_sales_refunded_aggregated` WRITE;
/*!40000 ALTER TABLE `magev1_sales_refunded_aggregated` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_sales_refunded_aggregated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_sales_refunded_aggregated_order`
--

DROP TABLE IF EXISTS `magev1_sales_refunded_aggregated_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_sales_refunded_aggregated_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `refunded` decimal(12,4) DEFAULT NULL COMMENT 'Refunded',
  `online_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Online Refunded',
  `offline_refunded` decimal(12,4) DEFAULT NULL COMMENT 'Offline Refunded',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNQ_MAGEV1_SALES_REFUNDED_AGGRED_ORDER_PERIOD_STORE_ID_ORDER_STS` (`period`,`store_id`,`order_status`),
  KEY `IDX_MAGEV1_SALES_REFUNDED_AGGREGATED_ORDER_STORE_ID` (`store_id`),
  CONSTRAINT `FK_D0659187CB2EB3B0D4DC8624A9AD5FD0` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Refunded Aggregated Order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_sales_refunded_aggregated_order`
--

LOCK TABLES `magev1_sales_refunded_aggregated_order` WRITE;
/*!40000 ALTER TABLE `magev1_sales_refunded_aggregated_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_sales_refunded_aggregated_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_sales_shipping_aggregated`
--

DROP TABLE IF EXISTS `magev1_sales_shipping_aggregated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_sales_shipping_aggregated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_shipping` decimal(12,4) DEFAULT NULL COMMENT 'Total Shipping',
  `total_shipping_actual` decimal(12,4) DEFAULT NULL COMMENT 'Total Shipping Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `A7226B4A8AA6B20F0AB813F8CC334C04` (`period`,`store_id`,`order_status`,`shipping_description`),
  KEY `IDX_MAGEV1_SALES_SHIPPING_AGGREGATED_STORE_ID` (`store_id`),
  CONSTRAINT `FK_MAGEV1_SALES_SHPP_AGGRED_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Shipping Aggregated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_sales_shipping_aggregated`
--

LOCK TABLES `magev1_sales_shipping_aggregated` WRITE;
/*!40000 ALTER TABLE `magev1_sales_shipping_aggregated` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_sales_shipping_aggregated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_sales_shipping_aggregated_order`
--

DROP TABLE IF EXISTS `magev1_sales_shipping_aggregated_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_sales_shipping_aggregated_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `order_status` varchar(50) DEFAULT NULL COMMENT 'Order Status',
  `shipping_description` varchar(255) DEFAULT NULL COMMENT 'Shipping Description',
  `orders_count` int(11) NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `total_shipping` decimal(12,4) DEFAULT NULL COMMENT 'Total Shipping',
  `total_shipping_actual` decimal(12,4) DEFAULT NULL COMMENT 'Total Shipping Actual',
  PRIMARY KEY (`id`),
  UNIQUE KEY `F40F9EA98D1E55A0EA958AF9E945DE52` (`period`,`store_id`,`order_status`,`shipping_description`),
  KEY `IDX_MAGEV1_SALES_SHIPPING_AGGREGATED_ORDER_STORE_ID` (`store_id`),
  CONSTRAINT `FK_901A90D5E35F919A8ADEFAD3A5C73E22` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Shipping Aggregated Order';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_sales_shipping_aggregated_order`
--

LOCK TABLES `magev1_sales_shipping_aggregated_order` WRITE;
/*!40000 ALTER TABLE `magev1_sales_shipping_aggregated_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_sales_shipping_aggregated_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_salesrule`
--

DROP TABLE IF EXISTS `magev1_salesrule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_salesrule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `description` text COMMENT 'Description',
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `uses_per_customer` int(11) NOT NULL DEFAULT '0' COMMENT 'Uses Per Customer',
  `is_active` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Active',
  `conditions_serialized` mediumtext COMMENT 'Conditions Serialized',
  `actions_serialized` mediumtext COMMENT 'Actions Serialized',
  `stop_rules_processing` smallint(6) NOT NULL DEFAULT '1' COMMENT 'Stop Rules Processing',
  `is_advanced` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Is Advanced',
  `product_ids` text COMMENT 'Product Ids',
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort Order',
  `simple_action` varchar(32) DEFAULT NULL COMMENT 'Simple Action',
  `discount_amount` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Discount Amount',
  `discount_qty` decimal(12,4) DEFAULT NULL COMMENT 'Discount Qty',
  `discount_step` int(10) unsigned NOT NULL COMMENT 'Discount Step',
  `simple_free_shipping` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Simple Free Shipping',
  `apply_to_shipping` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Apply To Shipping',
  `times_used` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Times Used',
  `is_rss` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Is Rss',
  `coupon_type` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Coupon Type',
  `use_auto_generation` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Use Auto Generation',
  `uses_per_coupon` int(11) NOT NULL DEFAULT '0' COMMENT 'Uses Per Coupon',
  PRIMARY KEY (`rule_id`),
  KEY `IDX_MAGEV1_SALESRULE_IS_ACTIVE_SORT_ORDER_TO_DATE_FROM_DATE` (`is_active`,`sort_order`,`to_date`,`from_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_salesrule`
--

LOCK TABLES `magev1_salesrule` WRITE;
/*!40000 ALTER TABLE `magev1_salesrule` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_salesrule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_salesrule_coupon`
--

DROP TABLE IF EXISTS `magev1_salesrule_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_salesrule_coupon` (
  `coupon_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Coupon Id',
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `code` varchar(255) DEFAULT NULL COMMENT 'Code',
  `usage_limit` int(10) unsigned DEFAULT NULL COMMENT 'Usage Limit',
  `usage_per_customer` int(10) unsigned DEFAULT NULL COMMENT 'Usage Per Customer',
  `times_used` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Times Used',
  `expiration_date` timestamp NULL DEFAULT NULL COMMENT 'Expiration Date',
  `is_primary` smallint(5) unsigned DEFAULT NULL COMMENT 'Is Primary',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Coupon Code Creation Date',
  `type` smallint(6) DEFAULT '0' COMMENT 'Coupon Code Type',
  PRIMARY KEY (`coupon_id`),
  UNIQUE KEY `UNQ_MAGEV1_SALESRULE_COUPON_CODE` (`code`),
  UNIQUE KEY `UNQ_MAGEV1_SALESRULE_COUPON_RULE_ID_IS_PRIMARY` (`rule_id`,`is_primary`),
  KEY `IDX_MAGEV1_SALESRULE_COUPON_RULE_ID` (`rule_id`),
  CONSTRAINT `FK_MAGEV1_SALESRULE_COUPON_RULE_ID_MAGEV1_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `magev1_salesrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Coupon';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_salesrule_coupon`
--

LOCK TABLES `magev1_salesrule_coupon` WRITE;
/*!40000 ALTER TABLE `magev1_salesrule_coupon` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_salesrule_coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_salesrule_coupon_usage`
--

DROP TABLE IF EXISTS `magev1_salesrule_coupon_usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_salesrule_coupon_usage` (
  `coupon_id` int(10) unsigned NOT NULL COMMENT 'Coupon Id',
  `customer_id` int(10) unsigned NOT NULL COMMENT 'Customer Id',
  `times_used` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Times Used',
  PRIMARY KEY (`coupon_id`,`customer_id`),
  KEY `IDX_MAGEV1_SALESRULE_COUPON_USAGE_COUPON_ID` (`coupon_id`),
  KEY `IDX_MAGEV1_SALESRULE_COUPON_USAGE_CUSTOMER_ID` (`customer_id`),
  CONSTRAINT `FK_D665BA6808651D7D1C4BA6CE28B1E20F` FOREIGN KEY (`customer_id`) REFERENCES `magev1_customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_EDC71C9B5321FFD9B07B816A19626139` FOREIGN KEY (`coupon_id`) REFERENCES `magev1_salesrule_coupon` (`coupon_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Coupon Usage';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_salesrule_coupon_usage`
--

LOCK TABLES `magev1_salesrule_coupon_usage` WRITE;
/*!40000 ALTER TABLE `magev1_salesrule_coupon_usage` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_salesrule_coupon_usage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_salesrule_customer`
--

DROP TABLE IF EXISTS `magev1_salesrule_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_salesrule_customer` (
  `rule_customer_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Rule Customer Id',
  `rule_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Rule Id',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer Id',
  `times_used` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Times Used',
  PRIMARY KEY (`rule_customer_id`),
  KEY `IDX_MAGEV1_SALESRULE_CUSTOMER_RULE_ID_CUSTOMER_ID` (`rule_id`,`customer_id`),
  KEY `IDX_MAGEV1_SALESRULE_CUSTOMER_CUSTOMER_ID_RULE_ID` (`customer_id`,`rule_id`),
  CONSTRAINT `FK_MAGEV1_SALESRULE_CSTR_CSTR_ID_MAGEV1_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `magev1_customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_SALESRULE_CUSTOMER_RULE_ID_MAGEV1_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `magev1_salesrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Customer';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_salesrule_customer`
--

LOCK TABLES `magev1_salesrule_customer` WRITE;
/*!40000 ALTER TABLE `magev1_salesrule_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_salesrule_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_salesrule_customer_group`
--

DROP TABLE IF EXISTS `magev1_salesrule_customer_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_salesrule_customer_group` (
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  PRIMARY KEY (`rule_id`,`customer_group_id`),
  KEY `IDX_MAGEV1_SALESRULE_CUSTOMER_GROUP_RULE_ID` (`rule_id`),
  KEY `IDX_MAGEV1_SALESRULE_CUSTOMER_GROUP_CUSTOMER_GROUP_ID` (`customer_group_id`),
  CONSTRAINT `FK_7072A0D277454EDF0E8F44C03CE7590B` FOREIGN KEY (`customer_group_id`) REFERENCES `magev1_customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_SALESRULE_CSTR_GROUP_RULE_ID_MAGEV1_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `magev1_salesrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Rules To Customer Groups Relations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_salesrule_customer_group`
--

LOCK TABLES `magev1_salesrule_customer_group` WRITE;
/*!40000 ALTER TABLE `magev1_salesrule_customer_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_salesrule_customer_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_salesrule_label`
--

DROP TABLE IF EXISTS `magev1_salesrule_label`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_salesrule_label` (
  `label_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Label Id',
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `label` varchar(255) DEFAULT NULL COMMENT 'Label',
  PRIMARY KEY (`label_id`),
  UNIQUE KEY `UNQ_MAGEV1_SALESRULE_LABEL_RULE_ID_STORE_ID` (`rule_id`,`store_id`),
  KEY `IDX_MAGEV1_SALESRULE_LABEL_STORE_ID` (`store_id`),
  KEY `IDX_MAGEV1_SALESRULE_LABEL_RULE_ID` (`rule_id`),
  CONSTRAINT `FK_MAGEV1_SALESRULE_LABEL_RULE_ID_MAGEV1_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `magev1_salesrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_SALESRULE_LABEL_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Label';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_salesrule_label`
--

LOCK TABLES `magev1_salesrule_label` WRITE;
/*!40000 ALTER TABLE `magev1_salesrule_label` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_salesrule_label` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_salesrule_product_attribute`
--

DROP TABLE IF EXISTS `magev1_salesrule_product_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_salesrule_product_attribute` (
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  PRIMARY KEY (`rule_id`,`website_id`,`customer_group_id`,`attribute_id`),
  KEY `IDX_MAGEV1_SALESRULE_PRODUCT_ATTRIBUTE_WEBSITE_ID` (`website_id`),
  KEY `IDX_MAGEV1_SALESRULE_PRODUCT_ATTRIBUTE_CUSTOMER_GROUP_ID` (`customer_group_id`),
  KEY `IDX_MAGEV1_SALESRULE_PRODUCT_ATTRIBUTE_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `FK_3101B98ED07753E31299B1D8C5AEF764` FOREIGN KEY (`customer_group_id`) REFERENCES `magev1_customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_MAGEV1_SALESRULE_PRD_ATTR_ATTR_ID_MAGEV1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `magev1_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_MAGEV1_SALESRULE_PRD_ATTR_RULE_ID_MAGEV1_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `magev1_salesrule` (`rule_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_MAGEV1_SALESRULE_PRD_ATTR_WS_ID_MAGEV1_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `magev1_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Salesrule Product Attribute';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_salesrule_product_attribute`
--

LOCK TABLES `magev1_salesrule_product_attribute` WRITE;
/*!40000 ALTER TABLE `magev1_salesrule_product_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_salesrule_product_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_salesrule_website`
--

DROP TABLE IF EXISTS `magev1_salesrule_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_salesrule_website` (
  `rule_id` int(10) unsigned NOT NULL COMMENT 'Rule Id',
  `website_id` smallint(5) unsigned NOT NULL COMMENT 'Website Id',
  PRIMARY KEY (`rule_id`,`website_id`),
  KEY `IDX_MAGEV1_SALESRULE_WEBSITE_RULE_ID` (`rule_id`),
  KEY `IDX_MAGEV1_SALESRULE_WEBSITE_WEBSITE_ID` (`website_id`),
  CONSTRAINT `FK_MAGEV1_SALESRULE_WEBSITE_RULE_ID_MAGEV1_SALESRULE_RULE_ID` FOREIGN KEY (`rule_id`) REFERENCES `magev1_salesrule` (`rule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_SALESRULE_WS_WS_ID_MAGEV1_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `magev1_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sales Rules To Websites Relations';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_salesrule_website`
--

LOCK TABLES `magev1_salesrule_website` WRITE;
/*!40000 ALTER TABLE `magev1_salesrule_website` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_salesrule_website` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_sendfriend_log`
--

DROP TABLE IF EXISTS `magev1_sendfriend_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_sendfriend_log` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Log ID',
  `ip` varbinary(16) DEFAULT NULL,
  `time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Log time',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website ID',
  PRIMARY KEY (`log_id`),
  KEY `IDX_MAGEV1_SENDFRIEND_LOG_IP` (`ip`),
  KEY `IDX_MAGEV1_SENDFRIEND_LOG_TIME` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Send to friend function log storage table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_sendfriend_log`
--

LOCK TABLES `magev1_sendfriend_log` WRITE;
/*!40000 ALTER TABLE `magev1_sendfriend_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_sendfriend_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_shipping_tablerate`
--

DROP TABLE IF EXISTS `magev1_shipping_tablerate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_shipping_tablerate` (
  `pk` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary key',
  `website_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `dest_country_id` varchar(4) NOT NULL DEFAULT '0' COMMENT 'Destination coutry ISO/2 or ISO/3 code',
  `dest_region_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Destination Region Id',
  `dest_zip` varchar(10) NOT NULL DEFAULT '*' COMMENT 'Destination Post Code (Zip)',
  `condition_name` varchar(20) NOT NULL COMMENT 'Rate Condition name',
  `condition_value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Rate condition value',
  `price` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Price',
  `cost` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Cost',
  PRIMARY KEY (`pk`),
  UNIQUE KEY `1B26AFFDB8CFA41D6C703F1AE1C70774` (`website_id`,`dest_country_id`,`dest_region_id`,`dest_zip`,`condition_name`,`condition_value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Shipping Tablerate';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_shipping_tablerate`
--

LOCK TABLES `magev1_shipping_tablerate` WRITE;
/*!40000 ALTER TABLE `magev1_shipping_tablerate` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_shipping_tablerate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_sitemap`
--

DROP TABLE IF EXISTS `magev1_sitemap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_sitemap` (
  `sitemap_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Sitemap Id',
  `sitemap_type` varchar(32) DEFAULT NULL COMMENT 'Sitemap Type',
  `sitemap_filename` varchar(32) DEFAULT NULL COMMENT 'Sitemap Filename',
  `sitemap_path` varchar(255) DEFAULT NULL COMMENT 'Sitemap Path',
  `sitemap_time` timestamp NULL DEFAULT NULL COMMENT 'Sitemap Time',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store id',
  PRIMARY KEY (`sitemap_id`),
  KEY `IDX_MAGEV1_SITEMAP_STORE_ID` (`store_id`),
  CONSTRAINT `FK_MAGEV1_SITEMAP_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Google Sitemap';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_sitemap`
--

LOCK TABLES `magev1_sitemap` WRITE;
/*!40000 ALTER TABLE `magev1_sitemap` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_sitemap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_tag`
--

DROP TABLE IF EXISTS `magev1_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_tag` (
  `tag_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tag Id',
  `name` varchar(255) DEFAULT NULL COMMENT 'Name',
  `status` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Status',
  `first_customer_id` int(10) unsigned DEFAULT NULL COMMENT 'First Customer Id',
  `first_store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'First Store Id',
  PRIMARY KEY (`tag_id`),
  KEY `FK_MAGEV1_TAG_FIRST_CUSTOMER_ID_MAGEV1_CUSTOMER_ENTITY_ENTITY_ID` (`first_customer_id`),
  KEY `FK_MAGEV1_TAG_FIRST_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` (`first_store_id`),
  CONSTRAINT `FK_MAGEV1_TAG_FIRST_CUSTOMER_ID_MAGEV1_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`first_customer_id`) REFERENCES `magev1_customer_entity` (`entity_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `FK_MAGEV1_TAG_FIRST_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`first_store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tag';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_tag`
--

LOCK TABLES `magev1_tag` WRITE;
/*!40000 ALTER TABLE `magev1_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_tag_properties`
--

DROP TABLE IF EXISTS `magev1_tag_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_tag_properties` (
  `tag_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Tag Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `base_popularity` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Base Popularity',
  PRIMARY KEY (`tag_id`,`store_id`),
  KEY `IDX_MAGEV1_TAG_PROPERTIES_STORE_ID` (`store_id`),
  CONSTRAINT `FK_MAGEV1_TAG_PROPERTIES_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_TAG_PROPERTIES_TAG_ID_MAGEV1_TAG_TAG_ID` FOREIGN KEY (`tag_id`) REFERENCES `magev1_tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tag Properties';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_tag_properties`
--

LOCK TABLES `magev1_tag_properties` WRITE;
/*!40000 ALTER TABLE `magev1_tag_properties` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_tag_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_tag_relation`
--

DROP TABLE IF EXISTS `magev1_tag_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_tag_relation` (
  `tag_relation_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Tag Relation Id',
  `tag_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Tag Id',
  `customer_id` int(10) unsigned DEFAULT NULL COMMENT 'Customer Id',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Store Id',
  `active` smallint(5) unsigned NOT NULL DEFAULT '1' COMMENT 'Active',
  `created_at` timestamp NULL DEFAULT NULL COMMENT 'Created At',
  PRIMARY KEY (`tag_relation_id`),
  UNIQUE KEY `UNQ_MAGEV1_TAG_RELATION_TAG_ID_CUSTOMER_ID_PRODUCT_ID_STORE_ID` (`tag_id`,`customer_id`,`product_id`,`store_id`),
  KEY `IDX_MAGEV1_TAG_RELATION_PRODUCT_ID` (`product_id`),
  KEY `IDX_MAGEV1_TAG_RELATION_TAG_ID` (`tag_id`),
  KEY `IDX_MAGEV1_TAG_RELATION_CUSTOMER_ID` (`customer_id`),
  KEY `IDX_MAGEV1_TAG_RELATION_STORE_ID` (`store_id`),
  CONSTRAINT `FK_MAGEV1_TAG_RELATION_CSTR_ID_MAGEV1_CSTR_ENTT_ENTT_ID` FOREIGN KEY (`customer_id`) REFERENCES `magev1_customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_TAG_RELATION_PRD_ID_MAGEV1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_TAG_RELATION_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_TAG_RELATION_TAG_ID_MAGEV1_TAG_TAG_ID` FOREIGN KEY (`tag_id`) REFERENCES `magev1_tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tag Relation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_tag_relation`
--

LOCK TABLES `magev1_tag_relation` WRITE;
/*!40000 ALTER TABLE `magev1_tag_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_tag_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_tag_summary`
--

DROP TABLE IF EXISTS `magev1_tag_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_tag_summary` (
  `tag_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Tag Id',
  `store_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Store Id',
  `customers` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customers',
  `products` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Products',
  `uses` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Uses',
  `historical_uses` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Historical Uses',
  `popularity` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Popularity',
  `base_popularity` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Base Popularity',
  PRIMARY KEY (`tag_id`,`store_id`),
  KEY `IDX_MAGEV1_TAG_SUMMARY_STORE_ID` (`store_id`),
  KEY `IDX_MAGEV1_TAG_SUMMARY_TAG_ID` (`tag_id`),
  CONSTRAINT `FK_MAGEV1_TAG_SUMMARY_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_TAG_SUMMARY_TAG_ID_MAGEV1_TAG_TAG_ID` FOREIGN KEY (`tag_id`) REFERENCES `magev1_tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tag Summary';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_tag_summary`
--

LOCK TABLES `magev1_tag_summary` WRITE;
/*!40000 ALTER TABLE `magev1_tag_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_tag_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_tax_calculation`
--

DROP TABLE IF EXISTS `magev1_tax_calculation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_tax_calculation` (
  `tax_calculation_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Id',
  `tax_calculation_rate_id` int(11) NOT NULL COMMENT 'Tax Calculation Rate Id',
  `tax_calculation_rule_id` int(11) NOT NULL COMMENT 'Tax Calculation Rule Id',
  `customer_tax_class_id` smallint(6) NOT NULL COMMENT 'Customer Tax Class Id',
  `product_tax_class_id` smallint(6) NOT NULL COMMENT 'Product Tax Class Id',
  PRIMARY KEY (`tax_calculation_id`),
  KEY `IDX_MAGEV1_TAX_CALCULATION_TAX_CALCULATION_RULE_ID` (`tax_calculation_rule_id`),
  KEY `IDX_MAGEV1_TAX_CALCULATION_TAX_CALCULATION_RATE_ID` (`tax_calculation_rate_id`),
  KEY `IDX_MAGEV1_TAX_CALCULATION_CUSTOMER_TAX_CLASS_ID` (`customer_tax_class_id`),
  KEY `IDX_MAGEV1_TAX_CALCULATION_PRODUCT_TAX_CLASS_ID` (`product_tax_class_id`),
  KEY `50E0A16E0B6176A34D2B8446DFC31532` (`tax_calculation_rate_id`,`customer_tax_class_id`,`product_tax_class_id`),
  CONSTRAINT `FK_435E8E7B78F81D500FB5A37499AC7784` FOREIGN KEY (`tax_calculation_rate_id`) REFERENCES `magev1_tax_calculation_rate` (`tax_calculation_rate_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_C1CF190ACB8928BDC710291E9D94D732` FOREIGN KEY (`tax_calculation_rule_id`) REFERENCES `magev1_tax_calculation_rule` (`tax_calculation_rule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_TAX_CALC_CSTR_TAX_CLASS_ID_MAGEV1_TAX_CLASS_CLASS_ID` FOREIGN KEY (`customer_tax_class_id`) REFERENCES `magev1_tax_class` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_TAX_CALC_PRD_TAX_CLASS_ID_MAGEV1_TAX_CLASS_CLASS_ID` FOREIGN KEY (`product_tax_class_id`) REFERENCES `magev1_tax_class` (`class_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Tax Calculation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_tax_calculation`
--

LOCK TABLES `magev1_tax_calculation` WRITE;
/*!40000 ALTER TABLE `magev1_tax_calculation` DISABLE KEYS */;
INSERT INTO `magev1_tax_calculation` VALUES (1,1,1,3,2),(2,2,1,3,2);
/*!40000 ALTER TABLE `magev1_tax_calculation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_tax_calculation_rate`
--

DROP TABLE IF EXISTS `magev1_tax_calculation_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_tax_calculation_rate` (
  `tax_calculation_rate_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Rate Id',
  `tax_country_id` varchar(2) NOT NULL COMMENT 'Tax Country Id',
  `tax_region_id` int(11) NOT NULL COMMENT 'Tax Region Id',
  `tax_postcode` varchar(21) DEFAULT NULL COMMENT 'Tax Postcode',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `rate` decimal(12,4) NOT NULL COMMENT 'Rate',
  `zip_is_range` smallint(6) DEFAULT NULL COMMENT 'Zip Is Range',
  `zip_from` int(10) unsigned DEFAULT NULL COMMENT 'Zip From',
  `zip_to` int(10) unsigned DEFAULT NULL COMMENT 'Zip To',
  PRIMARY KEY (`tax_calculation_rate_id`),
  KEY `644DB88A947D3DF5E30F7888D2D1052C` (`tax_country_id`,`tax_region_id`,`tax_postcode`),
  KEY `IDX_MAGEV1_TAX_CALCULATION_RATE_CODE` (`code`),
  KEY `0B1DFB94D7416667E3136D05BA067C5D` (`tax_calculation_rate_id`,`tax_country_id`,`tax_region_id`,`zip_is_range`,`tax_postcode`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Tax Calculation Rate';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_tax_calculation_rate`
--

LOCK TABLES `magev1_tax_calculation_rate` WRITE;
/*!40000 ALTER TABLE `magev1_tax_calculation_rate` DISABLE KEYS */;
INSERT INTO `magev1_tax_calculation_rate` VALUES (1,'US',12,'*','US-CA-*-Rate 1',8.2500,NULL,NULL,NULL),(2,'US',43,'*','US-NY-*-Rate 1',8.3750,NULL,NULL,NULL);
/*!40000 ALTER TABLE `magev1_tax_calculation_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_tax_calculation_rate_title`
--

DROP TABLE IF EXISTS `magev1_tax_calculation_rate_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_tax_calculation_rate_title` (
  `tax_calculation_rate_title_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Rate Title Id',
  `tax_calculation_rate_id` int(11) NOT NULL COMMENT 'Tax Calculation Rate Id',
  `store_id` smallint(5) unsigned NOT NULL COMMENT 'Store Id',
  `value` varchar(255) NOT NULL COMMENT 'Value',
  PRIMARY KEY (`tax_calculation_rate_title_id`),
  KEY `IDX_MAGEV1_TAX_CALC_RATE_TTL_TAX_CALC_RATE_ID_STORE_ID` (`tax_calculation_rate_id`,`store_id`),
  KEY `IDX_MAGEV1_TAX_CALCULATION_RATE_TITLE_TAX_CALCULATION_RATE_ID` (`tax_calculation_rate_id`),
  KEY `IDX_MAGEV1_TAX_CALCULATION_RATE_TITLE_STORE_ID` (`store_id`),
  CONSTRAINT `FK_C01203F058DBB84A826DE1B00C1B1463` FOREIGN KEY (`tax_calculation_rate_id`) REFERENCES `magev1_tax_calculation_rate` (`tax_calculation_rate_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_TAX_CALC_RATE_TTL_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Calculation Rate Title';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_tax_calculation_rate_title`
--

LOCK TABLES `magev1_tax_calculation_rate_title` WRITE;
/*!40000 ALTER TABLE `magev1_tax_calculation_rate_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_tax_calculation_rate_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_tax_calculation_rule`
--

DROP TABLE IF EXISTS `magev1_tax_calculation_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_tax_calculation_rule` (
  `tax_calculation_rule_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Tax Calculation Rule Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `priority` int(11) NOT NULL COMMENT 'Priority',
  `position` int(11) NOT NULL COMMENT 'Position',
  `calculate_subtotal` int(11) NOT NULL COMMENT 'Calculate off subtotal option',
  PRIMARY KEY (`tax_calculation_rule_id`),
  KEY `IDX_MAGEV1_TAX_CALC_RULE_PRIORITY_POSITION_TAX_CALC_RULE_ID` (`priority`,`position`,`tax_calculation_rule_id`),
  KEY `IDX_MAGEV1_TAX_CALCULATION_RULE_CODE` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Tax Calculation Rule';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_tax_calculation_rule`
--

LOCK TABLES `magev1_tax_calculation_rule` WRITE;
/*!40000 ALTER TABLE `magev1_tax_calculation_rule` DISABLE KEYS */;
INSERT INTO `magev1_tax_calculation_rule` VALUES (1,'Retail Customer-Taxable Goods-Rate 1',1,1,0);
/*!40000 ALTER TABLE `magev1_tax_calculation_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_tax_class`
--

DROP TABLE IF EXISTS `magev1_tax_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_tax_class` (
  `class_id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT 'Class Id',
  `class_name` varchar(255) NOT NULL COMMENT 'Class Name',
  `class_type` varchar(8) NOT NULL DEFAULT 'CUSTOMER' COMMENT 'Class Type',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Tax Class';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_tax_class`
--

LOCK TABLES `magev1_tax_class` WRITE;
/*!40000 ALTER TABLE `magev1_tax_class` DISABLE KEYS */;
INSERT INTO `magev1_tax_class` VALUES (2,'Taxable Goods','PRODUCT'),(3,'Retail Customer','CUSTOMER'),(4,'Shipping','PRODUCT');
/*!40000 ALTER TABLE `magev1_tax_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_tax_order_aggregated_created`
--

DROP TABLE IF EXISTS `magev1_tax_order_aggregated_created`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_tax_order_aggregated_created` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `percent` float DEFAULT NULL COMMENT 'Percent',
  `orders_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `tax_base_amount_sum` float DEFAULT NULL COMMENT 'Tax Base Amount Sum',
  PRIMARY KEY (`id`),
  UNIQUE KEY `E318D308333EA2E83B6318F1FE23ADAF` (`period`,`store_id`,`code`,`percent`,`order_status`),
  KEY `IDX_MAGEV1_TAX_ORDER_AGGREGATED_CREATED_STORE_ID` (`store_id`),
  CONSTRAINT `FK_2F484B04BE9BFFD6E41D281495F73EAC` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tax Order Aggregation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_tax_order_aggregated_created`
--

LOCK TABLES `magev1_tax_order_aggregated_created` WRITE;
/*!40000 ALTER TABLE `magev1_tax_order_aggregated_created` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_tax_order_aggregated_created` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_tax_order_aggregated_updated`
--

DROP TABLE IF EXISTS `magev1_tax_order_aggregated_updated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_tax_order_aggregated_updated` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `period` date DEFAULT NULL COMMENT 'Period',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `order_status` varchar(50) NOT NULL COMMENT 'Order Status',
  `percent` float DEFAULT NULL COMMENT 'Percent',
  `orders_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Orders Count',
  `tax_base_amount_sum` float DEFAULT NULL COMMENT 'Tax Base Amount Sum',
  PRIMARY KEY (`id`),
  UNIQUE KEY `3B7A92375F8D92CE68214F0A23DCDB0D` (`period`,`store_id`,`code`,`percent`,`order_status`),
  KEY `IDX_MAGEV1_TAX_ORDER_AGGREGATED_UPDATED_STORE_ID` (`store_id`),
  CONSTRAINT `FK_56EFAD4E494B93F4E4C6E7695F8EEAB2` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Magev1 Tax Order Aggregated Updated';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_tax_order_aggregated_updated`
--

LOCK TABLES `magev1_tax_order_aggregated_updated` WRITE;
/*!40000 ALTER TABLE `magev1_tax_order_aggregated_updated` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_tax_order_aggregated_updated` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_weee_discount`
--

DROP TABLE IF EXISTS `magev1_weee_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_weee_discount` (
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `customer_group_id` smallint(5) unsigned NOT NULL COMMENT 'Customer Group Id',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  KEY `IDX_MAGEV1_WEEE_DISCOUNT_WEBSITE_ID` (`website_id`),
  KEY `IDX_MAGEV1_WEEE_DISCOUNT_ENTITY_ID` (`entity_id`),
  KEY `IDX_MAGEV1_WEEE_DISCOUNT_CUSTOMER_GROUP_ID` (`customer_group_id`),
  CONSTRAINT `FK_5E6525539BA3D73990622846CEC698A2` FOREIGN KEY (`customer_group_id`) REFERENCES `magev1_customer_group` (`customer_group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_WEEE_DISCOUNT_ENTT_ID_MAGEV1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_WEEE_DISCOUNT_WS_ID_MAGEV1_CORE_WS_WS_ID` FOREIGN KEY (`website_id`) REFERENCES `magev1_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Weee Discount';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_weee_discount`
--

LOCK TABLES `magev1_weee_discount` WRITE;
/*!40000 ALTER TABLE `magev1_weee_discount` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_weee_discount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_weee_tax`
--

DROP TABLE IF EXISTS `magev1_weee_tax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_weee_tax` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Value Id',
  `website_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Website Id',
  `entity_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Entity Id',
  `country` varchar(2) DEFAULT NULL COMMENT 'Country',
  `value` decimal(12,4) NOT NULL DEFAULT '0.0000' COMMENT 'Value',
  `state` varchar(255) NOT NULL DEFAULT '*' COMMENT 'State',
  `attribute_id` smallint(5) unsigned NOT NULL COMMENT 'Attribute Id',
  `entity_type_id` smallint(5) unsigned NOT NULL COMMENT 'Entity Type Id',
  PRIMARY KEY (`value_id`),
  KEY `IDX_MAGEV1_WEEE_TAX_WEBSITE_ID` (`website_id`),
  KEY `IDX_MAGEV1_WEEE_TAX_ENTITY_ID` (`entity_id`),
  KEY `IDX_MAGEV1_WEEE_TAX_COUNTRY` (`country`),
  KEY `IDX_MAGEV1_WEEE_TAX_ATTRIBUTE_ID` (`attribute_id`),
  CONSTRAINT `FK_MAGEV1_WEEE_TAX_ATTR_ID_MAGEV1_EAV_ATTR_ATTR_ID` FOREIGN KEY (`attribute_id`) REFERENCES `magev1_eav_attribute` (`attribute_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_WEEE_TAX_COUNTRY_MAGEV1_DIRECTORY_COUNTRY_COUNTRY_ID` FOREIGN KEY (`country`) REFERENCES `magev1_directory_country` (`country_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_WEEE_TAX_ENTT_ID_MAGEV1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`entity_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_WEEE_TAX_WEBSITE_ID_MAGEV1_CORE_WEBSITE_WEBSITE_ID` FOREIGN KEY (`website_id`) REFERENCES `magev1_core_website` (`website_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Weee Tax';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_weee_tax`
--

LOCK TABLES `magev1_weee_tax` WRITE;
/*!40000 ALTER TABLE `magev1_weee_tax` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_weee_tax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_widget`
--

DROP TABLE IF EXISTS `magev1_widget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_widget` (
  `widget_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Widget Id',
  `widget_code` varchar(255) DEFAULT NULL COMMENT 'Widget code for template directive',
  `widget_type` varchar(255) DEFAULT NULL COMMENT 'Widget Type',
  `parameters` text COMMENT 'Parameters',
  PRIMARY KEY (`widget_id`),
  KEY `IDX_MAGEV1_WIDGET_WIDGET_CODE` (`widget_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Preconfigured Widgets';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_widget`
--

LOCK TABLES `magev1_widget` WRITE;
/*!40000 ALTER TABLE `magev1_widget` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_widget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_widget_instance`
--

DROP TABLE IF EXISTS `magev1_widget_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_widget_instance` (
  `instance_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Instance Id',
  `instance_type` varchar(255) DEFAULT NULL COMMENT 'Instance Type',
  `package_theme` varchar(255) DEFAULT NULL COMMENT 'Package Theme',
  `title` varchar(255) DEFAULT NULL COMMENT 'Widget Title',
  `store_ids` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Store ids',
  `widget_parameters` text COMMENT 'Widget parameters',
  `sort_order` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Sort order',
  PRIMARY KEY (`instance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Instances of Widget for Package Theme';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_widget_instance`
--

LOCK TABLES `magev1_widget_instance` WRITE;
/*!40000 ALTER TABLE `magev1_widget_instance` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_widget_instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_widget_instance_page`
--

DROP TABLE IF EXISTS `magev1_widget_instance_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_widget_instance_page` (
  `page_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Page Id',
  `instance_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Instance Id',
  `page_group` varchar(25) DEFAULT NULL COMMENT 'Block Group Type',
  `layout_handle` varchar(255) DEFAULT NULL COMMENT 'Layout Handle',
  `block_reference` varchar(255) DEFAULT NULL COMMENT 'Block Reference',
  `page_for` varchar(25) DEFAULT NULL COMMENT 'For instance entities',
  `entities` text COMMENT 'Catalog entities (comma separated)',
  `page_template` varchar(255) DEFAULT NULL COMMENT 'Path to widget template',
  PRIMARY KEY (`page_id`),
  KEY `IDX_MAGEV1_WIDGET_INSTANCE_PAGE_INSTANCE_ID` (`instance_id`),
  CONSTRAINT `FK_95E23243F0010140D3946D3C2BB86D02` FOREIGN KEY (`instance_id`) REFERENCES `magev1_widget_instance` (`instance_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Instance of Widget on Page';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_widget_instance_page`
--

LOCK TABLES `magev1_widget_instance_page` WRITE;
/*!40000 ALTER TABLE `magev1_widget_instance_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_widget_instance_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_widget_instance_page_layout`
--

DROP TABLE IF EXISTS `magev1_widget_instance_page_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_widget_instance_page_layout` (
  `page_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Page Id',
  `layout_update_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Layout Update Id',
  UNIQUE KEY `UNQ_MAGEV1_WIDGET_INSTANCE_PAGE_LAYOUT_LAYOUT_UPDATE_ID_PAGE_ID` (`layout_update_id`,`page_id`),
  KEY `IDX_MAGEV1_WIDGET_INSTANCE_PAGE_LAYOUT_PAGE_ID` (`page_id`),
  KEY `IDX_MAGEV1_WIDGET_INSTANCE_PAGE_LAYOUT_LAYOUT_UPDATE_ID` (`layout_update_id`),
  CONSTRAINT `FK_3DFBD698B1600211CD353DD07176DEFA` FOREIGN KEY (`page_id`) REFERENCES `magev1_widget_instance_page` (`page_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_6E91B2B2A2327C09E5350AD8503215E8` FOREIGN KEY (`layout_update_id`) REFERENCES `magev1_core_layout_update` (`layout_update_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Layout updates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_widget_instance_page_layout`
--

LOCK TABLES `magev1_widget_instance_page_layout` WRITE;
/*!40000 ALTER TABLE `magev1_widget_instance_page_layout` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_widget_instance_page_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_wishlist`
--

DROP TABLE IF EXISTS `magev1_wishlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_wishlist` (
  `wishlist_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Wishlist ID',
  `customer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Customer ID',
  `shared` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'Sharing flag (0 or 1)',
  `sharing_code` varchar(32) DEFAULT NULL COMMENT 'Sharing encrypted code',
  `updated_at` timestamp NULL DEFAULT NULL COMMENT 'Last updated date',
  PRIMARY KEY (`wishlist_id`),
  UNIQUE KEY `UNQ_MAGEV1_WISHLIST_CUSTOMER_ID` (`customer_id`),
  KEY `IDX_MAGEV1_WISHLIST_SHARED` (`shared`),
  CONSTRAINT `FK_MAGEV1_WISHLIST_CUSTOMER_ID_MAGEV1_CUSTOMER_ENTITY_ENTITY_ID` FOREIGN KEY (`customer_id`) REFERENCES `magev1_customer_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Wishlist main Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_wishlist`
--

LOCK TABLES `magev1_wishlist` WRITE;
/*!40000 ALTER TABLE `magev1_wishlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_wishlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_wishlist_item`
--

DROP TABLE IF EXISTS `magev1_wishlist_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_wishlist_item` (
  `wishlist_item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Wishlist item ID',
  `wishlist_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Wishlist ID',
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Product ID',
  `store_id` smallint(5) unsigned DEFAULT NULL COMMENT 'Store ID',
  `added_at` timestamp NULL DEFAULT NULL COMMENT 'Add date and time',
  `description` text COMMENT 'Short description of wish list item',
  `qty` decimal(12,4) NOT NULL COMMENT 'Qty',
  PRIMARY KEY (`wishlist_item_id`),
  KEY `IDX_MAGEV1_WISHLIST_ITEM_WISHLIST_ID` (`wishlist_id`),
  KEY `IDX_MAGEV1_WISHLIST_ITEM_PRODUCT_ID` (`product_id`),
  KEY `IDX_MAGEV1_WISHLIST_ITEM_STORE_ID` (`store_id`),
  CONSTRAINT `FK_MAGEV1_WISHLIST_ITEM_PRD_ID_MAGEV1_CAT_PRD_ENTT_ENTT_ID` FOREIGN KEY (`product_id`) REFERENCES `magev1_catalog_product_entity` (`entity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_WISHLIST_ITEM_STORE_ID_MAGEV1_CORE_STORE_STORE_ID` FOREIGN KEY (`store_id`) REFERENCES `magev1_core_store` (`store_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `FK_MAGEV1_WISHLIST_ITEM_WISHLIST_ID_MAGEV1_WISHLIST_WISHLIST_ID` FOREIGN KEY (`wishlist_id`) REFERENCES `magev1_wishlist` (`wishlist_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Wishlist items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_wishlist_item`
--

LOCK TABLES `magev1_wishlist_item` WRITE;
/*!40000 ALTER TABLE `magev1_wishlist_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_wishlist_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `magev1_wishlist_item_option`
--

DROP TABLE IF EXISTS `magev1_wishlist_item_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `magev1_wishlist_item_option` (
  `option_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Option Id',
  `wishlist_item_id` int(10) unsigned NOT NULL COMMENT 'Wishlist Item Id',
  `product_id` int(10) unsigned NOT NULL COMMENT 'Product Id',
  `code` varchar(255) NOT NULL COMMENT 'Code',
  `value` text COMMENT 'Value',
  PRIMARY KEY (`option_id`),
  KEY `FK_5B5A2DE2ABBF8FE2273C638F065097F6` (`wishlist_item_id`),
  CONSTRAINT `FK_5B5A2DE2ABBF8FE2273C638F065097F6` FOREIGN KEY (`wishlist_item_id`) REFERENCES `magev1_wishlist_item` (`wishlist_item_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Wishlist Item Option Table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `magev1_wishlist_item_option`
--

LOCK TABLES `magev1_wishlist_item_option` WRITE;
/*!40000 ALTER TABLE `magev1_wishlist_item_option` DISABLE KEYS */;
/*!40000 ALTER TABLE `magev1_wishlist_item_option` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-06  2:11:01
