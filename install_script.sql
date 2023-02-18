DROP DATABASE IF EXISTS htm_database;
CREATE DATABASE htm_database;
USE htm_database;

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

DROP TABLE IF EXISTS `airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `airport` (
  `id` int(11) NOT NULL,
  `ident` varchar(40) NOT NULL,
  `type` varchar(40) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `latitude_deg` double DEFAULT NULL,
  `longitude_deg` double DEFAULT NULL,
  `elevation_ft` int(11) DEFAULT NULL,
  `continent` varchar(40) DEFAULT NULL,
  `iso_country` varchar(40) DEFAULT NULL,
  `iso_region` varchar(40) DEFAULT NULL,
  `municipality` varchar(40) DEFAULT NULL,
  `scheduled_service` varchar(40) DEFAULT NULL,
  `gps_code` varchar(40) DEFAULT NULL,
  `iata_code` varchar(40) DEFAULT NULL,
  `local_code` varchar(40) DEFAULT NULL,
  `home_link` varchar(40) DEFAULT NULL,
  `wikipedia_link` varchar(40) DEFAULT NULL,
  `keywords` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ident`),
  KEY `iso_country` (`iso_country`),
  CONSTRAINT `airport_ibfk_1` FOREIGN KEY (`iso_country`) REFERENCES `country` (`iso_country`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `iso_country` varchar(40) NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `continent` varchar(40) DEFAULT NULL,
  `wikipedia_link` varchar(40) DEFAULT NULL,
  `keywords` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`iso_country`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game` (
  `id` varchar(40) NOT NULL,
  `fuel` int(8) DEFAULT NULL,
  `stonks` int(8) DEFAULT NULL,
  `location` varchar(10) DEFAULT NULL,
  `screen_name` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `location` (`location`),
  CONSTRAINT `game_ibfk_1` FOREIGN KEY (`location`) REFERENCES `airport` (`ident`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `minigame`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `minigame` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(120) DEFAULT NULL,
  `answer1` varchar(40) DEFAULT NULL,
  `answer2` varchar(40) DEFAULT NULL,
  `answer3` varchar(40) DEFAULT NULL,
  `answer4` varchar(40) DEFAULT NULL,
  `correct_answer` varchar(40) DEFAULT NULL,
  `completed` bool DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `prize`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `prize` (
  `id` int(11) NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `value` int(8) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `prize_ibfk_1` FOREIGN KEY (`id`) REFERENCES `minigame` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

DROP TABLE IF EXISTS `airport_reached`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `airport_reached` (
  `game_id` varchar(40) NOT NULL,
  `airport_icao` varchar(40) NOT NULL,
  `minigame_id` int(11) NOT NULL,
  PRIMARY KEY (`game_id`,`airport_icao`,`minigame_id`),
  KEY `gameid` (`game_id`),
  CONSTRAINT `airport_reached_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `game` (`id`),
  CONSTRAINT `airport_reached_ibfk_2` FOREIGN KEY (`airport_icao`) REFERENCES `airport` (`ident`),
  CONSTRAINT `airport_reached_ibfk_3` FOREIGN KEY (`minigame_id`) REFERENCES `minigame` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `airport` WRITE;
/*!40000 ALTER TABLE `airport` DISABLE KEYS */;
INSERT INTO `airport` VALUES
  (3622,'KJFK','large_airport','John F Kennedy International Airport',40.639801,-73.7789,13,'NA','US','US-NY','New York','yes','KJFK','JFK','JFK','https://www.jfkairport.com/','https://en.wikipedia.org/wiki/John_F._Ke','Manhattan, New York City, NYC, Idlewild,'),
  (3384,'KATL','large_airport','Hartsfield Jackson Atlanta International',33.6367,-84.428101,1026,'NA','US','US-GA','Atlanta','yes','KATL','ATL','ATL','http://www.atlanta-airport.com/','https://en.wikipedia.org/wiki/Hartsfield',''),
  (3751,'KOMA','medium_airport','Eppley Airfield',41.3032,-95.894096,984,'NA','US','US-NE','Omaha','yes','KOMA','OMA','OMA','','https://en.wikipedia.org/wiki/Eppley_Air',''),
  (3632,'KLAX','large_airport','Los Angeles International Airport',33.942501,-118.407997,125,'NA','US','US-CA','Los Angeles','yes','KLAX','LAX','LAX','https://www.flylax.com/','https://en.wikipedia.org/wiki/Los_Angele',''),
  (3631,'KLAS','large_airport','McCarran International Airport',36.08010101,-115.1520004,2181,'NA','US','US-NV','Las Vegas','yes','KLAS','LAS','LAS','http://www.mccarran.com/','https://en.wikipedia.org/wiki/McCarran_I',''),
  (3754,'KORD','large_airport',"Chicago O\'Hare International Airport",41.9786,-87.9048,672,'NA','US','US-IL','Chicago','yes','KORD','ORD','ORD','https://www.flychicago.com/ohare/home/pa',"https://en.wikipedia.org/wiki/O\'Hare_Int",'CHI, Orchard Place'),
  (3791,'KPSM','medium_airport','Portsmouth International at Pease Airpor',43.0778999329,-70.8233032227,100,'NA','US','US-NH','Portsmouth','yes','KPSM','PSM','PSM','','https://en.wikipedia.org/wiki/Pease_Inte',''),
  (3521,'KEWR','large_airport','Newark Liberty International Airport',40.692501,-74.168701,18,'NA','US','US-NJ','New York','yes','KEWR','EWR','EWR','http://www.panynj.gov/CommutingTravel/ai','https://en.wikipedia.org/wiki/Newark_Lib','Manhattan, New York City, NYC'),
  (16091,'KABQ','medium_airport','Albuquerque International Sunport',35.040199,-106.609001,5355,'NA','US','US-NM','Albuquerque','yes','KABQ','ABQ','ABQ','http://www.abqsunport.com/','https://en.wikipedia.org/wiki/Albuquerqu',''),
  (3457,'KCLT','large_airport','Charlotte Douglas International Airport',35.2140007019043,-80.94309997558594,748,'NA','US','US-NC','Charlotte','yes','KCLT','CLT','CLT','http://www.charlotteairport.com/','https://en.wikipedia.org/wiki/Charlotte/',''),
  (3702,'KMOT','medium_airport','Minot International Airport',48.2593994140625,-101.27999877929688,1716,'NA','US','US-ND','Minot','yes','KMOT','MOT','MOT','','https://en.wikipedia.org/wiki/Minot_Inte',''),
  (3458,'KCMH','large_airport','John Glenn Columbus International Airpor',39.998001,-82.891899,815,'NA','US','US-OH','Columbus','yes','KCMH','CMH','CMH','https://flycolumbus.com/','https://en.wikipedia.org/wiki/Port_Colum',''),
  (3747,'KOKC','medium_airport','Will Rogers World Airport',35.393101,-97.6007,1295,'NA','US','US-OK','Oklahoma City','yes','KOKC','OKC','OKC','','https://en.wikipedia.org/wiki/Will_Roger',''),
  (3768,'KPDX','large_airport','Portland International Airport',45.58869934,-122.5979996,31,'NA','US','US-OR','Portland','yes','KPDX','PDX','PDX','','https://en.wikipedia.org/wiki/Portland_I',''),
  (3771,'KPHL','large_airport','Philadelphia International Airport',39.87189865112305,-75.24109649658203,36,'NA','US','US-PA','Philadelphia','yes','KPHL','PHL','PHL','http://www.phl.org/','https://en.wikipedia.org/wiki/Philadelph',''),
  (3795,'KPVD','large_airport','Theodore Francis Green State Airport',41.725038,-71.425668,55,'NA','US','US-RI','Providence','yes','KPVD','PVD','PVD','','https://en.wikipedia.org/wiki/T._F._Gree',''),
  (3450,'KCHS','medium_airport','Charleston International Airport',32.898602,-80.040497,46,'NA','US','US-SC','Charleston','yes','KCHS','CHS','CHS','','https://en.wikipedia.org/wiki/Charleston','Charleston Air Force Base'),
  (3541,'KFSD','medium_airport','Sioux Falls Regional Airport / Joe Foss ',43.585463,-96.741152,1429,'NA','US','US-SD','Sioux Falls','yes','KFSD','FSD','FSD','http://www.sfairport.com/','https://en.wikipedia.org/wiki/Sioux_Fall','Joe Foss Field, Fighting Lobos, Sioux Fa'),
  (3420,'KBNA','large_airport','Nashville International Airport',36.1245002746582,-86.6781997680664,599,'NA','US','US-TN','Nashville','yes','KBNA','BNA','BNA','','https://en.wikipedia.org/wiki/Nashville_',''),
  (3488,'KDFW','large_airport','Dallas Fort Worth International Airport',32.896801,-97.038002,607,'NA','US','US-TX','Dallas-Fort Worth','yes','KDFW','DFW','DFW','https://www.dfwairport.com/','https://en.wikipedia.org/wiki/Dallas/For','QDF'),
  (3887,'KSLC','large_airport','Salt Lake City International Airport',40.785749,-111.979746,4227,'NA','US','US-UT','Salt Lake City','yes','KSLC','SLC','SLC','','https://en.wikipedia.org/wiki/Salt_Lake_',''),
  (3430,'KBTV','medium_airport','Burlington International Airport',44.471900939899996,-73.15329742429999,335,'NA','US','US-VT','Burlington','yes','KBTV','BTV','BTV','http://www.vermontairports.com/btv.html','https://en.wikipedia.org/wiki/Burlington',''),
  (3602,'KIAD','large_airport','Washington Dulles International Airport',38.9445,-77.455803,312,'NA','US','US-DC','Washington','yes','KIAD','IAD','IAD','http://www.mwaa.com/dulles/','https://en.wikipedia.org/wiki/Washington','WAS'),
  (3604,'KIAH','large_airport','George Bush Intercontinental Houston Air',29.984399795532227,-95.34140014648438,97,'NA','US','US-TX','Houston','yes','KIAH','IAH','IAH','http://www.fly2houston.com/iah','https://en.wikipedia.org/wiki/George_Bus','QHO'),
  (3875,'KSEA','large_airport','Seattle Tacoma International Airport',47.449001,-122.308998,433,'NA','US','US-WA','Seattle','yes','KSEA','SEA','SEA','http://www.portseattle.org/seatac/','https://en.wikipedia.org/wiki/Seattle–Ta',''),
  (3467,'KCRW','medium_airport','Yeager Airport',38.3731,-81.593201,981,'NA','US','US-WV','Charleston','yes','KCRW','CRW','CRW','','https://en.wikipedia.org/wiki/Yeager_Air',''),
  (3690,'KMKE','large_airport','General Mitchell International Airport',42.947200775146484,-87.89659881591797,723,'NA','US','US-WI','Milwaukee','yes','KMKE','MKE','MKE','','https://en.wikipedia.org/wiki/General_Mi',''),
  (3465,'KCPR','medium_airport','Casper-Natrona County International Airp',42.908001,-106.463997,5350,'NA','US','US-WY','Casper','yes','KCPR','CPR','CPR','','https://en.wikipedia.org/wiki/Natrona_Co',''),
  (3406,'KBHM','medium_airport','Birmingham-Shuttlesworth International A',33.562901,-86.753502,650,'NA','US','US-AL','Birmingham','yes','KBHM','BHM','BHM','http://www.flybirmingham.com/','https://en.wikipedia.org/wiki/Birmingham',''),
  (5388,'PANC','large_airport','Ted Stevens Anchorage International Airp',61.1744,-149.996002,152,'NA','US','US-AK','Anchorage','yes','PANC','ANC','ANC','','https://en.wikipedia.org/wiki/Ted_Steven',''),
  (3772,'KPHX','large_airport','Phoenix Sky Harbor International Airport',33.435302,-112.005905,1135,'NA','US','US-AZ','Phoenix','yes','KPHX','PHX','PHX','http://phoenix.gov/skyharborairport/','https://en.wikipedia.org/wiki/Phoenix_Sk',''),
  (3645,'KLIT','medium_airport','Bill & Hillary Clinton National Airport/',34.729582,-92.223728,262,'NA','US','US-AR','Little Rock','yes','KLIT','LIT','LIT','','https://en.wikipedia.org/wiki/Little_Roc',''),
  (3486,'KDEN','large_airport','Denver International Airport',39.861698150635,-104.672996521,5431,'NA','US','US-CO','Denver','yes','KDEN','DEN','DEN','http://www.flydenver.com/','https://en.wikipedia.org/wiki/Denver_Int','DVX, KVDX'),
  (3396,'KBDL','medium_airport','Bradley International Airport',41.93851,-72.688066,173,'NA','US','US-CT','Hartford','yes','KBDL','BDL','BDL','http://www.bradleyairport.com/','https://en.wikipedia.org/wiki/Bradley_In','HFD, Hartford'),
  (3608,'KILG','medium_airport','New Castle Airport',39.67869949,-75.60649872,80,'NA','US','US-DE','Wilmington','yes','KILG','ILG','ILG','','https://en.wikipedia.org/wiki/New_Castle',''),
  (3670,'KMCO','large_airport','Orlando International Airport',28.429399490356445,-81.30899810791016,96,'NA','US','US-FL','Orlando','yes','KMCO','MCO','MCO','http://www.orlandoairports.net/','https://en.wikipedia.org/wiki/Orlando_In','Disney World,Epcot Center'),
  (5453,'PHNL','large_airport','Daniel K Inouye International Airport',21.32062,-157.924228,13,'NA','US','US-HI','Honolulu','yes','PHNL','HNL','HNL','http://airports.hawaii.gov/hnl/','https://en.wikipedia.org/wiki/Daniel_K._','Hickam Air Force Base, HIK, PHIK, KHNL, '),
  (3421,'KBOI','medium_airport','Boise Air Terminal/Gowen Field',43.5644,-116.223,2871,'NA','US','US-ID','Boise','yes','KBOI','BOI','BOI','http://www.cityofboise.org/departments/a','https://en.wikipedia.org/wiki/Boise_Airp','Boise Air Terminal, Gowen Field'),
  (3422,'KBOS','large_airport','Logan International Airport',42.3643,-71.005203,20,'NA','US','US-MA','Boston','yes','KBOS','BOS','BOS','http://www.massport.com/logan/','https://en.wikipedia.org/wiki/Logan_Inte','General Edward Lawrence Logan Internatio'),
  (3610,'KIND','large_airport','Indianapolis International Airport',39.7173,-86.294403,797,'NA','US','US-IN','Indianapolis','yes','KIND','IND','IND','http://www.indianapolisairport.com/','https://en.wikipedia.org/wiki/Indianapol',''),
  (3496,'KDSM','medium_airport','Des Moines International Airport',41.534,-93.663101,958,'NA','US','US-IA','Des Moines','yes','KDSM','DSM','DSM','','https://en.wikipedia.org/wiki/Des_Moines',''),
  (3605,'KICT','medium_airport','Wichita Eisenhower National Airport',37.649899,-97.433098,1333,'NA','US','US-KS','Wichita','yes','KICT','ICT','ICT','','https://en.wikipedia.org/wiki/Wichita_Dw',''),
  (3873,'KSDF','large_airport','Louisville Muhammad Ali International Ai',38.1744,-85.736,501,'NA','US','US-KY','Louisville','yes','KSDF','SDF','SDF','http://www.flylouisville.com','https://en.wikipedia.org/wiki/Louisville','Louisville International, Standiford Fie'),
  (3711,'KMSY','large_airport','Louis Armstrong New Orleans Internationa',29.99340057373047,-90.25800323486328,4,'NA','US','US-LA','New Orleans','yes','KMSY','MSY','MSY','','https://en.wikipedia.org/wiki/Louis_Arms',''),
  (3796,'KPWM','large_airport','Portland International Jetport',43.646198,-70.309303,76,'NA','US','US-ME','Portland','yes','KPWM','PWM','PWM','','https://en.wikipedia.org/wiki/Portland_I',''),
  (3435,'KBWI','large_airport','Baltimore/Washington International Thurg',39.1754,-76.668297,146,'NA','US','US-MD','Baltimore','yes','KBWI','BWI','BWI','https://www.bwiairport.com/','https://en.wikipedia.org/wiki/Baltimore%','WAS'),
  (3497,'KDTW','large_airport','Detroit Metropolitan Wayne County Airpor',42.212398529052734,-83.35340118408203,645,'NA','US','US-MI','Detroit','yes','KDTW','DTW','DTW','http://www.metroairport.com/','https://en.wikipedia.org/wiki/Detroit_Me','DTT, Detroit Metro Airport'),
  (3709,'KMSP','large_airport','Minneapolis–Saint Paul International Air',44.882,-93.221802,841,'NA','US','US-MN','Minneapolis','yes','KMSP','MSP','MSP','http://www.mspairport.com/','https://en.wikipedia.org/wiki/Minneapoli',''),
  (3619,'KJAN','medium_airport','Jackson-Medgar Wiley Evers International',32.311199,-90.075897,346,'NA','US','US-MS','Jackson','yes','KJAN','JAN','JAN','','https://en.wikipedia.org/wiki/Jackson-Ev',''),
  (3905,'KSTL','large_airport','St Louis Lambert International Airport',38.748697,-90.370003,618,'NA','US','US-MO','St Louis','yes','KSTL','STL','STL','https://www.flystl.com/','https://en.wikipedia.org/wiki/St._Louis_','Lambert St Louis'),
  (3437,'KBZN','medium_airport','Gallatin Field',45.77750015,-111.1529999,4473,'NA','US','US-MT','Bozeman','yes','KBZN','BZN','BZN','','https://en.wikipedia.org/wiki/Gallatin_F',''),
  (4731,'MMMX','large_airport','Licenciado Benito Juarez International A',19.4363,-99.072098,7316,'NA','MX','MX-DIF','Mexico City','yes','MMMX','MEX','ME1','https://www.aicm.com.mx','https://en.wikipedia.org/wiki/Mexico_Cit','AICM'),
  (4762,'MMUN','large_airport','Cancún International Airport',21.036500930800003,-86.8770980835,22,'NA','MX','MX-ROO','Cancún','yes','MMUN','CUN','','http://www.asur.com.mx/asur/ingles/aerop','https://en.wikipedia.org/wiki/Canc%C3%BA',''),
  (4710,'MMGL','large_airport','Don Miguel Hidalgo Y Costilla Internatio',20.521799087524414,-103.31099700927734,5016,'NA','MX','MX-JAL','Guadalajara','yes','MMGL','GDL','','','https://en.wikipedia.org/wiki/Don_Miguel',''),
  (1986,'CYYT','large_airport',"St. John\'s International Airport",47.618598938,-52.7518997192,461,'NA','CA','CA-NL',"St. John\'s",'yes','CYYT','YYT','','http://www.stjohnsairport.com/',"https://en.wikipedia.org/wiki/St._John\'s",''),
  (1990,'CYYZ','large_airport','Lester B. Pearson International Airport',43.6772003174,-79.63059997559999,569,'NA','CA','CA-ON','Toronto','yes','CYYZ','YYZ','YYZ','http://www.gtaa.com/','https://en.wikipedia.org/wiki/Toronto_Pe','YTO, Toronto International Airport, Malt'),
  (1941,'CYVR','large_airport','Vancouver International Airport',49.193901062,-123.183998108,14,'NA','CA','CA-BC','Vancouver','yes','CYVR','YVR','','http://www.yvr.ca/','https://en.wikipedia.org/wiki/Vancouver_',''),
  (1946,'CYWG','large_airport','Winnipeg / James Armstrong Richardson In',49.909999847399995,-97.2398986816,783,'NA','CA','CA-MB','Winnipeg','yes','CYWG','YWG','YWG','http://www.waa.ca/','https://en.wikipedia.org/wiki/Winnipeg_J','CFB Winnipeg'),
  (4664,'MHSC','medium_airport','Palmerola International Airport',14.3824,-87.621201,2061,'NA','HN','HN-CM','Tegucigalpa','yes','MHPR','XPL','','','https://en.wikipedia.org/wiki/Comayagua_','Comayagua International, MHSC, Enrique S')
;
/*!40000 ALTER TABLE `airport` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES 
  ('AD','Andorra','EU','https://en.wikipedia.org/wiki/Andorra','\r'),
  ('AE','United Arab Emirates','AS','https://en.wikipedia.org/wiki/United_Ara','UAE'),
  ('AF','Afghanistan','AS','https://en.wikipedia.org/wiki/Afghanista','\r'),
  ('AG','Antigua and Barbuda','NA','https://en.wikipedia.org/wiki/Antigua_an','\r'),
  ('AI','Anguilla','NA','https://en.wikipedia.org/wiki/Anguilla','\r'),
  ('AL','Albania','EU','https://en.wikipedia.org/wiki/Albania','\r'),
  ('AM','Armenia','AS','https://en.wikipedia.org/wiki/Armenia','\r'),
  ('AO','Angola','AF','https://en.wikipedia.org/wiki/Angola','\r'),
  ('AQ','Antarctica','AN','https://en.wikipedia.org/wiki/Antarctica','\r'),
  ('AR','Argentina','SA','https://en.wikipedia.org/wiki/Argentina','Aeropuertos de Argentina\r'),
  ('AS','American Samoa','OC','https://en.wikipedia.org/wiki/American_S','\r'),
  ('AT','Austria','EU','https://en.wikipedia.org/wiki/Austria','Flughäfen in Österreich\r'),
  ('AU','Australia','OC','https://en.wikipedia.org/wiki/Australia','\r'),
  ('AW','Aruba','NA','https://en.wikipedia.org/wiki/Aruba','\r'),
  ('AZ','Azerbaijan','AS','https://en.wikipedia.org/wiki/Azerbaijan','\r'),
  ('BA','Bosnia and Herzegovina','EU','https://en.wikipedia.org/wiki/Bosnia_and','\r'),
  ('BB','Barbados','NA','https://en.wikipedia.org/wiki/Barbados','\r'),
  ('BD','Bangladesh','AS','https://en.wikipedia.org/wiki/Bangladesh','\r'),
  ('BE','Belgium','EU','https://en.wikipedia.org/wiki/Belgium','Aéroports de Belgique'),
  ('BF','Burkina Faso','AF','https://en.wikipedia.org/wiki/Burkina_Fa','\r'),
  ('BG','Bulgaria','EU','https://en.wikipedia.org/wiki/Bulgaria','\r'),
  ('BH','Bahrain','AS','https://en.wikipedia.org/wiki/Bahrain','?????? ???????\r'),
  ('BI','Burundi','AF','https://en.wikipedia.org/wiki/Burundi','\r'),
  ('BJ','Benin','AF','https://en.wikipedia.org/wiki/Benin','\r'),
  ('BL','Saint Barthélemy','NA','https://en.wikipedia.org/wiki/Saint_Bart','\r'),
  ('BM','Bermuda','NA','https://en.wikipedia.org/wiki/Bermuda','\r'),
  ('BN','Brunei','AS','https://en.wikipedia.org/wiki/Brunei','\r'),
  ('BO','Bolivia','SA','https://en.wikipedia.org/wiki/Bolivia','Aeropuertos de Bolivia\r'),
  ('BQ','Caribbean Netherlands','NA','https://en.wikipedia.org/wiki/Caribbean_','\r'),
  ('BR','Brazil','SA','https://en.wikipedia.org/wiki/Brazil','Brasil'),
  ('BS','Bahamas','NA','https://en.wikipedia.org/wiki/Bahamas','\r'),
  ('BT','Bhutan','AS','https://en.wikipedia.org/wiki/Bhutan','\r'),
  ('BW','Botswana','AF','https://en.wikipedia.org/wiki/Botswana','\r'),
  ('BY','Belarus','EU','https://en.wikipedia.org/wiki/Belarus','Belarussian'),
  ('BZ','Belize','NA','https://en.wikipedia.org/wiki/Belize','\r'),
  ('CA','Canada','NA','https://en.wikipedia.org/wiki/Canada','\r'),
  ('CC','Cocos (Keeling) Islands','AS','https://en.wikipedia.org/wiki/Cocos_(Kee','\r'),
  ('CD','Congo (Kinshasa)','AF','https://en.wikipedia.org/wiki/Congo_(Kin','\r'),
  ('CF','Central African Republic','AF','https://en.wikipedia.org/wiki/Central_Af','\r'),
  ('CG','Congo (Brazzaville)','AF','https://en.wikipedia.org/wiki/Congo_(Bra','\r'),
  ('CH','Switzerland','EU','https://en.wikipedia.org/wiki/Switzerlan','Aéroports de la Suisse'),
  ('CI',"Côte d\'Ivoire",'AF',"https://en.wikipedia.org/wiki/Côte_d\'Ivo",'Ivory Coast\r'),
  ('CK','Cook Islands','OC','https://en.wikipedia.org/wiki/Cook_Islan','\r'),
  ('CL','Chile','SA','https://en.wikipedia.org/wiki/Chile','Aeropuertos de Chile\r'),
  ('CM','Cameroon','AF','https://en.wikipedia.org/wiki/Cameroon','\r'),
  ('CN','China','AS','https://en.wikipedia.org/wiki/China','?????\r'),
  ('CO','Colombia','SA','https://en.wikipedia.org/wiki/Colombia','Aeropuertos de Colombia\r'),
  ('CR','Costa Rica','NA','https://en.wikipedia.org/wiki/Costa_Rica','Aeropuertos de Costa Rica\r'),
  ('CU','Cuba','NA','https://en.wikipedia.org/wiki/Cuba','Aeropuertos de Cuba\r'),
  ('CV','Cape Verde','AF','https://en.wikipedia.org/wiki/Cape_Verde','\r'),
  ('CW','Curaçao','NA','https://en.wikipedia.org/wiki/Cura%C3%A7','\r'),
  ('CX','Christmas Island','AS','https://en.wikipedia.org/wiki/Christmas_','\r'),
  ('CY','Cyprus','AS','https://en.wikipedia.org/wiki/Cyprus','\r'),
  ('CZ','Czech Republic','EU','https://en.wikipedia.org/wiki/Czech_Repu','Letišt? ?eské republiky'),
  ('DE','Germany','EU','https://en.wikipedia.org/wiki/Germany','Flughäfen in Deutschland\r'),
  ('DJ','Djibouti','AF','https://en.wikipedia.org/wiki/Djibouti','\r'),
  ('DK','Denmark','EU','https://en.wikipedia.org/wiki/Denmark','Lufthavnene i Danmark\r'),
  ('DM','Dominica','NA','https://en.wikipedia.org/wiki/Dominica','\r'),
  ('DO','Dominican Republic','NA','https://en.wikipedia.org/wiki/Dominican_','\r'),
  ('DZ','Algeria','AF','https://en.wikipedia.org/wiki/Algeria','?????? ???????\r'),
  ('EC','Ecuador','SA','https://en.wikipedia.org/wiki/Ecuador','Aeropuertos de Ecuador\r'),
  ('EE','Estonia','EU','https://en.wikipedia.org/wiki/Estonia','\r'),
  ('EG','Egypt','AF','https://en.wikipedia.org/wiki/Egypt','?????? ???\r'),
  ('EH','Western Sahara','AF','https://en.wikipedia.org/wiki/Western_Sa','Sahrawian'),
  ('ER','Eritrea','AF','https://en.wikipedia.org/wiki/Eritrea','\r'),
  ('ES','Spain','EU','https://en.wikipedia.org/wiki/Spain','Aeropuertos de España\r'),
  ('ET','Ethiopia','AF','https://en.wikipedia.org/wiki/Ethiopia','\r'),
  ('FI','Finland','EU','https://en.wikipedia.org/wiki/Finland','Lentokentät'),
  ('FJ','Fiji','OC','https://en.wikipedia.org/wiki/Fiji','\r'),
  ('FK','Falkland Islands','SA','https://en.wikipedia.org/wiki/Falkland_I','\r'),
  ('FM','Micronesia','OC','https://en.wikipedia.org/wiki/Federated_','\r'),
  ('FO','Faroe Islands','EU','https://en.wikipedia.org/wiki/Faroe_Isla','\r'),
  ('FR','France','EU','https://en.wikipedia.org/wiki/France','Aéroports de France\r'),
  ('GA','Gabon','AF','https://en.wikipedia.org/wiki/Gabon','\r'),
  ('GB','United Kingdom','EU','https://en.wikipedia.org/wiki/United_Kin','Great Britain\r'),
  ('GD','Grenada','NA','https://en.wikipedia.org/wiki/Grenada','\r'),
  ('GE','Georgia','AS','https://en.wikipedia.org/wiki/Georgia_(c','\r'),
  ('GF','French Guiana','SA','https://en.wikipedia.org/wiki/French_Gui','French Guyana\r'),
  ('GG','Guernsey','EU','https://en.wikipedia.org/wiki/Guernsey','\r'),
  ('GH','Ghana','AF','https://en.wikipedia.org/wiki/Ghana','\r'),
  ('GI','Gibraltar','EU','https://en.wikipedia.org/wiki/Gibraltar','\r'),
  ('GL','Greenland','NA','https://en.wikipedia.org/wiki/Greenland','\r'),
  ('GM','Gambia','AF','https://en.wikipedia.org/wiki/Gambia','\r'),
  ('GN','Guinea','AF','https://en.wikipedia.org/wiki/Guinea','Aéroports de la Guinée\r'),
  ('GP','Guadeloupe','NA','https://en.wikipedia.org/wiki/Guadeloupe','\r'),
  ('GQ','Equatorial Guinea','AF','https://en.wikipedia.org/wiki/Equatorial','\r'),
  ('GR','Greece','EU','https://en.wikipedia.org/wiki/Greece','?????????? ???? ??????\r'),
  ('GS','South Georgia and the South Sandwich Isl','AN','https://en.wikipedia.org/wiki/South_Geor','\r'),
  ('GT','Guatemala','NA','https://en.wikipedia.org/wiki/Guatemala','Aeropuertos de Guatemala\r'),
  ('GU','Guam','OC','https://en.wikipedia.org/wiki/Guam','\r'),
  ('GW','Guinea-Bissau','AF','https://en.wikipedia.org/wiki/Guinea-Bis','\r'),
  ('GY','Guyana','SA','https://en.wikipedia.org/wiki/Guyana','\r'),
  ('HK','Hong Kong','AS','https://en.wikipedia.org/wiki/Hong_Kong','\r'),
  ('HM','Heard and McDonald Islands','OC','https://en.wikipedia.org/wiki/Heard_Isla','\r'),
  ('HN','Honduras','NA','https://en.wikipedia.org/wiki/Honduras','Aeropuertos de Honduras\r'),
  ('HR','Croatia','EU','https://en.wikipedia.org/wiki/Croatia','\r'),
  ('HT','Haiti','NA','https://en.wikipedia.org/wiki/Haiti','Aéroports de Haïti\r'),
  ('HU','Hungary','EU','https://en.wikipedia.org/wiki/Hungary','Repül?terek Magyarország\r'),
  ('ID','Indonesia','AS','https://en.wikipedia.org/wiki/Indonesia','Bandara di Indonesia\r'),
  ('IE','Ireland','EU','https://en.wikipedia.org/wiki/Ireland','Eire\r'),
  ('IL','Israel','AS','https://en.wikipedia.org/wiki/Israel','???? ?????? ?? ?????\r'),
  ('IM','Isle of Man','EU','https://en.wikipedia.org/wiki/Isle_of_Ma','\r'),
  ('IN','India','AS','https://en.wikipedia.org/wiki/India','\r'),
  ('IO','British Indian Ocean Territory','AS','https://en.wikipedia.org/wiki/British_In','\r'),
  ('IQ','Iraq','AS','https://en.wikipedia.org/wiki/Iraq','?????? ??????\r'),
  ('IR','Iran','AS','https://en.wikipedia.org/wiki/Iran','??????? ??? ?????\r'),
  ('IS','Iceland','EU','https://en.wikipedia.org/wiki/Iceland','\r'),
  ('IT','Italy','EU','https://en.wikipedia.org/wiki/Italy',"Aeroporti d\'Italia\r"),
  ('JE','Jersey','EU','https://en.wikipedia.org/wiki/Jersey','\r'),
  ('JM','Jamaica','NA','https://en.wikipedia.org/wiki/Jamaica','\r'),
  ('JO','Jordan','AS','https://en.wikipedia.org/wiki/Jordan','?????? ?? ??????\r'),
  ('JP','Japan','AS','https://en.wikipedia.org/wiki/Japan','Nippon'),
  ('KE','Kenya','AF','https://en.wikipedia.org/wiki/Kenya','\r'),
  ('KG','Kyrgyzstan','AS','https://en.wikipedia.org/wiki/Kyrgyzstan','\r'),
  ('KH','Cambodia','AS','https://en.wikipedia.org/wiki/Cambodia','\r'),
  ('KI','Kiribati','OC','https://en.wikipedia.org/wiki/Kiribati','\r'),
  ('KM','Comoros','AF','https://en.wikipedia.org/wiki/Comoros','??? ?????\r'),
  ('KN','Saint Kitts and Nevis','NA','https://en.wikipedia.org/wiki/Saint_Kitt','\r'),
  ('KP','North Korea','AS','https://en.wikipedia.org/wiki/North_Kore','\r'),
  ('KR','South Korea','AS','https://en.wikipedia.org/wiki/South_Kore','??? ??\r'),
  ('KW','Kuwait','AS','https://en.wikipedia.org/wiki/Kuwait','\r'),
  ('KY','Cayman Islands','NA','https://en.wikipedia.org/wiki/Cayman_Isl','\r'),
  ('KZ','Kazakhstan','AS','https://en.wikipedia.org/wiki/Kazakhstan','Kazakh\r'),
  ('LA','Laos','AS','https://en.wikipedia.org/wiki/Laos','\r'),
  ('LB','Lebanon','AS','https://en.wikipedia.org/wiki/Lebanon','???????? ?? ?????\r'),
  ('LC','Saint Lucia','NA','https://en.wikipedia.org/wiki/Saint_Luci','\r'),
  ('LI','Liechtenstein','EU','https://en.wikipedia.org/wiki/Liechtenst','\r'),
  ('LK','Sri Lanka','AS','https://en.wikipedia.org/wiki/Sri_Lanka','\r'),
  ('LR','Liberia','AF','https://en.wikipedia.org/wiki/Liberia','\r'),
  ('LS','Lesotho','AF','https://en.wikipedia.org/wiki/Lesotho','\r'),
  ('LT','Lithuania','EU','https://en.wikipedia.org/wiki/Lithuania','\r'),
  ('LU','Luxembourg','EU','https://en.wikipedia.org/wiki/Luxembourg','\r'),
  ('LV','Latvia','EU','https://en.wikipedia.org/wiki/Latvia','\r'),
  ('LY','Libya','AF','https://en.wikipedia.org/wiki/Libya','?????? ?? ?????\r'),
  ('MA','Morocco','AF','https://en.wikipedia.org/wiki/Morocco','?????? ??????\r'),
  ('MC','Monaco','EU','https://en.wikipedia.org/wiki/Monaco','\r'),
  ('MD','Moldova','EU','https://en.wikipedia.org/wiki/Moldova','\r'),
  ('ME','Montenegro','EU','https://en.wikipedia.org/wiki/Montenegro','\r'),
  ('MF','Saint Martin','NA','https://en.wikipedia.org/wiki/Saint_Mart','\r'),
  ('MG','Madagascar','AF','https://en.wikipedia.org/wiki/Madagascar','\r'),
  ('MH','Marshall Islands','OC','https://en.wikipedia.org/wiki/Marshall_I','\r'),
  ('MK','North Macedonia','EU','https://en.wikipedia.org/wiki/Macedonia','\r'),
  ('ML','Mali','AF','https://en.wikipedia.org/wiki/Mali','Aéroports du Mali\r'),
  ('MM','Burma','AS','https://en.wikipedia.org/wiki/Burma','Myanmar\r'),
  ('MN','Mongolia','AS','https://en.wikipedia.org/wiki/Mongolia','\r'),
  ('MO','Macau','AS','https://en.wikipedia.org/wiki/Macau','Macao\r'),
  ('MP','Northern Mariana Islands','OC','https://en.wikipedia.org/wiki/Northern_M','\r'),
  ('MQ','Martinique','NA','https://en.wikipedia.org/wiki/Martinique','\r'),
  ('MR','Mauritania','AF','https://en.wikipedia.org/wiki/Mauritania','?????? ?????????\r'),
  ('MS','Montserrat','NA','https://en.wikipedia.org/wiki/Montserrat','\r'),
  ('MT','Malta','EU','https://en.wikipedia.org/wiki/Malta','\r'),
  ('MU','Mauritius','AF','https://en.wikipedia.org/wiki/Mauritius','\r'),
  ('MV','Maldives','AS','https://en.wikipedia.org/wiki/Maldives','\r'),
  ('MW','Malawi','AF','https://en.wikipedia.org/wiki/Malawi','\r'),
  ('MX','Mexico','NA','https://en.wikipedia.org/wiki/Mexico','Aeropuertos de México\r'),
  ('MY','Malaysia','AS','https://en.wikipedia.org/wiki/Malaysia','Lapangan Terbang Malaysia\r'),
  ('MZ','Mozambique','AF','https://en.wikipedia.org/wiki/Mozambique','\r'),
  ('NA','Namibia','AF','https://en.wikipedia.org/wiki/Namibia','\r'),
  ('NC','New Caledonia','OC','https://en.wikipedia.org/wiki/New_Caledo','\r'),
  ('NE','Niger','AF','https://en.wikipedia.org/wiki/Niger','\r'),
  ('NF','Norfolk Island','OC','https://en.wikipedia.org/wiki/Norfolk_Is','\r'),
  ('NG','Nigeria','AF','https://en.wikipedia.org/wiki/Nigeria','\r'),
  ('NI','Nicaragua','NA','https://en.wikipedia.org/wiki/Nicaragua','Aeropuertos de Nicaragua\r'),
  ('NL','Netherlands','EU','https://en.wikipedia.org/wiki/Netherland','Holland'),
  ('NO','Norway','EU','https://en.wikipedia.org/wiki/Norway','Flyplasser i Norge\r'),
  ('NP','Nepal','AS','https://en.wikipedia.org/wiki/Nepal','????? ???????????\r'),
  ('NR','Nauru','OC','https://en.wikipedia.org/wiki/Nauru','\r'),
  ('NU','Niue','OC','https://en.wikipedia.org/wiki/Niue','\r'),
  ('NZ','New Zealand','OC','https://en.wikipedia.org/wiki/New_Zealan','\r'),
  ('OM','Oman','AS','https://en.wikipedia.org/wiki/Oman','?????? ????\r'),
  ('PA','Panama','NA','https://en.wikipedia.org/wiki/Panama','Aeropuertos de Panamá\r'),
  ('PE','Perú','SA','https://en.wikipedia.org/wiki/Perú','Aeropuertos de Perú\r'),
  ('PF','French Polynesia','OC','https://en.wikipedia.org/wiki/French_Pol','\r'),
  ('PG','Papua New Guinea','OC','https://en.wikipedia.org/wiki/Papua_New_','\r'),
  ('PH','Philippines','AS','https://en.wikipedia.org/wiki/Philippine','Mga alternatibong byahe mula sa Pilipina'),
  ('PK','Pakistan','AS','https://en.wikipedia.org/wiki/Pakistan','??????? ?? ????? ????\r'),
  ('PL','Poland','EU','https://en.wikipedia.org/wiki/Poland','Lotniska Polski\r'),
  ('PM','Saint Pierre and Miquelon','NA','https://en.wikipedia.org/wiki/Saint_Pier','\r'),
  ('PN','Pitcairn','OC','https://en.wikipedia.org/wiki/Pitcairn','\r'),
  ('PR','Puerto Rico','NA','https://en.wikipedia.org/wiki/Puerto_Ric','\r'),
  ('PS','Palestinian Territory','AS','https://en.wikipedia.org/wiki/Palestinia','\r'),
  ('PT','Portugal','EU','https://en.wikipedia.org/wiki/Portugal','Aeroportos do Brasil\r'),
  ('PW','Palau','OC','https://en.wikipedia.org/wiki/Palau','\r'),
  ('PY','Paraguay','SA','https://en.wikipedia.org/wiki/Paraguay','Aeropuertos de Paraguay\r'),
  ('QA','Qatar','AS','https://en.wikipedia.org/wiki/Qatar','?????? ???\r'),
  ('RE','Réunion','AF','https://en.wikipedia.org/wiki/Réunion','Île Bourbon'),
  ('RO','Romania','EU','https://en.wikipedia.org/wiki/Romania','Aeroporturi din România\r'),
  ('RS','Serbia','EU','https://en.wikipedia.org/wiki/Serbia','Serb\r'),
  ('RU','Russia','EU','https://en.wikipedia.org/wiki/Russia','Soviet'),
  ('RW','Rwanda','AF','https://en.wikipedia.org/wiki/Rwanda','\r'),
  ('SA','Saudi Arabia','AS','https://en.wikipedia.org/wiki/Saudi_Arab','?????? ??????? ??????? ????????'),
  ('SB','Solomon Islands','OC','https://en.wikipedia.org/wiki/Solomon_Is','\r'),
  ('SC','Seychelles','AF','https://en.wikipedia.org/wiki/Seychelles','\r'),
  ('SD','Sudan','AF','https://en.wikipedia.org/wiki/Sudan','?????? ???????\r'),
  ('SE','Sweden','EU','https://en.wikipedia.org/wiki/Sweden','Flygplatserna'),
  ('SG','Singapore','AS','https://en.wikipedia.org/wiki/Singapore','\r'),
  ('SH','Saint Helena','AF','https://en.wikipedia.org/wiki/Saint_Hele','\r'),
  ('SI','Slovenia','EU','https://en.wikipedia.org/wiki/Slovenia','\r'),
  ('SK','Slovakia','EU','https://en.wikipedia.org/wiki/Slovakia','letisko Slovenska\r'),
  ('SL','Sierra Leone','AF','https://en.wikipedia.org/wiki/Sierra_Leo','\r'),
  ('SM','San Marino','EU','https://en.wikipedia.org/wiki/San_Marino','\r'),
  ('SN','Senegal','AF','https://en.wikipedia.org/wiki/Senegal','Aéroports du Sénégal\r'),
  ('SO','Somalia','AF','https://en.wikipedia.org/wiki/Somalia','\r'),
  ('SR','Suriname','SA','https://en.wikipedia.org/wiki/Suriname','\r'),
  ('SS','South Sudan','AF','https://en.wikipedia.org/wiki/South_Suda','\r'),
  ('ST','São Tomé and Principe','AF','https://en.wikipedia.org/wiki/São_Tomé_a','\r'),
  ('SV','El Salvador','NA','https://en.wikipedia.org/wiki/El_Salvado','Salvadorian'),
  ('SX','Sint Maarten','NA','https://en.wikipedia.org/wiki/Sint_Maart','\r'),
  ('SY','Syria','AS','https://en.wikipedia.org/wiki/Syria','?????? ?????\r'),
  ('SZ','Eswatini','AF','https://en.wikipedia.org/wiki/Eswatini','Swaziland\r'),
  ('TC','Turks and Caicos Islands','NA','https://en.wikipedia.org/wiki/Turks_and_','\r'),
  ('TD','Chad','AF','https://en.wikipedia.org/wiki/Chad','\r'),
  ('TF','French Southern Territories','AN','https://en.wikipedia.org/wiki/French_Sou','\r'),
  ('TG','Togo','AF','https://en.wikipedia.org/wiki/Togo','\r'),
  ('TH','Thailand','AS','https://en.wikipedia.org/wiki/Thailand','Siam'),
  ('TJ','Tajikistan','AS','https://en.wikipedia.org/wiki/Tajikistan','Tajik\r'),
  ('TK','Tokelau','OC','https://en.wikipedia.org/wiki/Tokelau','\r'),
  ('TL','Timor-Leste','AS','https://en.wikipedia.org/wiki/Timor-Lest','East Timor\r'),
  ('TM','Turkmenistan','AS','https://en.wikipedia.org/wiki/Turkmenist','\r'),
  ('TN','Tunisia','AF','https://en.wikipedia.org/wiki/Tunisia','?????? ????\r'),
  ('TO','Tonga','OC','https://en.wikipedia.org/wiki/Tonga','\r'),
  ('TR','Turkey','AS','https://en.wikipedia.org/wiki/Turkey','Türkiye havaalanlar?\r'),
  ('TT','Trinidad and Tobago','NA','https://en.wikipedia.org/wiki/Trinidad_a','\r'),
  ('TV','Tuvalu','OC','https://en.wikipedia.org/wiki/Tuvalu','\r'),
  ('TW','Taiwan','AS','https://en.wikipedia.org/wiki/Taiwan','\r'),
  ('TZ','Tanzania','AF','https://en.wikipedia.org/wiki/Tanzania','\r'),
  ('UA','Ukraine','EU','https://en.wikipedia.org/wiki/Ukraine','????????? ???????\r'),
  ('UG','Uganda','AF','https://en.wikipedia.org/wiki/Uganda','\r'),
  ('UM','United States Minor Outlying Islands','OC','https://en.wikipedia.org/wiki/United_Sta','\r'),
  ('US','United States','NA','https://en.wikipedia.org/wiki/United_Sta','America\r'),
  ('UY','Uruguay','SA','https://en.wikipedia.org/wiki/Uruguay','Aeropuertos de Uruguay\r'),
  ('UZ','Uzbekistan','AS','https://en.wikipedia.org/wiki/Uzbekistan','Uzbek\r'),
  ('VA','Vatican City','EU','https://en.wikipedia.org/wiki/Vatican_Ci','The Holy See\r'),
  ('VC','Saint Vincent and the Grenadines','NA','https://en.wikipedia.org/wiki/Saint_Vinc','\r'),
  ('VE','Venezuela','SA','https://en.wikipedia.org/wiki/Venezuela','Aeropuertos de Venezuela\r'),
  ('VG','British Virgin Islands','NA','https://en.wikipedia.org/wiki/British_Vi','\r'),
  ('VI','U.S. Virgin Islands','NA','https://en.wikipedia.org/wiki/U.S._Virgi','\r'),
  ('VN','Vietnam','AS','https://en.wikipedia.org/wiki/Vietnam','Các sân bay c?a Vi?t Nam\r'),
  ('VU','Vanuatu','OC','https://en.wikipedia.org/wiki/Vanuatu','\r'),
  ('WF','Wallis and Futuna','OC','https://en.wikipedia.org/wiki/Wallis_and','\r'),
  ('WS','Samoa','OC','https://en.wikipedia.org/wiki/Samoa','\r'),
  ('XK','Kosovo','EU','https://en.wikipedia.org/wiki/Kosovo','Kosova\r'),
  ('YE','Yemen','AS','https://en.wikipedia.org/wiki/Yemen','?????? ?????\r'),
  ('YT','Mayotte','AF','https://en.wikipedia.org/wiki/Mayotte','\r'),
  ('ZA','South Africa','AF','https://en.wikipedia.org/wiki/South_Afri','\r'),
  ('ZM','Zambia','AF','https://en.wikipedia.org/wiki/Zambia','\r'),
  ('ZW','Zimbabwe','AF','https://en.wikipedia.org/wiki/Zimbabwe','\r'),
  ('ZZ','Unknown or unassigned country','AF','https://en.wikipedia.org/wiki/Unknown_or','\r')
;
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `minigame` WRITE;
/*!40000 ALTER TABLE `minigame` DISABLE KEYS */;
INSERT INTO `minigame` (question,answer1,answer2,answer3,answer4,correct_answer) VALUES
  ('Which parent did Elon Musk live with after his parents divorced?', 'Father', 'Mother', 'Sister', 'Grandfather', 'Father')
;
/*!40000 ALTER TABLE `minigame` ENABLE KEYS */;
UNLOCK TABLES;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;