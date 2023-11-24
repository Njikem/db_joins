-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: db_warmup_join
-- ------------------------------------------------------
-- Server version	5.5.5-10.6.13-MariaDB

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned DEFAULT NULL,
  `account_number` int(10) unsigned DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `created_at` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_un` (`account_number`),
  CONSTRAINT `account_FK` FOREIGN KEY (`id`) REFERENCES `client` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `account_check` CHECK (`type` = 'saving' or `type` = 'chequing' or `type` = 'investing')
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,5,55665,'saving','1998-11-12'),(2,7,55885,'investing','2022-03-12'),(3,8,55995,'saving','2023-021-06'),(4,6,55775,'chequing','2021-10-12'),(5,9,55105,'chequing','2019-01-108');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `joined_on` varchar(100) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Maurice','2020-12-10','780-245-1203','123 fake address'),(2,'Annete','2021-12-10','780-305-1212','124 fake address'),(3,'Clau','2020-12-10','780-845-1303','125 fake address'),(4,'Nunti','2020-12-10','780-235-2203','126 fake address'),(5,'Amos','2020-12-10','780-105-1003','127 fake address');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned DEFAULT NULL,
  `account_id` int(10) unsigned DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `amount` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transaction_FK` (`client_id`),
  KEY `transaction_FK_1` (`account_id`),
  CONSTRAINT `transaction_FK` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `transaction_FK_1` FOREIGN KEY (`account_id`) REFERENCES `account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `transaction_check` CHECK (`type` = 'Deposit' or `type` = 'Withdrawl')
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (3,2,3,'Deposit','2010-01-06 01:00:02',200),(4,5,2,'Withdrawl','2003-00-00 06:00:00',300),(5,3,1,'Deposit','2011-00-00 11:00:01',400),(6,4,5,'Withdrawl','2021-10-11 08:00:05',500),(7,1,4,'Deposit','2019-05-09 10:00:03',1200);
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_warmup_join'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-24 13:06:58



insert into client(name, joined_on, phone_number, address) values('Maurice', '2020-12-10', '780-245-1203', '123 fake address');
insert into client(name, joined_on, phone_number, address) values('Annete', '2021-12-10', '780-305-1212', '124 fake address');
insert into client(name, joined_on, phone_number, address) values('Clau', '2020-12-10', '780-845-1303', '125 fake address');
insert into client(name, joined_on, phone_number, address) values('Nunti', '2020-12-10', '780-235-2203', '126 fake address');
insert into client(name, joined_on, phone_number, address) values('Amos', '2020-12-10', '780-105-1003', '127 fake address');


insert into account(client_id, account_number, type, created_at) values(5, 55665, 'saving', '1998-11-12');
insert into account(client_id, account_number, type, created_at) values(6, 55775, 'chequing', '2021-10-12');
insert into account(client_id, account_number, type, created_at) values(7, 55885, 'investing', '2022-03-12');
insert into account(client_id, account_number, type, created_at) values(8, 55995, 'saving', '2023-021-06');
insert into account(client_id, account_number, type, created_at) values(9, 55105, 'chequing', '2019-01-108');

insert into transaction(client_id, account_id, type, timestamp, amount) values(2, 3, 'Deposit', '2010-01-06 01:00:02', 200);
insert into transaction(client_id, account_id, type, timestamp, amount) values(5, 2, 'Withdrawl', '2003-00-00 06:00:00', 300);
insert into transaction(client_id, account_id, type, timestamp, amount) values(3, 1, 'Deposit', '2011-00-00 11:00:01', 400);
insert into transaction(client_id, account_id, type, timestamp, amount) values(4, 5, 'Withdrawl', '2021-10-11 08:00:05', 500);
insert into transaction(client_id, account_id, type, timestamp, amount) values(1, 4, 'Deposit', '2019-05-09 10:00:03', 600);


select client.name, account.account_number, account.type from client inner join account on client.id = account.client_id;

select account.account_number, transaction.timestamp, transaction.amount from account inner join transaction on account.id = transaction.account_id where transaction.type ='chequing' and transaction.amount>=1000;

select client.name, account.account_number, transaction.amount from client inner join account on client.id = account.client_id inner join transaction on account.id = transaction.account_id where transaction.type = 'investing' and client.id =5;

