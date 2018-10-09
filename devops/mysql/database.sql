-- MySQL dump 10.16  Distrib 10.1.26-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: mysql    Database: mautic
-- ------------------------------------------------------
-- Server version	5.7.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `mauticasset_downloads`
--

DROP TABLE IF EXISTS `mauticasset_downloads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticasset_downloads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `asset_id` int(11) DEFAULT NULL,
  `ip_id` int(11) NOT NULL,
  `lead_id` int(11) DEFAULT NULL,
  `email_id` int(11) DEFAULT NULL,
  `date_download` datetime NOT NULL,
  `code` int(11) NOT NULL,
  `referer` longtext COLLATE utf8_unicode_ci,
  `tracking_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_375B22A65DA1941` (`asset_id`),
  KEY `IDX_375B22A6A03F5E9F` (`ip_id`),
  KEY `IDX_375B22A655458D` (`lead_id`),
  KEY `IDX_375B22A6A832C1C9` (`email_id`),
  KEY `mauticdownload_tracking_search` (`tracking_id`),
  KEY `mauticdownload_source_search` (`source`,`source_id`),
  KEY `mauticasset_date_download` (`date_download`),
  CONSTRAINT `FK_375B22A655458D` FOREIGN KEY (`lead_id`) REFERENCES `mauticleads` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_375B22A65DA1941` FOREIGN KEY (`asset_id`) REFERENCES `mauticassets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_375B22A6A03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `mauticip_addresses` (`id`),
  CONSTRAINT `FK_375B22A6A832C1C9` FOREIGN KEY (`email_id`) REFERENCES `mauticemails` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticasset_downloads`
--

