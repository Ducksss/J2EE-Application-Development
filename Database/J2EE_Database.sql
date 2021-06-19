CREATE DATABASE  IF NOT EXISTS `sp_shop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sp_shop`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: sp_shop
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `catname` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `category_image` varchar(255) DEFAULT 'assets/img/product/no_image.png',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `catname_UNIQUE` (`catname`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Pancake','Pancake','\"assets/img/product/Peanut Butter Pancake.jpg\"','2021-05-20 06:01:21'),(2,'Beancurd','Beancurd','\"assets/img/product/Sea Salt Gula Melaka Beancurd.jpg\"','2021-05-20 15:18:56'),(3,'Drinks','Drinks','\"assets/img/product/Pearly Taro Soya Milk.jpg\"','2021-05-20 15:21:35'),(6,'Pearly','Pearly','\"assets/img/product/Pearly Beancurd.jpg\"','2021-06-19 10:17:56'),(7,'aaaddd','aaa','\'assets/img/product/no_image.png\'','2021-06-19 10:47:53');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_tags`
--

DROP TABLE IF EXISTS `category_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category_tags` (
  `category_tags_id` int NOT NULL AUTO_INCREMENT,
  `fk_product_id` int NOT NULL,
  `fk_category_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`category_tags_id`),
  KEY `fk_product_id_idx` (`fk_product_id`),
  KEY `fk_category_id_idx` (`fk_category_id`),
  CONSTRAINT `fk_category_id` FOREIGN KEY (`fk_category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_product_id` FOREIGN KEY (`fk_product_id`) REFERENCES `products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_tags`
--

LOCK TABLES `category_tags` WRITE;
/*!40000 ALTER TABLE `category_tags` DISABLE KEYS */;
INSERT INTO `category_tags` VALUES (1,1,1,'2021-06-15 07:22:27'),(3,2,1,'2021-06-15 07:22:27'),(6,3,1,'2021-06-17 08:06:55'),(15,4,2,'2021-06-19 10:15:37'),(16,5,2,'2021-06-19 10:15:37'),(17,6,2,'2021-06-19 10:15:37'),(18,7,3,'2021-06-19 10:15:37'),(19,8,3,'2021-06-19 10:15:37'),(20,9,3,'2021-06-19 10:15:37'),(21,5,6,'2021-06-19 10:19:35'),(22,8,6,'2021-06-19 10:19:35'),(23,9,6,'2021-06-19 10:19:35');
/*!40000 ALTER TABLE `category_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_title` varchar(255) NOT NULL,
  `brief_description` varchar(255) DEFAULT NULL,
  `detail_description` varchar(500) DEFAULT NULL,
  `cost_price` decimal(9,2) NOT NULL,
  `retail_price` decimal(9,2) NOT NULL,
  `stock_quantity` int NOT NULL,
  `image_location` varchar(255) DEFAULT 'assets/img/product/no_image.png',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `title_UNIQUE` (`product_title`),
  KEY `image_location_fk_idx` (`image_location`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Peanut Butter Pancake','Our peanut butter pancake contains all the natural nuts in the world.','Our peanut butter pancake contains all the natural nuts in the world. Sourcing from the heartland of South Africa, the nuts are of high quality and fragance. There is no compromise when it comes to ours nuts. This is a must try!',1.20,6.60,30,'assets/img/product/Peanut Butter Pancake.jpg','2021-05-20 05:56:19'),(2,'Red Bean Pancake','Sourced from guatamala, this red bean pancake contains 100% pure red beans.','Sourced from guatamala, this red bean pancake contains 100% pure red beans. The red beans are put through a rigorous screening process that ensures that they are of the highest grade 1 standard awarded by azuki redbean, the international redbean quality standard.',1.20,6.60,40,'assets/img/product/Red Bean Pancake.jpg','2021-06-11 18:24:09'),(3,'Tuna Pancake','This tuna was born and bred in Singapore, owing to our rich nutrient-filled waters. ','This tuna was born and bred in Singapore, owing to our rich nutrient-filled waters. We ensure that the tunas are brought in fresh from the sea, with a guaranteed quality to the texture of the meat. Singapore tuna is held to such a high standard it is internationally revered.',1.20,6.60,10,'assets/img/product/Tuna Pancake.jpg','2021-06-11 18:24:09'),(4,'Sea Salt Gula Melaka Beancurd','Sourced from the himalayan mountains, this salt contains minerals that every human needs. Infused with our bean curd.','Sourced from the himalayan mountains, this salt contains minerals that every human needs. Infused with our bean curd. The Gula Melaka and the bean curd fuse together so well, it gives a unique taste that is hard to miss.',1.20,6.60,15,'assets/img/product/Sea Salt Gula Melaka Beancurd.jpg','2021-06-11 18:24:09'),(5,'Pearly Beancurd','Pearls from the bean curd are soft and chewy, yet not difficult to eat.','Pearls from the bean curd are soft and chewy, yet not difficult to eat. We ensure that the pearls are sourced from a reliable source, and that they are 100% safe to consume. ',1.20,6.60,12,'assets/img/product/Pearly Beancurd.jpg','2021-06-11 18:24:37'),(6,'Grass Jelly Beancurd','The texture that comes from out grass jelly is both soft and smooth.','The texture that comes from out grass jelly is both soft and smooth. The grass jelly blends well with the bean curd, owing to our intense research that our research team did to perfect this combination.',0.80,4.60,154,'assets/img/product/Grass Jelly Beancurd.jpg','2021-06-11 18:26:28'),(7,'Watermelon Soya Milk','The freshest watermelons are chosen for this specialty blend.','The freshest watermelons are chosen for this specialty blend.The blend with watermelons and soya milk is irresistible to the human taste buds! Try it out now!',0.50,3.60,12,'assets/img/product/Watermelon Soya Milk.jpg','2021-06-11 18:26:28'),(8,'Pearly Bandung Soya Milk','Combining Bandung, a local delight with pearls and soya milk, who could resist such a treat?','Combining Bandung, a local delight with pearls and soya milk, who could resist such a treat? This triple blend is a deep favourite with out customers, not trying it will be a big regret in your life!',0.80,4.60,45,'assets/img/product/Pearly Bandung Soya Milk.jpg','2021-06-11 18:26:28'),(9,'Pearly Taro Soya Milk','This taro milk has both a silky and smooth texture. It is no mistake that it is a must try!','This taro milk has both a silky and smooth texture. It is no mistake that it is a must try! People travel from all over the world to try out our Pearly Taro Soya Milk! Why not give it a shot?',0.80,4.60,31,'assets/img/product/Pearly Taro Soya Milk.jpg','2021-06-11 18:26:28');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `review_id` int NOT NULL AUTO_INCREMENT,
  `content` varchar(45) NOT NULL,
  `fk_user_id` int NOT NULL,
  `fk_product_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`review_id`),
  KEY `fk_user_id_idx` (`fk_user_id`),
  KEY `fk_product_id_idx` (`fk_product_id`),
  CONSTRAINT `fk_product_id_1` FOREIGN KEY (`fk_product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `fk_user_id` FOREIGN KEY (`fk_user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,'Very Nice!',1,2,'2021-06-19 14:20:08'),(2,'This is very Good!',26,5,'2021-06-19 14:52:40'),(3,'Superduper goooooooood aoooga!',26,5,'2021-06-19 14:55:26'),(4,'Very NICEEEE',26,4,'2021-06-19 15:01:13');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL DEFAULT 'Customer',
  `profile_pic_url` varchar(45) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Terry Tan','terry@gmail.com','TerryTanPw','Customer','https://www.abc.com/terry.jpg','AIA Alexandra 371 Alexandra Road #10-04','2021-05-18 08:18:00'),(2,'Jia Shunz','jiashun@gmail.com','JiaShunpw','Admin','https://www.abc.com/jiashun.jpg','3 Jalan Lengkok Sembawang','2021-05-18 08:19:02'),(3,'Shu Yang','ShuYang@gmail.com','ShuYangPw','Admin','https://www.abc.com/shuyang.jpg','115A Commonwealth Drive #05-24 Tanglin Halt','2021-05-18 08:20:34'),(18,'Matthew Chan','Matthew@gmail.com','MatthewPw','Customer','https://www.abc.com/Matthew.jpg','36 Gul Drive','2021-05-18 08:24:27'),(19,'YanBin','YanBin@gmail.com','YanBinPw','Customer','https://www.abc.com/YanBin.jpg','191 Up Paya Lebar Rd','2021-05-18 08:24:27'),(20,'MrYong','MrYong@gmail.com','MrYongPw','Customer','https://www.abc.com/Yong.jpg','10 Eunos Road 8','2021-05-18 08:24:27'),(21,'JingWen','JingWen@gmail.com','JingWenPw','Customer','https://www.abc.com/JingWen.jpg','23 KALIDASA AVENUE TEACHER\'S HOUSING ESTATE','2021-05-18 08:24:27'),(22,'Isaac','Isaac@gmail.com','IsaacPw','Customer','https://www.abc.com/Isaac.jpg','1 Sophia Road 04-10R Peace Centre','2021-05-18 08:24:27'),(23,'James Ng','JamesNg@gmail.com','IsaacPw','Customer','https://www.abc.com/jamesNg.jpg','1 Park Road #03-62 People\'s Park Complex','2021-05-18 08:24:27'),(24,'Ashley Low','ashleylow@gmail.com','AshleyPw','Admin','https://www.abc.com/AshleyLow.jpg','545 ORCHARD ROAD#03-04','2021-05-18 08:24:27'),(26,'Cummerata','Cummerata@gmail.com','password','Customer',NULL,'7 TEMASEK BOULEVARD 22-02A SUNTEC TOWER ONE','2021-06-11 20:08:06'),(27,'Runterra','Runterra@gmail.com','Password','Customer',NULL,'30 Raffles Place #32-00 Chevron House','2021-06-11 20:12:13'),(28,'Jeffery Tan','JefferyTan@gmail.com','password','Customer',NULL,'143 Cecil Street #16-04 Gb Building','2021-06-18 12:06:53'),(30,'Tan Shien Hu','TanShienHu@gmail.com','password','Customer',NULL,'218 CHANGI ROAD 03-06 PKMS BUILDING','2021-06-18 12:10:22'),(31,'asdasdasd','TanShienHuaa@gmail.com','password','Customer',NULL,'273 Thomson Rd Novena Gdns','2021-06-18 12:11:49'),(32,'Kelvin Kang','TanShienHua@gmail.com','password','Customer',NULL,'400 Balestier Rd #05-01','2021-06-18 12:17:39'),(33,'Ramesh Monika','rameshmonika@gmail.com','Password','Admin',NULL,'Woodlands Avenue 11','2021-06-18 15:49:08');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'sp_shop'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-19 23:01:37
