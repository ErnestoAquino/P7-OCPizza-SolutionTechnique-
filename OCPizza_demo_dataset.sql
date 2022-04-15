-- MySQL dump 10.13  Distrib 8.0.28, for macos11 (x86_64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `client_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `adresse` varchar(100) DEFAULT NULL,
  `adresse_postalcode` varchar(10) DEFAULT NULL,
  `adresse_city` varchar(45) DEFAULT NULL,
  `phone_number` varchar(10) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `nick` varchar(15) DEFAULT NULL,
  `password` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Chandler Beaujolie','29 Boulevard de Normandie','97200','Fort-de-france','0568918489','chandelier@gmail.com','ooL2eecae','Cha2vucho'),(2,'Agramant Permentier','20 rue des Lieutemants Thomazo','83300','Draguignan','0415273549','agramantarmentier@hotmail.fr','Incrultogy','xaiShail6Ae'),(3,'Aubert Grondin','93 rue de la Hulotais','02100','Saint-Quentin','0306012936','aubertgrondin@gmail.com','Aforessind','noR9Mauh'),(4,'Harcourt Brisebois','67 rue Roussy','93130','Noisy-le-sec','0119967868','harcourt@hotmail.fr','Fromand1962','ahthieThah5'),(5,'Percy Lauzier','26 Boulevard d\'Alsace','92170','Vanves','0129199209','percylauzier@hotmail.com','Agnal1948','Aejabe5Oos');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients_orders`
--

DROP TABLE IF EXISTS `clients_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients_orders` (
  `client_id` int unsigned NOT NULL,
  `order_id` int unsigned NOT NULL,
  PRIMARY KEY (`client_id`,`order_id`),
  KEY `fk_clients_has_orders_orders1_idx` (`order_id`),
  KEY `fk_clients_has_orders_clients1_idx` (`client_id`),
  CONSTRAINT `fk_clients_has_orders_clients1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`),
  CONSTRAINT `fk_clients_has_orders_orders1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients_orders`
--

LOCK TABLES `clients_orders` WRITE;
/*!40000 ALTER TABLE `clients_orders` DISABLE KEYS */;
INSERT INTO `clients_orders` VALUES (1,1),(3,2),(3,3);
/*!40000 ALTER TABLE `clients_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_cards`
--

DROP TABLE IF EXISTS `credit_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credit_cards` (
  `credit_card_id` int unsigned NOT NULL AUTO_INCREMENT,
  `credit_card_number` varchar(16) NOT NULL,
  `expiration_moth` varchar(2) NOT NULL,
  `expiration_year` year NOT NULL,
  `client_id` int unsigned NOT NULL,
  PRIMARY KEY (`credit_card_id`,`client_id`),
  KEY `fk_credit_cards_clients1_idx` (`client_id`),
  CONSTRAINT `fk_credit_cards_clients1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_cards`
--

LOCK TABLES `credit_cards` WRITE;
/*!40000 ALTER TABLE `credit_cards` DISABLE KEYS */;
INSERT INTO `credit_cards` VALUES (1,'5280706438663637','08',2024,1),(2,'4716285877762249','07',2027,1),(3,'5250618035038103','03',2025,2),(4,'5463378927916550','07',2026,3),(5,'4716659252870092','04',2025,4);
/*!40000 ALTER TABLE `credit_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `employee_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `nick` varchar(15) NOT NULL,
  `pasword` varchar(15) NOT NULL,
  `access` tinyint NOT NULL,
  `position_job_id` int unsigned NOT NULL,
  `pizzeria_id` int unsigned NOT NULL,
  PRIMARY KEY (`employee_id`,`position_job_id`,`pizzeria_id`),
  KEY `fk_employees_positions_job1_idx` (`position_job_id`),
  KEY `fk_employees_pizzerias1_idx` (`pizzeria_id`),
  CONSTRAINT `fk_employees_pizzerias1` FOREIGN KEY (`pizzeria_id`) REFERENCES `pizzerias` (`pizzeria_id`),
  CONSTRAINT `fk_employees_positions_job1` FOREIGN KEY (`position_job_id`) REFERENCES `positions_job` (`position_job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Roland de Launay','roland','12qw34',1,1,1),(2,'Rive Gougeon','rive','6wyu28',1,2,1),(3,'Elisabeth Gabriaux','lili','1w2h7s',1,3,1),(4,'Cendrillon Pariseau','cendri','p0[j9os',1,4,1),(5,'René Lanteigne','lalilo','j82l\'s-d2',1,1,2),(6,'Hélène Bernard','ehlita','ofisa9Goh',1,2,2),(7,'Leverett Bondy','Vilim1979','ooRei5Chui',1,3,2),(8,'Arber Batard','Orgoods','see4Ro9Uwuy',1,4,2),(9,'Kerman Rouleau','Jull1983','ooL2eecae',0,1,2);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `item_id` int unsigned NOT NULL AUTO_INCREMENT,
  `item_code` varchar(5) NOT NULL,
  `name` varchar(30) NOT NULL,
  `stock` float NOT NULL,
  `unit` varchar(15) DEFAULT NULL,
  `date_of_expiry` date DEFAULT NULL,
  `pizzeria_id` int unsigned NOT NULL,
  PRIMARY KEY (`item_id`,`pizzeria_id`),
  KEY `fk_items_pizzerias1_idx` (`pizzeria_id`),
  CONSTRAINT `fk_items_pizzerias1` FOREIGN KEY (`pizzeria_id`) REFERENCES `pizzerias` (`pizzeria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'FAR00','Farine',25,'kilogramme','2023-01-23',1),(2,'LEV00','Levure',8,'kilogramme','2024-09-21',1),(3,'HUI00','Huile',10,'litre','2030-09-12',1),(4,'OEF00','Oeufs',46,NULL,NULL,1),(5,'FRM00','Mozzarella',10,NULL,'2022-12-13',1),(6,'FRM01','Parmesan',4,'kilogramme','2022-11-24',1),(7,'FRM02','Emmental',3,'kilogramme','2023-01-12',1),(8,'FRM03','Gorgonzola',2,'kilogramme','2022-09-12',1),(9,'FRI00','Tomate',34,NULL,NULL,1),(10,'FRI02','Ananas',3,NULL,NULL,1),(11,'FRI03','Tomate cerise',4,'kilogramme',NULL,1),(12,'BOT00','Olives',6,'kilogramme','2025-09-12',1),(13,'FRM04','Fromage chevre',4,NULL,'2022-12-23',1),(14,'FRO05','Creme',13,'litre','2022-10-12',1),(15,'FRI06','Oigons',14,'kilogramme',NULL,1),(16,'POU00','Blanc poulet',4,'kilogramme',NULL,1),(17,'JAM01','Jambon',2,'kilogramme','2022-03-01',1);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `order_id` int unsigned NOT NULL,
  `product_id` int unsigned NOT NULL,
  `quantity` int DEFAULT NULL,
  `price` float DEFAULT NULL,
  `comments` mediumtext,
  PRIMARY KEY (`order_id`,`product_id`),
  KEY `fk_orders_has_products_products1_idx` (`product_id`),
  KEY `fk_orders_has_products_orders1_idx` (`order_id`),
  CONSTRAINT `fk_orders_has_products_orders1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `fk_orders_has_products_products1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (1,1,2,22.98,'bien dore'),(2,2,1,10.99,NULL),(2,4,2,22.98,'bien dore'),(2,11,3,9,NULL),(3,15,1,3,NULL),(3,16,2,6,NULL),(3,18,2,2,NULL),(3,20,1,14.99,NULL);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `status_id` int unsigned NOT NULL,
  `payment_method` varchar(15) DEFAULT NULL,
  `delivery_type` varchar(15) DEFAULT NULL,
  `total` float DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`order_id`,`status_id`),
  KEY `fk_orders_status1_idx` (`status_id`),
  CONSTRAINT `fk_orders_status1` FOREIGN KEY (`status_id`) REFERENCES `status` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,'CB','livraison',20.98,'2022-03-16 12:15:10'),(2,6,'CB','livraison',42.97,'2022-03-16 12:20:12'),(3,3,'especes','sur place',25.99,'2022-03-16 13:23:43');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_informations`
--

DROP TABLE IF EXISTS `personal_informations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_informations` (
  `personal_information_id` int unsigned NOT NULL AUTO_INCREMENT,
  `adress` varchar(45) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `emergency_contact_details` varchar(45) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `employee_id` int unsigned NOT NULL,
  PRIMARY KEY (`personal_information_id`),
  KEY `fk_personal_informations_employees1_idx` (`employee_id`),
  CONSTRAINT `fk_personal_informations_employees1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_informations`
--

LOCK TABLES `personal_informations` WRITE;
/*!40000 ALTER TABLE `personal_informations` DISABLE KEYS */;
INSERT INTO `personal_informations` VALUES (1,'1336 Lamberts Branch Road','1945-01-25','Miramar Le Blanc 06123456','7865334658',1),(2,'11, place Maurice-Charretier','1985-09-02','Rive Auberjonois 06782918','0243225982',2),(3,'7, Rue Descartes','1939-11-17','Juana Rouge 0698256371','0187938156',3),(4,'39, Rue Saint Germain','1980-06-08','Alexis Saucier 0529862991','0170560319',4),(5,'23 Rue des Dunes','1979-08-25','Apolline Grenier 0575805326','0177369781',5),(6,'13 Rue de Verdun','1960-02-11','Leveret Bondy 0419010021','0112807210',6),(7,'39 rue Gontier-Patin','1979-02-22','Marshall Goulet 0178358152','0419010021',7),(8,'84 Rue grande Fusterie','1972-07-13','Ganelon Riquier 0190374754','0463417961',8),(9,'47 boulevard Aristide Briand','1983-08-26','Pomeroy Mothé','0471951713',9);
/*!40000 ALTER TABLE `personal_informations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizzerias`
--

DROP TABLE IF EXISTS `pizzerias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizzerias` (
  `pizzeria_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(15) NOT NULL,
  `address` varchar(45) NOT NULL,
  `adress_postalcode` varchar(10) NOT NULL,
  `adress_city` varchar(45) NOT NULL,
  `pizzeria_phone` varchar(10) NOT NULL,
  PRIMARY KEY (`pizzeria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizzerias`
--

LOCK TABLES `pizzerias` WRITE;
/*!40000 ALTER TABLE `pizzerias` DISABLE KEYS */;
INSERT INTO `pizzerias` VALUES (1,'Vert','12 rue vert','78928','Vertville','0318253712'),(2,'Rouge','rue Rouge','79123','Rougeville','0391735298'),(3,'Bleu','rue Bleu','65982','Bleuville','0314082394');
/*!40000 ALTER TABLE `pizzerias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizzerias_clients`
--

DROP TABLE IF EXISTS `pizzerias_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizzerias_clients` (
  `pizzeria_id` int unsigned NOT NULL,
  `client_id` int unsigned NOT NULL,
  PRIMARY KEY (`pizzeria_id`,`client_id`),
  KEY `fk_pizzerias_has_clients_clients1_idx` (`client_id`),
  KEY `fk_pizzerias_has_clients_pizzerias1_idx` (`pizzeria_id`),
  CONSTRAINT `fk_pizzerias_has_clients_clients1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`),
  CONSTRAINT `fk_pizzerias_has_clients_pizzerias1` FOREIGN KEY (`pizzeria_id`) REFERENCES `pizzerias` (`pizzeria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizzerias_clients`
--

LOCK TABLES `pizzerias_clients` WRITE;
/*!40000 ALTER TABLE `pizzerias_clients` DISABLE KEYS */;
INSERT INTO `pizzerias_clients` VALUES (1,1),(1,2),(2,3),(2,4),(3,5);
/*!40000 ALTER TABLE `pizzerias_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `positions_job`
--

DROP TABLE IF EXISTS `positions_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `positions_job` (
  `position_job_id` int unsigned NOT NULL AUTO_INCREMENT,
  `position` varchar(15) NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`position_job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `positions_job`
--

LOCK TABLES `positions_job` WRITE;
/*!40000 ALTER TABLE `positions_job` DISABLE KEYS */;
INSERT INTO `positions_job` VALUES (1,'Gérant','Dirige et administre  en tant que mandataire.'),(2,'Pizzaïolo','Cuisinier qui prépare les pizzas.'),(3,'Employé','Salarié(e) qui travaille dans la pizzeria.'),(4,'Livreur','Employé(e) qui porte chez l\'acheteur la marchandise vendue.');
/*!40000 ALTER TABLE `positions_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_code` varchar(5) NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` longtext,
  `date_of_expiry` date DEFAULT NULL,
  `stock` float NOT NULL,
  `unit` varchar(15) DEFAULT NULL,
  `recipe` longtext,
  `price` double NOT NULL,
  `pizzeria_id` int unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`pizzeria_id`),
  KEY `fk_products_pizzerias1_idx` (`pizzeria_id`),
  CONSTRAINT `fk_products_pizzerias1` FOREIGN KEY (`pizzeria_id`) REFERENCES `pizzerias` (`pizzeria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'PIZ01','Marguerita ','Tomate, fromage',NULL,12,NULL,'recette du pizza ',10.99,1),(2,'PIZ02','Napolitaine','Tomate, fromage, jambon',NULL,12,NULL,'recette du pizza',10.99,1),(3,'PIZ03','Campione','Tommate, fromage, viande hachee',NULL,3,NULL,'recette du pizza',10.99,1),(4,'PIZ04','4 Formages','Tomate, formage, gongonzola, chevre',NULL,6,NULL,'recette du pizza',10.99,1),(5,'PIZ05','Parisienne','Tomate, fromage, poulet tika, merguez, oignons',NULL,6,NULL,'recette du pizza',10.99,1),(6,'SAL01','Capri','Salade verte, tomates, mozzarella, huile d\'olive',NULL,4,'boite','recette du salade',6.99,1),(7,'SAl02','Thon','Salade verte, tomates, thon, olives, oignons',NULL,3,'boite','recette du salade',6.99,1),(8,'SAL03','Grec','Salade verte, tomates, oignons, concombre, olive',NULL,7,'boite','recette du salade',6.99,1),(9,'SAL04','Nicoise','Salade verte, tomates, pommes de terre, oeuf, olives, concombres',NULL,2,'boite','recette du salde',6.99,1),(10,'SAL05','Service','Salade verte, tomates, poulet fume, oeuf dur, olives',NULL,3,'boite','recette du salade',6.99,1),(11,'BOI01','Coca cola',NULL,'2025-03-12',16,NULL,NULL,3,1),(12,'BOI02','Oasis',NULL,'2025-09-12',12,NULL,NULL,3,1),(13,'BOI03','Perrier',NULL,'2030-12-14',17,NULL,NULL,3,1),(14,'DES01','Brownie','Chocolat',NULL,14,'piece',NULL,3,1),(15,'DES02','Tiramisu','Cafe',NULL,1,'piece',NULL,3,1),(16,'DES03','Tiramisu ','Chocolat','2022-12-05',14,'piece',NULL,3,1),(17,'PIZ06','Extra maison','Tomate, formage, pommes de terre, chorizo',NULL,12,NULL,'recette du pizza',10.99,1),(18,'00001','Extra jambon',NULL,NULL,10,'tranches',NULL,1,1),(19,'PIZ07','Marguerita  Junior','Tomate, fromage',NULL,12,NULL,'recette dupizza ',6.99,1),(20,'PIZ08','Marguerita Familiale','Tomate, fromage',NULL,10,NULL,'recette du pizza',14.99,1),(21,'00002','Extra chorizo',NULL,NULL,5,'portion',NULL,1,0);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_items`
--

DROP TABLE IF EXISTS `products_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_items` (
  `product_id` int unsigned NOT NULL,
  `item_id` int unsigned NOT NULL,
  PRIMARY KEY (`product_id`,`item_id`),
  KEY `fk_products_has_items_items1_idx` (`item_id`),
  KEY `fk_products_has_items_products1_idx` (`product_id`),
  CONSTRAINT `fk_products_has_items_items1` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`),
  CONSTRAINT `fk_products_has_items_products1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_items`
--

LOCK TABLES `products_items` WRITE;
/*!40000 ALTER TABLE `products_items` DISABLE KEYS */;
INSERT INTO `products_items` VALUES (1,6),(2,6),(2,8),(1,9),(2,9);
/*!40000 ALTER TABLE `products_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `status_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Waiting list','Your order is on the waiting list'),(2,'Kitchen','Your order is in the kitchen'),(3,'Preparation','Your order is being perpared'),(4,'Ready','Your order is ready'),(5,'In delivery','Your order is in delivery'),(6,'Delivered','Your order has been delivered');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-04 22:45:56
