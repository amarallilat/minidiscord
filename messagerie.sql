-- MariaDB dump 10.19  Distrib 10.6.11-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: messagerie
-- ------------------------------------------------------
-- Server version	10.6.11-MariaDB-0ubuntu0.22.04.1

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
-- Current Database: `messagerie`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `messagerie` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `messagerie`;

--
-- Table structure for table `groupe`
--

DROP TABLE IF EXISTS `groupe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groupe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(300) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupe`
--

LOCK TABLES `groupe` WRITE;
/*!40000 ALTER TABLE `groupe` DISABLE KEYS */;
INSERT INTO `groupe` VALUES (1,'groupe');
/*!40000 ALTER TABLE `groupe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contenu` text NOT NULL,
  `id_expediteur` int(11) NOT NULL,
  `id_recepteur` int(11) DEFAULT NULL,
  `heure` datetime NOT NULL DEFAULT current_timestamp(),
  `id_groupe` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `message_FK` (`id_expediteur`),
  KEY `message_FK_1` (`id_recepteur`),
  CONSTRAINT `message_FK` FOREIGN KEY (`id_expediteur`) REFERENCES `utilisateur` (`id`),
  CONSTRAINT `message_FK_1` FOREIGN KEY (`id_recepteur`) REFERENCES `utilisateur` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,'Bonjour amar, comment ça va?',1,2,'2022-11-02 16:58:04',NULL),(2,'cc',3,1,'2022-11-02 16:59:50',NULL),(3,'SAmoussa, zakaria me reponds pas?',3,4,'2022-11-02 17:00:55',NULL),(4,'Je ne sais pas',4,3,'2022-11-02 17:01:22',NULL),(5,'fatma elle deuh',1,5,'2022-11-02 17:16:38',NULL),(9,'bonjour a tous',2,NULL,'2022-11-02 17:44:43',NULL),(10,'bonjour a tous aaaaaaa',1,NULL,'2022-11-07 15:34:46',NULL),(11,'bnjr',3,NULL,'2022-11-07 15:46:24',NULL),(12,'Bonjour a tout le monde',2,NULL,'2022-11-09 13:10:12',NULL),(15,'bonjour fatma',2,3,'2022-11-02 17:44:43',NULL),(24,'fatma',2,NULL,'2022-11-15 13:11:48',NULL),(48,'slt',3,NULL,'2022-11-16 15:03:10',NULL),(50,'buenos dias',3,NULL,'2022-11-16 15:05:25',NULL),(51,'me hablo espagnol',3,NULL,'2022-11-16 15:06:29',NULL),(55,'booooooooooooooooooooonjouuuuuuuuuuuuuuuuuuuuuuuuur',3,NULL,'2022-11-16 15:11:18',NULL),(56,'auuuuuuuuuu reeeeeeeeeeeeeevoooooiiiiiiiiiiirrr',3,NULL,'2022-11-16 15:11:28',NULL),(59,'&#128528;',2,NULL,'2022-11-16 15:17:18',NULL),(60,'&#128528;',2,NULL,'2022-11-16 15:17:32',NULL),(61,'&#128528',2,NULL,'2022-11-16 15:17:57',NULL),(98,'vu...',2,3,'2022-11-17 15:32:43',NULL),(99,'repon un peu',2,3,'2022-11-17 15:33:03',NULL),(121,'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',3,NULL,'2022-11-18 13:11:11',NULL),(122,'bonjour',2,NULL,'2022-11-18 14:30:48',NULL),(123,'bonjour',2,5,'2022-11-18 14:31:16',NULL),(124,'bonjour',5,2,'2022-11-18 14:31:44',NULL),(127,'jjdjdjh',1,1,'2022-11-18 14:53:41',NULL),(128,'BONJOUR',5,NULL,'2022-11-18 15:06:21',NULL),(129,'jeeçufezç',2,NULL,'2022-11-18 15:06:39',NULL),(130,'Bonjour oui ça va et toi',2,1,'2022-11-18 15:07:03',NULL),(131,'yszydz',2,1,'2022-11-18 15:09:27',NULL),(132,'ayydydy',2,1,'2022-11-18 15:09:40',NULL),(133,'è_zdfay_çdèza',2,1,'2022-11-18 15:13:28',NULL),(134,'aaaaaaaaaaaa',2,1,'2022-11-18 15:14:14',NULL),(135,'aaaaaaaaaaaaaaa',2,1,'2022-11-18 15:14:15',NULL),(136,'aaaaaaaaaaaaaaa',2,1,'2022-11-18 15:14:16',NULL),(137,'aaaaaaaaaaaaaaaaaaaaa',2,1,'2022-11-18 15:14:19',NULL),(138,'aaaaaaaaaaaaaaaaaa',2,1,'2022-11-18 15:14:20',NULL),(139,'gian',2,NULL,'2022-11-18 15:19:38',NULL),(140,'aahahaha',2,3,'2022-11-18 15:19:48',NULL),(141,'dhdhaa',3,2,'2022-11-18 15:20:29',NULL),(142,'ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff',2,NULL,'2022-11-21 20:30:33',NULL),(143,'fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff fffffffffffffffffffffffffffffffffffffffffffffffff',2,NULL,'2022-11-21 20:32:21',NULL),(144,'Lorem ipsum dolor, sit amet consectetur adipisicing elit. Qui voluptate tempore ratione? Soluta delectus voluptatem fugiat et vitae alias natus quisquam dignissimos mollitia inventore, nostrum, aliquam consectetur doloremque dolor repudiandae.',2,NULL,'2022-11-21 20:34:33',NULL),(145,'t ou',3,6,'2022-11-22 15:50:46',NULL),(146,'dvsiojlkjdsvqjvds',2,6,'2022-11-29 13:40:57',NULL),(147,'bvdiffifuid',6,NULL,'2022-12-05 14:44:25',NULL),(148,'',6,NULL,'2022-12-05 14:44:25',NULL),(149,'buàipuud',6,NULL,'2022-12-05 14:44:26',NULL),(150,'aaaaaaaaaaaaaaaaa',6,NULL,'2022-12-05 14:44:32',NULL),(151,'jaime luffi ',6,NULL,'2022-12-05 14:44:36',NULL),(152,'je de',6,NULL,'2022-12-05 14:44:42',NULL),(153,'jv fhoduijwn',2,6,'2022-12-05 17:09:14',NULL),(154,'',2,NULL,'2022-12-09 14:29:55',NULL),(155,'',2,NULL,'2022-12-09 14:29:56',NULL),(156,'',2,NULL,'2022-12-09 14:42:58',NULL),(157,'',2,NULL,'2022-12-09 14:46:06',NULL);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `email` varchar(400) NOT NULL,
  `password` varchar(400) NOT NULL,
  `avatar` varchar(400) NOT NULL DEFAULT 'defaut.jpg',
  `pseudo` varchar(400) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur`
--

LOCK TABLES `utilisateur` WRITE;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
INSERT INTO `utilisateur` VALUES (1,'Hanafi','Zakaria','zakaria@hanafi.fr','123','zakarialogo.gif','zakaria213'),(2,'Allilat','Amar','amar@allilat.fr','123','amar.jpeg','amar144'),(3,'بودبوس','فاطمة','fatma@bou.fr','123','fatma1.jpg','fatma216'),(4,'Soumsa','Kwami','soumsa@kwami.com','123','index.jpeg','kwami228'),(5,'Illoul','Amine','amine@illoul.fr','123','amine.jpeg','amine33'),(6,'Idrismoussa','Abdousalam','idrismoussa@abdousalam.fr','123','abdou.jpg','saviola'),(7,'aaa','aaaaa','iiiii@djdj.fr','123','defaut.jpg','oueoueoue'),(8,'aaaa','aaaaaa','oooo@ffff.fr','123','defaut.jpg','aaaaaaaaa'),(9,'gagnieux','virgil','virgil@grave.fr','$2y$10$91fL8zZrY5v7Dy1AQhts2.NVp7JS4IIuD/obAu5Qzx6q3D.f3VR96','defaut.jpg','virgil213');
/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateur_groupe`
--

DROP TABLE IF EXISTS `utilisateur_groupe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utilisateur_groupe` (
  `id_utilisateur` int(11) NOT NULL,
  `id_groupe` int(11) NOT NULL,
  KEY `utilisateur_groupe_FK` (`id_utilisateur`),
  KEY `utilisateur_groupe_FK_1` (`id_groupe`),
  CONSTRAINT `utilisateur_groupe_FK` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id`),
  CONSTRAINT `utilisateur_groupe_FK_1` FOREIGN KEY (`id_groupe`) REFERENCES `groupe` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur_groupe`
--

LOCK TABLES `utilisateur_groupe` WRITE;
/*!40000 ALTER TABLE `utilisateur_groupe` DISABLE KEYS */;
/*!40000 ALTER TABLE `utilisateur_groupe` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-09 17:05:11
