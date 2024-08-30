-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: proyecto_laboratorio
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `analisis`
--

DROP TABLE IF EXISTS `analisis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analisis` (
  `id_analisis` int NOT NULL AUTO_INCREMENT,
  `tipo_analisis` varchar(100) DEFAULT NULL,
  `precio` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`id_analisis`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analisis`
--

LOCK TABLES `analisis` WRITE;
/*!40000 ALTER TABLE `analisis` DISABLE KEYS */;
INSERT INTO `analisis` VALUES (1,'Hemograma',2550.00),(2,'Glucemia',1275.00),(3,'Urea',1275.00),(4,'Eritrosedimentación',850.00),(5,'Orina completa',2550.00),(6,'Calcemia total',1275.00),(7,'Triglicéridos',2125.00),(8,'Colesterol total',1275.00),(9,'Colesterol HDL',2550.00),(10,'Colesterol LDL',3400.00),(11,'Prolactina',8500.00),(12,'Insulina',9350.00),(13,'Bilirrubina',1275.00),(14,'Fosfasata alcalina',1275.00),(15,'Tirotrofina - TSH',7650.00),(16,'Tiroxina total - T4',7650.00),(17,'Tiroxina efectiva - Libre',7650.00),(18,'Ionograma',2975.00),(19,'Magnesio urinario',2125.00),(20,'Proteína C reactiva - PCR',4250.00);
/*!40000 ALTER TABLE `analisis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `archivo_pacientes_anteriores`
--

DROP TABLE IF EXISTS `archivo_pacientes_anteriores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `archivo_pacientes_anteriores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_paciente_eliminado` int NOT NULL,
  `nombre_paciente` varchar(100) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `fecha_eliminacion` datetime DEFAULT (now()),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archivo_pacientes_anteriores`
--

LOCK TABLES `archivo_pacientes_anteriores` WRITE;
/*!40000 ALTER TABLE `archivo_pacientes_anteriores` DISABLE KEYS */;
/*!40000 ALTER TABLE `archivo_pacientes_anteriores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `id_factura` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int NOT NULL,
  `id_analisis` int NOT NULL,
  `id_insumo` int DEFAULT NULL,
  `id_obra_social` int DEFAULT NULL,
  `precio_total` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`id_factura`),
  KEY `FK_Factura_Pedido` (`id_pedido`),
  KEY `FK_Factura_Analisis` (`id_analisis`),
  KEY `FK_Factura_Insumo` (`id_insumo`),
  KEY `FK_Factura_ObraSocial` (`id_obra_social`),
  CONSTRAINT `FK_Factura_Analisis` FOREIGN KEY (`id_analisis`) REFERENCES `analisis` (`id_analisis`),
  CONSTRAINT `FK_Factura_Insumo` FOREIGN KEY (`id_insumo`) REFERENCES `insumos` (`id_insumo`),
  CONSTRAINT `FK_Factura_ObraSocial` FOREIGN KEY (`id_obra_social`) REFERENCES `obra_social` (`id_obra_social`),
  CONSTRAINT `FK_Factura_Pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos_analisis` (`id_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES (1,19,6,8,NULL,NULL),(2,36,9,24,9,NULL),(3,6,11,22,5,NULL),(4,24,20,7,7,NULL),(5,32,17,4,NULL,NULL),(6,18,17,16,8,NULL),(7,29,10,8,NULL,NULL),(8,7,3,5,NULL,NULL),(9,2,5,12,10,NULL),(10,31,2,24,NULL,NULL),(11,44,4,19,8,NULL),(12,48,12,17,NULL,NULL),(13,41,10,22,5,NULL),(14,11,6,14,4,NULL),(15,47,19,18,NULL,NULL),(16,39,14,12,NULL,NULL),(17,14,7,6,NULL,NULL),(18,49,16,23,NULL,NULL),(19,2,9,15,NULL,NULL),(20,40,16,18,NULL,NULL),(21,42,9,1,NULL,NULL),(22,9,8,1,4,NULL),(23,5,12,13,NULL,NULL),(24,33,4,8,NULL,NULL),(25,35,20,23,NULL,NULL),(26,39,6,13,10,NULL),(27,19,8,12,1,NULL),(28,48,19,8,9,NULL),(29,29,13,18,9,NULL),(30,41,4,4,NULL,NULL),(31,21,3,16,NULL,NULL),(32,10,10,4,9,NULL),(33,29,18,2,3,NULL),(34,13,2,22,NULL,NULL),(35,48,11,1,NULL,NULL),(36,12,15,8,NULL,NULL),(37,2,8,15,8,NULL),(38,18,11,5,NULL,NULL),(39,22,15,8,2,NULL),(40,41,3,6,NULL,NULL),(41,26,5,11,1,NULL),(42,42,2,17,NULL,NULL),(43,40,8,16,NULL,NULL),(44,31,13,10,6,NULL),(45,19,11,13,7,NULL),(46,25,19,8,6,NULL),(47,1,18,22,5,NULL),(48,44,14,9,6,NULL),(49,47,14,12,NULL,NULL),(50,15,6,23,9,NULL);
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insumos`
--

DROP TABLE IF EXISTS `insumos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insumos` (
  `id_insumo` int NOT NULL AUTO_INCREMENT,
  `tipo_insumo` varchar(100) DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL,
  `precio` decimal(8,2) DEFAULT NULL,
  `id_proveedor` int NOT NULL,
  PRIMARY KEY (`id_insumo`),
  KEY `FK_Insumo_Proveedor` (`id_proveedor`),
  CONSTRAINT `FK_Insumo_Proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insumos`
--

LOCK TABLES `insumos` WRITE;
/*!40000 ALTER TABLE `insumos` DISABLE KEYS */;
INSERT INTO `insumos` VALUES (1,'Jeringa descartable','2024-11-27',1070.00,10),(2,'Aguja hipodérmica','2025-02-16',450.00,10),(3,'Tira reactiva de orina','2025-03-24',325.50,4),(4,'Frasco estéril para análisis','2025-02-05',2720.00,1),(5,'Reactivo Hemograma','2025-05-04',950.00,1),(6,'Reactivo Glucemia','2024-12-19',750.00,8),(7,'Reactivo Urea','2024-11-26',750.00,2),(8,'Reactivo Eritrosedimentación','2025-04-16',825.00,5),(9,'Reactivo Orina completa','2025-03-31',950.00,6),(10,'Reactivo Calcemia total','2025-02-25',750.00,7),(11,'Reactivo Triglicéridos','2025-02-27',900.00,3),(12,'Reactivo Colesterol total','2024-11-14',750.00,6),(13,'Reactivo Colesterol HDL','2025-05-12',950.00,1),(14,'Reactivo Colesterol LDL','2025-02-23',1550.00,3),(15,'Reactivo Prolactina','2025-03-17',2500.00,8),(16,'Reactivo Insulina','2025-03-03',3000.00,8),(17,'Reactivo Bilirrubina','2024-12-26',750.00,1),(18,'Reactivo Fosfasata alcalina','2024-11-24',750.00,1),(19,'Reactivo Tirotrofina - TSH','2025-02-22',2000.00,8),(20,'Reactivo Tiroxina total - T4','2025-01-09',2000.00,6),(21,'Reactivo Tiroxina efectiva - Libre','2025-01-07',2000.00,9),(22,'Reactivo Ionograma','2025-03-13',950.00,5),(23,'Reactivo Magnesio urinario','2025-03-04',900.00,4),(24,'Reactivo Proteína C reactiva - PCR','2025-03-14',1750.75,9);
/*!40000 ALTER TABLE `insumos` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_logger_actualizacion_insumos` AFTER UPDATE ON `insumos` FOR EACH ROW BEGIN
	INSERT INTO Proyecto_Laboratorio.logs_precio_insumos
	(id_tabla_insumos,tipo_insumo,precio_actualizado,precio_anterior,usuario_updater,fecha_modificacion)
    VALUES
    (
		OLD.id_insumo,
        OLD.tipo_insumo,
        NEW.precio,
        OLD.precio,
        SESSION_USER(),
        NOW()
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `logs_precio_insumos`
--

DROP TABLE IF EXISTS `logs_precio_insumos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs_precio_insumos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_tabla_insumos` int NOT NULL,
  `tipo_insumo` varchar(100) DEFAULT NULL,
  `precio_actualizado` decimal(8,2) DEFAULT NULL,
  `precio_anterior` decimal(8,2) DEFAULT NULL,
  `usuario_updater` varchar(100) DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs_precio_insumos`
--

LOCK TABLES `logs_precio_insumos` WRITE;
/*!40000 ALTER TABLE `logs_precio_insumos` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs_precio_insumos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obra_social`
--

DROP TABLE IF EXISTS `obra_social`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `obra_social` (
  `id_obra_social` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `cobertura` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id_obra_social`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obra_social`
--

LOCK TABLES `obra_social` WRITE;
/*!40000 ALTER TABLE `obra_social` DISABLE KEYS */;
INSERT INTO `obra_social` VALUES (1,'MedGuard Plus','50%'),(2,'HealthShield Advantage','40%'),(3,'WellnessWise Premier','30%'),(4,'CareConnect Pro','50%'),(5,'Vitality Vault Elite','60%'),(6,'MedMax Protector','75%'),(7,'ProHealth Partners','50%'),(8,'SecureCare Solutions','40%'),(9,'HealthHaven Select','30%'),(10,'CareCraft Comprehensive','25%');
/*!40000 ALTER TABLE `obra_social` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacientes`
--

DROP TABLE IF EXISTS `pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pacientes` (
  `id_paciente` int NOT NULL AUTO_INCREMENT,
  `nombre_completo` varchar(100) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `sexo` varchar(9) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `e_mail` varchar(100) DEFAULT NULL,
  `id_obra_social` int DEFAULT NULL,
  PRIMARY KEY (`id_paciente`),
  UNIQUE KEY `e_mail` (`e_mail`),
  KEY `FK_Paciente_ObraSocial` (`id_obra_social`),
  CONSTRAINT `FK_Paciente_ObraSocial` FOREIGN KEY (`id_obra_social`) REFERENCES `obra_social` (`id_obra_social`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacientes`
--

LOCK TABLES `pacientes` WRITE;
/*!40000 ALTER TABLE `pacientes` DISABLE KEYS */;
INSERT INTO `pacientes` VALUES (1,'Adelaida Reburn','1949-10-21','M','4107030720','areburn0@hhs.gov',5),(2,'Sigismundo George','2002-09-09','M','4203568913','sgeorge1@washingtonpost.com',NULL),(3,'Ogdan Morsey','1982-12-12','F','8323130942','omorsey2@bloomberg.com',10),(4,'Claudio Ladel','2000-07-27','F','4586459050','cladel3@cbslocal.com',7),(5,'Benny Blind','1955-06-13','M','5643889290','bblind4@microsoft.com',1),(6,'Kevin Ceillier','1965-03-24','F','8574453532','kceillier5@fotki.com',3),(7,'Germaine Walas','1946-06-14','M','2714566357','gwalas6@cmu.edu',4),(8,'Jen Gallone','1948-10-06','F','1426925517','jgallone7@nymag.com',NULL),(9,'Gerta Philot','1945-08-21','M','5911561889','gphilot8@howstuffworks.com',NULL),(10,'Sherilyn Kochs','1961-06-02','F','6417424204',NULL,6),(11,'Gayle Sprionghall','1997-06-19','M','8127178056','gsprionghalla@miibeian.gov.cn',NULL),(12,'Winny Euels','1960-04-15','F','7261625972','weuelsb@ezinearticles.com',NULL),(13,'Byron Moens','1985-05-19','F','7195867477',NULL,6),(14,'Benedicta Beau','1947-12-10','F','5136795703','bbeaud@flickr.com',3),(15,'Federica Wabe','1955-08-03','F','5316292358','fwabee@chronoengine.com',NULL),(16,'Genny Loachhead','1969-03-27','M','7976169029',NULL,NULL),(17,'Dynah Reignolds','1984-03-18','F','4205999464','dreignoldsg@irs.gov',2),(18,'Tudor McGerraghty','1984-02-12','F','8782766644','tmcgerraghtyh@netlog.com',NULL),(19,'Beret Sambrok','2002-12-20','F','4054720256','bsambroki@list-manage.com',10),(20,'Brandon Boyes','1973-05-31','F','9337776015','bboyesj@who.int',NULL),(21,'Ricca Croall','1959-03-13','M','5149752437','rcroallk@illinois.edu',6),(22,'La verne Dyball','1963-09-23','F','5364492253','lvernel@engadget.com',NULL),(23,'Darya Ridulfo','1978-07-07','M','9636160456','dridulfom@nytimes.com',2),(24,'Micheline Habens','1971-06-06','F','1588800300','mhabensn@theglobeandmail.com',NULL),(25,'Benji Gayton','1953-12-07','F','5268172312','bgaytono@t.co',10),(26,'Vail Zeplin','1964-03-03','M','7656095619','vzeplinp@paypal.com',10),(27,'Aurore Dumbare','1990-07-20','M','6245433019',NULL,7),(28,'Kelley Cowin','2002-11-28','M','1019290697','kcowinr@bloglovin.com',2),(29,'Prisca Tregale','1957-09-06','F','7654137163','ptregales@statcounter.com',6),(30,'Consuelo Snufflebottom','1974-12-27','M','9435826061','csnufflebottomt@moonfruit.com',9),(31,'Loraine Bollon','1971-08-13','M','5859760766','lbollonu@hao123.com',NULL),(32,'Abdel Horsewood','1982-02-09','M','3262897389',NULL,4),(33,'Marlowe Cowtherd','2001-01-28','F','3644154402','mcowtherdw@virginia.edu',NULL),(34,'Natalina Scarman','1960-11-27','F','4476182150','nscarmanx@trellian.com',4),(35,'Fara Huttley','1945-04-22','F','7045152526','fhuttleyy@wikispaces.com',6),(36,'Kory Kitcat','1982-07-04','M','1577826904','kkitcatz@linkedin.com',NULL),(37,'Winn Gatty','2000-08-12','M','9122027512','wgatty10@foxnews.com',6),(38,'Marchelle Grandham','1971-08-22','F','8271992260',NULL,5),(39,'Fayette Du Fray','1971-06-08','F','4899249980','fdu12@skype.com',NULL),(40,'Jerrilee Fedorski','1964-08-16','M','4413220193','jfedorski13@psu.edu',2),(41,'Addi Gallyon','1960-01-07','F','5496072157','agallyon14@diigo.com',3),(42,'Xaviera Laterza','1995-11-18','F','9692830445','xlaterza15@who.int',NULL),(43,'Krystle Dearman','1993-05-08','F','8375140467','kdearman16@cnn.com',NULL),(44,'Waverly Dagworthy','1972-12-25','F','1581887005','wdagworthy17@mac.com',NULL),(45,'Rafa Readwood','1994-11-12','F','3998370390','rreadwood18@paypal.com',NULL),(46,'Zulema Egar','2003-01-06','F','5478295427','zegar19@google.cn',NULL),(47,'Jade Grime','1971-04-12','M','9633846862',NULL,NULL),(48,'Sutherlan Trimby','1989-09-10','M','8419935648','strimby1b@last.fm',6),(49,'Stu Lambillion','1946-02-26','M','5093888557','slambillion1c@geocities.com',NULL),(50,'Vitoria Blumfield','1987-11-19','F','7683877455','vblumfield1d@tinypic.com',8),(51,'Abby Leyre','1985-11-11','F','4301474761','aleyre1e@cafepress.com',NULL),(52,'Rivy Shinner','2001-06-19','M','5386482540','rshinner1f@reference.com',NULL),(53,'Avie Kynston','1994-09-30','F','9356631104','akynston1g@privacy.gov.au',NULL),(54,'Onfroi Dossit','1975-06-12','M','6197154120','odossit1h@unicef.org',9),(55,'Yevette Aberkirdo','1963-10-05','F','1671313806','yaberkirdo1i@vimeo.com',7),(56,'Marjorie Zaniolini','1970-12-28','F','2619550573','mzaniolini1j@furl.net',NULL),(57,'Rodrique Roja','1998-10-28','M','5361885933',NULL,10),(58,'Mathew Worg','1967-08-18','M','7514893297','mworg1l@networkadvertising.org',NULL),(59,'Shellysheldon Stickles','2003-12-05','M','7867765830','sstickles1m@csmonitor.com',10),(60,'Gerick Kosel','1966-08-15','M','1623304903',NULL,NULL),(61,'Dianne Jovis','1959-07-20','F','8859455654','djovis1o@surveymonkey.com',NULL),(62,'Kenna Frost','1987-03-20','F','8446557909','kfrost1p@vinaora.com',6),(63,'Nikkie Purkiss','1972-09-02','F','5097268261','npurkiss1q@youtu.be',3),(64,'Clarance Klemt','1965-10-18','F','3619306807','cklemt1r@unc.edu',NULL),(65,'Greggory Skeldon','1970-08-16','F','5212572969','gskeldon1s@icio.us',NULL),(66,'Jacinthe Jessope','2004-02-27','M','9705207841',NULL,NULL),(67,'Marrissa Coghlan','1990-08-28','F','7038946828','mcoghlan1u@over-blog.com',5),(68,'Edyth Engley','1964-08-12','F','7366763860','eengley1v@google.de',10),(69,'Lauri Hackley','1945-11-20','F','4031417640',NULL,10),(70,'Bat Kingswood','1986-07-08','F','7588033159','bkingswood1x@forbes.com',10),(71,'Pippa McKenny','1991-07-17','F','6028742138',NULL,4),(72,'Shannah Stienton','1952-07-26','M','5444573597',NULL,NULL),(73,'Vera Salkeld','2002-11-15','M','2027637770','vsalkeld20@oaic.gov.au',NULL),(74,'Shari Bruckner','1987-02-02','M','4572027157','sbruckner21@noaa.gov',NULL),(75,'Tine Baldin','1945-04-30','M','4683689498','tbaldin22@flavors.me',6),(76,'Marji Dossantos','1967-09-15','F','2707273096','mdossantos23@1und1.de',7),(77,'Jacki Dumphy','1980-08-26','M','2983517890','jdumphy24@ucoz.ru',NULL),(78,'Angelo Attkins','1977-05-04','F','2722229638','aattkins25@accuweather.com',NULL),(79,'Bernardina Blesli','1960-03-08','M','7232196369','bblesli26@twitter.com',NULL),(80,'Eamon Decruse','1959-03-04','M','1256929949','edecruse27@scientificamerican.com',10),(81,'Tedd Wield','1990-03-30','F','2473021920','twield28@networksolutions.com',NULL),(82,'Gillan Androlli','1971-02-13','F','2937508467','gandrolli29@fema.gov',9),(83,'Brietta Gladdifh','1963-04-07','M','7449272541','bgladdifh2a@cam.ac.uk',NULL),(84,'Rici Dow','1951-05-25','M','4709235429','rdow2b@storify.com',2),(85,'Em Klimkin','1995-07-07','F','9742057273',NULL,1),(86,'Magdalena Harker','1979-03-11','F','4866077365','mharker2d@princeton.edu',NULL),(87,'Theda Mycroft','1999-12-14','M','7874256249','tmycroft2e@php.net',2),(88,'Darla Benedikt','1966-10-08','F','9287505514','dbenedikt2f@jimdo.com',7),(89,'Ebba Dany','1994-03-11','F','5463745886','edany2g@nyu.edu',5),(90,'Bobette Domenichelli','1971-12-27','M','4092143899','bdomenichelli2h@howstuffworks.com',4),(91,'Arvin Diggons','1995-09-17','F','2761028474','adiggons2i@senate.gov',8),(92,'Gretchen Hasker','1957-02-07','F','3824245378','ghasker2j@geocities.jp',NULL),(93,'Martguerita Leidl','2000-08-16','F','1334161193','mleidl2k@wikimedia.org',10),(94,'Vicky Spearman','1974-06-06','M','5936684303','vspearman2l@dot.gov',8),(95,'Faunie Hansed','1960-07-30','M','4681047735','fhansed2m@sina.com.cn',6),(96,'Devonna Colleck','1952-09-18','F','5235719913','dcolleck2n@tripadvisor.com',NULL),(97,'Kerk Pocklington','1952-04-27','F','5918477709','kpocklington2o@netscape.com',1),(98,'Dania Loveless','1957-10-07','M','7344111981','dloveless2p@newyorker.com',NULL),(99,'Mervin Stanyland','1954-02-24','F','8786413048','mstanyland2q@ca.gov',7),(100,'Aleece Blackler','2002-03-17','M','5148494614','ablackler2r@spotify.com',NULL);
/*!40000 ALTER TABLE `pacientes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_checker_insert_paciente_contacto` BEFORE INSERT ON `pacientes` FOR EACH ROW BEGIN
IF NEW.telefono IS NULL AND
NEW.e_mail IS NULL THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Es necesario algún medio de contacto';
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_checker_paciente_contacto` AFTER UPDATE ON `pacientes` FOR EACH ROW BEGIN
IF NEW.telefono IS NULL AND
NEW.e_mail IS NULL THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = 'Solicitar medio de contacto';
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pedidos_analisis`
--

DROP TABLE IF EXISTS `pedidos_analisis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_analisis` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `fecha` datetime DEFAULT NULL,
  `id_paciente` int NOT NULL,
  `id_analisis` int NOT NULL,
  `id_bioquimico` int NOT NULL,
  `id_enfermero` int DEFAULT NULL,
  `insumo_necesario` int DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `FK_Pedido_Paciente` (`id_paciente`),
  KEY `FK_Pedido_IdAnalisis` (`id_analisis`),
  KEY `FK_Pedido_Bioquimico` (`id_bioquimico`),
  KEY `FK_Pedido_Enfermero` (`id_enfermero`),
  KEY `FK_Pedido_Insumo` (`insumo_necesario`),
  CONSTRAINT `FK_Pedido_Bioquimico` FOREIGN KEY (`id_bioquimico`) REFERENCES `staff_bioquimica` (`id_bioquimico`),
  CONSTRAINT `FK_Pedido_Enfermero` FOREIGN KEY (`id_enfermero`) REFERENCES `staff_enfermeria` (`id_enfermero`),
  CONSTRAINT `FK_Pedido_IdAnalisis` FOREIGN KEY (`id_analisis`) REFERENCES `analisis` (`id_analisis`),
  CONSTRAINT `FK_Pedido_Insumo` FOREIGN KEY (`insumo_necesario`) REFERENCES `insumos` (`id_insumo`),
  CONSTRAINT `FK_Pedido_Paciente` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos_analisis`
--

LOCK TABLES `pedidos_analisis` WRITE;
/*!40000 ALTER TABLE `pedidos_analisis` DISABLE KEYS */;
INSERT INTO `pedidos_analisis` VALUES (1,'2024-04-04 11:10:22',22,16,9,3,23),(2,'2024-03-02 20:01:55',42,14,14,4,17),(3,'2024-03-04 05:05:30',54,19,4,3,8),(4,'2024-04-15 18:13:58',68,5,14,4,22),(5,'2024-02-10 20:50:56',29,18,4,15,10),(6,'2024-03-12 21:15:12',82,14,5,3,17),(7,'2024-02-25 09:35:02',61,7,4,14,24),(8,'2024-03-07 14:18:52',58,4,14,12,6),(9,'2024-04-11 20:23:43',68,5,5,15,21),(10,'2024-02-11 01:33:48',91,18,9,4,3),(11,'2024-04-14 12:44:15',71,9,11,9,24),(12,'2024-06-16 23:24:43',45,11,7,2,4),(13,'2024-01-15 04:43:03',74,17,15,5,23),(14,'2024-07-18 12:31:20',43,15,5,13,13),(15,'2024-06-19 16:36:59',40,7,5,7,17),(16,'2024-01-21 22:15:22',32,20,1,3,14),(17,'2024-05-01 19:51:44',95,1,8,5,10),(18,'2024-04-07 21:22:18',37,5,6,1,21),(19,'2024-03-19 10:11:01',33,17,3,3,17),(20,'2024-02-21 18:38:34',74,1,4,9,9),(21,'2024-05-31 14:16:47',95,7,10,13,12),(22,'2024-02-25 17:58:25',58,15,2,12,14),(23,'2024-04-02 17:42:31',23,6,6,13,6),(24,'2024-05-07 10:15:35',53,7,14,1,18),(25,'2024-03-16 04:26:15',62,6,3,6,2),(26,'2024-03-04 18:22:22',14,6,10,12,4),(27,'2024-03-25 02:21:52',52,14,1,15,18),(28,'2024-07-24 21:04:17',34,1,7,9,13),(29,'2024-01-04 00:21:50',22,15,13,4,24),(30,'2024-01-22 04:36:32',14,18,1,6,16),(31,'2024-07-28 16:28:34',45,4,6,2,21),(32,'2024-05-12 07:30:55',42,13,6,13,17),(33,'2024-04-28 22:39:59',87,17,11,5,6),(34,'2024-06-05 21:41:14',86,1,13,8,16),(35,'2024-07-26 01:29:44',19,8,7,1,24),(36,'2024-06-03 15:34:26',53,1,2,15,15),(37,'2024-02-27 06:11:31',93,9,10,4,4),(38,'2024-06-24 22:50:19',14,14,5,2,2),(39,'2024-05-17 07:29:17',41,5,15,5,4),(40,'2024-02-01 04:18:32',5,14,15,11,20),(41,'2024-02-19 16:25:50',15,3,4,3,22),(42,'2024-04-28 00:45:55',67,2,10,12,16),(43,'2024-06-17 15:17:53',73,18,15,14,5),(44,'2024-04-18 04:29:00',79,13,6,13,12),(45,'2024-03-07 07:38:43',48,2,12,6,5),(46,'2024-02-04 19:15:32',72,14,8,3,20),(47,'2024-07-02 20:43:27',11,6,10,6,21),(48,'2024-01-02 07:08:17',87,20,2,8,18),(49,'2024-07-07 17:29:59',73,5,8,8,3),(50,'2024-06-25 20:03:01',39,6,14,8,18);
/*!40000 ALTER TABLE `pedidos_analisis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `nombre_proveedor` varchar(100) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Best Choice','4307 Pearson Way','2531138921'),(2,'Aquapick Co., Ltd','01 Becker Alley','5701643836'),(3,'Procter & Gamble Manufacturing Company','7 Clove Point','7915452125'),(4,'Mylan Pharmaceuticals Inc.','3897 Arkansas Street','3299321709'),(5,'CSL Behring LLC','96728 Pine View Trail','8372312825'),(6,'Fenwal, Inc.','41 Monica Drive','3439365567'),(7,'RedPharm Drug Inc.','8624 Farwell Alley','9633304448'),(8,'Rite Aid Corporation','0 Evergreen Parkway','8318804675'),(9,'Jubilant HollisterStier LLC','583 Myrtle Parkway','6375790153'),(10,'Ranbaxy Pharmaceuticals Inc.','318 Elka Hill','9222599612');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_bioquimica`
--

DROP TABLE IF EXISTS `staff_bioquimica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_bioquimica` (
  `id_bioquimico` int NOT NULL AUTO_INCREMENT,
  `nombre_bioquimico` varchar(60) DEFAULT NULL,
  `matricula` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id_bioquimico`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_bioquimica`
--

LOCK TABLES `staff_bioquimica` WRITE;
/*!40000 ALTER TABLE `staff_bioquimica` DISABLE KEYS */;
INSERT INTO `staff_bioquimica` VALUES (1,'Eda Sawell','58118-477'),(2,'Bevan Carling','1283-810'),(3,'Lucille Pistol','2363-917'),(4,'Hillie Killock','4964-383'),(5,'Dinny Gowlett','1674-662'),(6,'Alexa Shefton','2338-719'),(7,'Shari Tearney','5515-167'),(8,'Emile Oxford','3680-759'),(9,'Niles Burges','3698-307'),(10,'Lynette Shrigley','3698-394'),(11,'Sibella Grennan','3698-326'),(12,'Barnabe Zywicki','4250-558'),(13,'Deidre Whitsun','6138-310'),(14,'Meggie Izachik','4152-196'),(15,'Zenia Crozier','1081-168');
/*!40000 ALTER TABLE `staff_bioquimica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_enfermeria`
--

DROP TABLE IF EXISTS `staff_enfermeria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_enfermeria` (
  `id_enfermero` int NOT NULL AUTO_INCREMENT,
  `nombre_enfermero` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id_enfermero`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_enfermeria`
--

LOCK TABLES `staff_enfermeria` WRITE;
/*!40000 ALTER TABLE `staff_enfermeria` DISABLE KEYS */;
INSERT INTO `staff_enfermeria` VALUES (1,'Schuyler Dimitrov'),(2,'Flynn Harrington'),(3,'Anderson Collinwood'),(4,'Don Fallen'),(5,'Karoline O\'Donnell'),(6,'Savina Shorter'),(7,'Layton Ivell'),(8,'Armin Vallis'),(9,'Jaquelyn Whitlow'),(10,'Berrie Milazzo'),(11,'Cristian Lamartine'),(12,'Benedicto Shimon'),(13,'Chaunce Dumingos'),(14,'Jocelyn Glasscoo'),(15,'Alidia Sowersby');
/*!40000 ALTER TABLE `staff_enfermeria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_pacientes__por_obra_social`
--

DROP TABLE IF EXISTS `view_pacientes__por_obra_social`;
/*!50001 DROP VIEW IF EXISTS `view_pacientes__por_obra_social`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_pacientes__por_obra_social` AS SELECT 
 1 AS `Obra_Social`,
 1 AS `Id_Paciente`,
 1 AS `Nombre_Paciente`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_pacientes_obra_mayor_cobertura`
--

DROP TABLE IF EXISTS `view_pacientes_obra_mayor_cobertura`;
/*!50001 DROP VIEW IF EXISTS `view_pacientes_obra_mayor_cobertura`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_pacientes_obra_mayor_cobertura` AS SELECT 
 1 AS `Id_Paciente`,
 1 AS `Nombre`,
 1 AS `Telefono`,
 1 AS `Correo_Electronico`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_pedidos_mayo_julio`
--

DROP TABLE IF EXISTS `view_pedidos_mayo_julio`;
/*!50001 DROP VIEW IF EXISTS `view_pedidos_mayo_julio`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_pedidos_mayo_julio` AS SELECT 
 1 AS `Id_Pedido`,
 1 AS `Fecha`,
 1 AS `Id_Paciente`,
 1 AS `Nombre_Paciente`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'proyecto_laboratorio'
--

--
-- Dumping routines for database 'proyecto_laboratorio'
--
/*!50003 DROP FUNCTION IF EXISTS `edad_paciente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `edad_paciente`(id_paciente INT) RETURNS int
    READS SQL DATA
BEGIN
    DECLARE fecha_nacimiento DATE;
	DECLARE edad_paciente INT;
    
	SELECT Pacientes.fecha_nacimiento INTO fecha_nacimiento
    FROM Proyecto_Laboratorio.Pacientes
    WHERE Pacientes.id_paciente = id_paciente;
    
    SET edad_paciente = TIMESTAMPDIFF(YEAR,fecha_nacimiento,CURDATE());
    RETURN edad_paciente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `pedidos_bioquimico` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `pedidos_bioquimico`(bioquimico VARCHAR (60)) RETURNS varchar(200) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	DECLARE lista_pedidos VARCHAR (200);
    SELECT GROUP_CONCAT(p_a.id_pedido SEPARATOR ', ')
    INTO lista_pedidos
    FROM Staff_Bioquimica s_b
    JOIN Pedidos_Analisis p_a ON s_b.id_bioquimico = p_a.id_bioquimico
    WHERE s_b.nombre_bioquimico = bioquimico;
    RETURN lista_pedidos;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_actualizacion_cobertura` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizacion_cobertura`(IN id_obra_social INT,
IN cobertura_actualizada VARCHAR (4))
BEGIN
	UPDATE Proyecto_Laboratorio.Obra_Social
    SET cobertura = cobertura_actualizada
    WHERE id_obra_social = Obra_Social.id_obra_social;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_eliminacion_archivo_paciente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminacion_archivo_paciente`(IN id_paciente INT)
BEGIN
	DECLARE v_nombre_paciente VARCHAR (100);
    DECLARE v_fecha_nacimiento DATE;
    
	SELECT
		nombre_completo,
		fecha_nacimiento
	INTO v_nombre_paciente, v_fecha_nacimiento
    FROM Proyecto_Laboratorio.Pacientes
    WHERE id_paciente = Pacientes.id_paciente;
    
    INSERT INTO Proyecto_Laboratorio.Archivo_Pacientes_Anteriores
    (id_paciente_eliminado,
    nombre_paciente,
    fecha_nacimiento,
    fecha_eliminacion)
    VALUES
    (id_paciente,
    v_nombre_paciente,
    v_fecha_nacimiento,
    CURRENT_TIMESTAMP());

	DELETE FROM Proyecto_Laboratorio.Pedidos_Analisis
    WHERE id_paciente = Pedidos_Analisis.id_paciente;
    
    DELETE FROM Proyecto_Laboratorio.Pacientes
    WHERE id_paciente = Pacientes.id_paciente;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `view_pacientes__por_obra_social`
--

/*!50001 DROP VIEW IF EXISTS `view_pacientes__por_obra_social`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_pacientes__por_obra_social` (`Obra_Social`,`Id_Paciente`,`Nombre_Paciente`) AS select `o`.`nombre` AS `obra_social`,`p`.`id_paciente` AS `id_paciente`,`p`.`nombre_completo` AS `nombre_paciente` from (`obra_social` `o` left join `pacientes` `p` on((`o`.`id_obra_social` = `p`.`id_obra_social`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_pacientes_obra_mayor_cobertura`
--

/*!50001 DROP VIEW IF EXISTS `view_pacientes_obra_mayor_cobertura`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_pacientes_obra_mayor_cobertura` (`Id_Paciente`,`Nombre`,`Telefono`,`Correo_Electronico`) AS select `pacientes`.`id_paciente` AS `id_paciente`,`pacientes`.`nombre_completo` AS `nombre_completo`,`pacientes`.`telefono` AS `telefono`,`pacientes`.`e_mail` AS `e_mail` from `pacientes` where (`pacientes`.`id_obra_social` = 6) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_pedidos_mayo_julio`
--

/*!50001 DROP VIEW IF EXISTS `view_pedidos_mayo_julio`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_pedidos_mayo_julio` (`Id_Pedido`,`Fecha`,`Id_Paciente`,`Nombre_Paciente`) AS select `p_a`.`id_pedido` AS `id_pedido`,`p_a`.`fecha` AS `fecha`,`p_a`.`id_paciente` AS `id_paciente`,`p`.`nombre_completo` AS `nombre_completo` from (`pedidos_analisis` `p_a` left join `pacientes` `p` on((`p_a`.`id_paciente` = `p`.`id_paciente`))) where (`p_a`.`fecha` between '2024-05-01' and '2024-07-31') order by `p_a`.`fecha` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-30 11:04:21
