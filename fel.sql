-- MySQL dump 10.13  Distrib 5.5.41, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: fel
-- ------------------------------------------------------
-- Server version	5.5.47-0+deb7u1

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
-- Table structure for table `acl`
--

DROP TABLE IF EXISTS `acl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `url_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `resource_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_acl_acl/resources_id` (`resource_id`),
  KEY `FK_acl_acl/roles_id` (`role_id`),
  KEY `FK_acl_acl/url_id` (`url_id`),
  CONSTRAINT `FK_acl_acl/resources_id` FOREIGN KEY (`resource_id`) REFERENCES `acl/resources` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_acl_acl/roles_id` FOREIGN KEY (`role_id`) REFERENCES `acl/roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_acl_acl/url_id` FOREIGN KEY (`url_id`) REFERENCES `acl/url` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl`
--

LOCK TABLES `acl` WRITE;
/*!40000 ALTER TABLE `acl` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl/resources`
--

DROP TABLE IF EXISTS `acl/resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl/resources` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('page','module','file') NOT NULL,
  `page_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_acl/resources_pages_id` (`page_id`),
  CONSTRAINT `FK_acl/resources_pages_id` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl/resources`
--

LOCK TABLES `acl/resources` WRITE;
/*!40000 ALTER TABLE `acl/resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl/resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl/roles`
--

DROP TABLE IF EXISTS `acl/roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl/roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `permission` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl/roles`
--

LOCK TABLES `acl/roles` WRITE;
/*!40000 ALTER TABLE `acl/roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl/roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `acl/url`
--

DROP TABLE IF EXISTS `acl/url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl/url` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl/url`
--

LOCK TABLES `acl/url` WRITE;
/*!40000 ALTER TABLE `acl/url` DISABLE KEYS */;
/*!40000 ALTER TABLE `acl/url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogs`
--

DROP TABLE IF EXISTS `catalogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `meta` varchar(255) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_catalogs_users_id` (`creator_id`),
  CONSTRAINT `FK_catalogs_users_id` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogs`
--

LOCK TABLES `catalogs` WRITE;
/*!40000 ALTER TABLE `catalogs` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogs/categories`
--

DROP TABLE IF EXISTS `catalogs/categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogs/categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catalog_id` int(10) unsigned NOT NULL,
  `meta` varchar(255) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_catalogs_categories_catalogs_id` (`catalog_id`),
  CONSTRAINT `FK_catalogs/categories_catalogs_id` FOREIGN KEY (`catalog_id`) REFERENCES `catalogs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogs/categories`
--

LOCK TABLES `catalogs/categories` WRITE;
/*!40000 ALTER TABLE `catalogs/categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogs/categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalogs/works`
--

DROP TABLE IF EXISTS `catalogs/works`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalogs/works` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `meta` varchar(255) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_catalogs_categories_works_catalogs_categories_id` (`category_id`),
  CONSTRAINT `FK_catalogs/works_catalogs/categories_id` FOREIGN KEY (`category_id`) REFERENCES `catalogs/categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogs/works`
--

LOCK TABLES `catalogs/works` WRITE;
/*!40000 ALTER TABLE `catalogs/works` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalogs/works` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tree_id` int(10) unsigned NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `creator_id` int(10) unsigned NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_comments_messages_comments_id` (`tree_id`),
  KEY `FK_comments_messages_comments_messages_id` (`parent_id`),
  KEY `FK_comments_messages_users_id` (`creator_id`),
  CONSTRAINT `FK_comments_comments_id` FOREIGN KEY (`parent_id`) REFERENCES `comments` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_comments_users_id` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(50) DEFAULT NULL,
  `skype` varchar(255) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `pinterest` varchar(255) DEFAULT NULL,
  `other` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `prototype_id` int(10) unsigned DEFAULT NULL,
  `type` enum('picture','file','audio','video') NOT NULL,
  `name` varchar(50) NOT NULL,
  `discription` varchar(255) DEFAULT NULL,
  `path` varchar(255) NOT NULL,
  `extension` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_documents_documents_prototypes_id` (`prototype_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_files`
--

DROP TABLE IF EXISTS `documents_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_files` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `discription` varchar(255) DEFAULT NULL,
  `path` varchar(255) NOT NULL,
  `extension` enum('txt') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_files`
--

LOCK TABLES `documents_files` WRITE;
/*!40000 ALTER TABLE `documents_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents_prototypes`
--

DROP TABLE IF EXISTS `documents_prototypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents_prototypes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `width` int(10) unsigned NOT NULL,
  `height` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents_prototypes`
--

LOCK TABLES `documents_prototypes` WRITE;
/*!40000 ALTER TABLE `documents_prototypes` DISABLE KEYS */;
/*!40000 ALTER TABLE `documents_prototypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `creator_id` int(10) unsigned NOT NULL,
  `s_description` varchar(255) DEFAULT NULL,
  `description` varchar(4000) DEFAULT NULL,
  `periodic` varchar(255) DEFAULT NULL,
  `begin_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `end_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `tags` varchar(255) DEFAULT NULL,
  `type_id` int(10) unsigned NOT NULL,
  `place_id` int(10) unsigned NOT NULL,
  `contact_id` int(10) unsigned DEFAULT NULL,
  `participation_id` int(10) unsigned NOT NULL,
  `ad_inform` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_events_contacts_id` (`contact_id`),
  KEY `FK_events_events/participations_id` (`participation_id`),
  KEY `FK_events_events/types_id` (`type_id`),
  KEY `FK_events_places_id` (`place_id`),
  KEY `FK_events_users_id` (`creator_id`),
  CONSTRAINT `FK_events_contacts_id` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_events_events/participations_id` FOREIGN KEY (`participation_id`) REFERENCES `events/participations` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_events_events/types_id` FOREIGN KEY (`type_id`) REFERENCES `events/types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_events_places_id` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_events_users_id` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events/members`
--

DROP TABLE IF EXISTS `events/members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events/members` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `event_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_events/members_events_id` (`event_id`),
  KEY `FK_events/members_users_id` (`user_id`),
  CONSTRAINT `FK_events/members_events_id` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_events/members_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events/members`
--

LOCK TABLES `events/members` WRITE;
/*!40000 ALTER TABLE `events/members` DISABLE KEYS */;
/*!40000 ALTER TABLE `events/members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events/participations`
--

DROP TABLE IF EXISTS `events/participations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events/participations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events/participations`
--

LOCK TABLES `events/participations` WRITE;
/*!40000 ALTER TABLE `events/participations` DISABLE KEYS */;
/*!40000 ALTER TABLE `events/participations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events/types`
--

DROP TABLE IF EXISTS `events/types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events/types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events/types`
--

LOCK TABLES `events/types` WRITE;
/*!40000 ALTER TABLE `events/types` DISABLE KEYS */;
/*!40000 ALTER TABLE `events/types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journals`
--

DROP TABLE IF EXISTS `journals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journals` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creator_id` int(10) unsigned NOT NULL,
  `meta` varchar(255) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_journals_users_id` (`creator_id`),
  CONSTRAINT `FK_journals_users_id` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journals`
--

LOCK TABLES `journals` WRITE;
/*!40000 ALTER TABLE `journals` DISABLE KEYS */;
/*!40000 ALTER TABLE `journals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journals/articles`
--

DROP TABLE IF EXISTS `journals/articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journals/articles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `theme_id` int(10) unsigned NOT NULL,
  `meta` varchar(255) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `s_description` varchar(255) DEFAULT NULL,
  `description` varchar(4000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_journals_articles_journals_articles_themes_id` (`theme_id`),
  CONSTRAINT `FK_journals/articles_journals/themes_id` FOREIGN KEY (`theme_id`) REFERENCES `journals/themes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journals/articles`
--

LOCK TABLES `journals/articles` WRITE;
/*!40000 ALTER TABLE `journals/articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `journals/articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journals/themes`
--

DROP TABLE IF EXISTS `journals/themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `journals/themes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `journal_id` int(10) unsigned NOT NULL,
  `meta` varchar(255) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_journals_articles_themes_journals_id` (`journal_id`),
  CONSTRAINT `FK_journals/themes_journals_id` FOREIGN KEY (`journal_id`) REFERENCES `journals` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journals/themes`
--

LOCK TABLES `journals/themes` WRITE;
/*!40000 ALTER TABLE `journals/themes` DISABLE KEYS */;
/*!40000 ALTER TABLE `journals/themes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `languages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `short` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) unsigned NOT NULL,
  `receiver_id` int(10) unsigned NOT NULL,
  `state` enum('new','readed') NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `message` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_messages_rusers_id` (`receiver_id`),
  KEY `FK_messages_susers_id` (`sender_id`),
  CONSTRAINT `FK_messages_rusers_id` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_messages_susers_id` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `controller_name` varchar(50) NOT NULL,
  `method_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules_parameters`
--

DROP TABLE IF EXISTS `modules_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modules_parameters` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module_id` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_modules_parameters_modules_id` (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules_parameters`
--

LOCK TABLES `modules_parameters` WRITE;
/*!40000 ALTER TABLE `modules_parameters` DISABLE KEYS */;
/*!40000 ALTER TABLE `modules_parameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template_id` int(10) unsigned NOT NULL,
  `meta` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pages_metas_id` (`meta`),
  KEY `FK_pages_pages_templates_id` (`template_id`),
  CONSTRAINT `FK_pages_pages/templates_id` FOREIGN KEY (`template_id`) REFERENCES `pages/templates` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages/blocks`
--

DROP TABLE IF EXISTS `pages/blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages/blocks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` varchar(10000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pages_blocks_pages_id` (`page_id`),
  CONSTRAINT `FK_pages/blocks_pages_id` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages/blocks`
--

LOCK TABLES `pages/blocks` WRITE;
/*!40000 ALTER TABLE `pages/blocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages/blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages/tblocks`
--

DROP TABLE IF EXISTS `pages/tblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages/tblocks` (
  `id` int(10) NOT NULL,
  `template_id` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `value` varchar(10000) DEFAULT NULL,
  KEY `FK_pages/tblocks_pages/templates_id` (`template_id`),
  CONSTRAINT `FK_pages/tblocks_pages/templates_id` FOREIGN KEY (`template_id`) REFERENCES `pages/templates` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages/tblocks`
--

LOCK TABLES `pages/tblocks` WRITE;
/*!40000 ALTER TABLE `pages/tblocks` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages/tblocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages/templates`
--

DROP TABLE IF EXISTS `pages/templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages/templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages/templates`
--

LOCK TABLES `pages/templates` WRITE;
/*!40000 ALTER TABLE `pages/templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages/templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `places`
--

DROP TABLE IF EXISTS `places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `places` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `country` varchar(50) NOT NULL,
  `region` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `places`
--

LOCK TABLES `places` WRITE;
/*!40000 ALTER TABLE `places` DISABLE KEYS */;
/*!40000 ALTER TABLE `places` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(50) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `inviter_id` int(10) unsigned DEFAULT NULL,
  `expired` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `role_id` int(10) unsigned NOT NULL,
  `contact_id` int(10) unsigned DEFAULT NULL,
  `place_id` int(10) unsigned DEFAULT NULL,
  `registration_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_updated_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_visited_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  KEY `FK_users_acl/roles_id` (`role_id`),
  KEY `FK_users_contacts_id` (`contact_id`),
  KEY `FK_users_places_id` (`place_id`),
  KEY `FK_users_users_id` (`inviter_id`),
  CONSTRAINT `FK_users_acl/roles_id` FOREIGN KEY (`role_id`) REFERENCES `acl/roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_users_contacts_id` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_users_places_id` FOREIGN KEY (`place_id`) REFERENCES `places` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_users_users_id` FOREIGN KEY (`inviter_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'nap_ge@mail.ru','1',1,'2016-04-14 09:53:53',1,1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,'nik@mail.ru','1',1,'2016-04-14 09:55:03',1,1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,'0','0',1,'2016-04-14 10:09:08',1,1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,'qwer@mail.ru','qwe',1,'2016-04-14 10:13:54',1,1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00','0000-00-00 00:00:00'),(6,'qwer@mail.ru','qwe',1,'2016-04-14 10:15:48',1,1,1,'2016-04-14 08:15:48','0000-00-00 00:00:00','0000-00-00 00:00:00'),(7,'nap_ge@mail.ru','asdzxc',1,'2016-04-20 08:40:29',1,1,1,'2016-04-20 06:40:29','0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users/images`
--

DROP TABLE IF EXISTS `users/images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users/images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_users/images_users_id` (`user_id`),
  CONSTRAINT `FK_users/images_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users/images`
--

LOCK TABLES `users/images` WRITE;
/*!40000 ALTER TABLE `users/images` DISABLE KEYS */;
/*!40000 ALTER TABLE `users/images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users/languages`
--

DROP TABLE IF EXISTS `users/languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users/languages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `language_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_users/languages_languages_id` (`language_id`),
  KEY `FK_users/languages_users_id` (`user_id`),
  CONSTRAINT `FK_users/languages_languages_id` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_users/languages_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users/languages`
--

LOCK TABLES `users/languages` WRITE;
/*!40000 ALTER TABLE `users/languages` DISABLE KEYS */;
/*!40000 ALTER TABLE `users/languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users/links`
--

DROP TABLE IF EXISTS `users/links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users/links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `type` enum('"link"','"online"','"offline"') NOT NULL,
  `name` varchar(50) NOT NULL,
  `ref` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_users/links_users_id` (`user_id`),
  CONSTRAINT `FK_users/links_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users/links`
--

LOCK TABLES `users/links` WRITE;
/*!40000 ALTER TABLE `users/links` DISABLE KEYS */;
/*!40000 ALTER TABLE `users/links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users/penalties`
--

DROP TABLE IF EXISTS `users/penalties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users/penalties` (
  `id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `block` tinyint(1) DEFAULT NULL,
  `invite` tinyint(1) DEFAULT NULL,
  `comment` tinyint(1) DEFAULT NULL,
  `event` tinyint(1) DEFAULT NULL,
  `group` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_users/penalties_users_id` (`user_id`),
  CONSTRAINT `FK_users/penalties_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users/penalties`
--

LOCK TABLES `users/penalties` WRITE;
/*!40000 ALTER TABLE `users/penalties` DISABLE KEYS */;
/*!40000 ALTER TABLE `users/penalties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users/profiles`
--

DROP TABLE IF EXISTS `users/profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users/profiles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `middlename` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `about` varchar(255) DEFAULT NULL,
  `specialty` varchar(255) DEFAULT NULL,
  `proficiency_level` enum('full_time','hobbyist') NOT NULL,
  `availability` enum('"online"','"offline"','"both"') NOT NULL,
  `custom_orders` tinyint(1) DEFAULT NULL,
  `members_special` varchar(255) DEFAULT NULL,
  `wholesale_policies` varchar(255) DEFAULT NULL,
  `tutor_status` enum('"Locally"','"Globally"','"No"') DEFAULT NULL,
  `shipping` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_users/profiles_users_id` (`user_id`),
  CONSTRAINT `FK_users/profiles_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users/profiles`
--

LOCK TABLES `users/profiles` WRITE;
/*!40000 ALTER TABLE `users/profiles` DISABLE KEYS */;
/*!40000 ALTER TABLE `users/profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users/promotions`
--

DROP TABLE IF EXISTS `users/promotions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users/promotions` (
  `id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `discount_time` timestamp NULL DEFAULT NULL,
  `discount_prc` smallint(6) unsigned DEFAULT NULL,
  `newsletter` smallint(6) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_users/promotions_users_id` (`user_id`),
  CONSTRAINT `FK_users/promotions_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users/promotions`
--

LOCK TABLES `users/promotions` WRITE;
/*!40000 ALTER TABLE `users/promotions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users/promotions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-21 17:15:52