LOCK TABLES `mauticasset_downloads` WRITE;
/*!40000 ALTER TABLE `mauticasset_downloads` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticasset_downloads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticassets`
--

DROP TABLE IF EXISTS `mauticassets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticassets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `storage_location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remote_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `original_file_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `download_count` int(11) NOT NULL,
  `unique_download_count` int(11) NOT NULL,
  `revision` int(11) NOT NULL,
  `extension` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `disallow` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5CB40FB112469DE2` (`category_id`),
  KEY `mauticasset_alias_search` (`alias`),
  CONSTRAINT `FK_5CB40FB112469DE2` FOREIGN KEY (`category_id`) REFERENCES `mauticcategories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticassets`
--

LOCK TABLES `mauticassets` WRITE;
/*!40000 ALTER TABLE `mauticassets` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticassets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticaudit_log`
--

DROP TABLE IF EXISTS `mauticaudit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticaudit_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bundle` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `object` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `object_id` int(11) NOT NULL,
  `action` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `details` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `date_added` datetime NOT NULL,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mauticobject_search` (`object`,`object_id`),
  KEY `mautictimeline_search` (`bundle`,`object`,`action`,`object_id`),
  KEY `mauticdate_added_index` (`date_added`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticaudit_log`
--

LOCK TABLES `mauticaudit_log` WRITE;
/*!40000 ALTER TABLE `mauticaudit_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticaudit_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticcache_items`
--

DROP TABLE IF EXISTS `mauticcache_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticcache_items` (
  `item_id` varbinary(255) NOT NULL,
  `item_data` longblob NOT NULL,
  `item_lifetime` int(10) unsigned DEFAULT NULL,
  `item_time` int(10) unsigned NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticcache_items`
--

LOCK TABLES `mauticcache_items` WRITE;
/*!40000 ALTER TABLE `mauticcache_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticcache_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticcampaign_events`
--

DROP TABLE IF EXISTS `mauticcampaign_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticcampaign_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `event_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `event_order` int(11) NOT NULL,
  `properties` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `trigger_date` datetime DEFAULT NULL,
  `trigger_interval` int(11) DEFAULT NULL,
  `trigger_interval_unit` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `trigger_mode` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `decision_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `temp_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `channel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1FD640CEF639F774` (`campaign_id`),
  KEY `IDX_1FD640CE727ACA70` (`parent_id`),
  KEY `mauticcampaign_event_search` (`type`,`event_type`),
  KEY `mauticcampaign_event_type` (`event_type`),
  KEY `mauticcampaign_event_channel` (`channel`,`channel_id`),
  CONSTRAINT `FK_1FD640CE727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `mauticcampaign_events` (`id`),
  CONSTRAINT `FK_1FD640CEF639F774` FOREIGN KEY (`campaign_id`) REFERENCES `mauticcampaigns` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticcampaign_events`
--

LOCK TABLES `mauticcampaign_events` WRITE;
/*!40000 ALTER TABLE `mauticcampaign_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticcampaign_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticcampaign_form_xref`
--

DROP TABLE IF EXISTS `mauticcampaign_form_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticcampaign_form_xref` (
  `campaign_id` int(11) NOT NULL,
  `form_id` int(11) NOT NULL,
  PRIMARY KEY (`campaign_id`,`form_id`),
  KEY `IDX_F13E22DF639F774` (`campaign_id`),
  KEY `IDX_F13E22D5FF69B7D` (`form_id`),
  CONSTRAINT `FK_F13E22D5FF69B7D` FOREIGN KEY (`form_id`) REFERENCES `mauticforms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_F13E22DF639F774` FOREIGN KEY (`campaign_id`) REFERENCES `mauticcampaigns` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticcampaign_form_xref`
--

LOCK TABLES `mauticcampaign_form_xref` WRITE;
/*!40000 ALTER TABLE `mauticcampaign_form_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticcampaign_form_xref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticcampaign_lead_event_failed_log`
--

DROP TABLE IF EXISTS `mauticcampaign_lead_event_failed_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticcampaign_lead_event_failed_log` (
  `log_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `reason` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`log_id`),
  KEY `mauticcampaign_event_failed_date` (`date_added`),
  CONSTRAINT `FK_7FD63A68EA675D86` FOREIGN KEY (`log_id`) REFERENCES `mauticcampaign_lead_event_log` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticcampaign_lead_event_failed_log`
--

LOCK TABLES `mauticcampaign_lead_event_failed_log` WRITE;
/*!40000 ALTER TABLE `mauticcampaign_lead_event_failed_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticcampaign_lead_event_failed_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticcampaign_lead_event_log`
--

DROP TABLE IF EXISTS `mauticcampaign_lead_event_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticcampaign_lead_event_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `lead_id` int(11) NOT NULL,
  `campaign_id` int(11) DEFAULT NULL,
  `ip_id` int(11) DEFAULT NULL,
  `rotation` int(11) NOT NULL,
  `date_triggered` datetime DEFAULT NULL,
  `is_scheduled` tinyint(1) NOT NULL,
  `trigger_date` datetime DEFAULT NULL,
  `system_triggered` tinyint(1) NOT NULL,
  `metadata` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `channel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `non_action_path_taken` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mauticcampaign_rotation` (`event_id`,`lead_id`,`rotation`),
  KEY `IDX_288AE85471F7E88B` (`event_id`),
  KEY `IDX_288AE85455458D` (`lead_id`),
  KEY `IDX_288AE854F639F774` (`campaign_id`),
  KEY `IDX_288AE854A03F5E9F` (`ip_id`),
  KEY `mauticcampaign_event_upcoming_search` (`is_scheduled`,`lead_id`),
  KEY `mauticcampaign_event_schedule_counts` (`campaign_id`,`is_scheduled`,`trigger_date`),
  KEY `mauticcampaign_date_triggered` (`date_triggered`),
  KEY `mauticcampaign_leads` (`lead_id`,`campaign_id`,`rotation`),
  KEY `mauticcampaign_log_channel` (`channel`,`channel_id`,`lead_id`),
  KEY `mauticcampaign_actions` (`campaign_id`,`event_id`,`date_triggered`),
  KEY `mauticcampaign_stats` (`campaign_id`,`date_triggered`,`event_id`,`non_action_path_taken`),
  CONSTRAINT `FK_288AE85455458D` FOREIGN KEY (`lead_id`) REFERENCES `mauticleads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_288AE85471F7E88B` FOREIGN KEY (`event_id`) REFERENCES `mauticcampaign_events` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_288AE854A03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `mauticip_addresses` (`id`),
  CONSTRAINT `FK_288AE854F639F774` FOREIGN KEY (`campaign_id`) REFERENCES `mauticcampaigns` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticcampaign_lead_event_log`
--

LOCK TABLES `mauticcampaign_lead_event_log` WRITE;
/*!40000 ALTER TABLE `mauticcampaign_lead_event_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticcampaign_lead_event_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticcampaign_leadlist_xref`
--

DROP TABLE IF EXISTS `mauticcampaign_leadlist_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticcampaign_leadlist_xref` (
  `campaign_id` int(11) NOT NULL,
  `leadlist_id` int(11) NOT NULL,
  PRIMARY KEY (`campaign_id`,`leadlist_id`),
  KEY `IDX_13875568F639F774` (`campaign_id`),
  KEY `IDX_13875568B9FC8874` (`leadlist_id`),
  CONSTRAINT `FK_13875568B9FC8874` FOREIGN KEY (`leadlist_id`) REFERENCES `mauticlead_lists` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_13875568F639F774` FOREIGN KEY (`campaign_id`) REFERENCES `mauticcampaigns` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticcampaign_leadlist_xref`
--

LOCK TABLES `mauticcampaign_leadlist_xref` WRITE;
/*!40000 ALTER TABLE `mauticcampaign_leadlist_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticcampaign_leadlist_xref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticcampaign_leads`
--

DROP TABLE IF EXISTS `mauticcampaign_leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticcampaign_leads` (
  `campaign_id` int(11) NOT NULL,
  `lead_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `manually_removed` tinyint(1) NOT NULL,
  `manually_added` tinyint(1) NOT NULL,
  `date_last_exited` datetime DEFAULT NULL,
  `rotation` int(11) NOT NULL,
  PRIMARY KEY (`campaign_id`,`lead_id`),
  KEY `IDX_2F979F73F639F774` (`campaign_id`),
  KEY `IDX_2F979F7355458D` (`lead_id`),
  KEY `mauticcampaign_leads_date_added` (`date_added`),
  KEY `mauticcampaign_leads_date_exited` (`date_last_exited`),
  KEY `mauticcampaign_leads` (`campaign_id`,`manually_removed`,`lead_id`,`rotation`),
  CONSTRAINT `FK_2F979F7355458D` FOREIGN KEY (`lead_id`) REFERENCES `mauticleads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_2F979F73F639F774` FOREIGN KEY (`campaign_id`) REFERENCES `mauticcampaigns` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticcampaign_leads`
--

LOCK TABLES `mauticcampaign_leads` WRITE;
/*!40000 ALTER TABLE `mauticcampaign_leads` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticcampaign_leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticcampaigns`
--

DROP TABLE IF EXISTS `mauticcampaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticcampaigns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `canvas_settings` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `allow_restart` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_EC95585B12469DE2` (`category_id`),
  CONSTRAINT `FK_EC95585B12469DE2` FOREIGN KEY (`category_id`) REFERENCES `mauticcategories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticcampaigns`
--

LOCK TABLES `mauticcampaigns` WRITE;
/*!40000 ALTER TABLE `mauticcampaigns` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticcampaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticcategories`
--

DROP TABLE IF EXISTS `mauticcategories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticcategories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(7) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bundle` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mauticcategory_alias_search` (`alias`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticcategories`
--

LOCK TABLES `mauticcategories` WRITE;
/*!40000 ALTER TABLE `mauticcategories` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticcategories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticchannel_url_trackables`
--

DROP TABLE IF EXISTS `mauticchannel_url_trackables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticchannel_url_trackables` (
  `redirect_id` int(11) NOT NULL,
  `channel_id` int(11) NOT NULL,
  `channel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hits` int(11) NOT NULL,
  `unique_hits` int(11) NOT NULL,
  PRIMARY KEY (`redirect_id`,`channel_id`),
  KEY `IDX_5886F45BB42D874D` (`redirect_id`),
  KEY `mauticchannel_url_trackable_search` (`channel`,`channel_id`),
  CONSTRAINT `FK_5886F45BB42D874D` FOREIGN KEY (`redirect_id`) REFERENCES `mauticpage_redirects` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticchannel_url_trackables`
--

LOCK TABLES `mauticchannel_url_trackables` WRITE;
/*!40000 ALTER TABLE `mauticchannel_url_trackables` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticchannel_url_trackables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticcompanies`
--

DROP TABLE IF EXISTS `mauticcompanies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticcompanies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `social_cache` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `score` int(11) DEFAULT NULL,
  `companyemail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `companyaddress1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `companyaddress2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `companyphone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `companycity` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `companystate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `companyzipcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `companycountry` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `companyname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `companywebsite` longtext COLLATE utf8_unicode_ci,
  `companyindustry` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `companydescription` longtext COLLATE utf8_unicode_ci,
  `companynumber_of_employees` double DEFAULT NULL,
  `companyfax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `companyannual_revenue` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8DA286117E3C61F9` (`owner_id`),
  KEY `mauticcompanyaddress1_search` (`companyaddress1`),
  KEY `mauticcompanyaddress2_search` (`companyaddress2`),
  KEY `mauticcompanyemail_search` (`companyemail`),
  KEY `mauticcompanyphone_search` (`companyphone`),
  KEY `mauticcompanycity_search` (`companycity`),
  KEY `mauticcompanystate_search` (`companystate`),
  KEY `mauticcompanyzipcode_search` (`companyzipcode`),
  KEY `mauticcompanycountry_search` (`companycountry`),
  KEY `mauticcompanyname_search` (`companyname`),
  KEY `mauticcompanynumber_of_employees_search` (`companynumber_of_employees`),
  KEY `mauticcompanyfax_search` (`companyfax`),
  KEY `mauticcompanyannual_revenue_search` (`companyannual_revenue`),
  KEY `mauticcompanyindustry_search` (`companyindustry`),
  KEY `mauticcompany_filter` (`companyname`,`companyemail`),
  KEY `mauticcompany_match` (`companyname`,`companycity`,`companycountry`,`companystate`),
  CONSTRAINT `FK_8DA286117E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `mauticusers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticcompanies`
--

LOCK TABLES `mauticcompanies` WRITE;
/*!40000 ALTER TABLE `mauticcompanies` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticcompanies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticcompanies_leads`
--

DROP TABLE IF EXISTS `mauticcompanies_leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticcompanies_leads` (
  `company_id` int(11) NOT NULL,
  `lead_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `is_primary` tinyint(1) DEFAULT NULL,
  `manually_removed` tinyint(1) NOT NULL,
  `manually_added` tinyint(1) NOT NULL,
  PRIMARY KEY (`company_id`,`lead_id`),
  KEY `IDX_650B649F979B1AD6` (`company_id`),
  KEY `IDX_650B649F55458D` (`lead_id`),
  CONSTRAINT `FK_650B649F55458D` FOREIGN KEY (`lead_id`) REFERENCES `mauticleads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_650B649F979B1AD6` FOREIGN KEY (`company_id`) REFERENCES `mauticcompanies` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticcompanies_leads`
--

LOCK TABLES `mauticcompanies_leads` WRITE;
/*!40000 ALTER TABLE `mauticcompanies_leads` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticcompanies_leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticcontact_merge_records`
--

DROP TABLE IF EXISTS `mauticcontact_merge_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticcontact_merge_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `merged_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D9D422BEE7A1254A` (`contact_id`),
  KEY `mauticcontact_merge_date_added` (`date_added`),
  KEY `mauticcontact_merge_ids` (`merged_id`),
  CONSTRAINT `FK_D9D422BEE7A1254A` FOREIGN KEY (`contact_id`) REFERENCES `mauticleads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticcontact_merge_records`
--

LOCK TABLES `mauticcontact_merge_records` WRITE;
/*!40000 ALTER TABLE `mauticcontact_merge_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticcontact_merge_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticdynamic_content`
--

DROP TABLE IF EXISTS `mauticdynamic_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticdynamic_content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `translation_parent_id` int(11) DEFAULT NULL,
  `variant_parent_id` int(11) DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `sent_count` int(11) NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci,
  `utm_tags` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json_array)',
  `lang` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `variant_settings` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `variant_start_date` datetime DEFAULT NULL,
  `filters` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `is_campaign_based` tinyint(1) NOT NULL DEFAULT '1',
  `slot_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B1ABB09B12469DE2` (`category_id`),
  KEY `IDX_B1ABB09B9091A2FB` (`translation_parent_id`),
  KEY `IDX_B1ABB09B91861123` (`variant_parent_id`),
  KEY `mauticis_campaign_based_index` (`is_campaign_based`),
  KEY `mauticslot_name_index` (`slot_name`),
  CONSTRAINT `FK_B1ABB09B12469DE2` FOREIGN KEY (`category_id`) REFERENCES `mauticcategories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_B1ABB09B9091A2FB` FOREIGN KEY (`translation_parent_id`) REFERENCES `mauticdynamic_content` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B1ABB09B91861123` FOREIGN KEY (`variant_parent_id`) REFERENCES `mauticdynamic_content` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticdynamic_content`
--

LOCK TABLES `mauticdynamic_content` WRITE;
/*!40000 ALTER TABLE `mauticdynamic_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticdynamic_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticdynamic_content_lead_data`
--

DROP TABLE IF EXISTS `mauticdynamic_content_lead_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticdynamic_content_lead_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lead_id` int(11) NOT NULL,
  `dynamic_content_id` int(11) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `slot` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1931BE955458D` (`lead_id`),
  KEY `IDX_1931BE9D9D0CD7` (`dynamic_content_id`),
  CONSTRAINT `FK_1931BE955458D` FOREIGN KEY (`lead_id`) REFERENCES `mauticleads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_1931BE9D9D0CD7` FOREIGN KEY (`dynamic_content_id`) REFERENCES `mauticdynamic_content` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticdynamic_content_lead_data`
--

LOCK TABLES `mauticdynamic_content_lead_data` WRITE;
/*!40000 ALTER TABLE `mauticdynamic_content_lead_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticdynamic_content_lead_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticdynamic_content_stats`
--

DROP TABLE IF EXISTS `mauticdynamic_content_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticdynamic_content_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dynamic_content_id` int(11) DEFAULT NULL,
  `lead_id` int(11) DEFAULT NULL,
  `date_sent` datetime NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `tokens` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `sent_count` int(11) DEFAULT NULL,
  `last_sent` datetime DEFAULT NULL,
  `sent_details` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_E4EF6F81D9D0CD7` (`dynamic_content_id`),
  KEY `IDX_E4EF6F8155458D` (`lead_id`),
  KEY `mauticstat_dynamic_content_search` (`dynamic_content_id`,`lead_id`),
  KEY `mauticstat_dynamic_content_source_search` (`source`,`source_id`),
  CONSTRAINT `FK_E4EF6F8155458D` FOREIGN KEY (`lead_id`) REFERENCES `mauticleads` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_E4EF6F81D9D0CD7` FOREIGN KEY (`dynamic_content_id`) REFERENCES `mauticdynamic_content` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticdynamic_content_stats`
--

LOCK TABLES `mauticdynamic_content_stats` WRITE;
/*!40000 ALTER TABLE `mauticdynamic_content_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticdynamic_content_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticemail_assets_xref`
--

DROP TABLE IF EXISTS `mauticemail_assets_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticemail_assets_xref` (
  `email_id` int(11) NOT NULL,
  `asset_id` int(11) NOT NULL,
  PRIMARY KEY (`email_id`,`asset_id`),
  KEY `IDX_247D15DEA832C1C9` (`email_id`),
  KEY `IDX_247D15DE5DA1941` (`asset_id`),
  CONSTRAINT `FK_247D15DE5DA1941` FOREIGN KEY (`asset_id`) REFERENCES `mauticassets` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_247D15DEA832C1C9` FOREIGN KEY (`email_id`) REFERENCES `mauticemails` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticemail_assets_xref`
--

LOCK TABLES `mauticemail_assets_xref` WRITE;
/*!40000 ALTER TABLE `mauticemail_assets_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticemail_assets_xref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticemail_copies`
--

DROP TABLE IF EXISTS `mauticemail_copies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticemail_copies` (
  `id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `date_created` datetime NOT NULL,
  `body` longtext COLLATE utf8_unicode_ci,
  `subject` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticemail_copies`
--

LOCK TABLES `mauticemail_copies` WRITE;
/*!40000 ALTER TABLE `mauticemail_copies` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticemail_copies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticemail_list_xref`
--

DROP TABLE IF EXISTS `mauticemail_list_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticemail_list_xref` (
  `email_id` int(11) NOT NULL,
  `leadlist_id` int(11) NOT NULL,
  PRIMARY KEY (`email_id`,`leadlist_id`),
  KEY `IDX_BF369E35A832C1C9` (`email_id`),
  KEY `IDX_BF369E35B9FC8874` (`leadlist_id`),
  CONSTRAINT `FK_BF369E35A832C1C9` FOREIGN KEY (`email_id`) REFERENCES `mauticemails` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_BF369E35B9FC8874` FOREIGN KEY (`leadlist_id`) REFERENCES `mauticlead_lists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticemail_list_xref`
--

LOCK TABLES `mauticemail_list_xref` WRITE;
/*!40000 ALTER TABLE `mauticemail_list_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticemail_list_xref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticemail_stat_replies`
--

DROP TABLE IF EXISTS `mauticemail_stat_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticemail_stat_replies` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `stat_id` int(11) NOT NULL,
  `date_replied` datetime NOT NULL,
  `message_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2EB2BC7F9502F0B` (`stat_id`),
  KEY `mauticemail_replies` (`stat_id`,`message_id`),
  KEY `mauticdate_email_replied` (`date_replied`),
  CONSTRAINT `FK_2EB2BC7F9502F0B` FOREIGN KEY (`stat_id`) REFERENCES `mauticemail_stats` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticemail_stat_replies`
--

LOCK TABLES `mauticemail_stat_replies` WRITE;
/*!40000 ALTER TABLE `mauticemail_stat_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticemail_stat_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticemail_stats`
--

DROP TABLE IF EXISTS `mauticemail_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticemail_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email_id` int(11) DEFAULT NULL,
  `lead_id` int(11) DEFAULT NULL,
  `list_id` int(11) DEFAULT NULL,
  `ip_id` int(11) DEFAULT NULL,
  `copy_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_sent` datetime NOT NULL,
  `is_read` tinyint(1) NOT NULL,
  `is_failed` tinyint(1) NOT NULL,
  `viewed_in_browser` tinyint(1) NOT NULL,
  `date_read` datetime DEFAULT NULL,
  `tracking_hash` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `retry_count` int(11) DEFAULT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `tokens` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `open_count` int(11) DEFAULT NULL,
  `last_opened` datetime DEFAULT NULL,
  `open_details` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_8EA2B849A832C1C9` (`email_id`),
  KEY `IDX_8EA2B84955458D` (`lead_id`),
  KEY `IDX_8EA2B8493DAE168B` (`list_id`),
  KEY `IDX_8EA2B849A03F5E9F` (`ip_id`),
  KEY `IDX_8EA2B849A8752772` (`copy_id`),
  KEY `mauticstat_email_search` (`email_id`,`lead_id`),
  KEY `mauticstat_email_search2` (`lead_id`,`email_id`),
  KEY `mauticstat_email_failed_search` (`is_failed`),
  KEY `mauticstat_email_read_search` (`is_read`),
  KEY `mauticstat_email_hash_search` (`tracking_hash`),
  KEY `mauticstat_email_source_search` (`source`,`source_id`),
  KEY `mauticemail_date_sent` (`date_sent`),
  KEY `mauticemail_date_read` (`date_read`),
  CONSTRAINT `FK_8EA2B8493DAE168B` FOREIGN KEY (`list_id`) REFERENCES `mauticlead_lists` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_8EA2B84955458D` FOREIGN KEY (`lead_id`) REFERENCES `mauticleads` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_8EA2B849A03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `mauticip_addresses` (`id`),
  CONSTRAINT `FK_8EA2B849A832C1C9` FOREIGN KEY (`email_id`) REFERENCES `mauticemails` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_8EA2B849A8752772` FOREIGN KEY (`copy_id`) REFERENCES `mauticemail_copies` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticemail_stats`
--

LOCK TABLES `mauticemail_stats` WRITE;
/*!40000 ALTER TABLE `mauticemail_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticemail_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticemail_stats_devices`
--

DROP TABLE IF EXISTS `mauticemail_stats_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticemail_stats_devices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) DEFAULT NULL,
  `stat_id` int(11) DEFAULT NULL,
  `ip_id` int(11) DEFAULT NULL,
  `date_opened` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1A05C9F094A4C7D4` (`device_id`),
  KEY `IDX_1A05C9F09502F0B` (`stat_id`),
  KEY `IDX_1A05C9F0A03F5E9F` (`ip_id`),
  KEY `mauticdate_opened_search` (`date_opened`),
  CONSTRAINT `FK_1A05C9F094A4C7D4` FOREIGN KEY (`device_id`) REFERENCES `mauticlead_devices` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_1A05C9F09502F0B` FOREIGN KEY (`stat_id`) REFERENCES `mauticemail_stats` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_1A05C9F0A03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `mauticip_addresses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticemail_stats_devices`
--

LOCK TABLES `mauticemail_stats_devices` WRITE;
/*!40000 ALTER TABLE `mauticemail_stats_devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticemail_stats_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticemails`
--

DROP TABLE IF EXISTS `mauticemails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticemails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `translation_parent_id` int(11) DEFAULT NULL,
  `variant_parent_id` int(11) DEFAULT NULL,
  `unsubscribeform_id` int(11) DEFAULT NULL,
  `preference_center_id` int(11) DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `subject` longtext COLLATE utf8_unicode_ci,
  `from_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reply_to_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bcc_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `utm_tags` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `plain_text` longtext COLLATE utf8_unicode_ci,
  `custom_html` longtext COLLATE utf8_unicode_ci,
  `email_type` longtext COLLATE utf8_unicode_ci,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `read_count` int(11) NOT NULL,
  `sent_count` int(11) NOT NULL,
  `variant_sent_count` int(11) NOT NULL,
  `variant_read_count` int(11) NOT NULL,
  `revision` int(11) NOT NULL,
  `lang` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `variant_settings` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `variant_start_date` datetime DEFAULT NULL,
  `dynamic_content` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `headers` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`),
  KEY `IDX_69E49A6D12469DE2` (`category_id`),
  KEY `IDX_69E49A6D9091A2FB` (`translation_parent_id`),
  KEY `IDX_69E49A6D91861123` (`variant_parent_id`),
  KEY `IDX_69E49A6D2DC494F6` (`unsubscribeform_id`),
  KEY `IDX_69E49A6D834F9C5B` (`preference_center_id`),
  CONSTRAINT `FK_69E49A6D12469DE2` FOREIGN KEY (`category_id`) REFERENCES `mauticcategories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_69E49A6D2DC494F6` FOREIGN KEY (`unsubscribeform_id`) REFERENCES `mauticforms` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_69E49A6D834F9C5B` FOREIGN KEY (`preference_center_id`) REFERENCES `mauticpages` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_69E49A6D9091A2FB` FOREIGN KEY (`translation_parent_id`) REFERENCES `mauticemails` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_69E49A6D91861123` FOREIGN KEY (`variant_parent_id`) REFERENCES `mauticemails` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticemails`
--

LOCK TABLES `mauticemails` WRITE;
/*!40000 ALTER TABLE `mauticemails` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticemails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticfocus`
--

DROP TABLE IF EXISTS `mauticfocus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticfocus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `focus_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `style` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `properties` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `utm_tags` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `form_id` int(11) DEFAULT NULL,
  `cache` longtext COLLATE utf8_unicode_ci,
  `html_mode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `editor` longtext COLLATE utf8_unicode_ci,
  `html` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_6860D55B12469DE2` (`category_id`),
  KEY `mauticfocus_type` (`focus_type`),
  KEY `mauticfocus_style` (`style`),
  KEY `mauticfocus_form` (`form_id`),
  CONSTRAINT `FK_6860D55B12469DE2` FOREIGN KEY (`category_id`) REFERENCES `mauticcategories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticfocus`
--

LOCK TABLES `mauticfocus` WRITE;
/*!40000 ALTER TABLE `mauticfocus` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticfocus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticfocus_stats`
--

DROP TABLE IF EXISTS `mauticfocus_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticfocus_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `focus_id` int(11) NOT NULL,
  `lead_id` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_87C1EEB051804B42` (`focus_id`),
  KEY `IDX_87C1EEB055458D` (`lead_id`),
  KEY `mauticfocus_type` (`type`),
  KEY `mauticfocus_type_id` (`type`,`type_id`),
  KEY `mauticfocus_date_added` (`date_added`),
  CONSTRAINT `FK_87C1EEB051804B42` FOREIGN KEY (`focus_id`) REFERENCES `mauticfocus` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_87C1EEB055458D` FOREIGN KEY (`lead_id`) REFERENCES `mauticleads` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticfocus_stats`
--

LOCK TABLES `mauticfocus_stats` WRITE;
/*!40000 ALTER TABLE `mauticfocus_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticfocus_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticform_actions`
--

DROP TABLE IF EXISTS `mauticform_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticform_actions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `action_order` int(11) NOT NULL,
  `properties` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_706414395FF69B7D` (`form_id`),
  KEY `mauticform_action_type_search` (`type`),
  CONSTRAINT `FK_706414395FF69B7D` FOREIGN KEY (`form_id`) REFERENCES `mauticforms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticform_actions`
--

LOCK TABLES `mauticform_actions` WRITE;
/*!40000 ALTER TABLE `mauticform_actions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticform_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticform_fields`
--

DROP TABLE IF EXISTS `mauticform_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticform_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL,
  `label` longtext COLLATE utf8_unicode_ci NOT NULL,
  `show_label` tinyint(1) DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_custom` tinyint(1) NOT NULL,
  `custom_parameters` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `default_value` longtext COLLATE utf8_unicode_ci,
  `is_required` tinyint(1) NOT NULL,
  `validation_message` longtext COLLATE utf8_unicode_ci,
  `help_message` longtext COLLATE utf8_unicode_ci,
  `field_order` int(11) DEFAULT NULL,
  `properties` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `label_attr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `input_attr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `container_attr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lead_field` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `save_result` tinyint(1) DEFAULT NULL,
  `is_auto_fill` tinyint(1) DEFAULT NULL,
  `show_when_value_exists` tinyint(1) DEFAULT NULL,
  `show_after_x_submissions` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_38A3A94A5FF69B7D` (`form_id`),
  KEY `mauticform_field_type_search` (`type`),
  CONSTRAINT `FK_38A3A94A5FF69B7D` FOREIGN KEY (`form_id`) REFERENCES `mauticforms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticform_fields`
--

LOCK TABLES `mauticform_fields` WRITE;
/*!40000 ALTER TABLE `mauticform_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticform_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticform_submissions`
--

DROP TABLE IF EXISTS `mauticform_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticform_submissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `form_id` int(11) NOT NULL,
  `ip_id` int(11) NOT NULL,
  `lead_id` int(11) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  `tracking_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_submitted` datetime NOT NULL,
  `referer` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8A2973E45FF69B7D` (`form_id`),
  KEY `IDX_8A2973E4A03F5E9F` (`ip_id`),
  KEY `IDX_8A2973E455458D` (`lead_id`),
  KEY `IDX_8A2973E4C4663E4` (`page_id`),
  KEY `mauticform_submission_tracking_search` (`tracking_id`),
  KEY `mauticform_date_submitted` (`date_submitted`),
  CONSTRAINT `FK_8A2973E455458D` FOREIGN KEY (`lead_id`) REFERENCES `mauticleads` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_8A2973E45FF69B7D` FOREIGN KEY (`form_id`) REFERENCES `mauticforms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_8A2973E4A03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `mauticip_addresses` (`id`),
  CONSTRAINT `FK_8A2973E4C4663E4` FOREIGN KEY (`page_id`) REFERENCES `mauticpages` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticform_submissions`
--

LOCK TABLES `mauticform_submissions` WRITE;
/*!40000 ALTER TABLE `mauticform_submissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticform_submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticforms`
--

DROP TABLE IF EXISTS `mauticforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cached_html` longtext COLLATE utf8_unicode_ci,
  `post_action` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `post_action_property` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `in_kiosk_mode` tinyint(1) DEFAULT NULL,
  `render_style` tinyint(1) DEFAULT NULL,
  `form_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F79F844512469DE2` (`category_id`),
  CONSTRAINT `FK_F79F844512469DE2` FOREIGN KEY (`category_id`) REFERENCES `mauticcategories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticforms`
--

LOCK TABLES `mauticforms` WRITE;
/*!40000 ALTER TABLE `mauticforms` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticforms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticimports`
--

DROP TABLE IF EXISTS `mauticimports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticimports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dir` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `original_file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `line_count` int(11) NOT NULL,
  `inserted_count` int(11) NOT NULL,
  `updated_count` int(11) NOT NULL,
  `ignored_count` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `date_started` datetime DEFAULT NULL,
  `date_ended` datetime DEFAULT NULL,
  `object` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `properties` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`),
  KEY `mauticimport_object` (`object`),
  KEY `mauticimport_status` (`status`),
  KEY `mauticimport_priority` (`priority`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticimports`
--

LOCK TABLES `mauticimports` WRITE;
/*!40000 ALTER TABLE `mauticimports` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticimports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticintegration_entity`
--

DROP TABLE IF EXISTS `mauticintegration_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticintegration_entity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_added` datetime NOT NULL,
  `integration` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `integration_entity` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `integration_entity_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `internal_entity` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `internal_entity_id` int(11) DEFAULT NULL,
  `last_sync_date` datetime DEFAULT NULL,
  `internal` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `mauticintegration_external_entity` (`integration`,`integration_entity`,`integration_entity_id`),
  KEY `mauticintegration_internal_entity` (`integration`,`internal_entity`,`internal_entity_id`),
  KEY `mauticintegration_entity_match` (`integration`,`internal_entity`,`integration_entity`),
  KEY `mauticintegration_last_sync_date` (`integration`,`last_sync_date`),
  KEY `mauticinternal_integration_entity` (`internal_entity_id`,`integration_entity_id`,`internal_entity`,`integration_entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticintegration_entity`
--

LOCK TABLES `mauticintegration_entity` WRITE;
/*!40000 ALTER TABLE `mauticintegration_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticintegration_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticip_addresses`
--

DROP TABLE IF EXISTS `mauticip_addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticip_addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `ip_details` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `mauticip_search` (`ip_address`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticip_addresses`
--

LOCK TABLES `mauticip_addresses` WRITE;
/*!40000 ALTER TABLE `mauticip_addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticip_addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticlead_categories`
--

DROP TABLE IF EXISTS `mauticlead_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticlead_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `lead_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `manually_removed` tinyint(1) NOT NULL,
  `manually_added` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_837A33DD12469DE2` (`category_id`),
  KEY `IDX_837A33DD55458D` (`lead_id`),
  CONSTRAINT `FK_837A33DD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `mauticcategories` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_837A33DD55458D` FOREIGN KEY (`lead_id`) REFERENCES `mauticleads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticlead_categories`
--

LOCK TABLES `mauticlead_categories` WRITE;
/*!40000 ALTER TABLE `mauticlead_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticlead_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticlead_companies_change_log`
--

DROP TABLE IF EXISTS `mauticlead_companies_change_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticlead_companies_change_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lead_id` int(11) NOT NULL,
  `type` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `event_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `action_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F0FCF1E955458D` (`lead_id`),
  KEY `mauticcompany_date_added` (`date_added`),
  CONSTRAINT `FK_F0FCF1E955458D` FOREIGN KEY (`lead_id`) REFERENCES `mauticleads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticlead_companies_change_log`
--

LOCK TABLES `mauticlead_companies_change_log` WRITE;
/*!40000 ALTER TABLE `mauticlead_companies_change_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticlead_companies_change_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticlead_devices`
--

DROP TABLE IF EXISTS `mauticlead_devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticlead_devices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lead_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `client_info` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `device` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_os_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_os_shortname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_os_version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_os_platform` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_brand` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_model` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `device_fingerprint` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tracking_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C8997197D05ABBE` (`tracking_id`),
  KEY `IDX_C89971955458D` (`lead_id`),
  KEY `mauticdate_added_search` (`date_added`),
  KEY `mauticdevice_search` (`device`),
  KEY `mauticdevice_os_name_search` (`device_os_name`),
  KEY `mauticdevice_os_shortname_search` (`device_os_shortname`),
  KEY `mauticdevice_os_version_search` (`device_os_version`),
  KEY `mauticdevice_os_platform_search` (`device_os_platform`),
  KEY `mauticdevice_brand_search` (`device_brand`),
  KEY `mauticdevice_model_search` (`device_model`),
  KEY `mauticdevice_fingerprint_search` (`device_fingerprint`),
  CONSTRAINT `FK_C89971955458D` FOREIGN KEY (`lead_id`) REFERENCES `mauticleads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticlead_devices`
--

LOCK TABLES `mauticlead_devices` WRITE;
/*!40000 ALTER TABLE `mauticlead_devices` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticlead_devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticlead_donotcontact`
--

DROP TABLE IF EXISTS `mauticlead_donotcontact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticlead_donotcontact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lead_id` int(11) DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `reason` smallint(6) NOT NULL,
  `channel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `comments` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_9F9049BB55458D` (`lead_id`),
  KEY `mauticdnc_reason_search` (`reason`),
  CONSTRAINT `FK_9F9049BB55458D` FOREIGN KEY (`lead_id`) REFERENCES `mauticleads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticlead_donotcontact`
--

LOCK TABLES `mauticlead_donotcontact` WRITE;
/*!40000 ALTER TABLE `mauticlead_donotcontact` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticlead_donotcontact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticlead_event_log`
--

DROP TABLE IF EXISTS `mauticlead_event_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticlead_event_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lead_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bundle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `object` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `object_id` int(11) DEFAULT NULL,
  `date_added` datetime NOT NULL,
  `properties` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`),
  KEY `mauticlead_id_index` (`lead_id`),
  KEY `mauticlead_object_index` (`object`,`object_id`),
  KEY `mauticlead_timeline_index` (`bundle`,`object`,`action`,`object_id`),
  KEY `mauticlead_timeline_action_index` (`action`),
  KEY `mauticlead_date_added_index` (`date_added`),
  CONSTRAINT `FK_7151116055458D` FOREIGN KEY (`lead_id`) REFERENCES `mauticleads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticlead_event_log`
--

LOCK TABLES `mauticlead_event_log` WRITE;
/*!40000 ALTER TABLE `mauticlead_event_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticlead_event_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticlead_fields`
--

DROP TABLE IF EXISTS `mauticlead_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticlead_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `field_group` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `default_value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL,
  `is_fixed` tinyint(1) NOT NULL,
  `is_visible` tinyint(1) NOT NULL,
  `is_short_visible` tinyint(1) NOT NULL,
  `is_listable` tinyint(1) NOT NULL,
  `is_publicly_updatable` tinyint(1) NOT NULL,
  `is_unique_identifer` tinyint(1) DEFAULT NULL,
  `field_order` int(11) DEFAULT NULL,
  `object` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `properties` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `mauticsearch_by_object` (`object`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticlead_fields`
--

LOCK TABLES `mauticlead_fields` WRITE;
/*!40000 ALTER TABLE `mauticlead_fields` DISABLE KEYS */;
INSERT INTO `mauticlead_fields` VALUES (1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Title','title','lookup','core',NULL,0,1,1,0,1,0,0,1,'lead','a:1:{s:4:\"list\";s:11:\"Mr|Mrs|Miss\";}'),(2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'First Name','firstname','text','core',NULL,0,1,1,1,1,0,0,2,'lead','a:0:{}'),(3,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Last Name','lastname','text','core',NULL,0,1,1,1,1,0,0,3,'lead','a:0:{}'),(4,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Primary company','company','text','core',NULL,0,1,1,0,1,0,0,4,'lead','a:0:{}'),(5,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Position','position','text','core',NULL,0,1,1,0,1,0,0,5,'lead','a:0:{}'),(6,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Email','email','email','core',NULL,0,1,1,1,1,0,1,6,'lead','a:0:{}'),(7,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Mobile','mobile','tel','core',NULL,0,1,1,0,1,0,0,7,'lead','a:0:{}'),(8,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Phone','phone','tel','core',NULL,0,1,1,0,1,0,0,8,'lead','a:0:{}'),(9,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Points','points','number','core','0',0,1,1,0,1,0,0,9,'lead','a:0:{}'),(10,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Fax','fax','tel','core',NULL,0,0,1,0,1,0,0,10,'lead','a:0:{}'),(11,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Address Line 1','address1','text','core',NULL,0,1,1,0,1,0,0,11,'lead','a:0:{}'),(12,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Address Line 2','address2','text','core',NULL,0,1,1,0,1,0,0,12,'lead','a:0:{}'),(13,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'City','city','text','core',NULL,0,1,1,0,1,0,0,13,'lead','a:0:{}'),(14,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'State','state','region','core',NULL,0,1,1,0,1,0,0,14,'lead','a:0:{}'),(15,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Zip Code','zipcode','text','core',NULL,0,1,1,0,1,0,0,15,'lead','a:0:{}'),(16,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Country','country','country','core',NULL,0,1,1,0,1,0,0,16,'lead','a:0:{}'),(17,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Preferred Locale','preferred_locale','locale','core',NULL,0,1,1,0,1,0,0,17,'lead','a:0:{}'),(18,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Attribution Date','attribution_date','datetime','core',NULL,0,1,1,0,1,0,0,18,'lead','a:0:{}'),(19,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Attribution','attribution','number','core',NULL,0,1,1,0,1,0,0,19,'lead','a:2:{s:9:\"roundmode\";i:4;s:9:\"precision\";i:2;}'),(20,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Website','website','url','core',NULL,0,0,1,0,1,0,0,20,'lead','a:0:{}'),(21,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Facebook','facebook','text','social',NULL,0,0,1,0,1,0,0,21,'lead','a:0:{}'),(22,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Foursquare','foursquare','text','social',NULL,0,0,1,0,1,0,0,22,'lead','a:0:{}'),(23,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Google+','googleplus','text','social',NULL,0,0,1,0,1,0,0,23,'lead','a:0:{}'),(24,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Instagram','instagram','text','social',NULL,0,0,1,0,1,0,0,24,'lead','a:0:{}'),(25,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'LinkedIn','linkedin','text','social',NULL,0,0,1,0,1,0,0,25,'lead','a:0:{}'),(26,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Skype','skype','text','social',NULL,0,0,1,0,1,0,0,26,'lead','a:0:{}'),(27,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Twitter','twitter','text','social',NULL,0,0,1,0,1,0,0,27,'lead','a:0:{}'),(28,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Address 1','companyaddress1','text','core',NULL,0,1,1,0,1,0,0,1,'company','a:0:{}'),(29,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Address 2','companyaddress2','text','core',NULL,0,1,1,0,1,0,0,2,'company','a:0:{}'),(30,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Company Email','companyemail','email','core',NULL,0,1,1,0,1,0,1,3,'company','a:0:{}'),(31,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Phone','companyphone','tel','core',NULL,0,1,1,0,1,0,0,4,'company','a:0:{}'),(32,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'City','companycity','text','core',NULL,0,1,1,0,1,0,0,5,'company','a:0:{}'),(33,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'State','companystate','region','core',NULL,0,1,1,0,1,0,0,6,'company','a:0:{}'),(34,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Zip Code','companyzipcode','text','core',NULL,0,1,1,0,1,0,0,7,'company','a:0:{}'),(35,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Country','companycountry','country','core',NULL,0,1,1,0,1,0,0,8,'company','a:0:{}'),(36,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Company Name','companyname','text','core',NULL,1,1,1,0,1,0,0,9,'company','a:0:{}'),(37,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Website','companywebsite','url','core',NULL,0,1,1,0,1,0,0,10,'company','a:0:{}'),(38,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Number of Employees','companynumber_of_employees','number','professional',NULL,0,0,1,0,1,0,0,11,'company','a:2:{s:9:\"roundmode\";i:4;s:9:\"precision\";i:0;}'),(39,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Fax','companyfax','tel','professional',NULL,0,0,1,0,1,0,0,12,'company','a:0:{}'),(40,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Annual Revenue','companyannual_revenue','number','professional',NULL,0,0,1,0,1,0,0,13,'company','a:2:{s:9:\"roundmode\";i:4;s:9:\"precision\";i:2;}'),(41,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Industry','companyindustry','select','professional',NULL,0,1,1,0,1,0,0,14,'company','a:1:{s:4:\"list\";s:349:\"Agriculture|Apparel|Banking|Biotechnology|Chemicals|Communications|Construction|Education|Electronics|Energy|Engineering|Entertainment|Environmental|Finance|Food & Beverage|Government|Healthcare|Hospitality|Insurance|Machinery|Manufacturing|Media|Not for Profit|Recreation|Retail|Shipping|Technology|Telecommunications|Transportation|Utilities|Other\";}'),(42,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Description','companydescription','text','professional',NULL,0,1,1,0,1,0,0,15,'company','a:0:{}');
/*!40000 ALTER TABLE `mauticlead_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticlead_frequencyrules`
--

DROP TABLE IF EXISTS `mauticlead_frequencyrules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticlead_frequencyrules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lead_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `frequency_number` smallint(6) DEFAULT NULL,
  `frequency_time` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `channel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `preferred_channel` tinyint(1) NOT NULL,
  `pause_from_date` datetime DEFAULT NULL,
  `pause_to_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CA05826B55458D` (`lead_id`),
  KEY `mauticchannel_frequency` (`channel`),
  CONSTRAINT `FK_CA05826B55458D` FOREIGN KEY (`lead_id`) REFERENCES `mauticleads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticlead_frequencyrules`
--

LOCK TABLES `mauticlead_frequencyrules` WRITE;
/*!40000 ALTER TABLE `mauticlead_frequencyrules` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticlead_frequencyrules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticlead_ips_xref`
--

DROP TABLE IF EXISTS `mauticlead_ips_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticlead_ips_xref` (
  `lead_id` int(11) NOT NULL,
  `ip_id` int(11) NOT NULL,
  PRIMARY KEY (`lead_id`,`ip_id`),
  KEY `IDX_4012A02655458D` (`lead_id`),
  KEY `IDX_4012A026A03F5E9F` (`ip_id`),
  CONSTRAINT `FK_4012A02655458D` FOREIGN KEY (`lead_id`) REFERENCES `mauticleads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_4012A026A03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `mauticip_addresses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticlead_ips_xref`
--

LOCK TABLES `mauticlead_ips_xref` WRITE;
/*!40000 ALTER TABLE `mauticlead_ips_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticlead_ips_xref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticlead_lists`
--

DROP TABLE IF EXISTS `mauticlead_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticlead_lists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `filters` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `is_global` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticlead_lists`
--

LOCK TABLES `mauticlead_lists` WRITE;
/*!40000 ALTER TABLE `mauticlead_lists` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticlead_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticlead_lists_leads`
--

DROP TABLE IF EXISTS `mauticlead_lists_leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticlead_lists_leads` (
  `leadlist_id` int(11) NOT NULL,
  `lead_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `manually_removed` tinyint(1) NOT NULL,
  `manually_added` tinyint(1) NOT NULL,
  PRIMARY KEY (`leadlist_id`,`lead_id`),
  KEY `IDX_B7D7F67EB9FC8874` (`leadlist_id`),
  KEY `IDX_B7D7F67E55458D` (`lead_id`),
  KEY `mauticmanually_removed` (`manually_removed`),
  CONSTRAINT `FK_B7D7F67E55458D` FOREIGN KEY (`lead_id`) REFERENCES `mauticleads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B7D7F67EB9FC8874` FOREIGN KEY (`leadlist_id`) REFERENCES `mauticlead_lists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticlead_lists_leads`
--

LOCK TABLES `mauticlead_lists_leads` WRITE;
/*!40000 ALTER TABLE `mauticlead_lists_leads` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticlead_lists_leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticlead_notes`
--

DROP TABLE IF EXISTS `mauticlead_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticlead_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lead_id` int(11) NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` longtext COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CB4F746F55458D` (`lead_id`),
  CONSTRAINT `FK_CB4F746F55458D` FOREIGN KEY (`lead_id`) REFERENCES `mauticleads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticlead_notes`
--

LOCK TABLES `mauticlead_notes` WRITE;
/*!40000 ALTER TABLE `mauticlead_notes` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticlead_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticlead_points_change_log`
--

DROP TABLE IF EXISTS `mauticlead_points_change_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticlead_points_change_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lead_id` int(11) NOT NULL,
  `ip_id` int(11) NOT NULL,
  `type` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `event_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `action_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `delta` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_E39B7C8A55458D` (`lead_id`),
  KEY `IDX_E39B7C8AA03F5E9F` (`ip_id`),
  KEY `mauticpoint_date_added` (`date_added`),
  CONSTRAINT `FK_E39B7C8A55458D` FOREIGN KEY (`lead_id`) REFERENCES `mauticleads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_E39B7C8AA03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `mauticip_addresses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticlead_points_change_log`
--

LOCK TABLES `mauticlead_points_change_log` WRITE;
/*!40000 ALTER TABLE `mauticlead_points_change_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticlead_points_change_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticlead_stages_change_log`
--

DROP TABLE IF EXISTS `mauticlead_stages_change_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticlead_stages_change_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lead_id` int(11) NOT NULL,
  `stage_id` int(11) DEFAULT NULL,
  `event_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `action_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4B37EB555458D` (`lead_id`),
  KEY `IDX_4B37EB52298D193` (`stage_id`),
  CONSTRAINT `FK_4B37EB52298D193` FOREIGN KEY (`stage_id`) REFERENCES `mauticstages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_4B37EB555458D` FOREIGN KEY (`lead_id`) REFERENCES `mauticleads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticlead_stages_change_log`
--

LOCK TABLES `mauticlead_stages_change_log` WRITE;
/*!40000 ALTER TABLE `mauticlead_stages_change_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticlead_stages_change_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticlead_tags`
--

DROP TABLE IF EXISTS `mauticlead_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticlead_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mauticlead_tag_search` (`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticlead_tags`
--

LOCK TABLES `mauticlead_tags` WRITE;
/*!40000 ALTER TABLE `mauticlead_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticlead_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticlead_tags_xref`
--

DROP TABLE IF EXISTS `mauticlead_tags_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticlead_tags_xref` (
  `lead_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`lead_id`,`tag_id`),
  KEY `IDX_84E7A0F855458D` (`lead_id`),
  KEY `IDX_84E7A0F8BAD26311` (`tag_id`),
  CONSTRAINT `FK_84E7A0F855458D` FOREIGN KEY (`lead_id`) REFERENCES `mauticleads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_84E7A0F8BAD26311` FOREIGN KEY (`tag_id`) REFERENCES `mauticlead_tags` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticlead_tags_xref`
--

LOCK TABLES `mauticlead_tags_xref` WRITE;
/*!40000 ALTER TABLE `mauticlead_tags_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticlead_tags_xref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticlead_utmtags`
--

DROP TABLE IF EXISTS `mauticlead_utmtags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticlead_utmtags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lead_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `query` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `referer` longtext COLLATE utf8_unicode_ci,
  `remote_host` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_agent` longtext COLLATE utf8_unicode_ci,
  `utm_campaign` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `utm_content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `utm_medium` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `utm_source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `utm_term` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_815B4E6055458D` (`lead_id`),
  CONSTRAINT `FK_815B4E6055458D` FOREIGN KEY (`lead_id`) REFERENCES `mauticleads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticlead_utmtags`
--

LOCK TABLES `mauticlead_utmtags` WRITE;
/*!40000 ALTER TABLE `mauticlead_utmtags` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticlead_utmtags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticleads`
--

DROP TABLE IF EXISTS `mauticleads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticleads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT NULL,
  `stage_id` int(11) DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `points` int(11) NOT NULL,
  `last_active` datetime DEFAULT NULL,
  `internal` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `social_cache` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `date_identified` datetime DEFAULT NULL,
  `preferred_profile_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `zipcode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timezone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `preferred_locale` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attribution_date` datetime DEFAULT NULL COMMENT '(DC2Type:datetime)',
  `attribution` double DEFAULT NULL,
  `website` longtext COLLATE utf8_unicode_ci,
  `facebook` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `foursquare` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `googleplus` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instagram` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `linkedin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `skype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1D30DAE07E3C61F9` (`owner_id`),
  KEY `IDX_1D30DAE02298D193` (`stage_id`),
  KEY `mauticlead_date_added` (`date_added`),
  KEY `mauticdate_identified` (`date_identified`),
  KEY `mautictitle_search` (`title`),
  KEY `mauticfirstname_search` (`firstname`),
  KEY `mauticlastname_search` (`lastname`),
  KEY `mauticcompany_search` (`company`),
  KEY `mauticposition_search` (`position`),
  KEY `mauticemail_search` (`email`),
  KEY `mauticmobile_search` (`mobile`),
  KEY `mauticphone_search` (`phone`),
  KEY `mauticpoints_search` (`points`),
  KEY `mauticfax_search` (`fax`),
  KEY `mauticaddress1_search` (`address1`),
  KEY `mauticaddress2_search` (`address2`),
  KEY `mauticcity_search` (`city`),
  KEY `mauticstate_search` (`state`),
  KEY `mauticzipcode_search` (`zipcode`),
  KEY `mauticcountry_search` (`country`),
  KEY `mauticpreferred_locale_search` (`preferred_locale`),
  KEY `mauticattribution_date_search` (`attribution_date`),
  KEY `mauticattribution_search` (`attribution`),
  KEY `mauticfacebook_search` (`facebook`),
  KEY `mauticfoursquare_search` (`foursquare`),
  KEY `mauticgoogleplus_search` (`googleplus`),
  KEY `mauticinstagram_search` (`instagram`),
  KEY `mauticlinkedin_search` (`linkedin`),
  KEY `mauticskype_search` (`skype`),
  KEY `mautictwitter_search` (`twitter`),
  KEY `mauticcontact_attribution` (`attribution`,`attribution_date`),
  KEY `mauticdate_added_country_index` (`date_added`,`country`),
  CONSTRAINT `FK_1D30DAE02298D193` FOREIGN KEY (`stage_id`) REFERENCES `mauticstages` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_1D30DAE07E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `mauticusers` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticleads`
--

LOCK TABLES `mauticleads` WRITE;
/*!40000 ALTER TABLE `mauticleads` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticleads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticmessage_channels`
--

DROP TABLE IF EXISTS `mauticmessage_channels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticmessage_channels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_id` int(11) NOT NULL,
  `channel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `properties` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `is_enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mauticchannel_index` (`message_id`,`channel`),
  KEY `IDX_B811ACA5537A1329` (`message_id`),
  KEY `mauticchannel_entity_index` (`channel`,`channel_id`),
  KEY `mauticchannel_enabled_index` (`channel`,`is_enabled`),
  CONSTRAINT `FK_B811ACA5537A1329` FOREIGN KEY (`message_id`) REFERENCES `mauticmessages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticmessage_channels`
--

LOCK TABLES `mauticmessage_channels` WRITE;
/*!40000 ALTER TABLE `mauticmessage_channels` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticmessage_channels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticmessage_queue`
--

DROP TABLE IF EXISTS `mauticmessage_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticmessage_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) DEFAULT NULL,
  `lead_id` int(11) NOT NULL,
  `channel` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `channel_id` int(11) NOT NULL,
  `priority` smallint(6) NOT NULL,
  `max_attempts` smallint(6) NOT NULL,
  `attempts` smallint(6) NOT NULL,
  `success` tinyint(1) NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_published` datetime DEFAULT NULL,
  `scheduled_date` datetime DEFAULT NULL,
  `last_attempt` datetime DEFAULT NULL,
  `date_sent` datetime DEFAULT NULL,
  `options` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_5EA45EC871F7E88B` (`event_id`),
  KEY `IDX_5EA45EC855458D` (`lead_id`),
  KEY `mauticmessage_status_search` (`status`),
  KEY `mauticmessage_date_sent` (`date_sent`),
  KEY `mauticmessage_scheduled_date` (`scheduled_date`),
  KEY `mauticmessage_priority` (`priority`),
  KEY `mauticmessage_success` (`success`),
  KEY `mauticmessage_channel_search` (`channel`,`channel_id`),
  CONSTRAINT `FK_5EA45EC855458D` FOREIGN KEY (`lead_id`) REFERENCES `mauticleads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_5EA45EC871F7E88B` FOREIGN KEY (`event_id`) REFERENCES `mauticcampaign_events` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticmessage_queue`
--

LOCK TABLES `mauticmessage_queue` WRITE;
/*!40000 ALTER TABLE `mauticmessage_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticmessage_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticmessages`
--

DROP TABLE IF EXISTS `mauticmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3DD701DF12469DE2` (`category_id`),
  KEY `mauticdate_message_added` (`date_added`),
  CONSTRAINT `FK_3DD701DF12469DE2` FOREIGN KEY (`category_id`) REFERENCES `mauticcategories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticmessages`
--

LOCK TABLES `mauticmessages` WRITE;
/*!40000 ALTER TABLE `mauticmessages` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticmessages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticmonitor_post_count`
--

DROP TABLE IF EXISTS `mauticmonitor_post_count`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticmonitor_post_count` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `monitor_id` int(11) DEFAULT NULL,
  `post_date` date NOT NULL,
  `post_count` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_DCF76A554CE1C902` (`monitor_id`),
  CONSTRAINT `FK_DCF76A554CE1C902` FOREIGN KEY (`monitor_id`) REFERENCES `mauticmonitoring` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticmonitor_post_count`
--

LOCK TABLES `mauticmonitor_post_count` WRITE;
/*!40000 ALTER TABLE `mauticmonitor_post_count` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticmonitor_post_count` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticmonitoring`
--

DROP TABLE IF EXISTS `mauticmonitoring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticmonitoring` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `lists` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `network_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `revision` int(11) NOT NULL,
  `stats` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `properties` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_16FC883112469DE2` (`category_id`),
  CONSTRAINT `FK_16FC883112469DE2` FOREIGN KEY (`category_id`) REFERENCES `mauticcategories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticmonitoring`
--

LOCK TABLES `mauticmonitoring` WRITE;
/*!40000 ALTER TABLE `mauticmonitoring` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticmonitoring` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticmonitoring_leads`
--

DROP TABLE IF EXISTS `mauticmonitoring_leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticmonitoring_leads` (
  `monitor_id` int(11) NOT NULL,
  `lead_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`monitor_id`,`lead_id`),
  KEY `IDX_703F0484CE1C902` (`monitor_id`),
  KEY `IDX_703F04855458D` (`lead_id`),
  CONSTRAINT `FK_703F0484CE1C902` FOREIGN KEY (`monitor_id`) REFERENCES `mauticmonitoring` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_703F04855458D` FOREIGN KEY (`lead_id`) REFERENCES `mauticleads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticmonitoring_leads`
--

LOCK TABLES `mauticmonitoring_leads` WRITE;
/*!40000 ALTER TABLE `mauticmonitoring_leads` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticmonitoring_leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticnotifications`
--

DROP TABLE IF EXISTS `mauticnotifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticnotifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `type` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `header` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `date_added` datetime NOT NULL,
  `icon_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BEFF6E93A76ED395` (`user_id`),
  KEY `mauticnotification_read_status` (`is_read`),
  KEY `mauticnotification_type` (`type`),
  KEY `mauticnotification_user_read_status` (`is_read`,`user_id`),
  CONSTRAINT `FK_BEFF6E93A76ED395` FOREIGN KEY (`user_id`) REFERENCES `mauticusers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticnotifications`
--

LOCK TABLES `mauticnotifications` WRITE;
/*!40000 ALTER TABLE `mauticnotifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticnotifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticoauth1_access_tokens`
--

DROP TABLE IF EXISTS `mauticoauth1_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticoauth1_access_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `consumer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expires_at` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A3EAC96237FDBD6D` (`consumer_id`),
  KEY `IDX_A3EAC962A76ED395` (`user_id`),
  KEY `mauticoauth1_access_token_search` (`token`),
  CONSTRAINT `FK_A3EAC96237FDBD6D` FOREIGN KEY (`consumer_id`) REFERENCES `mauticoauth1_consumers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A3EAC962A76ED395` FOREIGN KEY (`user_id`) REFERENCES `mauticusers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticoauth1_access_tokens`
--

LOCK TABLES `mauticoauth1_access_tokens` WRITE;
/*!40000 ALTER TABLE `mauticoauth1_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticoauth1_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticoauth1_consumers`
--

DROP TABLE IF EXISTS `mauticoauth1_consumers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticoauth1_consumers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `consumer_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `consumer_secret` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `callback` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mauticconsumer_search` (`consumer_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticoauth1_consumers`
--

LOCK TABLES `mauticoauth1_consumers` WRITE;
/*!40000 ALTER TABLE `mauticoauth1_consumers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticoauth1_consumers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticoauth1_nonces`
--

DROP TABLE IF EXISTS `mauticoauth1_nonces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticoauth1_nonces` (
  `nonce` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`nonce`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticoauth1_nonces`
--

LOCK TABLES `mauticoauth1_nonces` WRITE;
/*!40000 ALTER TABLE `mauticoauth1_nonces` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticoauth1_nonces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticoauth1_request_tokens`
--

DROP TABLE IF EXISTS `mauticoauth1_request_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticoauth1_request_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `consumer_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expires_at` bigint(20) NOT NULL,
  `verifier` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_809316EB37FDBD6D` (`consumer_id`),
  KEY `IDX_809316EBA76ED395` (`user_id`),
  KEY `mauticoauth1_request_token_search` (`token`),
  CONSTRAINT `FK_809316EB37FDBD6D` FOREIGN KEY (`consumer_id`) REFERENCES `mauticoauth1_consumers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_809316EBA76ED395` FOREIGN KEY (`user_id`) REFERENCES `mauticusers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticoauth1_request_tokens`
--

LOCK TABLES `mauticoauth1_request_tokens` WRITE;
/*!40000 ALTER TABLE `mauticoauth1_request_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticoauth1_request_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticoauth2_accesstokens`
--

DROP TABLE IF EXISTS `mauticoauth2_accesstokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticoauth2_accesstokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expires_at` bigint(20) DEFAULT NULL,
  `scope` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_5A971FC55F37A13B` (`token`),
  KEY `IDX_5A971FC519EB6921` (`client_id`),
  KEY `IDX_5A971FC5A76ED395` (`user_id`),
  KEY `mauticoauth2_access_token_search` (`token`),
  CONSTRAINT `FK_5A971FC519EB6921` FOREIGN KEY (`client_id`) REFERENCES `mauticoauth2_clients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_5A971FC5A76ED395` FOREIGN KEY (`user_id`) REFERENCES `mauticusers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticoauth2_accesstokens`
--

LOCK TABLES `mauticoauth2_accesstokens` WRITE;
/*!40000 ALTER TABLE `mauticoauth2_accesstokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticoauth2_accesstokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticoauth2_authcodes`
--

DROP TABLE IF EXISTS `mauticoauth2_authcodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticoauth2_authcodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expires_at` bigint(20) DEFAULT NULL,
  `scope` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `redirect_uri` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_90970E795F37A13B` (`token`),
  KEY `IDX_90970E7919EB6921` (`client_id`),
  KEY `IDX_90970E79A76ED395` (`user_id`),
  CONSTRAINT `FK_90970E7919EB6921` FOREIGN KEY (`client_id`) REFERENCES `mauticoauth2_clients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_90970E79A76ED395` FOREIGN KEY (`user_id`) REFERENCES `mauticusers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticoauth2_authcodes`
--

LOCK TABLES `mauticoauth2_authcodes` WRITE;
/*!40000 ALTER TABLE `mauticoauth2_authcodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticoauth2_authcodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticoauth2_clients`
--

DROP TABLE IF EXISTS `mauticoauth2_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticoauth2_clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `random_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `redirect_uris` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `allowed_grant_types` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `mauticclient_id_search` (`random_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticoauth2_clients`
--

LOCK TABLES `mauticoauth2_clients` WRITE;
/*!40000 ALTER TABLE `mauticoauth2_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticoauth2_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticoauth2_refreshtokens`
--

DROP TABLE IF EXISTS `mauticoauth2_refreshtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticoauth2_refreshtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expires_at` bigint(20) DEFAULT NULL,
  `scope` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_525C5A1B5F37A13B` (`token`),
  KEY `IDX_525C5A1B19EB6921` (`client_id`),
  KEY `IDX_525C5A1BA76ED395` (`user_id`),
  KEY `mauticoauth2_refresh_token_search` (`token`),
  CONSTRAINT `FK_525C5A1B19EB6921` FOREIGN KEY (`client_id`) REFERENCES `mauticoauth2_clients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_525C5A1BA76ED395` FOREIGN KEY (`user_id`) REFERENCES `mauticusers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticoauth2_refreshtokens`
--

LOCK TABLES `mauticoauth2_refreshtokens` WRITE;
/*!40000 ALTER TABLE `mauticoauth2_refreshtokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticoauth2_refreshtokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticoauth2_user_client_xref`
--

DROP TABLE IF EXISTS `mauticoauth2_user_client_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticoauth2_user_client_xref` (
  `client_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`client_id`,`user_id`),
  KEY `IDX_852BA7E619EB6921` (`client_id`),
  KEY `IDX_852BA7E6A76ED395` (`user_id`),
  CONSTRAINT `FK_852BA7E619EB6921` FOREIGN KEY (`client_id`) REFERENCES `mauticoauth2_clients` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_852BA7E6A76ED395` FOREIGN KEY (`user_id`) REFERENCES `mauticusers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticoauth2_user_client_xref`
--

LOCK TABLES `mauticoauth2_user_client_xref` WRITE;
/*!40000 ALTER TABLE `mauticoauth2_user_client_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticoauth2_user_client_xref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticpage_hits`
--

DROP TABLE IF EXISTS `mauticpage_hits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticpage_hits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` int(11) DEFAULT NULL,
  `redirect_id` int(11) DEFAULT NULL,
  `email_id` int(11) DEFAULT NULL,
  `lead_id` int(11) DEFAULT NULL,
  `ip_id` int(11) NOT NULL,
  `device_id` int(11) DEFAULT NULL,
  `date_hit` datetime NOT NULL,
  `date_left` datetime DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `region` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isp` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `organization` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` int(11) NOT NULL,
  `referer` longtext COLLATE utf8_unicode_ci,
  `url` longtext COLLATE utf8_unicode_ci,
  `url_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_agent` longtext COLLATE utf8_unicode_ci,
  `remote_host` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `page_language` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `browser_languages` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `tracking_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `query` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_92AD5CDAC4663E4` (`page_id`),
  KEY `IDX_92AD5CDAB42D874D` (`redirect_id`),
  KEY `IDX_92AD5CDAA832C1C9` (`email_id`),
  KEY `IDX_92AD5CDA55458D` (`lead_id`),
  KEY `IDX_92AD5CDAA03F5E9F` (`ip_id`),
  KEY `IDX_92AD5CDA94A4C7D4` (`device_id`),
  KEY `mauticpage_hit_tracking_search` (`tracking_id`),
  KEY `mauticpage_hit_code_search` (`code`),
  KEY `mauticpage_hit_source_search` (`source`,`source_id`),
  KEY `mauticpage_date_hit` (`date_hit`),
  KEY `mauticdate_hit_left_index` (`date_hit`,`date_left`),
  CONSTRAINT `FK_92AD5CDA55458D` FOREIGN KEY (`lead_id`) REFERENCES `mauticleads` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_92AD5CDA94A4C7D4` FOREIGN KEY (`device_id`) REFERENCES `mauticlead_devices` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_92AD5CDAA03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `mauticip_addresses` (`id`),
  CONSTRAINT `FK_92AD5CDAA832C1C9` FOREIGN KEY (`email_id`) REFERENCES `mauticemails` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_92AD5CDAB42D874D` FOREIGN KEY (`redirect_id`) REFERENCES `mauticpage_redirects` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_92AD5CDAC4663E4` FOREIGN KEY (`page_id`) REFERENCES `mauticpages` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticpage_hits`
--

LOCK TABLES `mauticpage_hits` WRITE;
/*!40000 ALTER TABLE `mauticpage_hits` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticpage_hits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticpage_redirects`
--

DROP TABLE IF EXISTS `mauticpage_redirects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticpage_redirects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `redirect_id` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `url` longtext COLLATE utf8_unicode_ci NOT NULL,
  `hits` int(11) NOT NULL,
  `unique_hits` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticpage_redirects`
--

LOCK TABLES `mauticpage_redirects` WRITE;
/*!40000 ALTER TABLE `mauticpage_redirects` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticpage_redirects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticpages`
--

DROP TABLE IF EXISTS `mauticpages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticpages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `translation_parent_id` int(11) DEFAULT NULL,
  `variant_parent_id` int(11) DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `custom_html` longtext COLLATE utf8_unicode_ci,
  `content` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `hits` int(11) NOT NULL,
  `unique_hits` int(11) NOT NULL,
  `variant_hits` int(11) NOT NULL,
  `revision` int(11) NOT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `redirect_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `redirect_url` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_preference_center` tinyint(1) DEFAULT NULL,
  `no_index` tinyint(1) DEFAULT NULL,
  `lang` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `variant_settings` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `variant_start_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2AD47AC712469DE2` (`category_id`),
  KEY `IDX_2AD47AC79091A2FB` (`translation_parent_id`),
  KEY `IDX_2AD47AC791861123` (`variant_parent_id`),
  KEY `mauticpage_alias_search` (`alias`),
  CONSTRAINT `FK_2AD47AC712469DE2` FOREIGN KEY (`category_id`) REFERENCES `mauticcategories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_2AD47AC79091A2FB` FOREIGN KEY (`translation_parent_id`) REFERENCES `mauticpages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_2AD47AC791861123` FOREIGN KEY (`variant_parent_id`) REFERENCES `mauticpages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticpages`
--

LOCK TABLES `mauticpages` WRITE;
/*!40000 ALTER TABLE `mauticpages` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticpages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticpermissions`
--

DROP TABLE IF EXISTS `mauticpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `bundle` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `bitwise` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mauticunique_perm` (`bundle`,`name`,`role_id`),
  KEY `IDX_69455203D60322AC` (`role_id`),
  CONSTRAINT `FK_69455203D60322AC` FOREIGN KEY (`role_id`) REFERENCES `mauticroles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticpermissions`
--

LOCK TABLES `mauticpermissions` WRITE;
/*!40000 ALTER TABLE `mauticpermissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticpermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticplugin_citrix_events`
--

DROP TABLE IF EXISTS `mauticplugin_citrix_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticplugin_citrix_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lead_id` int(11) NOT NULL,
  `product` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `event_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `event_desc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `event_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `event_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_6DA7721055458D` (`lead_id`),
  KEY `mauticcitrix_event_email` (`product`,`email`),
  KEY `mauticcitrix_event_name` (`product`,`event_name`,`event_type`),
  KEY `mauticcitrix_event_type` (`product`,`event_type`,`event_date`),
  KEY `mauticcitrix_event_product` (`product`,`email`,`event_type`),
  KEY `mauticcitrix_event_product_name` (`product`,`email`,`event_type`,`event_name`),
  KEY `mauticcitrix_event_product_name_lead` (`product`,`event_type`,`event_name`,`lead_id`),
  KEY `mauticcitrix_event_product_type_lead` (`product`,`event_type`,`lead_id`),
  KEY `mauticcitrix_event_date` (`event_date`),
  CONSTRAINT `FK_6DA7721055458D` FOREIGN KEY (`lead_id`) REFERENCES `mauticleads` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticplugin_citrix_events`
--

LOCK TABLES `mauticplugin_citrix_events` WRITE;
/*!40000 ALTER TABLE `mauticplugin_citrix_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticplugin_citrix_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticplugin_crm_pipedrive_owners`
--

DROP TABLE IF EXISTS `mauticplugin_crm_pipedrive_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticplugin_crm_pipedrive_owners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mauticemail` (`email`),
  KEY `mauticowner_id` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticplugin_crm_pipedrive_owners`
--

LOCK TABLES `mauticplugin_crm_pipedrive_owners` WRITE;
/*!40000 ALTER TABLE `mauticplugin_crm_pipedrive_owners` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticplugin_crm_pipedrive_owners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticplugin_integration_settings`
--

DROP TABLE IF EXISTS `mauticplugin_integration_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticplugin_integration_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plugin_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  `supported_features` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `api_keys` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `feature_settings` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_ED95771FEC942BCF` (`plugin_id`),
  CONSTRAINT `FK_ED95771FEC942BCF` FOREIGN KEY (`plugin_id`) REFERENCES `mauticplugins` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticplugin_integration_settings`
--

LOCK TABLES `mauticplugin_integration_settings` WRITE;
/*!40000 ALTER TABLE `mauticplugin_integration_settings` DISABLE KEYS */;
INSERT INTO `mauticplugin_integration_settings` VALUES (1,NULL,'OneSignal',0,'a:4:{i:0;s:6:\"mobile\";i:1;s:20:\"landing_page_enabled\";i:2;s:28:\"welcome_notification_enabled\";i:3;s:21:\"tracking_page_enabled\";}','a:0:{}','a:0:{}'),(2,NULL,'Twilio',0,'a:0:{}','a:0:{}','a:0:{}');
/*!40000 ALTER TABLE `mauticplugin_integration_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticplugins`
--

DROP TABLE IF EXISTS `mauticplugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticplugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `is_missing` tinyint(1) NOT NULL,
  `bundle` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mauticunique_bundle` (`bundle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticplugins`
--

LOCK TABLES `mauticplugins` WRITE;
/*!40000 ALTER TABLE `mauticplugins` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticplugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticpoint_lead_action_log`
--

DROP TABLE IF EXISTS `mauticpoint_lead_action_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticpoint_lead_action_log` (
  `point_id` int(11) NOT NULL,
  `lead_id` int(11) NOT NULL,
  `ip_id` int(11) DEFAULT NULL,
  `date_fired` datetime NOT NULL,
  PRIMARY KEY (`point_id`,`lead_id`),
  KEY `IDX_6D999A57C028CEA2` (`point_id`),
  KEY `IDX_6D999A5755458D` (`lead_id`),
  KEY `IDX_6D999A57A03F5E9F` (`ip_id`),
  CONSTRAINT `FK_6D999A5755458D` FOREIGN KEY (`lead_id`) REFERENCES `mauticleads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_6D999A57A03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `mauticip_addresses` (`id`),
  CONSTRAINT `FK_6D999A57C028CEA2` FOREIGN KEY (`point_id`) REFERENCES `mauticpoints` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticpoint_lead_action_log`
--

LOCK TABLES `mauticpoint_lead_action_log` WRITE;
/*!40000 ALTER TABLE `mauticpoint_lead_action_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticpoint_lead_action_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticpoint_lead_event_log`
--

DROP TABLE IF EXISTS `mauticpoint_lead_event_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticpoint_lead_event_log` (
  `event_id` int(11) NOT NULL,
  `lead_id` int(11) NOT NULL,
  `ip_id` int(11) DEFAULT NULL,
  `date_fired` datetime NOT NULL,
  PRIMARY KEY (`event_id`,`lead_id`),
  KEY `IDX_A273BCBA71F7E88B` (`event_id`),
  KEY `IDX_A273BCBA55458D` (`lead_id`),
  KEY `IDX_A273BCBAA03F5E9F` (`ip_id`),
  CONSTRAINT `FK_A273BCBA55458D` FOREIGN KEY (`lead_id`) REFERENCES `mauticleads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A273BCBA71F7E88B` FOREIGN KEY (`event_id`) REFERENCES `mauticpoint_trigger_events` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A273BCBAA03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `mauticip_addresses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticpoint_lead_event_log`
--

LOCK TABLES `mauticpoint_lead_event_log` WRITE;
/*!40000 ALTER TABLE `mauticpoint_lead_event_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticpoint_lead_event_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticpoint_trigger_events`
--

DROP TABLE IF EXISTS `mauticpoint_trigger_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticpoint_trigger_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trigger_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `action_order` int(11) NOT NULL,
  `properties` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_6D8668585FDDDCD6` (`trigger_id`),
  KEY `mautictrigger_type_search` (`type`),
  CONSTRAINT `FK_6D8668585FDDDCD6` FOREIGN KEY (`trigger_id`) REFERENCES `mauticpoint_triggers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticpoint_trigger_events`
--

LOCK TABLES `mauticpoint_trigger_events` WRITE;
/*!40000 ALTER TABLE `mauticpoint_trigger_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticpoint_trigger_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticpoint_triggers`
--

DROP TABLE IF EXISTS `mauticpoint_triggers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticpoint_triggers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `points` int(11) NOT NULL,
  `color` varchar(7) COLLATE utf8_unicode_ci NOT NULL,
  `trigger_existing_leads` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_EAA96D6112469DE2` (`category_id`),
  CONSTRAINT `FK_EAA96D6112469DE2` FOREIGN KEY (`category_id`) REFERENCES `mauticcategories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticpoint_triggers`
--

LOCK TABLES `mauticpoint_triggers` WRITE;
/*!40000 ALTER TABLE `mauticpoint_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticpoint_triggers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticpoints`
--

DROP TABLE IF EXISTS `mauticpoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticpoints` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `delta` int(11) NOT NULL,
  `properties` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_2DFFC1612469DE2` (`category_id`),
  KEY `mauticpoint_type_search` (`type`),
  CONSTRAINT `FK_2DFFC1612469DE2` FOREIGN KEY (`category_id`) REFERENCES `mauticcategories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticpoints`
--

LOCK TABLES `mauticpoints` WRITE;
/*!40000 ALTER TABLE `mauticpoints` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticpoints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticpush_ids`
--

DROP TABLE IF EXISTS `mauticpush_ids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticpush_ids` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lead_id` int(11) DEFAULT NULL,
  `push_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `mobile` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A9F68CA155458D` (`lead_id`),
  CONSTRAINT `FK_A9F68CA155458D` FOREIGN KEY (`lead_id`) REFERENCES `mauticleads` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticpush_ids`
--

LOCK TABLES `mauticpush_ids` WRITE;
/*!40000 ALTER TABLE `mauticpush_ids` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticpush_ids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticpush_notification_list_xref`
--

DROP TABLE IF EXISTS `mauticpush_notification_list_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticpush_notification_list_xref` (
  `notification_id` int(11) NOT NULL,
  `leadlist_id` int(11) NOT NULL,
  PRIMARY KEY (`notification_id`,`leadlist_id`),
  KEY `IDX_3EB64210EF1A9D84` (`notification_id`),
  KEY `IDX_3EB64210B9FC8874` (`leadlist_id`),
  CONSTRAINT `FK_3EB64210B9FC8874` FOREIGN KEY (`leadlist_id`) REFERENCES `mauticlead_lists` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_3EB64210EF1A9D84` FOREIGN KEY (`notification_id`) REFERENCES `mauticpush_notifications` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticpush_notification_list_xref`
--

LOCK TABLES `mauticpush_notification_list_xref` WRITE;
/*!40000 ALTER TABLE `mauticpush_notification_list_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticpush_notification_list_xref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticpush_notification_stats`
--

DROP TABLE IF EXISTS `mauticpush_notification_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticpush_notification_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notification_id` int(11) DEFAULT NULL,
  `lead_id` int(11) DEFAULT NULL,
  `list_id` int(11) DEFAULT NULL,
  `ip_id` int(11) DEFAULT NULL,
  `date_sent` datetime NOT NULL,
  `date_read` datetime DEFAULT NULL,
  `is_clicked` tinyint(1) NOT NULL,
  `date_clicked` datetime DEFAULT NULL,
  `tracking_hash` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `retry_count` int(11) DEFAULT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `tokens` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `click_count` int(11) DEFAULT NULL,
  `last_clicked` datetime DEFAULT NULL,
  `click_details` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_41AB8AABEF1A9D84` (`notification_id`),
  KEY `IDX_41AB8AAB55458D` (`lead_id`),
  KEY `IDX_41AB8AAB3DAE168B` (`list_id`),
  KEY `IDX_41AB8AABA03F5E9F` (`ip_id`),
  KEY `mauticstat_notification_search` (`notification_id`,`lead_id`),
  KEY `mauticstat_notification_clicked_search` (`is_clicked`),
  KEY `mauticstat_notification_hash_search` (`tracking_hash`),
  KEY `mauticstat_notification_source_search` (`source`,`source_id`),
  CONSTRAINT `FK_41AB8AAB3DAE168B` FOREIGN KEY (`list_id`) REFERENCES `mauticlead_lists` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_41AB8AAB55458D` FOREIGN KEY (`lead_id`) REFERENCES `mauticleads` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_41AB8AABA03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `mauticip_addresses` (`id`),
  CONSTRAINT `FK_41AB8AABEF1A9D84` FOREIGN KEY (`notification_id`) REFERENCES `mauticpush_notifications` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticpush_notification_stats`
--

LOCK TABLES `mauticpush_notification_stats` WRITE;
/*!40000 ALTER TABLE `mauticpush_notification_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticpush_notification_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticpush_notifications`
--

DROP TABLE IF EXISTS `mauticpush_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticpush_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `lang` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` longtext COLLATE utf8_unicode_ci,
  `heading` longtext COLLATE utf8_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `button` longtext COLLATE utf8_unicode_ci,
  `utm_tags` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `notification_type` longtext COLLATE utf8_unicode_ci,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `read_count` int(11) NOT NULL,
  `sent_count` int(11) NOT NULL,
  `mobile` tinyint(1) NOT NULL,
  `mobileSettings` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_64C034D012469DE2` (`category_id`),
  CONSTRAINT `FK_64C034D012469DE2` FOREIGN KEY (`category_id`) REFERENCES `mauticcategories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticpush_notifications`
--

LOCK TABLES `mauticpush_notifications` WRITE;
/*!40000 ALTER TABLE `mauticpush_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticpush_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticreports`
--

DROP TABLE IF EXISTS `mauticreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticreports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `system` tinyint(1) NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `columns` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `filters` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `table_order` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `graphs` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `group_by` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `aggregators` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `settings` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json_array)',
  `is_scheduled` tinyint(1) NOT NULL,
  `schedule_unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `to_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `schedule_day` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `schedule_month_frequency` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticreports`
--

LOCK TABLES `mauticreports` WRITE;
/*!40000 ALTER TABLE `mauticreports` DISABLE KEYS */;
INSERT INTO `mauticreports` VALUES (1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Visits published Pages',NULL,1,'page.hits','a:7:{i:0;s:11:\"ph.date_hit\";i:1;s:6:\"ph.url\";i:2;s:12:\"ph.url_title\";i:3;s:10:\"ph.referer\";i:4;s:12:\"i.ip_address\";i:5;s:7:\"ph.city\";i:6;s:10:\"ph.country\";}','a:2:{i:0;a:3:{s:6:\"column\";s:7:\"ph.code\";s:9:\"condition\";s:2:\"eq\";s:5:\"value\";s:3:\"200\";}i:1;a:3:{s:6:\"column\";s:14:\"p.is_published\";s:9:\"condition\";s:2:\"eq\";s:5:\"value\";s:1:\"1\";}}','a:1:{i:0;a:2:{s:6:\"column\";s:11:\"ph.date_hit\";s:9:\"direction\";s:3:\"ASC\";}}','a:8:{i:0;s:35:\"mautic.page.graph.line.time.on.site\";i:1;s:27:\"mautic.page.graph.line.hits\";i:2;s:38:\"mautic.page.graph.pie.new.vs.returning\";i:3;s:31:\"mautic.page.graph.pie.languages\";i:4;s:34:\"mautic.page.graph.pie.time.on.site\";i:5;s:27:\"mautic.page.table.referrers\";i:6;s:30:\"mautic.page.table.most.visited\";i:7;s:37:\"mautic.page.table.most.visited.unique\";}','a:0:{}','a:0:{}','[]',0,NULL,NULL,NULL,NULL),(2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Downloads of all Assets',NULL,1,'asset.downloads','a:7:{i:0;s:16:\"ad.date_download\";i:1;s:7:\"a.title\";i:2;s:12:\"i.ip_address\";i:3;s:11:\"l.firstname\";i:4;s:10:\"l.lastname\";i:5;s:7:\"l.email\";i:6;s:4:\"a.id\";}','a:1:{i:0;a:3:{s:6:\"column\";s:14:\"a.is_published\";s:9:\"condition\";s:2:\"eq\";s:5:\"value\";s:1:\"1\";}}','a:1:{i:0;a:2:{s:6:\"column\";s:16:\"ad.date_download\";s:9:\"direction\";s:3:\"ASC\";}}','a:4:{i:0;s:33:\"mautic.asset.graph.line.downloads\";i:1;s:31:\"mautic.asset.graph.pie.statuses\";i:2;s:34:\"mautic.asset.table.most.downloaded\";i:3;s:32:\"mautic.asset.table.top.referrers\";}','a:0:{}','a:0:{}','[]',0,NULL,NULL,NULL,NULL),(3,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Submissions of published Forms',NULL,1,'form.submissions','a:0:{}','a:1:{i:1;a:3:{s:6:\"column\";s:14:\"f.is_published\";s:9:\"condition\";s:2:\"eq\";s:5:\"value\";s:1:\"1\";}}','a:0:{}','a:3:{i:0;s:34:\"mautic.form.graph.line.submissions\";i:1;s:32:\"mautic.form.table.most.submitted\";i:2;s:31:\"mautic.form.table.top.referrers\";}','a:0:{}','a:0:{}','[]',0,NULL,NULL,NULL,NULL),(4,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'All Emails',NULL,1,'email.stats','a:5:{i:0;s:12:\"es.date_sent\";i:1;s:12:\"es.date_read\";i:2;s:9:\"e.subject\";i:3;s:16:\"es.email_address\";i:4;s:4:\"e.id\";}','a:1:{i:0;a:3:{s:6:\"column\";s:14:\"e.is_published\";s:9:\"condition\";s:2:\"eq\";s:5:\"value\";s:1:\"1\";}}','a:1:{i:0;a:2:{s:6:\"column\";s:12:\"es.date_sent\";s:9:\"direction\";s:3:\"ASC\";}}','a:6:{i:0;s:29:\"mautic.email.graph.line.stats\";i:1;s:42:\"mautic.email.graph.pie.ignored.read.failed\";i:2;s:35:\"mautic.email.table.most.emails.read\";i:3;s:35:\"mautic.email.table.most.emails.sent\";i:4;s:43:\"mautic.email.table.most.emails.read.percent\";i:5;s:37:\"mautic.email.table.most.emails.failed\";}','a:0:{}','a:0:{}','[]',0,NULL,NULL,NULL,NULL),(5,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Leads and Points',NULL,1,'lead.pointlog','a:7:{i:0;s:13:\"lp.date_added\";i:1;s:7:\"lp.type\";i:2;s:13:\"lp.event_name\";i:3;s:11:\"l.firstname\";i:4;s:10:\"l.lastname\";i:5;s:7:\"l.email\";i:6;s:8:\"lp.delta\";}','a:0:{}','a:1:{i:0;a:2:{s:6:\"column\";s:13:\"lp.date_added\";s:9:\"direction\";s:3:\"ASC\";}}','a:6:{i:0;s:29:\"mautic.lead.graph.line.points\";i:1;s:29:\"mautic.lead.table.most.points\";i:2;s:29:\"mautic.lead.table.top.actions\";i:3;s:28:\"mautic.lead.table.top.cities\";i:4;s:31:\"mautic.lead.table.top.countries\";i:5;s:28:\"mautic.lead.table.top.events\";}','a:0:{}','a:0:{}','[]',0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `mauticreports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticreports_schedulers`
--

DROP TABLE IF EXISTS `mauticreports_schedulers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticreports_schedulers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_id` int(11) NOT NULL,
  `schedule_date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F817EC274BD2A4C0` (`report_id`),
  CONSTRAINT `FK_F817EC274BD2A4C0` FOREIGN KEY (`report_id`) REFERENCES `mauticreports` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticreports_schedulers`
--

LOCK TABLES `mauticreports_schedulers` WRITE;
/*!40000 ALTER TABLE `mauticreports_schedulers` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticreports_schedulers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticroles`
--

DROP TABLE IF EXISTS `mauticroles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticroles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `is_admin` tinyint(1) NOT NULL,
  `readable_permissions` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticroles`
--

LOCK TABLES `mauticroles` WRITE;
/*!40000 ALTER TABLE `mauticroles` DISABLE KEYS */;
INSERT INTO `mauticroles` VALUES (1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Administrator','Full system access',1,'N;');
/*!40000 ALTER TABLE `mauticroles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticsaml_id_entry`
--

DROP TABLE IF EXISTS `mauticsaml_id_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticsaml_id_entry` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `entity_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expiryTimestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`,`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticsaml_id_entry`
--

LOCK TABLES `mauticsaml_id_entry` WRITE;
/*!40000 ALTER TABLE `mauticsaml_id_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticsaml_id_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticsms_message_list_xref`
--

DROP TABLE IF EXISTS `mauticsms_message_list_xref`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticsms_message_list_xref` (
  `sms_id` int(11) NOT NULL,
  `leadlist_id` int(11) NOT NULL,
  PRIMARY KEY (`sms_id`,`leadlist_id`),
  KEY `IDX_B0522C2FBD5C7E60` (`sms_id`),
  KEY `IDX_B0522C2FB9FC8874` (`leadlist_id`),
  CONSTRAINT `FK_B0522C2FB9FC8874` FOREIGN KEY (`leadlist_id`) REFERENCES `mauticlead_lists` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_B0522C2FBD5C7E60` FOREIGN KEY (`sms_id`) REFERENCES `mauticsms_messages` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticsms_message_list_xref`
--

LOCK TABLES `mauticsms_message_list_xref` WRITE;
/*!40000 ALTER TABLE `mauticsms_message_list_xref` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticsms_message_list_xref` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticsms_message_stats`
--

DROP TABLE IF EXISTS `mauticsms_message_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticsms_message_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sms_id` int(11) DEFAULT NULL,
  `lead_id` int(11) DEFAULT NULL,
  `list_id` int(11) DEFAULT NULL,
  `ip_id` int(11) DEFAULT NULL,
  `date_sent` datetime NOT NULL,
  `tracking_hash` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `tokens` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_E1ADF84FBD5C7E60` (`sms_id`),
  KEY `IDX_E1ADF84F55458D` (`lead_id`),
  KEY `IDX_E1ADF84F3DAE168B` (`list_id`),
  KEY `IDX_E1ADF84FA03F5E9F` (`ip_id`),
  KEY `mauticstat_sms_search` (`sms_id`,`lead_id`),
  KEY `mauticstat_sms_hash_search` (`tracking_hash`),
  KEY `mauticstat_sms_source_search` (`source`,`source_id`),
  CONSTRAINT `FK_E1ADF84F3DAE168B` FOREIGN KEY (`list_id`) REFERENCES `mauticlead_lists` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_E1ADF84F55458D` FOREIGN KEY (`lead_id`) REFERENCES `mauticleads` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_E1ADF84FA03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `mauticip_addresses` (`id`),
  CONSTRAINT `FK_E1ADF84FBD5C7E60` FOREIGN KEY (`sms_id`) REFERENCES `mauticsms_messages` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticsms_message_stats`
--

LOCK TABLES `mauticsms_message_stats` WRITE;
/*!40000 ALTER TABLE `mauticsms_message_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticsms_message_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticsms_messages`
--

DROP TABLE IF EXISTS `mauticsms_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticsms_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `lang` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sms_type` longtext COLLATE utf8_unicode_ci,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `sent_count` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F9B4BA7A12469DE2` (`category_id`),
  CONSTRAINT `FK_F9B4BA7A12469DE2` FOREIGN KEY (`category_id`) REFERENCES `mauticcategories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticsms_messages`
--

LOCK TABLES `mauticsms_messages` WRITE;
/*!40000 ALTER TABLE `mauticsms_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticsms_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticstage_lead_action_log`
--

DROP TABLE IF EXISTS `mauticstage_lead_action_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticstage_lead_action_log` (
  `stage_id` int(11) NOT NULL,
  `lead_id` int(11) NOT NULL,
  `ip_id` int(11) DEFAULT NULL,
  `date_fired` datetime NOT NULL,
  PRIMARY KEY (`stage_id`,`lead_id`),
  KEY `IDX_A5667FBF2298D193` (`stage_id`),
  KEY `IDX_A5667FBF55458D` (`lead_id`),
  KEY `IDX_A5667FBFA03F5E9F` (`ip_id`),
  CONSTRAINT `FK_A5667FBF2298D193` FOREIGN KEY (`stage_id`) REFERENCES `mauticstages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A5667FBF55458D` FOREIGN KEY (`lead_id`) REFERENCES `mauticleads` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_A5667FBFA03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `mauticip_addresses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticstage_lead_action_log`
--

LOCK TABLES `mauticstage_lead_action_log` WRITE;
/*!40000 ALTER TABLE `mauticstage_lead_action_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticstage_lead_action_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticstages`
--

DROP TABLE IF EXISTS `mauticstages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticstages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `weight` int(11) NOT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_AC7185B12469DE2` (`category_id`),
  CONSTRAINT `FK_AC7185B12469DE2` FOREIGN KEY (`category_id`) REFERENCES `mauticcategories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticstages`
--

LOCK TABLES `mauticstages` WRITE;
/*!40000 ALTER TABLE `mauticstages` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticstages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mautictweet_stats`
--

DROP TABLE IF EXISTS `mautictweet_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mautictweet_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tweet_id` int(11) DEFAULT NULL,
  `lead_id` int(11) DEFAULT NULL,
  `twitter_tweet_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date_sent` datetime DEFAULT NULL,
  `is_failed` tinyint(1) DEFAULT NULL,
  `retry_count` int(11) DEFAULT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `favorite_count` int(11) DEFAULT NULL,
  `retweet_count` int(11) DEFAULT NULL,
  `response_details` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`),
  KEY `IDX_8F2424891041E39B` (`tweet_id`),
  KEY `IDX_8F24248955458D` (`lead_id`),
  KEY `mauticstat_tweet_search` (`tweet_id`,`lead_id`),
  KEY `mauticstat_tweet_search2` (`lead_id`,`tweet_id`),
  KEY `mauticstat_tweet_failed_search` (`is_failed`),
  KEY `mauticstat_tweet_source_search` (`source`,`source_id`),
  KEY `mauticfavorite_count_index` (`favorite_count`),
  KEY `mauticretweet_count_index` (`retweet_count`),
  KEY `mautictweet_date_sent` (`date_sent`),
  KEY `mautictwitter_tweet_id_index` (`twitter_tweet_id`),
  CONSTRAINT `FK_8F2424891041E39B` FOREIGN KEY (`tweet_id`) REFERENCES `mautictweets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_8F24248955458D` FOREIGN KEY (`lead_id`) REFERENCES `mauticleads` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mautictweet_stats`
--

LOCK TABLES `mautictweet_stats` WRITE;
/*!40000 ALTER TABLE `mautictweet_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `mautictweet_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mautictweets`
--

DROP TABLE IF EXISTS `mautictweets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mautictweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  `asset_id` int(11) DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `media_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `media_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text` varchar(280) COLLATE utf8_unicode_ci NOT NULL,
  `sent_count` int(11) DEFAULT NULL,
  `favorite_count` int(11) DEFAULT NULL,
  `retweet_count` int(11) DEFAULT NULL,
  `lang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8F5D321A12469DE2` (`category_id`),
  KEY `IDX_8F5D321AC4663E4` (`page_id`),
  KEY `IDX_8F5D321A5DA1941` (`asset_id`),
  KEY `mautictweet_text_index` (`text`),
  KEY `mauticsent_count_index` (`sent_count`),
  KEY `mauticfavorite_count_index` (`favorite_count`),
  KEY `mauticretweet_count_index` (`retweet_count`),
  CONSTRAINT `FK_8F5D321A12469DE2` FOREIGN KEY (`category_id`) REFERENCES `mauticcategories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_8F5D321A5DA1941` FOREIGN KEY (`asset_id`) REFERENCES `mauticassets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_8F5D321AC4663E4` FOREIGN KEY (`page_id`) REFERENCES `mauticpages` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mautictweets`
--

LOCK TABLES `mautictweets` WRITE;
/*!40000 ALTER TABLE `mautictweets` DISABLE KEYS */;
/*!40000 ALTER TABLE `mautictweets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticuser_tokens`
--

DROP TABLE IF EXISTS `mauticuser_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticuser_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `authorizator` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `expiration` datetime DEFAULT NULL,
  `one_time_only` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8BA094DF5CA2E8E5` (`secret`),
  KEY `IDX_8BA094DFA76ED395` (`user_id`),
  CONSTRAINT `FK_8BA094DFA76ED395` FOREIGN KEY (`user_id`) REFERENCES `mauticusers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticuser_tokens`
--

LOCK TABLES `mauticuser_tokens` WRITE;
/*!40000 ALTER TABLE `mauticuser_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticuser_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticusers`
--

DROP TABLE IF EXISTS `mauticusers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticusers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timezone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locale` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_active` datetime DEFAULT NULL,
  `online_status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `preferences` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `signature` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1E233A5BF85E0677` (`username`),
  UNIQUE KEY `UNIQ_1E233A5BE7927C74` (`email`),
  KEY `IDX_1E233A5BD60322AC` (`role_id`),
  CONSTRAINT `FK_1E233A5BD60322AC` FOREIGN KEY (`role_id`) REFERENCES `mauticroles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticusers`
--

LOCK TABLES `mauticusers` WRITE;
/*!40000 ALTER TABLE `mauticusers` DISABLE KEYS */;
INSERT INTO `mauticusers` VALUES (1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'carbon','$2y$13$Onv7Z.sHX.ePmGhGMUCjfu67gDut8CqcF2p7jONvbtPBQ5Q8jq3YO','Carbon','Coworking','lucas@carbon.com.br',NULL,'','','2018-10-09 16:39:50','2018-10-09 16:58:43','away','a:0:{}',NULL);
/*!40000 ALTER TABLE `mauticusers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticvideo_hits`
--

DROP TABLE IF EXISTS `mauticvideo_hits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticvideo_hits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lead_id` int(11) DEFAULT NULL,
  `ip_id` int(11) NOT NULL,
  `date_hit` datetime NOT NULL,
  `date_left` datetime DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `region` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isp` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `organization` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` int(11) NOT NULL,
  `referer` longtext COLLATE utf8_unicode_ci,
  `url` longtext COLLATE utf8_unicode_ci,
  `user_agent` longtext COLLATE utf8_unicode_ci,
  `remote_host` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `guid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `page_language` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `browser_languages` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `channel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `time_watched` int(11) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `query` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  KEY `IDX_B1AB2E9B55458D` (`lead_id`),
  KEY `IDX_B1AB2E9BA03F5E9F` (`ip_id`),
  KEY `mauticvideo_date_hit` (`date_hit`),
  KEY `mauticvideo_channel_search` (`channel`,`channel_id`),
  KEY `mauticvideo_guid_lead_search` (`guid`,`lead_id`),
  CONSTRAINT `FK_B1AB2E9B55458D` FOREIGN KEY (`lead_id`) REFERENCES `mauticleads` (`id`) ON DELETE SET NULL,
  CONSTRAINT `FK_B1AB2E9BA03F5E9F` FOREIGN KEY (`ip_id`) REFERENCES `mauticip_addresses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticvideo_hits`
--

LOCK TABLES `mauticvideo_hits` WRITE;
/*!40000 ALTER TABLE `mauticvideo_hits` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticvideo_hits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticwebhook_events`
--

DROP TABLE IF EXISTS `mauticwebhook_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticwebhook_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `webhook_id` int(11) NOT NULL,
  `event_type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CD6F0795C9BA60B` (`webhook_id`),
  CONSTRAINT `FK_CD6F0795C9BA60B` FOREIGN KEY (`webhook_id`) REFERENCES `mauticwebhooks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticwebhook_events`
--

LOCK TABLES `mauticwebhook_events` WRITE;
/*!40000 ALTER TABLE `mauticwebhook_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticwebhook_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticwebhook_logs`
--

DROP TABLE IF EXISTS `mauticwebhook_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticwebhook_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `webhook_id` int(11) NOT NULL,
  `status_code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `runtime` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1E3D6AA5C9BA60B` (`webhook_id`),
  CONSTRAINT `FK_1E3D6AA5C9BA60B` FOREIGN KEY (`webhook_id`) REFERENCES `mauticwebhooks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticwebhook_logs`
--

LOCK TABLES `mauticwebhook_logs` WRITE;
/*!40000 ALTER TABLE `mauticwebhook_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticwebhook_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticwebhook_queue`
--

DROP TABLE IF EXISTS `mauticwebhook_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticwebhook_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `webhook_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2BD2445A5C9BA60B` (`webhook_id`),
  KEY `IDX_2BD2445A71F7E88B` (`event_id`),
  CONSTRAINT `FK_2BD2445A5C9BA60B` FOREIGN KEY (`webhook_id`) REFERENCES `mauticwebhooks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_2BD2445A71F7E88B` FOREIGN KEY (`event_id`) REFERENCES `mauticwebhook_events` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticwebhook_queue`
--

LOCK TABLES `mauticwebhook_queue` WRITE;
/*!40000 ALTER TABLE `mauticwebhook_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticwebhook_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticwebhooks`
--

DROP TABLE IF EXISTS `mauticwebhooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticwebhooks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) DEFAULT NULL,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `webhook_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `events_orderby_dir` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7F59509412469DE2` (`category_id`),
  CONSTRAINT `FK_7F59509412469DE2` FOREIGN KEY (`category_id`) REFERENCES `mauticcategories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticwebhooks`
--

LOCK TABLES `mauticwebhooks` WRITE;
/*!40000 ALTER TABLE `mauticwebhooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `mauticwebhooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mauticwidgets`
--

DROP TABLE IF EXISTS `mauticwidgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mauticwidgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_published` tinyint(1) NOT NULL,
  `date_added` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checked_out` datetime DEFAULT NULL,
  `checked_out_by` int(11) DEFAULT NULL,
  `checked_out_by_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `cache_timeout` int(11) DEFAULT NULL,
  `ordering` int(11) DEFAULT NULL,
  `params` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mauticwidgets`
--

LOCK TABLES `mauticwidgets` WRITE;
/*!40000 ALTER TABLE `mauticwidgets` DISABLE KEYS */;
INSERT INTO `mauticwidgets` VALUES (1,1,'2018-10-09 16:39:50',1,'Carbon Coworking','2018-10-09 16:39:50',NULL,NULL,NULL,NULL,NULL,'Contacts created','created.leads.in.time',100,330,NULL,0,'a:1:{s:5:\"lists\";s:21:\"identifiedVsAnonymous\";}'),(2,1,'2018-10-09 16:39:50',1,'Carbon Coworking','2018-10-09 16:39:50',NULL,NULL,NULL,NULL,NULL,'Contact map','map.of.leads',75,445,NULL,1,'a:0:{}'),(3,1,'2018-10-09 16:39:50',1,'Carbon Coworking','2018-10-09 16:39:50',NULL,NULL,NULL,NULL,NULL,'Top lists','top.lists',25,445,NULL,2,'a:0:{}'),(4,1,'2018-10-09 16:39:50',1,'Carbon Coworking','2018-10-09 16:39:50',NULL,NULL,NULL,NULL,NULL,'Visits','page.hits.in.time',100,330,NULL,3,'a:0:{}'),(5,1,'2018-10-09 16:39:50',1,'Carbon Coworking','2018-10-09 16:39:50',NULL,NULL,NULL,NULL,NULL,'Emails sent / opened','emails.in.time',100,330,NULL,4,'a:0:{}'),(6,1,'2018-10-09 16:39:50',1,'Carbon Coworking','2018-10-09 16:39:50',NULL,NULL,NULL,NULL,NULL,'Unique/returning visitors','unique.vs.returning.leads',25,215,NULL,5,'a:0:{}'),(7,1,'2018-10-09 16:39:50',1,'Carbon Coworking','2018-10-09 16:39:50',NULL,NULL,NULL,NULL,NULL,'Ignored/opened emails','ignored.vs.read.emails',25,215,NULL,6,'a:0:{}'),(8,1,'2018-10-09 16:39:50',1,'Carbon Coworking','2018-10-09 16:39:50',NULL,NULL,NULL,NULL,NULL,'Identified vs anonymous leads','anonymous.vs.identified.leads',25,215,NULL,7,'a:0:{}'),(9,1,'2018-10-09 16:39:50',1,'Carbon Coworking','2018-10-09 16:39:50',NULL,NULL,NULL,NULL,NULL,'Dwell times','dwell.times',25,215,NULL,8,'a:0:{}'),(10,1,'2018-10-09 16:39:50',1,'Carbon Coworking','2018-10-09 16:39:50',NULL,NULL,NULL,NULL,NULL,'Recent activity','recent.activity',50,330,NULL,9,'a:0:{}'),(11,1,'2018-10-09 16:39:50',1,'Carbon Coworking','2018-10-09 16:39:50',NULL,NULL,NULL,NULL,NULL,'Upcoming Emails','upcoming.emails',50,330,NULL,10,'a:0:{}');
/*!40000 ALTER TABLE `mauticwidgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-09 16:59:23
