CREATE DATABASE  IF NOT EXISTS `smeet` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `smeet`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: smeet
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `Chefs`
--

DROP TABLE IF EXISTS `Chefs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Chefs` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) NOT NULL,
  `Job` varchar(20) DEFAULT NULL,
  `IMG` varchar(100) NOT NULL,
  `TeamID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_Chefs_TeamID_idx` (`TeamID`),
  CONSTRAINT `FK_Chefs_TeamID` FOREIGN KEY (`TeamID`) REFERENCES `Teams` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Chefs`
--

LOCK TABLES `Chefs` WRITE;
/*!40000 ALTER TABLE `Chefs` DISABLE KEYS */;
INSERT INTO `Chefs` VALUES (1,'立雁山','廚師長','img/chefteam_img/cf1.png',1),(2,'吳健智','副主廚','img/chefteam_img/cf2.png',1),(3,'蔡恕君','副主廚','img/chefteam_img/cf3.png',1),(4,'蔡宇亭','冷盤廚師','img/chefteam_img/cf4.png',1),(5,'張佳琦','甜點師','img/chefteam_img/cf5.png',1),(6,'李藝廷','行政主廚','img/chefteam_img/cf6.png',1),(7,'陳早安','幫廚','img/chefteam_img/cf7.png',1),(8,'夏午查','幫廚','img/chefteam_img/cf8.png',1),(9,'菜雨停','廚師長','img/chefteam_img/cf9.jpg',2),(10,'陳品鞍','副主廚','img/chefteam_img/cf10.jpg',2),(11,'戴秀軒','副主廚','img/chefteam_img/cf11.jpg',2),(12,'初原菌','冷盤廚師','img/chefteam_img/cf12.jpg',2),(13,'陳一璇','甜點師','img/chefteam_img/cf13.jpg',2),(14,'陳幼榕','行政主廚','img/chefteam_img/cf14.jpg',2),(15,'蔡漢頤','幫廚','img/chefteam_img/cf15.jpg',2),(16,'許皓文','幫廚','img/chefteam_img/cf16.jpg',2),(17,'吳薦痣','廚師長','img/chefteam_img/cf17.jpg',3),(18,'盧顴骨','副主廚','img/chefteam_img/cf18.jpg',3),(19,'陳品猿','副主廚','img/chefteam_img/cf19.jpg',3),(20,'張勝劫','冷盤廚師','img/chefteam_img/cf20.jpg',3),(21,'鍋子寧','甜點師','img/chefteam_img/cf21.jpg',3),(22,'張恩瓶','行政主廚','img/chefteam_img/cf22.jpg',3),(23,'楊子融','幫廚','img/chefteam_img/cf23.jpg',3),(24,'董怡軍','幫廚','img/chefteam_img/cf24.jpg',3);
/*!40000 ALTER TABLE `Chefs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Contact`
--

DROP TABLE IF EXISTS `Contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Contact` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ReleaseDate` timestamp NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Phone` varchar(10) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Category` varchar(45) NOT NULL,
  `SuggestContent` varchar(500) NOT NULL,
  `Condition` tinyint NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contact`
--

LOCK TABLES `Contact` WRITE;
/*!40000 ALTER TABLE `Contact` DISABLE KEYS */;
INSERT INTO `Contact` VALUES (1,'2023-01-05 09:21:01','陳品元','0912345678','testaccount_1@gmail.com','預約','婚宴預約120人，時間是下半年的12/7號，可以嗎？',1),(2,'2023-01-06 10:22:02','陳聘原','0987654321','testaccount_2@gmail.com','付款','可以分12期嗎？',0),(3,'2023-01-07 11:23:03','陳蘋苑','0911223344','testaccount_3@gmail.com','租借','請問有提供場地租借嗎？',1),(4,'2023-01-08 12:24:04','李羿廷','0955667788','testaccount_4@gmail.com','商城','可以超商取貨嗎？運費多少？',0),(5,'2023-01-09 13:25:05','李意婷','0999001122','testaccount_5@gmail.com','合作','貴公司您好，請問異業合作可以聯繫誰？',1),(6,'2023-01-10 14:26:06','李依婷','0933445566','testaccount_6@gmail.com','其他','line怎麼沒人回覆，已經等一個小時了！這種服務不行耶',0),(7,'2023-01-11 15:27:07','張恩平','0977889900','testaccount_7@gmail.com','預約','婚宴預約120人，時間是下半年的12/7號，可以嗎？',1),(8,'2023-01-12 08:28:08','張恩蘋','0988635123','testaccount_8@gmail.com','付款','可以分12期嗎？',0),(9,'2023-01-13 07:29:09','張嗯拼','0988635456','testaccount_9@gmail.com','租借','請問有提供場地租借嗎？',1),(10,'2023-01-14 06:30:10','盧全穀','0988635789','desktop_1@gmail.com','商城','可以超商取貨嗎？運費多少？',0),(11,'2023-01-15 05:31:11','盧顴骨','0928515123','desktop_2@gmail.com','合作','貴公司您好，請問異業合作可以聯繫誰？',1),(12,'2023-01-16 04:32:12','盧泉谷','0928515456','desktop_3@gmail.com','其他','line怎麼沒人回覆，已經等一個小時了！這種服務不行耶',0);
/*!40000 ALTER TABLE `Contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Dish`
--

DROP TABLE IF EXISTS `Dish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Dish` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Type` int NOT NULL COMMENT '預約:\n湯物,前菜,刺身,主食,甜點,飲品,單品\n商城:\n商城主食,商城湯品,商城甜品\n服務',
  `Name` varchar(30) NOT NULL DEFAULT '使用者更新',
  `Price` int DEFAULT '0',
  `IMG` varchar(300) DEFAULT NULL,
  `ShopPoint` varchar(500) DEFAULT NULL,
  `Introduction` varchar(500) DEFAULT NULL,
  `Condition` tinyint(1) NOT NULL,
  `pushisedDate` timestamp NOT NULL,
  `SetID` int DEFAULT NULL,
  `ProductType` varchar(20) DEFAULT NULL COMMENT '私廚單點,商城冷凍',
  PRIMARY KEY (`ID`),
  KEY `FK_Dishs_SetID_idx` (`SetID`),
  KEY `FK_DishsType_TypeID_idx` (`Type`),
  CONSTRAINT `FK_Dishs_SetID` FOREIGN KEY (`SetID`) REFERENCES `Sets` (`ID`),
  CONSTRAINT `FK_DishsType_TypeID` FOREIGN KEY (`Type`) REFERENCES `DishsType` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Dish`
--

LOCK TABLES `Dish` WRITE;
/*!40000 ALTER TABLE `Dish` DISABLE KEYS */;
INSERT INTO `Dish` VALUES (1,1,'奶香牛肝菌野菇濃湯',0,NULL,NULL,NULL,1,'2023-01-30 15:33:23',1,'私廚單點'),(2,1,'石斑海鮮清湯',0,NULL,NULL,NULL,1,'2023-01-27 05:02:55',1,'私廚單點'),(3,2,'燻鮭魚番茄佐優格醬',0,NULL,NULL,NULL,1,'2023-01-27 02:04:46',1,'私廚單點'),(4,2,'深海魚皮野蔬沙拉佐醋醬',0,NULL,NULL,NULL,1,'2023-01-30 15:33:23',1,'私廚單點'),(5,3,'生魚片拼盤',0,NULL,NULL,NULL,1,'2023-01-26 11:13:41',1,'私廚單點'),(6,4,'嫩煎干貝佐松露菲力',0,NULL,NULL,NULL,1,'2023-01-26 18:49:37',1,'私廚單點'),(7,4,'日本小田和牛壽喜燒',0,NULL,NULL,NULL,1,'2023-01-30 15:33:23',1,'私廚單點'),(8,4,'龍蝦佐鮑魚海鮮拼盤',0,NULL,NULL,NULL,1,'2023-01-26 11:35:03',1,'私廚單點'),(9,5,'抹茶布丁搭配綿密金時紅豆',0,NULL,NULL,NULL,1,'2023-01-26 18:56:27',1,'私廚單點'),(10,5,'栗子羊羹',0,NULL,NULL,NULL,0,'2023-01-27 02:04:46',1,'私廚單點'),(11,5,'春手毬和菓子',0,NULL,NULL,NULL,1,'2023-01-16 23:38:49',1,'私廚單點'),(12,6,'抹茶海鹽奶蓋',0,NULL,NULL,NULL,1,'2023-01-26 18:56:27',1,'私廚單點'),(13,6,'烘焙曼巴咖啡',0,NULL,NULL,NULL,1,'2023-01-27 02:04:46',1,'私廚單點'),(14,6,'高山金萱茶',0,NULL,NULL,NULL,1,'2023-01-26 11:35:03',1,'私廚單點'),(15,6,'檸檬海鹽氣泡飲',0,NULL,NULL,NULL,1,'2023-01-26 11:23:56',1,'私廚單點'),(16,6,'水蜜桃氣泡飲',0,NULL,NULL,NULL,0,'2023-01-16 11:23:56',1,'私廚單點'),(17,1,'鮭魚味噌湯',0,NULL,NULL,NULL,0,'2023-01-12 11:11:43',2,'私廚單點'),(18,1,'燻鮭魚番茄濃湯',0,NULL,NULL,NULL,1,'2023-01-26 11:11:43',2,'私廚單點'),(19,1,'手沖牛肉清湯',0,NULL,NULL,NULL,1,'2023-01-16 23:38:49',2,'私廚單點'),(20,2,'鳟魚卵干貝卷',0,NULL,NULL,NULL,1,'2023-01-16 23:38:49',2,'私廚單點'),(21,2,'昆布酒蒸鮑魚',0,NULL,NULL,NULL,1,'2023-01-26 11:11:43',2,'私廚單點'),(22,3,'生魚片拼盤',0,NULL,NULL,NULL,1,'2023-01-16 23:38:49',2,'私廚單點'),(23,4,'日落低溫慢烤和牛',0,NULL,NULL,NULL,1,'2023-01-16 23:38:49',2,'私廚單點'),(24,4,'嫩肩松坂豬佐松露蕈菇',0,NULL,NULL,NULL,1,'2023-01-16 23:38:49',2,'私廚單點'),(25,4,'嫩肩小羔羊佐海大蝦',0,NULL,NULL,NULL,1,'2023-01-16 23:38:49',2,'私廚單點'),(26,5,'和風酒釀野露丸串',0,NULL,NULL,NULL,1,'2023-01-16 23:38:49',2,'私廚單點'),(27,5,'抹茶烤春日卷',0,NULL,NULL,NULL,1,'2023-01-16 23:38:49',2,'私廚單點'),(28,5,'繡球花和菓子',0,NULL,NULL,NULL,0,'2023-01-27 05:43:54',2,'私廚單點'),(29,6,'大江戶紅豆鮮奶蓋',0,NULL,NULL,NULL,1,'2023-01-27 05:43:54',2,'私廚單點'),(30,6,'藝妓咖啡',0,NULL,NULL,NULL,1,'2023-01-16 23:38:49',2,'私廚單點'),(31,6,'富士山和風菓茶',0,NULL,NULL,NULL,1,'2023-01-16 23:38:49',2,'私廚單點'),(32,6,'私覓碳香茶',0,NULL,NULL,NULL,1,'2023-01-16 23:38:49',2,'私廚單點'),(33,1,'京都雪藏干貝湯',0,NULL,NULL,NULL,1,'2023-01-26 11:31:42',3,'私廚單點'),(34,1,'蛤蠣煮物院雞湯',0,NULL,NULL,NULL,0,'2023-01-27 05:59:07',3,'私廚單點'),(35,2,'京都魚子醬松葉蟹',0,NULL,NULL,NULL,1,'2023-01-26 11:31:42',3,'私廚單點'),(36,2,'大閘蟹握壽司',0,NULL,NULL,NULL,1,'2023-01-26 11:11:09',3,'私廚單點'),(37,3,'生魚片拼盤',0,NULL,NULL,NULL,1,'2023-01-27 05:59:07',3,'私廚單點'),(38,4,'日本A5黑毛和牛岩板燒',0,NULL,NULL,NULL,1,'2023-01-26 11:32:31',3,'私廚單點'),(39,4,'酒焰龍蝦盛宴',0,NULL,NULL,NULL,1,'2023-01-16 23:38:49',3,'私廚單點'),(40,4,'A4熊本縣紐約客',0,NULL,NULL,NULL,1,'2023-01-26 11:11:09',3,'私廚單點'),(41,5,'百香果烏龍茶晶球布丁',0,NULL,NULL,NULL,1,'2023-01-16 23:38:49',3,'私廚單點'),(42,5,'北海道私覓熔岩心',0,NULL,NULL,NULL,1,'2023-01-16 23:38:49',3,'私廚單點'),(43,5,'千代見草和菓子',0,NULL,NULL,NULL,1,'2023-01-16 23:38:49',3,'私廚單點'),(44,6,'日暈雙月奶蓋',0,NULL,NULL,NULL,1,'2023-01-16 23:38:49',3,'私廚單點'),(45,6,'京都淺咖啡',0,NULL,NULL,NULL,1,'2023-01-16 23:38:49',3,'私廚單點'),(46,6,'星月茶',0,NULL,NULL,NULL,1,'2023-01-16 23:38:49',3,'私廚單點'),(47,6,'柚香清氣泡飲',0,NULL,NULL,NULL,1,'2023-01-16 23:38:49',3,'私廚單點'),(48,7,'廣島牡蠣釜飯',800,NULL,NULL,NULL,1,'2023-01-26 11:06:25',NULL,'私廚單點'),(49,7,'和牛蕈菇釜飯',300,NULL,NULL,NULL,1,'2023-01-25 09:18:31',NULL,'私廚單點'),(50,7,'黑鮪刺身',800,NULL,NULL,NULL,1,'2023-01-25 08:10:47',NULL,'私廚單點'),(51,7,'蘆筍蝦手卷',300,NULL,NULL,NULL,1,'2023-01-16 23:38:58',NULL,'私廚單點'),(52,7,'迷你上等三色丼',240,NULL,NULL,NULL,0,'2023-01-25 09:30:53',NULL,'私廚單點'),(53,7,'北海道松葉蟹蒸蛋',740,NULL,NULL,NULL,1,'2023-01-16 23:38:58',NULL,'私廚單點'),(54,7,'大閘蟹蟹黃球',500,NULL,NULL,NULL,0,'2023-01-16 23:38:58',NULL,'私廚單點'),(55,7,'燻鮭魚蔬菜濃湯',200,NULL,NULL,NULL,1,'2023-01-16 23:38:58',NULL,'私廚單點'),(56,7,'蘭姆酒和牛澄清湯',300,NULL,NULL,NULL,1,'2023-01-25 08:09:55',NULL,'私廚單點'),(57,8,'黑鮪刺身',700,'img/shopmall_img/shopmall_product01_1.jpg img/shopmall_img/shopmall_product01_2.jpg img/shopmall_img/shopmall_product01_3.jpg','一道擁有日式美學的油醋刺身','以柴魚高湯的土佐醋來製作成土佐醋凍片，將酸感降低，搭配油脂豐富的鮪魚、油漬刺蔥與番茄製造出更有層次的風味。',1,'2023-01-07 11:47:55',NULL,'商城冷凍'),(58,8,'廣島牡蠣釜飯',450,'img/shopmall_img/shopmall_product02_1.jpg img/shopmall_img/shopmall_product02_2.jpg img/shopmall_img/shopmall_product02_3.jpg','以「牡蠣、牛蒡」為主要元素，再加入牛肝菌、草菇為主的湯底。','以「牡蠣、牛蒡」為主要元素，再加入牛肝菌、草菇為主的湯底，帶出牡蠣本身的鮮甜，米飯經由高湯燉煮，更增添食物的清淡香氣。',1,'2023-01-07 11:47:55',NULL,'商城冷凍'),(59,8,'蘆筍蝦手捲',300,'img/shopmall_img/shopmall_product03_1.jpg img/shopmall_img/shopmall_product03_2.jpg img/shopmall_img/shopmall_product03_3.jpg','鮮嫩的富山白蝦搭配果醋及海苔鮮味非常開胃，接上新鮮清爽的蘆筍讓人唇齒留香。','鮮嫩的富山白蝦搭配果醋及海苔鮮味非常開胃，接上新鮮清爽的蘆筍讓人唇齒留香，最後再以鹹香的干貝塔搭配濃郁香氣的黑松露與蔬菜芝麻葉，製造出更有層次的風味。',1,'2023-01-07 11:47:55',NULL,'商城冷凍'),(60,8,'大閘蟹膏手卷',350,'img/shopmall_img/shopmall_product04_1.jpg img/shopmall_img/shopmall_product04_2.jpg img/shopmall_img/shopmall_product04_3.jpg','以醃漬物、蒔蘿帶出爽脆口感與辛香，選用紅藜麥替代米飯的黏膩感，最後添上扎實的蟹肉、鮪魚中腹使鮮味、油脂香氣佈滿口中。','以醃漬物、蒔蘿帶出爽脆口感與辛香，選用紅藜麥替代米飯的黏膩感，最後添上扎實的蟹肉、鮪魚中腹使鮮味、油脂香氣佈滿口中，每一口都能品嘗到不同的風味，是喜愛螃蟹的饕客不可錯過的料理之一。',1,'2023-01-07 11:47:55',NULL,'商城冷凍'),(61,9,'槍烏賊清湯',300,'img/shopmall_img/shopmall_soup01_1.jpg img/shopmall_img/shopmall_soup01_2.jpg img/shopmall_img/shopmall_soup01_3.jpg','口感彈嫩的北海道白貝，搭配台灣乾魷魚熬煮的高湯、特級魚子醬、指橙等，味道豐美。','口感彈嫩的北海道白貝，搭配台灣乾魷魚熬煮的高湯、特級魚子醬、指橙等，味道豐美。',1,'2023-01-07 11:47:55',NULL,'商城冷凍'),(62,9,'蘭姆酒和牛澄清湯',350,'img/shopmall_img/shopmall_soup02_1.jpg img/shopmall_img/shopmall_soup02_2.jpg img/shopmall_img/shopmall_soup02_3.jpg','以經典法式澄清湯 Consommé手法經過三次的慢熬細篩，只留下和牛深厚精華，幾乎未見油脂的澄清湯。','以經典法式澄清湯 Consommé手法經過三次的慢熬細篩，只留下和牛深厚精華，幾乎未見油脂的澄清湯，在熱湯中品嘗煙燻過的菲力與彈牙龍蝦，經過煙燻的菲力降低油脂為，而風味卻更深厚、有韻味。',1,'2023-01-07 11:47:55',NULL,'商城冷凍'),(63,9,'燻鮭魚蔬菜濃湯',350,'img/shopmall_img/shopmall_soup03_1.jpg img/shopmall_img/shopmall_soup03_2.jpg img/shopmall_img/shopmall_soup03_3.jpg','獨特的冷燻法，木質燻香均勻滲透肉質，同時保留鮭魚的鮮美再加入小火慢熬的蔬果湯底，同時享有食蔬及海鮮的甘甜。','獨特的冷燻法，木質燻香均勻滲透肉質，同時保留鮭魚的鮮美再加入小火慢熬的蔬果湯底，同時享有食蔬及海鮮的甘甜。',1,'2023-01-07 11:47:55',NULL,'商城冷凍'),(64,10,'千代見草和菓子',250,'img/shopmall_img/shopmall_dessert01_1.jpg img/shopmall_img/shopmall_dessert01_2.jpg img/shopmall_img/shopmall_dessert01_3.jpg','菊花又名千代見草，於平安時期是貴族觀賞的花卉，現今融入剪菊技術，內餡融入奶油乳酪增加鹹甜感、夏威夷豆增加口感與堅果香氣，鹹甜鹹甜的滋味讓人想念','菊花又名千代見草，於平安時期是貴族觀賞的花卉，現今融入剪菊技術，內餡融入奶油乳酪增加鹹甜感、夏威夷豆增加口感與堅果香氣，鹹甜鹹甜的滋味讓人想念',1,'2023-01-07 11:47:55',NULL,'商城冷凍'),(65,10,'和風酒釀野露丸串',250,'img/shopmall_img/shopmall_dessert02_1.jpg img/shopmall_img/shopmall_dessert02_2.jpg img/shopmall_img/shopmall_dessert02_3.jpg','清酒釀製的米香為基底，搭配爽口的糯米串，外脆內軟的口感慢慢在嘴裡化開。','清酒釀製的米香為基底，搭配爽口的糯米串，外脆內軟的口感慢慢在嘴裡化開。',1,'2023-01-07 11:47:55',NULL,'商城冷凍'),(66,8,'和牛蕈菇釜飯',400,'img/shopmall_img/shopmall_product05_1.jpg img/shopmall_img/shopmall_product05_2.jpg img/shopmall_img/shopmall_product05_3.jpg','牛油均勻塗抹在攝氏300度的高溫火山岩後，再放入鮮切日本頂級黑毛A5和牛','牛油均勻塗抹在攝氏300度的高溫火山岩後，再放入鮮切日本頂級黑毛A5和牛，岩板與油脂豐富的和牛油花吱吱作響，入口即化的肉質只想一嘗再嚐。',1,'2023-01-07 11:47:55',NULL,'商城冷凍'),(67,8,'北海道松葉蟹蒸蛋',400,'img/shopmall_img/shopmall_product06_1.jpg img/shopmall_img/shopmall_product06_2.jpg img/shopmall_img/shopmall_product06_3.jpg','北海道松葉蟹來自日本北海道水域，被稱為「日本三大名蟹」之一，味道鮮甜美味、肉質軟滑','北海道松葉蟹來自日本北海道水域，被稱為「日本三大名蟹」之一，味道鮮甜美味、肉質軟滑、蟹膏香濃，另外再以鰻魚、牛蒡、雞蛋延續美味，增添不同層次的大地風味的茶碗蒸。',1,'2023-01-07 11:47:55',NULL,'商城冷凍'),(68,8,'迷你上等三色丼',450,'img/shopmall_img/shopmall_product07_1.jpg img/shopmall_img/shopmall_product07_2.jpg img/shopmall_img/shopmall_product07_3.jpg','嚴選新鮮鮭魚生魚片、北海道干貝、鮭魚卵，再加上牧場精心飼養的靈芝蛋黃增加滑順的口感，一場味覺的饗宴限時上演。','嚴選新鮮鮭魚生魚片、北海道干貝、鮭魚卵，再加上牧場精心飼養的靈芝蛋黃增加滑順的口感，一場味覺的饗宴限時上演。',1,'2023-01-07 11:47:55',NULL,'商城冷凍'),(69,8,'大閘蟹蟹黃球',300,'img/shopmall_img/shopmall_product08_1.jpg img/shopmall_img/shopmall_product08_2.jpg img/shopmall_img/shopmall_product08_3.jpg','大閘蟹蟹黃球內部包裹著一整隻太湖大閘蟹的蟹膏做為內餡，外層由南瓜、大閘蟹肉作為外衣','大閘蟹蟹黃球內部包裹著一整隻太湖大閘蟹的蟹膏做為內餡，外層由南瓜、大閘蟹肉作為外衣，一口咬下外衣微酥的口感，在體會內餡濃郁蟹膏的美好。',1,'2023-01-07 11:47:55',NULL,'商城冷凍'),(70,8,'富山縣小白蝦握壽司',450,'img/shopmall_img/shopmall_product08_1.jpg img/shopmall_img/shopmall_product08_2.jpg img/shopmall_img/shopmall_product08_3.jpg','選用富山白蝦、昆布、檸檬胡椒，清爽的口感使人唇齒留香，最後再輔以濃郁香氣的黑松露與蔬菜芝麻葉，製造更富層次的口感。','選用富山白蝦、昆布、檸檬胡椒，清爽的口感使人唇齒留香，最後再輔以濃郁香氣的黑松露與蔬菜芝麻葉，製造更富層次的口感。',0,'2023-01-07 19:47:55',NULL,'商城冷凍'),(71,9,'日式黑豬肉清湯',450,'img/shopmall_img/shopmall_soup04_1.jpg img/shopmall_img/shopmall_soup04_2.jpg img/shopmall_img/shopmall_soup04_3.jpg','嚴選日式黑豬肉製成的高級清湯。','嚴選日式黑豬肉製成的高級清湯，越吃越感動會掉眼淚的那種。',1,'2023-01-07 11:47:55',NULL,'商城冷凍'),(72,9,'當季魚頭味噌湯',450,'img/shopmall_img/shopmall_soup05_1.jpg img/shopmall_img/shopmall_soup05_2.jpg img/shopmall_img/shopmall_soup05_3.jpg','嚴選當季魚頭來製作的魚頭味噌湯。','嚴選當季魚頭來製作的魚頭味噌湯，越吃越感動會掉眼淚的那種。',1,'2023-01-07 11:47:55',NULL,'商城冷凍'),(73,9,'季節魚頭湯',450,'img/shopmall_img/shopmall_soup06_1.jpg img/shopmall_img/shopmall_soup06_2.jpg img/shopmall_img/shopmall_soup06_3.jpg','嚴選當季魚頭來製作的魚頭湯。','嚴選當季魚頭來製作的魚頭湯，越吃越感動會掉眼淚的那種。',1,'2023-01-07 11:47:55',NULL,'商城冷凍'),(74,9,'鮮錦味噌湯',450,'img/shopmall_img/shopmall_soup07_1.jpg img/shopmall_img/shopmall_soup07_2.jpg img/shopmall_img/shopmall_soup07_3.jpg','嚴選當季海鮮鮮錦味噌湯。','嚴選當季海鮮鮮錦味噌湯，越吃越感動會掉眼淚的那種。',1,'2023-01-07 11:47:55',NULL,'商城冷凍'),(75,9,'日式綜合海陸湯',450,'img/shopmall_img/shopmall_soup08_1.jpg img/shopmall_img/shopmall_soup08_2.jpg img/shopmall_img/shopmall_soup08_3.jpg','嚴選當季海鮮及路上怕的動物製成的海陸湯。','嚴選當季海鮮及路上怕的動物製成的海陸湯，越吃越感動會掉眼淚的那種。',1,'2023-01-07 11:47:55',NULL,'商城冷凍'),(77,10,'草莓大福',250,'img/shopmall_img/shopmall_dessert03_1.jpg img/shopmall_img/shopmall_dessert03_2.jpg img/shopmall_img/shopmall_dessert03_3.jpg','嚴選上等草莓製成的大福。','嚴選上等草莓製成的大福，越吃越感動會掉眼淚的那種。',1,'2023-01-07 11:47:55',NULL,'商城冷凍'),(78,10,'日式銅鑼燒',250,'img/shopmall_img/shopmall_dessert04_1.jpg img/shopmall_img/shopmall_dessert04_2.jpg img/shopmall_img/shopmall_dessert04_3.jpg','嚴選上等紅豆製成的大福。','嚴選上等紅豆製成的大福，越吃越感動會掉眼淚的那種。',1,'2023-01-07 11:47:55',NULL,'商城冷凍'),(79,10,'奶油鯛魚燒',250,'img/shopmall_img/shopmall_dessert05_1.jpg img/shopmall_img/shopmall_dessert05_2.jpg img/shopmall_img/shopmall_dessert05_3.jpg','嚴選上等奶油製成的鯛魚燒。','嚴選上等奶油製成的鯛魚燒，越吃越感動會掉眼淚的那種。',1,'2023-01-07 11:47:55',NULL,'商城冷凍'),(80,10,'南瓜水羊羹',250,'img/shopmall_img/shopmall_dessert06_1.jpg img/shopmall_img/shopmall_dessert06_2.jpg img/shopmall_img/shopmall_dessert06_3.jpg','嚴選上等奶油製成的鯛魚燒。','嚴選上等奶油製成的鯛魚燒，越吃越感動會掉眼淚的那種。',1,'2023-01-07 11:47:55',NULL,'商城冷凍'),(81,10,'黑糖麻糬丁',250,'img/shopmall_img/shopmall_dessert07_1.jpg img/shopmall_img/shopmall_dessert07_2.jpg img/shopmall_img/shopmall_dessert07_3.jpg','嚴選上等黑糖製成的麻糬丁。','嚴選上等黑糖製成的麻糬丁，越吃越感動會掉眼淚的那種。',1,'2023-01-07 11:47:55',NULL,'商城冷凍'),(82,10,'卡士達珍珠鯛魚燒',250,'img/shopmall_img/shopmall_dessert08_1.jpg img/shopmall_img/shopmall_dessert08_2.jpg img/shopmall_img/shopmall_dessert08_3.jpg','嚴選上等卡士達製成的鯛魚燒。','嚴選上等卡士達製成的鯛魚燒，越吃越感動會掉眼淚的那種。',1,'2023-01-07 11:47:55',NULL,'商城冷凍'),(83,10,'日式湯種紅豆包',250,'img/shopmall_img/shopmall_dessert07_1.jpg img/shopmall_img/shopmall_dessert07_2.jpg img/shopmall_img/shopmall_dessert07_3.jpg','嚴選上等紅豆製成的紅豆包。','嚴選上等紅豆製成的紅豆包，越吃越感動會掉眼淚的那種。',0,'2023-01-07 19:47:55',NULL,'商城冷凍'),(84,11,'廚具',300,NULL,NULL,'盤子、餐具、餐巾(必選)',1,'2023-01-16 23:39:20',NULL,'私廚單點'),(85,11,'炊具',300,NULL,NULL,'鍋碗瓢盆(必選)',1,'2023-01-16 23:39:20',NULL,'私廚單點'),(86,11,'餐盤',400,NULL,NULL,'餐盤&拼盤',1,'2023-01-16 23:39:20',NULL,'私廚單點'),(87,11,'服務人員',500,NULL,NULL,'全程服務及售後清潔',1,'2023-01-16 23:39:20',NULL,'私廚單點');
/*!40000 ALTER TABLE `Dish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DishsType`
--

DROP TABLE IF EXISTS `DishsType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DishsType` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(20) NOT NULL COMMENT '預約:\n湯物,前菜,刺身,主食,甜點,飲品,單品\n商城:\n商城主食,商城湯品,商城甜品',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DishsType`
--

