-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: suuuiv20
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `client_client_info`
--

DROP TABLE IF EXISTS `client_client_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_client_info` (
  `client_value` varchar(100) NOT NULL,
  `id_column_name` int NOT NULL,
  `client_id` int NOT NULL,
  PRIMARY KEY (`id_column_name`,`client_id`),
  KEY `relation_18` (`client_id`),
  CONSTRAINT `relation_17` FOREIGN KEY (`id_column_name`) REFERENCES `client_info` (`id_column_name`) ON DELETE CASCADE,
  CONSTRAINT `relation_18` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_client_info`
--

LOCK TABLES `client_client_info` WRITE;
/*!40000 ALTER TABLE `client_client_info` DISABLE KEYS */;
INSERT INTO `client_client_info` VALUES ('Александр',1,1),('Илья',1,2),('Сиин',1,3),('Максим',1,4),('Максим',1,10),('Бурла',1,11),('Василий',1,12),('Василий',1,13),('Виктор',1,14),('Пособило',2,1),('Воронов',2,2),('Сиинов',2,3),('Безруков',2,4),('Стрельцов',2,10),('Эстель',2,11),('Пупкин',2,12),('Рулем',2,13),('Костырин',2,14),('Владимирович',3,1),('Алексеевич',3,2),('Сиинович',3,3),('Витальевич',3,4),('Дмитриевич',3,10),('Паскалевна',3,11),('Иванович',3,12),('Олегович',3,13),('Алексеевич',3,14),('+79771413078',4,1),('88005553535',4,2),('89004444241',4,3),('+7988131272',4,4),('89253452056',4,10),('89651983139',4,11),('89258719201',4,12),('89771032289',4,13),('89771032286',4,14),('Анохина 30',5,1),('Полянка 16',5,2),('Большая Серпуховская 12',5,3),('Выхино 34',5,4),('усиевича 500',5,10),('район аэропорт',5,11),('красногорск',5,12),('химки',5,13),('камышин',5,14),('max2003-02@mail.ru',6,10),('peachjardin@yandex.ru',6,11),('222@mail.ru',6,12),('333@mail.ru',6,13),('33513@mail.ru',6,14),('почта клиента: sanchezzz1307@gmail.com',7,1),('ориентация: вроде натурал',7,2),('Национальность: еврей',7,3),('Примичание: неадекватный',7,4),('топовый)',7,10),('райская',7,11),('норм',7,12),('крут',7,13),('член команды)',7,14),('15.12.2002',8,1),('05.12.2002',8,2),('12.09.2002',8,3),('14.04.2003',8,4),('',8,10),('19.08.2003',8,11),('09.03.2010',8,12),('05.09.2001',8,13),('24.04.2003',8,14);
/*!40000 ALTER TABLE `client_client_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-27 10:56:37