LOCK TABLES `DishsType` WRITE;
/*!40000 ALTER TABLE `DishsType` DISABLE KEYS */;
INSERT INTO `DishsType` VALUES (1,'湯物'),(2,'前菜'),(3,'刺身'),(4,'主食'),(5,'甜點'),(6,'飲品'),(7,'單品'),(8,'商城主食'),(9,'商城湯品'),(10,'商城甜品'),(11,'服務');
/*!40000 ALTER TABLE `DishsType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FavoriteLists`
--

DROP TABLE IF EXISTS `FavoriteLists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FavoriteLists` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DishID` int NOT NULL,
  `collectionTime` timestamp NOT NULL,
  `Member_ID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_favoriteList_Member1_idx` (`Member_ID`),
  KEY `FK_FavoriteList_DishID_idx` (`DishID`),
  CONSTRAINT `FK_FavoriteList_DishID` FOREIGN KEY (`DishID`) REFERENCES `Dish` (`ID`),
  CONSTRAINT `FK_FavoriteList_MemberID` FOREIGN KEY (`Member_ID`) REFERENCES `Member` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FavoriteLists`
--

LOCK TABLES `FavoriteLists` WRITE;
/*!40000 ALTER TABLE `FavoriteLists` DISABLE KEYS */;
INSERT INTO `FavoriteLists` VALUES (1,57,'2023-01-30 11:01:09',1),(2,83,'2023-01-30 11:01:09',1),(3,70,'2023-01-30 11:01:09',1),(4,75,'2023-01-30 11:01:09',1),(5,74,'2023-01-30 11:01:09',1),(6,66,'2023-01-30 11:01:09',2),(7,70,'2023-01-30 11:01:09',2),(8,75,'2023-01-30 11:01:09',2),(9,74,'2023-01-30 11:01:09',2),(10,83,'2023-01-30 11:01:09',2),(11,70,'2023-01-30 11:01:09',3),(12,75,'2023-01-30 11:01:09',3),(13,74,'2023-01-30 11:01:09',4),(14,83,'2023-01-30 11:01:09',4),(15,70,'2023-01-30 11:01:09',5),(16,75,'2023-01-30 11:01:09',5),(17,74,'2023-01-30 11:01:09',6),(18,83,'2023-01-30 11:01:09',7),(19,70,'2023-01-30 11:01:09',7),(20,75,'2023-01-30 11:01:09',7),(21,74,'2023-01-30 11:01:09',7),(22,83,'2023-01-30 11:01:09',8),(23,70,'2023-01-30 11:01:09',8),(24,75,'2023-01-30 11:01:09',8),(25,74,'2023-01-30 11:01:09',10),(26,83,'2023-01-30 11:01:09',10),(27,70,'2023-01-30 11:01:09',10),(28,75,'2023-01-30 11:01:09',10),(29,74,'2023-01-30 11:01:09',11),(30,60,'2023-01-30 11:01:09',12),(31,83,'2023-01-30 11:01:09',12),(32,70,'2023-01-30 11:01:09',13),(33,75,'2023-01-30 11:01:09',15),(34,74,'2023-01-30 11:01:09',15),(35,74,'2023-01-30 11:01:09',18),(36,83,'2023-01-30 11:01:09',18),(37,70,'2023-01-30 11:01:09',18);
/*!40000 ALTER TABLE `FavoriteLists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MallDetail`
--

DROP TABLE IF EXISTS `MallDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MallDetail` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `MallID` int NOT NULL,
  `qty` int NOT NULL,
  `price` int NOT NULL,
  `DishID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_MallDetail_MallID_idx` (`MallID`),
  KEY `FK_MallDetail_DishID_idx` (`DishID`),
  CONSTRAINT `FK_MallDetail_DishID` FOREIGN KEY (`DishID`) REFERENCES `Dish` (`ID`),
  CONSTRAINT `FK_MallDetail_MallID` FOREIGN KEY (`MallID`) REFERENCES `MallOrders` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MallDetail`
--

LOCK TABLES `MallDetail` WRITE;
/*!40000 ALTER TABLE `MallDetail` DISABLE KEYS */;
INSERT INTO `MallDetail` VALUES (1,1,1,700,57),(2,1,2,450,58),(3,1,3,300,59),(4,2,2,350,60),(5,2,1,250,64),(6,2,1,250,65),(7,2,1,300,69),(8,3,2,450,70),(9,3,1,300,61),(10,4,4,450,73),(11,5,2,450,58);
/*!40000 ALTER TABLE `MallDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MallOrders`
--

DROP TABLE IF EXISTS `MallOrders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MallOrders` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Date` timestamp NOT NULL,
  `State` varchar(10) NOT NULL,
  `Payment` varchar(10) NOT NULL,
  `TotalPrice` int NOT NULL,
  `Points` int DEFAULT '0',
  `Invoice` varchar(10) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Delivery` varchar(20) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `MemberID` int NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Phone` varchar(10) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_MallOreder_MemberID_idx` (`MemberID`),
  CONSTRAINT `FK_MallOreder_MemberID` FOREIGN KEY (`MemberID`) REFERENCES `Member` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MallOrders`
--

LOCK TABLES `MallOrders` WRITE;
/*!40000 ALTER TABLE `MallOrders` DISABLE KEYS */;
INSERT INTO `MallOrders` VALUES (1,'2022-12-23 12:10:00','訂單成立已付款','信用卡',2500,25,'GA03843214','abc123@gmail.com','宅配','台北市中山區建國北路一段96號B1',2,'蔡廷廷','0912345678'),(2,'2022-12-30 18:30:00','訂單成立已付款','信用卡',1500,0,'GB03591457','abc125@gmail.com','宅配','台北市松山區敦化北路100號B1',3,'厲硯山','0923345252'),(3,'2023-01-03 19:00:00','訂單成立已付款','信用卡',1200,500,'GA08761234','cba987@gmail.com','宅配','台北市松山區南京東路三段210巷4號2樓',5,'陳園元','0966796543'),(4,'2023-01-07 11:30:00','訂單成立已付款','信用卡',1800,150,'CA13572468','abc128@gmail.com','宅配','台北市萬華區貴陽街二段116號',6,'蔡雨停','0916345675'),(5,'2023-01-30 13:51:33','訂單成立已付款','信用卡',900,0,'GA08762222','abc123@gmail.com','宅配','台北市中山區八德路二段174巷5號',1,'管理員','0915111111');
/*!40000 ALTER TABLE `MallOrders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Member`
--

DROP TABLE IF EXISTS `Member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Member` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Email` varchar(50) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Name` varchar(20) DEFAULT NULL,
  `Phone` varchar(10) DEFAULT NULL,
  `BirthDate` date DEFAULT NULL,
  `Sex` varchar(5) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `multiLogin` varchar(45) DEFAULT NULL,
  `point` int DEFAULT '0',
  `Once` tinyint DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Member`
--

LOCK TABLES `Member` WRITE;
/*!40000 ALTER TABLE `Member` DISABLE KEYS */;
INSERT INTO `Member` VALUES (1,'abc123@gmail.com','abc123123','管理員','0915111111','1993-02-26','男','台北市中山區八德路二段174巷5號',NULL,7,1),(2,'abc124@gmail.com','abc123123','蔡樹均','0915531123','1993-02-26','男','台北市中山區八德路二段174巷5號',NULL,101,1),(3,'abc125@gmail.com','abc123123','厲硯山','0923345252','1995-07-16','男','台北市松山區敦化北路100號B1',NULL,100,1),(4,'abc126@gmail.com','abc123123','吳建置','0972567345','1992-05-04','男','台北市中山區建國北路一段74號',NULL,0,1),(5,'abc127@gmail.com','abc123123','張家麒','0912167652','1997-07-19','男','台北市松山區南京東路四段133巷4弄16號',NULL,400,0),(6,'abc128@gmail.com','abc123123','蔡雨停','0916345675','1996-05-29','女','台北市萬華區貴陽街二段116號',NULL,33,0),(7,'abc129@gmail.com','abc123123','李逸停','0916345675','1992-06-24','男','台北市中正區衡陽路74號',NULL,0,0),(8,'abc131@gmail.com','abc123123','蔡雨停','0913464375','1996-05-29','女','台北市大同區太原路48巷7號',NULL,22,0),(9,'abc132@gmail.com','abc123123','陳怡君','0911234575','1997-03-06','女','台北市大同區西寧北路43號',NULL,22,1),(10,'abc133@gmail.com','abc123123','張宇和','0911245675','1995-02-16','男','台北市中山區長春路176號',NULL,11,0),(11,'abc134@gmail.com','abc123123','黃家佳','0916123675','1999-05-12','男','台北市中正區仁愛路二段108號',NULL,199,1),(12,'abc135@gmail.com','abc123123','葉清芳','0916378978','1973-06-11','女','台北市大安區建國南路二段11巷28號',NULL,0,0),(13,'abc136@gmail.com','abc123123','張漢萬','0913245675','1984-04-15','男','台北市大安區忠孝東路三段10巷22號',NULL,2,0),(14,'abc128@gmail.com','abc123123','莊鈞一','0923457225','1993-07-19','女','台北市大安區安和路一段29-1號',NULL,444,1),(15,'abc129@gmail.com','abc123123','林停佳','0911363525','1984-08-29','女','台北市大安區光復南路308巷45號',NULL,1,1),(16,'abc130@gmail.com','abc123123',NULL,NULL,NULL,NULL,NULL,NULL,0,0),(17,'abc131@gmail.com','abc123123',NULL,NULL,NULL,NULL,NULL,NULL,0,0),(18,'abc132@gmail.com','abc123123',NULL,NULL,NULL,NULL,NULL,NULL,0,0);
/*!40000 ALTER TABLE `Member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MemberMsgs`
--

DROP TABLE IF EXISTS `MemberMsgs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MemberMsgs` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `pushlishedTime` timestamp NOT NULL,
  `state` tinyint(1) NOT NULL,
  `content` varchar(150) NOT NULL,
  `MemberID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_menber_msgs_Member_idx` (`MemberID`),
  CONSTRAINT `FK_menber_msgs_MemberID` FOREIGN KEY (`MemberID`) REFERENCES `Member` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MemberMsgs`
--

LOCK TABLES `MemberMsgs` WRITE;
/*!40000 ALTER TABLE `MemberMsgs` DISABLE KEYS */;
INSERT INTO `MemberMsgs` VALUES (1,'2023-01-16 22:57:24',0,'我可以不在網上下單嗎？',1),(2,'2023-01-16 22:57:24',0,'我可以不在網上下單嗎？',1),(3,'2023-01-16 22:57:24',0,'上門廚師服務有最低消費嗎',2),(4,'2023-01-16 22:57:24',0,'我可以怎樣付款？',4),(5,'2023-01-16 22:57:24',0,'我是否一定要用信用卡付款? 可以銀行轉賑或支票付款嗎?',2),(6,'2023-01-16 22:57:24',0,'我可以取消預訂並退款嗎？',5),(7,'2023-01-16 22:57:24',0,'我的廚房要有什麼準備？',1),(8,'2023-01-16 22:57:24',0,'怎樣寫評價？',3),(9,'2023-01-16 22:57:24',0,'我需要清理廚房嗎？',4),(10,'2023-01-16 22:57:24',0,'預訂確認後，我還可以更改嗎？',1);
/*!40000 ALTER TABLE `MemberMsgs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `News`
--

DROP TABLE IF EXISTS `News`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `News` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Category` varchar(10) NOT NULL,
  `Date` timestamp NOT NULL,
  `Title` varchar(50) NOT NULL,
  `Article` varchar(300) NOT NULL,
  `IMG` varchar(300) NOT NULL,
  `TIMG` varchar(300) DEFAULT NULL,
  `Condition` tinyint(1) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `News`
--

LOCK TABLES `News` WRITE;
/*!40000 ALTER TABLE `News` DISABLE KEYS */;
INSERT INTO `News` VALUES (1,'最新動態','2023-01-04 17:21:46','冬季暖心','鮟鱇魚富含膠原蛋白且低脂肪熱量，味道鮮甜淡雅，是健康又美味的海水魚，被譽為人間極品珍饈，其貌不揚，卻富含膠原蛋白且低脂肪低熱量，可美肌防老還極其鮮美，簡單的魚湯料理就可以完美呈現媲美龍蝦肉的鮮甜Q彈。','img/news_img/news_post1.jpg','img/news_img/news_articlepost1.jpg',0),(2,'限時優惠','2023-01-04 17:21:46','秋季限定料理','私覓主理人與多位摯友於1989年參加一場私廚派對，於派對中享用的鮮美食材仍深刻於心，多年後再度憶起來當年的感動，私覓主理人與專業團隊共同開發秋季限定料理，希望再次復刻最初的感動。以鰹魚為食，輔以柑橘類的柚子醬『ポン酢』調味，再加一點梅子提味，提升整體的層次感。秋天的味蕾－松茸ごはん（松茸飯）」，使用昆布高湯，並將松茸與其他像是銀杏果等食材一同放進炊飯器煮。而秋天更不能錯過柿子、水梨，私覓嚴選千葉縣水梨，於前菜至主食期望帶給預約私覓的顧客，能和私覓主理人一同回到1989年的秋天，體驗這份私藏的心意。','img/news_img/news_post2.jpg','img/news_img/news_articlepost2.jpg',1),(3,'聯名限定','2023-01-04 17:21:46','開幕消息','日式私廚料理進軍台灣！隨著私廚料理進駐的消息一曝光，可是讓人又驚又喜，是極限挑戰台灣人飲食習慣的開關。不僅可以吃到道地且新鮮味美的海鮮，期間限定的口味也都讓人期待，選用來自日本的竹筴魚，油脂量4%以上，肉質爽口不油膩，獨特的香氣，絕對是可遇不可求 的美味。這波私人饗宴都要吃個過癮！','img/news_img/news_post3.jpg','img/news_img/news_articlepost3.jpg',1),(4,'最新動態','2023-01-04 17:21:46','夏季限定料理','在炎熱夏季期間到來的「土用丑日」。吃鰻魚滋補身體是一種自古留下的風俗。然而，所謂的「土用」，指的是立春、立夏、立秋、立冬前季節交替之際。而今，鰻魚被視為土用丑日的儀式食物，但其實在原本的傳說中，說的是食用「u」開頭的食材能預防夏日疲勞症候群。例如，改善食慾不振和生津解渴的「梅干」（umeboshi）。此外，先人們也靠著食用從體內排熱的「瓜類」（uri）和容易消化的「烏龍麵」（udon）等食物來度過炎熱的夏日。有別於此的，則有食用蜆貝、泥鰍、牛蒡等「黑色食材」的習俗。這是來自於掌控丑對應方位（北方）的靈獸「玄武」所代表的黑色。','img/news_img/news_post4.jpg','img/news_img/news_articlepost4.jpg',1),(5,'限時優惠','2023-01-04 17:21:46','精選獺祭-精碾二割三分','旭酒造每年都會用23%的山田錦釀造幾個酒槽，但在幾年前曾有相當數量的二割三分因為達不到我們所要求的水準而降等，訂單的數量卻比前一年增加許多。雖然很遺憾釀造上的不順利，但也因客戶的支持而感動，只好將數量不多的二割三分盡量分配給各訂戶。','img/news_img/news_post5.jpg','img/news_img/news_articlepost5.jpg',1),(6,'最新動態','2023-01-04 17:21:46','2022年度優惠','私覓致力提供優質溫潤的私人料理，提供主顧暖心的服務，目前推出壽星優惠『秋蟹吃到飽饗宴』，即日起也推出３大優惠，包含「春酒尾牙」方案，滿20位送2位免費用餐、40位送4位免費用餐，以此類推；至多80位，加購一人$100享紅酒無限暢飲！','img/news_img/news_post6.jpg','img/news_img/news_articlepost6.jpg',1),(7,'最新動態','2023-01-05 01:21:46','聯名卡限量推出','即日起 ~ 2023/6/30，持私覓銀行《吉燕卡》至官網商城或私櫥預約消費，發票金額滿1,000元獨享『100元餐費折抵』，結帳時須使用私覓銀行《吉燕卡》，方可享折抵優惠，結帳完成後後恕無法後補退款。若有未盡事宜，私覓日本料理及私覓銀行保有解釋、修改、終止活動內容細節之權利。','img/news_img/news_post7.jpg','img/news_img/news_articlepost7.jpg',1),(8,'限時優惠','2023-01-05 01:21:46','海膽缺貨中','赤潮是一種藻華現象，是海洋災害的一種。指海洋中某些微小的浮游植物、原生動物或細菌，在一定的環境條件下突發性增殖和聚集，引發一定範圍和一段時間內產生水體變色的現象，由於赤潮現象發生，導致今年沒有海膽可買，各大餐廳菜單上也都少了海膽的影子，且隨著年底將迎來農曆新年，人氣的北海道海膽和鮭魚卵需求上升，恐怕都沒機會吃到，各大超市和餐廳都傳出缺貨情形。','img/news_img/news_post8.jpg','img/news_img/news_articlepost8.jpg',1),(9,'聯名限定','2023-01-05 01:21:46','三星主廚進駐','米其林三星主廚要進駐私覓私櫥了！日本米其林三星名廚雁杉力太郎攜手私覓主理人今（5）日宣布，聯合開發傳統與未來感結合的日料菜單。主理人表示，將在明年3月正式上餐！這史無前例的合作模式。將在美食領域中帶來全新的衝擊與刺激，進而激盪出更創新的進步，而期望這將會是私覓私櫥重要的里程碑。','img/news_img/news_post9.jpg','img/news_img/news_articlepost9.jpg',0),(10,'最新動態','2023-01-05 01:21:46','冬季限定料理','從松葉蟹（ズワイガニ）、帝王蟹（タラバガニ）、毛蟹（ケガニ）到花咲蟹（ハナサキガニ），冬天裡日本多數地方都吃到的螃蟹，又以北海道最有名。有螃蟹王國之稱的北海道，幾乎是各種類螃蟹的卸貨量都位居第一。私覓引進各類螃蟹不同的美味吃法，秋冬後推出全新菜單「螃蟹涮涮鍋」（かにしゃぶしゃぶ）。使用帝王蟹或松葉蟹，將生蟹腳浸入用昆布熬煮的高湯中來回川燙，當蟹肉變得有膨脹感時就是品味的最好時機。一般會佐柑橘醋醬汁食用，但即便是單吃也能品嚐出螃蟹原本的鮮甜。','img/news_img/news_post10.jpg','img/news_img/news_articlepost10.jpg',0),(11,'限時優惠','2023-01-05 01:21:46','(徵）日料開發專員','私覓集團 誠徵【研發中心-日料研發師傅】工作內容: 1.設計菜單、食材替代材研發、協助菜色ODM。 2.食材、烹飪技術、廚具設備研究。 3.菜譜設計與撰寫，菜色教學技轉。 4.菜色研發專案團隊廚藝Leader。 5.門店菜色抽檢與廚藝輔導。','img/news_img/news_post11.jpg','img/news_img/news_articlepost11.jpg',1),(12,'最新動態','2023-01-05 01:21:46','疫情解封慶','國際政經局勢不穩，又有通膨巨獸來襲隱憂，但完全不影響日料私櫥的熱情，在疫情解封後，不僅預約人潮再現，業績更大幅成長，幾乎回到疫情前水準。「這次不只是春燕到，而是喜鵲來了！」，「私櫥皆以兩個月的預約為主，為慶祝解封與知名品牌合作的限量版私覓熊公仔，因為只有20隻，所以預約早早就卡滿了。','img/news_img/news_post12.jpg','img/news_img/news_articlepost12.jpg',1),(13,'最新動態','2023-01-04 17:21:46','私櫥限定拍貼機','鮟鱇魚富含膠原蛋白且低脂肪熱量，味道鮮甜淡雅，是健康又美味的海水魚，被譽為人間極品珍饈，其貌不揚，卻富含膠原蛋白且低脂肪低熱量，可美肌防老還極其鮮美，簡單的魚湯料理就可以完美呈現媲美龍蝦肉的鮮甜Q彈。','img/news_img/news_post13.jpg','img/news_img/news_articlepost13.jpg',1),(14,'限時優惠','2023-01-04 17:21:46','主理人私房料理','私覓主理人與多位摯友於1989年參加一場私廚派對，於派對中享用的鮮美食材仍深刻於心，多年後再度憶起來當年的感動，私覓主理人與專業團隊共同開發秋季限定料理，希望再次復刻最初的感動。以鰹魚為食，輔以柑橘類的柚子醬『ポン酢』調味，再加一點梅子提味，提升整體的層次感。秋天的味蕾－松茸ごはん（松茸飯）」，使用昆布高湯，並將松茸與其他像是銀杏果等食材一同放進炊飯器煮。而秋天更不能錯過柿子、水梨，私覓嚴選千葉縣水梨，於前菜至主食期望帶給預約私覓的顧客，能和私覓主理人一同回到1989年的秋天，體驗這份私藏的心意。','img/news_img/news_post14.jpg','img/news_img/news_articlepost14.jpg',1),(15,'聯名限定','2023-01-04 17:21:46','日料新東方','日式私廚料理進軍台灣！隨著私廚料理進駐的消息一曝光，可是讓人又驚又喜，是極限挑戰台灣人飲食習慣的開關。不僅可以吃到道地且新鮮味美的海鮮，期間限定的口味也都讓人期待，選用來自日本的竹筴魚，油脂量4%以上，肉質爽口不油膩，獨特的香氣，絕對是可遇不可求 的美味。這波私人饗宴都要吃個過癮！','img/news_img/news_post15.jpg','img/news_img/news_articlepost15.jpg',0),(16,'最新動態','2023-01-04 17:21:46','聯名沐夏抹茶','在炎熱夏季期間到來的「土用丑日」。吃鰻魚滋補身體是一種自古留下的風俗。然而，所謂的「土用」，指的是立春、立夏、立秋、立冬前季節交替之際。而今，鰻魚被視為土用丑日的儀式食物，但其實在原本的傳說中，說的是食用「u」開頭的食材能預防夏日疲勞症候群。例如，改善食慾不振和生津解渴的「梅干」（umeboshi）。此外，先人們也靠著食用從體內排熱的「瓜類」（uri）和容易消化的「烏龍麵」（udon）等食物來度過炎熱的夏日。有別於此的，則有食用蜆貝、泥鰍、牛蒡等「黑色食材」的習俗。這是來自於掌控丑對應方位（北方）的靈獸「玄武」所代表的黑色。','img/news_img/news_post16.jpg','img/news_img/news_articlepost16.jpg',0),(17,'限時優惠','2023-01-04 17:21:46','商城全面啟動','旭酒造每年都會用23%的山田錦釀造幾個酒槽，但在幾年前曾有相當數量的二割三分因為達不到我們所要求的水準而降等，訂單的數量卻比前一年增加許多。雖然很遺憾釀造上的不順利，但也因客戶的支持而感動，只好將數量不多的二割三分盡量分配給各訂戶。','img/news_img/news_post17.jpg','img/news_img/news_articlepost17.jpg',1),(18,'最新動態','2023-01-04 17:21:46','滿額贈和菓子','私覓致力提供優質溫潤的私人料理，提供主顧暖心的服務，目前推出壽星優惠『秋蟹吃到飽饗宴』，即日起也推出３大優惠，包含「春酒尾牙」方案，滿20位送2位免費用餐、40位送4位免費用餐，以此類推；至多80位，加購一人$100享紅酒無限暢飲！','img/news_img/news_post18.jpg','img/news_img/news_articlepost18.jpg',1);
/*!40000 ALTER TABLE `News` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `AppointmentDate` date NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Count` int NOT NULL,
  `Condition` varchar(50) NOT NULL COMMENT '訂單封存, 訂單成立未付款\n訂單成立已付款,已完成售後服務',
  `Scheduled` varchar(10) NOT NULL COMMENT 'n預約時段\\n 11:00 ~ 14:00 午餐\n,\\n14:30 ~ 16:30, 下午茶\n\\n18:00 ~ 21:00\\ 晚餐\n',
  `Address` varchar(300) NOT NULL,
  `Date` timestamp NOT NULL,
  `TotalPrice` int NOT NULL,
  `notes` varchar(600) DEFAULT NULL,
  `point` int NOT NULL,
  `MemberID` int NOT NULL,
  `TeamID` int NOT NULL,
  `SetID` int NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Phone` varchar(10) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_PrivateOrders_Member1_idx` (`MemberID`),
  KEY `fk_Orders_Team1_idx` (`TeamID`),
  KEY `FK_Orders_SetID_idx` (`SetID`),
  CONSTRAINT `FK_Orders_MemberID` FOREIGN KEY (`MemberID`) REFERENCES `Member` (`ID`),
  CONSTRAINT `FK_Orders_SetID` FOREIGN KEY (`SetID`) REFERENCES `Sets` (`ID`),
  CONSTRAINT `FK_Orders_TeamID` FOREIGN KEY (`TeamID`) REFERENCES `Teams` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (1,'2023-01-05','超級管理員',5,'訂單封存','晚餐','台北市中山區八德路二段174巷5號8F','2023-01-18 09:43:39',40700,'測試資料格式吻合',33,1,2,2,'abc123@gmail.com','0988111111'),(2,'2023-01-05','黃金管理員',10,'已完成售後服務','午餐','台中擎天崗玉水路140號3F','2023-01-18 09:51:25',116540,'請問可以多一點餐點服務嗎?<br />\n例如可以取名XXX',100,1,3,3,'testgood@gmail','0921444222'),(3,'2023-01-25','吳建置',2,'已完成售後服務','下午茶','台北市中山區建國北路一段74號','2023-01-18 09:54:06',16940,'台北市中山區建國北路一段74號<br /><br />\n有點遠唷~~',0,4,3,2,'abc126@gmail.com','0972567345'),(4,'2023-01-27','蔡雨停',7,'已完成售後服務','午餐','台北市萬華區貴陽街二段116號','2023-01-18 10:01:13',62460,'訂單成立要花很多錢',3,14,3,2,'abc128@gmail.com','0916345675'),(5,'2023-01-31','傳說級管理員',12,'訂單成立已付款','下午茶','台中大都五感於井鳥','2023-01-18 10:05:21',82840,'希望有更多的服務，<br />\n更多優質商品與用餐體驗。',10,1,1,2,'tastesogoogle@gmail.com','0931321314'),(6,'2023-01-23','蔡樹均',1,'已完成售後服務','下午茶','台北市中山區八德路二段174巷5號','2023-01-18 10:12:33',7600,'我家有點遠  請問會有其他特別服務嗎?<br />\n我想要連辦三天三夜的宴客...',0,2,3,1,'erice360@gmail.com','0931232132'),(7,'2023-01-31','超級有錢管理員',12,'訂單成立已付款','晚餐','台北市萬華區貴陽街二段116號多金皇后鎮(停車旁邊)','2023-01-18 10:16:55',84320,'有烤肉服務嗎~~~~?',0,1,3,2,'soRich@ed.com','0912343284'),(8,'2023-03-13','管理員',4,'訂單成立已付款','下午茶','字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它','2023-01-18 10:24:15',47540,'字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它字述灌爆它',0,1,1,3,'testErrror','0932394192'),(9,'2023-01-20','厲硯山',11,'已完成售後服務','下午茶','台北市松山區敦化北路100號B1','2023-01-19 06:15:20',82980,'如果想支持我或想看更多多幕後周邊和我的生活私照的朋友們可以考慮加入”寬油幫“油管會員，點擊訂閱按鈕旁的加入按鈕會彈出詳情，會員福利如下：<br />\n1. 擁有“寬油幫”成長徽章<br />\n2. “寬油”社區動態，獨家生活私照和生活分享<br />\n3. 擁有更多留言被回复的機會',123,3,2,2,'abc125@gmail.com','0923345252'),(10,'2023-02-09','李逸停',6,'訂單成立已付款','午餐','台北市中正區衡陽路74號','2023-01-30 11:51:06',39900,'',1,15,2,2,'abc129@gmail.com','0916345675'),(11,'2023-01-17','張漢萬',3,'已完成售後服務','午餐','台北市大安區忠孝東路三段10巷22號','2023-01-30 14:59:46',20140,'請問有好喝的飲料吧嗎?!',2,13,1,2,'abc136@gmail.com','0913245675'),(12,'2023-01-17','黃家佳',11,'已完成售後服務','下午茶','台北市中正區仁愛路二段108號','2023-01-30 15:04:12',128700,'聚會地點請電洽作最後確認',0,11,2,3,'abc134@gmail.com','0916123675'),(13,'2023-01-17','蔡樹均',3,'訂單封存','下午茶','台北市中山區八德路二段174巷5號','2023-01-30 15:06:30',35900,'請問回饋點數可以現抵此這訂單嗎?',0,2,3,3,'abc124@gmail.com','0915531123'),(14,'2023-01-01','金瑞雪',2,'訂單成立已付款','午餐','台北市中山區八德路二段174巷5號','2023-01-30 15:19:25',14700,'請問有歡唱KTV嗎?如果有的話請向我報價格謝謝您',0,16,1,2,'recei123@gmail.com','0922384984'),(15,'2023-01-01','李逸停',7,'訂單成立已付款','午餐','台北市中正區衡陽路74號','2023-01-30 15:41:59',86040,'請問可宴會整天都舉辦嗎?<br />\n增加的費用可以電洽跟我講',0,15,2,3,'LeuTing@gmail.com','0916345675'),(16,'2023-01-01','丁夏于',12,'訂單成立已付款','午餐','桃園市新屋區九斗38號4樓','2023-01-30 15:46:41',60580,'',0,14,3,1,'roberts6412@gmail.com','0933762696'),(17,'2023-01-05','張家麒',4,'訂單成立已付款','午餐','台北市萬華區貴陽街二段116號','2023-01-30 15:49:15',49440,'',0,5,1,3,'CJE13460@gmail.com','0916345675'),(18,'2023-02-02','郭依倩',9,'訂單成立已付款','晚餐','臺中市北屯區竹坑巷67號10樓之4','2023-01-30 15:54:30',66260,'希望能專屬服侍人員在旁協助用餐禮儀',0,5,1,2,'trenton8008@hotmail.com','0987807364'),(19,'2023-02-02','梁棟然',12,'訂單成立已付款','午餐','花蓮縣吉安鄉吉安路５段51號8樓','2023-01-30 15:59:59',142080,'請問有特殊需求要撥通那些專線服務呢?',0,18,3,3,'gunter418@gmail.com','0933216273'),(20,'2023-01-25','王可業',4,'訂單成立已付款','午餐','臺北市士林區中山北路７段41號','2023-01-30 16:02:06',50320,'請問如果延期時間<br />\n會需要違約金嗎?',0,18,1,3,'ryder6096@gmail.com','0927485230'),(21,'2023-02-24','李曼瓊',2,'訂單成立已付款','午餐','桃園市桃園區陽明六街46號之2','2023-01-30 16:06:59',26540,'',0,18,1,3,'clyde1575@yahoo.com','0971508943'),(22,'2023-02-02','石志靜',3,'訂單成立已付款','晚餐','桃園市大溪區長興東街75號','2023-01-30 16:11:27',22200,'',0,18,2,2,'howard3376@gmail.com','0933199352'),(23,'2023-02-18','蔡樹均',5,'訂單成立已付款','下午茶','台北市中山區八德路二段174巷5號','2023-01-30 16:14:55',60580,'請問生魚片能否更換成其他餐點呢?',0,2,1,3,'spielberg8668@yahoo.com','0915531123'),(24,'2023-01-15','厲硯山',11,'訂單成立已付款','晚餐','台北市中山區建國北路一段74號','2023-01-30 16:20:19',131480,'請問有支援不同國系的菜色嗎?',177,3,1,3,'abc125@gmail.com','0923345252'),(25,'2023-01-25','吳建置',6,'訂單成立已付款','下午茶','台北市中山區建國北路一段74號','2023-01-30 16:24:07',43240,'有素食者可飲食的菜單嗎?',1,4,2,2,'velazquez5383@gmail.com','0972567345'),(26,'2023-02-18','葉清芳',6,'訂單成立已付款','下午茶','台北市大安區建國南路二段11巷28號','2023-01-30 16:27:07',75600,'請問假如要辦大型約三人的聚會請如何通報你們呢?',31,12,2,3,'abc135@gmail.com','0923231231'),(27,'2023-02-18','古園黛',10,'訂單成立已付款','下午茶','臺中市西屯區中平路43號','2023-01-30 16:35:14',51020,'請問如果有什麼特殊需求那費用該如何計算呢?',200,12,3,1,'sean3484@gmail.com','0933580657'),(28,'2023-02-15','蔡樹均',4,'訂單成立已付款','下午茶','高雄市橋頭區西林路光復巷51號','2023-01-30 16:38:37',48400,'我想加點大型烤乳豬餐點請用是否能提供嗎?',111,2,1,3,'abc124@gmail.com','0915531123'),(29,'2023-02-24','邱玉育',9,'訂單成立已付款','下午茶','桃園市中壢區龍安一街78號3樓','2023-01-30 16:40:48',108780,'',99,2,2,3,'megan7420@gmail.com','0968086096'),(30,'2023-02-15','張宇和',8,'訂單成立已付款','晚餐','台北市中山區長春路176號','2023-01-30 16:43:50',41820,'我還沒有確定套餐要什麼的話!?<br />\n能否電洽後再向我詢問一遍呢',0,10,2,1,'abc133@gmail.com','0911245675'),(31,'2023-02-24','蔡雨停',4,'訂單成立已付款','下午茶','台北市萬華區貴陽街二段116號','2023-01-30 17:00:32',23220,'',0,17,3,1,'abc128@gmail.com','0912167652'),(32,'2023-02-15','梁孝琛',1,'訂單成立已付款','下午茶','臺北市中山區濱江街51號之1七樓','2023-01-30 17:03:19',9700,'',0,17,3,2,'briggs9595@gmail.com','0970308638');
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrdersDetail`
--

DROP TABLE IF EXISTS `OrdersDetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrdersDetail` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `OrderID` int NOT NULL,
  `qty` int NOT NULL,
  `price` int NOT NULL,
  `DishID` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_OrderDetail_DishID_idx` (`DishID`),
  KEY `FK_OrderDetail_OrderID_idx` (`OrderID`),
  CONSTRAINT `FK_OrderDetail_DishID` FOREIGN KEY (`DishID`) REFERENCES `Dish` (`ID`),
  CONSTRAINT `FK_OrderDetail_OrderID` FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=683 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrdersDetail`
--

LOCK TABLES `OrdersDetail` WRITE;
/*!40000 ALTER TABLE `OrdersDetail` DISABLE KEYS */;
INSERT INTO `OrdersDetail` VALUES (1,1,3,0,18),(2,1,2,0,19),(3,1,2,0,20),(4,1,3,0,21),(5,1,5,0,22),(6,1,1,0,23),(7,1,2,0,24),(8,1,2,0,25),(9,1,1,0,26),(10,1,3,0,27),(11,1,1,0,28),(12,1,1,0,29),(13,1,1,0,30),(14,1,3,0,31),(15,1,2,500,48),(16,1,1,800,49),(17,1,2,800,50),(18,1,3,300,51),(19,1,2,240,52),(20,1,3,740,53),(21,1,4,300,56),(22,1,5,300,84),(23,1,5,300,85),(24,1,5,400,86),(25,1,5,500,87),(26,2,3,0,33),(27,2,7,0,34),(28,2,2,0,35),(29,2,8,0,36),(30,2,10,0,37),(31,2,5,0,38),(32,2,5,0,39),(33,2,1,0,41),(34,2,3,0,42),(35,2,6,0,43),(36,2,1,0,45),(37,2,2,0,46),(38,2,7,0,47),(39,2,1,500,48),(40,2,1,300,51),(41,2,1,240,52),(42,2,1,200,55),(43,2,1,300,56),(44,2,10,300,84),(45,2,10,300,85),(46,2,10,400,86),(47,2,10,500,87),(48,3,1,0,18),(49,3,1,0,19),(50,3,1,0,20),(51,3,1,0,21),(52,3,2,0,22),(53,3,1,0,23),(54,3,1,0,25),(55,3,1,0,27),(56,3,1,0,28),(57,3,1,0,30),(58,3,1,0,31),(59,3,1,800,49),(60,3,2,800,50),(61,3,3,300,51),(62,3,1,740,53),(63,3,1,500,54),(64,3,1,200,55),(65,3,2,300,84),(66,3,2,300,85),(67,3,2,500,87),(68,4,1,0,18),(69,4,6,0,19),(70,4,2,0,20),(71,4,5,0,21),(72,4,7,0,22),(73,4,2,0,23),(74,4,5,0,24),(75,4,1,0,26),(76,4,2,0,27),(77,4,4,0,28),(78,4,1,0,29),(79,4,1,0,30),(80,4,1,0,31),(81,4,4,0,32),(82,4,2,500,48),(83,4,2,800,49),(84,4,2,800,50),(85,4,2,240,52),(86,4,2,740,53),(87,4,36,300,56),(88,4,7,300,84),(89,4,7,300,85),(90,4,7,400,86),(91,4,7,500,87),(92,5,3,0,18),(93,5,9,0,19),(94,5,2,0,20),(95,5,10,0,21),(96,5,12,0,22),(97,5,4,0,24),(98,5,8,0,25),(99,5,2,0,26),(100,5,2,0,27),(101,5,8,0,28),(102,5,2,0,30),(103,5,3,0,31),(104,5,7,0,32),(105,5,2,800,49),(106,5,1,800,50),(107,5,1,300,51),(108,5,1,740,53),(109,5,2,500,54),(110,5,2,200,55),(111,5,12,300,84),(112,5,12,300,85),(113,5,12,400,86),(114,5,12,500,87),(115,6,1,0,1),(116,6,1,0,4),(117,6,1,0,5),(118,6,1,0,6),(119,6,1,0,9),(120,6,1,0,13),(121,6,1,500,48),(122,6,1,800,49),(123,6,1,800,50),(124,6,1,500,54),(125,6,1,200,55),(126,6,1,300,56),(127,6,1,300,84),(128,6,1,300,85),(129,6,1,400,86),(130,6,1,500,87),(131,7,4,0,18),(132,7,8,0,19),(133,7,2,0,20),(134,7,10,0,21),(135,7,12,0,22),(136,7,3,0,23),(137,7,2,0,24),(138,7,7,0,25),(139,7,2,0,26),(140,7,3,0,27),(141,7,7,0,28),(142,7,1,0,29),(143,7,1,0,30),(144,7,2,0,31),(145,7,8,0,32),(146,7,1,500,48),(147,7,2,800,49),(148,7,2,800,50),(149,7,2,300,51),(150,7,3,240,52),(151,7,2,200,55),(152,7,3,300,56),(153,7,12,300,84),(154,7,12,300,85),(155,7,12,400,86),(156,7,12,500,87),(157,8,2,0,33),(158,8,2,0,34),(159,8,2,0,35),(160,8,2,0,36),(161,8,4,0,37),(162,8,2,0,38),(163,8,1,0,39),(164,8,1,0,40),(165,8,2,0,41),(166,8,1,0,42),(167,8,1,0,43),(168,8,4,0,47),(169,8,2,800,49),(170,8,2,800,50),(171,8,1,740,53),(172,8,2,500,54),(173,8,1,200,55),(174,8,4,300,84),(175,8,4,300,85),(176,9,2,0,18),(177,9,9,0,19),(178,9,3,0,20),(179,9,8,0,21),(180,9,11,0,22),(181,9,2,0,23),(182,9,3,0,24),(183,9,6,0,25),(184,9,3,0,26),(185,9,3,0,27),(186,9,5,0,28),(187,9,2,0,29),(188,9,4,0,30),(189,9,3,0,31),(190,9,2,0,32),(191,9,2,800,49),(192,9,3,800,50),(193,9,4,300,51),(194,9,4,240,52),(195,9,3,740,53),(196,9,2,500,54),(197,9,6,200,55),(198,9,3,300,56),(199,9,11,300,84),(200,9,11,300,85),(201,9,11,400,86),(202,9,11,500,87),(203,10,2,0,18),(204,10,4,0,19),(205,10,1,0,20),(206,10,5,0,21),(207,10,6,0,22),(208,10,1,0,24),(209,10,5,0,25),(210,10,2,0,26),(211,10,4,0,27),(212,10,1,0,29),(213,10,1,0,30),(214,10,1,0,31),(215,10,3,0,32),(216,10,1,800,48),(217,10,2,300,49),(218,10,2,800,50),(219,10,1,300,51),(220,10,6,300,84),(221,10,6,300,85),(222,10,6,500,87),(223,11,2,0,18),(224,11,1,0,19),(225,11,2,0,20),(226,11,1,0,21),(227,11,3,0,22),(228,11,2,0,24),(229,11,1,0,25),(230,11,2,0,26),(231,11,1,0,27),(232,11,1,0,29),(233,11,1,0,31),(234,11,1,0,32),(235,11,1,800,48),(236,11,1,740,53),(237,11,1,300,56),(238,11,3,300,84),(239,11,3,300,85),(240,11,3,500,87),(241,12,11,0,33),(242,12,4,0,35),(243,12,7,0,36),(244,12,11,0,37),(245,12,2,0,38),(246,12,3,0,39),(247,12,6,0,40),(248,12,2,0,41),(249,12,2,0,42),(250,12,7,0,43),(251,12,2,0,44),(252,12,2,0,45),(253,12,2,0,46),(254,12,5,0,47),(255,12,1,800,48),(256,12,1,300,49),(257,12,1,800,50),(258,12,1,300,56),(259,12,11,300,84),(260,12,11,300,85),(261,12,11,400,86),(262,12,11,500,87),(263,13,3,0,33),(264,13,2,0,35),(265,13,1,0,36),(266,13,3,0,37),(267,13,2,0,38),(268,13,1,0,39),(269,13,1,0,41),(270,13,1,0,42),(271,13,1,0,43),(272,13,1,0,45),(273,13,1,0,46),(274,13,1,0,47),(275,13,1,800,48),(276,13,1,300,49),(277,13,1,300,56),(278,13,3,300,84),(279,13,3,300,85),(280,13,3,400,86),(281,13,3,500,87),(282,14,2,0,18),(283,14,2,0,20),(284,14,2,0,22),(285,14,1,0,23),(286,14,1,0,25),(287,14,1,0,26),(288,14,1,0,27),(289,14,1,0,31),(290,14,1,0,32),(291,14,2,300,49),(292,14,3,300,51),(293,14,1,200,55),(294,14,2,300,84),(295,14,2,300,85),(296,14,2,400,86),(297,14,2,500,87),(298,15,7,0,33),(299,15,3,0,35),(300,15,4,0,36),(301,15,7,0,37),(302,15,2,0,38),(303,15,2,0,39),(304,15,3,0,40),(305,15,3,0,41),(306,15,3,0,42),(307,15,1,0,43),(308,15,2,0,44),(309,15,2,0,45),(310,15,2,0,46),(311,15,1,0,47),(312,15,1,800,48),(313,15,1,300,49),(314,15,4,800,50),(315,15,1,740,53),(316,15,1,200,55),(317,15,1,300,56),(318,15,7,300,84),(319,15,7,300,85),(320,15,7,400,86),(321,15,7,500,87),(322,16,4,0,1),(323,16,8,0,2),(324,16,3,0,3),(325,16,9,0,4),(326,16,12,0,5),(327,16,2,0,7),(328,16,10,0,8),(329,16,5,0,9),(330,16,7,0,11),(331,16,2,0,12),(332,16,7,0,13),(333,16,1,0,14),(334,16,2,0,15),(335,16,2,800,48),(336,16,2,300,49),(337,16,2,800,50),(338,16,2,300,51),(339,16,2,740,53),(340,16,2,200,55),(341,16,1,300,56),(342,16,12,300,84),(343,16,12,300,85),(344,16,12,400,86),(345,16,12,500,87),(346,17,4,0,33),(347,17,2,0,35),(348,17,2,0,36),(349,17,4,0,37),(350,17,2,0,38),(351,17,1,0,39),(352,17,1,0,40),(353,17,2,0,41),(354,17,2,0,42),(355,17,1,0,44),(356,17,1,0,45),(357,17,1,0,46),(358,17,1,0,47),(359,17,2,800,48),(360,17,2,300,49),(361,17,1,300,51),(362,17,1,740,53),(363,17,1,200,55),(364,17,4,300,84),(365,17,4,300,85),(366,17,4,400,86),(367,17,4,500,87),(368,18,1,0,18),(369,18,8,0,19),(370,18,2,0,20),(371,18,7,0,21),(372,18,9,0,22),(373,18,2,0,23),(374,18,2,0,24),(375,18,5,0,25),(376,18,2,0,26),(377,18,7,0,27),(378,18,1,0,29),(379,18,2,0,30),(380,18,3,0,31),(381,18,3,0,32),(382,18,2,800,48),(383,18,2,300,49),(384,18,2,800,50),(385,18,4,740,53),(386,18,5,200,55),(387,18,9,300,84),(388,18,9,300,85),(389,18,9,400,86),(390,18,9,500,87),(391,19,12,0,33),(392,19,3,0,35),(393,19,9,0,36),(394,19,12,0,37),(395,19,2,0,38),(396,19,2,0,39),(397,19,8,0,40),(398,19,8,0,41),(399,19,2,0,42),(400,19,2,0,43),(401,19,3,0,44),(402,19,4,0,45),(403,19,2,0,46),(404,19,3,0,47),(405,19,2,800,50),(406,19,2,300,51),(407,19,2,740,53),(408,19,2,200,55),(409,19,12,300,84),(410,19,12,300,85),(411,19,12,400,86),(412,19,12,500,87),(413,20,4,0,33),(414,20,1,0,35),(415,20,3,0,36),(416,20,4,0,37),(417,20,2,0,38),(418,20,2,0,39),(419,20,2,0,41),(420,20,2,0,42),(421,20,1,0,44),(422,20,1,0,45),(423,20,1,0,46),(424,20,1,0,47),(425,20,1,800,48),(426,20,1,300,49),(427,20,1,800,50),(428,20,3,740,53),(429,20,1,200,55),(430,20,4,300,84),(431,20,4,300,85),(432,20,4,400,86),(433,20,4,500,87),(434,21,2,0,33),(435,21,1,0,35),(436,21,1,0,36),(437,21,2,0,37),(438,21,1,0,38),(439,21,1,0,39),(440,21,1,0,41),(441,21,1,0,42),(442,21,1,0,44),(443,21,1,0,46),(444,21,2,800,48),(445,21,2,300,49),(446,21,2,300,51),(447,21,1,740,53),(448,21,2,300,84),(449,21,2,300,85),(450,21,2,400,86),(451,21,2,500,87),(452,22,3,0,18),(453,22,2,0,20),(454,22,1,0,21),(455,22,3,0,22),(456,22,1,0,23),(457,22,1,0,24),(458,22,1,0,25),(459,22,2,0,26),(460,22,1,0,27),(461,22,1,0,29),(462,22,1,0,30),(463,22,1,0,31),(464,22,2,800,48),(465,22,1,800,50),(466,22,1,300,51),(467,22,3,300,84),(468,22,3,300,85),(469,22,3,400,86),(470,22,3,500,87),(471,23,5,0,33),(472,23,2,0,35),(473,23,3,0,36),(474,23,5,0,37),(475,23,2,0,38),(476,23,1,0,39),(477,23,2,0,40),(478,23,2,0,41),(479,23,1,0,42),(480,23,2,0,43),(481,23,1,0,44),(482,23,2,0,45),(483,23,1,0,46),(484,23,1,0,47),(485,23,1,800,48),(486,23,1,300,49),(487,23,2,740,53),(488,23,1,200,55),(489,23,1,300,56),(490,23,5,300,84),(491,23,5,300,85),(492,23,5,400,86),(493,23,5,500,87),(494,24,11,0,33),(495,24,4,0,35),(496,24,7,0,36),(497,24,11,0,37),(498,24,2,0,38),(499,24,2,0,39),(500,24,7,0,40),(501,24,2,0,41),(502,24,3,0,42),(503,24,6,0,43),(504,24,2,0,44),(505,24,3,0,45),(506,24,2,0,46),(507,24,4,0,47),(508,24,2,800,48),(509,24,2,300,49),(510,24,2,300,51),(511,24,2,740,53),(512,24,2,200,55),(513,24,1,300,56),(514,24,11,300,84),(515,24,11,300,85),(516,24,11,400,86),(517,24,11,500,87),(518,25,2,0,18),(519,25,4,0,19),(520,25,2,0,20),(521,25,4,0,21),(522,25,6,0,22),(523,25,2,0,23),(524,25,2,0,24),(525,25,2,0,25),(526,25,3,0,26),(527,25,3,0,27),(528,25,2,0,29),(529,25,2,0,30),(530,25,2,0,31),(531,25,2,800,48),(532,25,2,800,50),(533,25,1,300,51),(534,25,1,740,53),(535,25,6,300,84),(536,25,6,300,85),(537,25,6,400,86),(538,25,6,500,87),(539,26,6,0,33),(540,26,3,0,35),(541,26,3,0,36),(542,26,6,0,37),(543,26,3,0,38),(544,26,1,0,39),(545,26,2,0,40),(546,26,2,0,41),(547,26,3,0,42),(548,26,1,0,43),(549,26,2,0,44),(550,26,2,0,45),(551,26,1,0,46),(552,26,1,0,47),(553,26,2,800,48),(554,26,2,300,49),(555,26,2,800,50),(556,26,1,300,51),(557,26,2,200,55),(558,26,7,300,56),(559,26,6,300,84),(560,26,6,300,85),(561,26,6,400,86),(562,26,6,500,87),(563,27,2,0,1),(564,27,8,0,2),(565,27,3,0,3),(566,27,7,0,4),(567,27,10,0,5),(568,27,2,0,6),(569,27,2,0,7),(570,27,6,0,8),(571,27,5,0,9),(572,27,5,0,11),(573,27,2,0,12),(574,27,2,0,13),(575,27,2,0,14),(576,27,4,0,15),(577,27,2,800,48),(578,27,2,300,49),(579,27,2,800,50),(580,27,3,740,53),(581,27,10,300,84),(582,27,10,300,85),(583,27,10,400,86),(584,27,10,500,87),(585,28,4,0,33),(586,28,2,0,35),(587,28,2,0,36),(588,28,4,0,37),(589,28,2,0,38),(590,28,2,0,39),(591,28,1,0,41),(592,28,1,0,42),(593,28,2,0,43),(594,28,1,0,44),(595,28,1,0,45),(596,28,1,0,46),(597,28,1,0,47),(598,28,2,800,48),(599,28,2,300,49),(600,28,2,800,50),(601,28,2,300,51),(602,28,4,300,84),(603,28,4,300,85),(604,28,4,400,86),(605,29,9,0,33),(606,29,3,0,35),(607,29,6,0,36),(608,29,9,0,37),(609,29,2,0,38),(610,29,3,0,39),(611,29,4,0,40),(612,29,2,0,41),(613,29,2,0,42),(614,29,5,0,43),(615,29,2,0,44),(616,29,2,0,45),(617,29,3,0,46),(618,29,2,0,47),(619,29,2,800,48),(620,29,2,300,49),(621,29,2,800,50),(622,29,2,740,53),(623,29,9,300,84),(624,29,9,300,85),(625,29,9,400,86),(626,29,9,500,87),(627,30,6,0,1),(628,30,2,0,2),(629,30,2,0,3),(630,30,6,0,4),(631,30,8,0,5),(632,30,2,0,6),(633,30,3,0,7),(634,30,3,0,8),(635,30,1,0,9),(636,30,7,0,11),(637,30,2,0,12),(638,30,2,0,13),(639,30,3,0,14),(640,30,1,0,15),(641,30,1,800,48),(642,30,2,300,49),(643,30,2,800,50),(644,30,2,300,51),(645,30,3,740,53),(646,30,8,300,84),(647,30,8,300,85),(648,30,8,400,86),(649,30,8,500,87),(650,31,2,0,1),(651,31,2,0,2),(652,31,2,0,3),(653,31,2,0,4),(654,31,4,0,5),(655,31,3,0,6),(656,31,1,0,7),(657,31,2,0,9),(658,31,2,0,11),(659,31,1,0,12),(660,31,2,0,13),(661,31,1,0,14),(662,31,2,300,49),(663,31,3,800,50),(664,31,3,740,53),(665,31,4,300,84),(666,31,4,300,85),(667,31,4,400,86),(668,31,4,500,87),(669,32,1,0,18),(670,32,1,0,20),(671,32,1,0,22),(672,32,1,0,23),(673,32,1,0,27),(674,32,1,0,29),(675,32,2,800,48),(676,32,2,300,49),(677,32,2,300,51),(678,32,2,200,55),(679,32,1,300,84),(680,32,1,300,85),(681,32,1,400,86),(682,32,1,500,87);
/*!40000 ALTER TABLE `OrdersDetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `QA`
--

DROP TABLE IF EXISTS `QA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `QA` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ReleaseDate` date NOT NULL,
  `Category` varchar(10) NOT NULL,
  `QuestionContent` varchar(300) NOT NULL,
  `AnswerContent` varchar(300) NOT NULL,
  `Condition` tinyint(1) NOT NULL,
  `ModifyTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `QA`
--

LOCK TABLES `QA` WRITE;
/*!40000 ALTER TABLE `QA` DISABLE KEYS */;
INSERT INTO `QA` VALUES (1,'2023-01-05','預約流程','請問有限制用餐人數嗎？','沒有！一個人也可以享有專屬私廚服務唷',1,'2023-01-05 18:21:46'),(2,'2023-01-05','預約流程','請問有提供素食餐點嗎？','不好意思，目前暫無提供全素食餐點。',1,'2023-01-05 18:21:46'),(3,'2023-01-05','預約流程','請問廚師預約的時段有哪些呢？','預約流程中會顯示廚師們可預約的時段，透過行事曆也可以查看目前廚師們的空檔唷！',1,'2023-01-05 18:21:46'),(4,'2023-01-05','預約流程','請問提供租借服務有要加選什麼項目呢？','全額退款的最晚取消為當日到府服務的15天前（不含服務當天）10-14天內取消預約則退款70%不足10天則不予退款。(如欲政府發佈之天災狀況不在以上限制，可延期一次）',1,'2023-01-05 18:21:46'),(5,'2023-01-05','預約流程','請問可以預約半年後嗎？','目前僅開放當月及隔月的預約系統，如有特殊需求請透過聯繫我們洽詢呦',1,'2023-01-05 18:21:46'),(6,'2023-01-05','付款問題','請問可以分期付款嗎？','使用國泰世華銀行付款最高提供6期零利率！',1,'2023-01-05 18:21:46'),(7,'2023-01-05','付款問題','請問刷卡有優惠嗎？','使用國泰世華銀行付款，享5%紅利回饋，5人以上預約並享有春饗干貝/羔羊饗宴/思饗牛小排三擇一招待！',1,'2023-01-05 18:21:46'),(8,'2023-01-05','付款問題','請問預約付款期限？','收款帳號爲系統生成，在預約成立後會寄出付款信函，並提醒付款期限，通常爲3天時效',1,'2023-01-05 18:21:46'),(9,'2023-01-05','付款問題','請問忘記付款怎麼辦？','目前暫無提供重新付款系統，如遇該狀況再煩請重新下單謝謝！',1,'2023-01-05 18:21:46'),(10,'2023-01-05','付款問題','請問付款後想取消有期限嗎？','全額退款的最晚取消為當日到府服務的15天前（不含服務當天）10-14天內取消預約則退款70%不足10天則不予退款。(如欲政府發佈之天災狀況不在以上限制，可延期一次）',1,'2023-01-05 18:21:46'),(11,'2023-01-05','租借服務','請問租借的風格可以挑選嗎？','我們廚具皆與Crate&barrel品牌合作，皆是品質與風格保證的！可放心使用。',1,'2023-01-05 18:21:46'),(12,'2023-01-05','租借服務','請問可以超租嗎？','由於私廚服務以人頭計算，餐具份量也會依據訂餐人數做準備，如若需增加人數，請私訊客服協助修改訂單，謝謝。',1,'2023-01-05 18:21:46'),(13,'2023-01-05','租借服務','請問可以不要租借嗎？','訂單本身會包含租借Crate&barrel品牌合作的餐炊廚具，爲求維持私廚等級的服務品質，暫不提供取消服務，謝謝。',1,'2023-01-05 18:21:46'),(14,'2023-01-05','租借服務','請問租借服務有含餐具外的裝飾品嗎？','訂單僅含Crate&barrel品牌合作的餐炊廚具，其餘的需要麻煩客人自行準備唷！',1,'2023-01-05 18:21:46'),(15,'2023-01-05','租借服務','請問有場地租借服務嗎？','場地租借服務目前正在規劃中，敬請期待！',1,'2023-01-05 18:21:46');
/*!40000 ALTER TABLE `QA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sets`
--

DROP TABLE IF EXISTS `Sets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sets` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SetPrice` int NOT NULL,
  `SetName` varchar(50) NOT NULL,
  `IMG` varchar(200) NOT NULL,
  `IntroIMG` varchar(500) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sets`
--

LOCK TABLES `Sets` WRITE;
/*!40000 ALTER TABLE `Sets` DISABLE KEYS */;
INSERT INTO `Sets` VALUES (1,3000,'名物 私套餐','img/reserve_img/reserve_set01.jpg','私覓帶你窺視日式廚藝的精妙，彷如遊歷日本美食之旅」為概念，匯集各式具代表性的料理，如壽司、生魚片、海鮮、燒烤、小缽、天婦羅、土瓶蒸、和菓子等，提供在優雅的日式氛圍中自在品嘗道地精緻和食。'),(2,5000,'極上 會席套餐','img/reserve_img/reserve_set02.jpg','以日式料亭的細膩手藝，一刀、一握、一杓為您烹調，體驗「先付、造身、壽司、揚物、烤物、炊合、食事」等演繹的12類主題、感受來自和風的料理與溫度。'),(3,10000,'苑 春堂套餐','img/reserve_img/reserve_set03.jpg','苑 春堂喻意春日裡的花園，如日式庭院般的百盤。彷如聽見富士山河間那潺潺的流水聲，從鮮嫩多汁的富山白蝦，並搭配濃郁的抹茶香與鮮香干貝，並在極具日本職人、製菓文化的甜品-和菓子中，感受到府私廚的浪漫');
/*!40000 ALTER TABLE `Sets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Teams`
--

DROP TABLE IF EXISTS `Teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Teams` (
  `ID` int NOT NULL,
  `team` char(1) NOT NULL,
  `LederName` varchar(50) NOT NULL,
  `LederProfile` varchar(300) NOT NULL,
  `IMG` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Teams`
--

LOCK TABLES `Teams` WRITE;
/*!40000 ALTER TABLE `Teams` DISABLE KEYS */;
INSERT INTO `Teams` VALUES (1,'A','厲燕山','人稱，平成末的日式料理專家\r，在冷熱料理中輕鬆切換，變化中不失和諧感\r，經典懷石風味的割烹料理彷如露天寫生一般\r，充滿藝術的氣息，一口一口的念念不忘，\r打斷你對日式料理的初想，給你獨一無二的念想。','img/chefteam_img/chef1.png'),(2,'B','菜雨停','秉持面對食材一心一意的嚴謹，翻轉著日系傳統經典的菜色與形式，加入過去師承的日式料理及兒時記憶中的懷舊滋味，細膩原味的正統和食，用心款待的感動時刻，讓每位客人，在最後都能帶著幸福、滿足的笑容離開。','img/chefteam_img/chef2.png'),(3,'C','吳薦痣','美味來自看不見的細節，料理人們日日嚴守和食之道，展現在對每道菜餚背後的細節與堅持，近百道和食料理，感受來自季節的風土與料理的溫度，全心傾注在這一份華麗、精緻、豪邁又平價的天丼料理中。','img/chefteam_img/chef3.png');
/*!40000 ALTER TABLE `Teams` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-31  1:49:51
