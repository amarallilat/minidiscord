-- MariaDB dump 10.19  Distrib 10.6.7-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: messagerie
-- ------------------------------------------------------
-- Server version	10.6.7-MariaDB-2ubuntu1.1

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

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `messagerie` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `messagerie`;

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
  PRIMARY KEY (`id`),
  KEY `message_FK` (`id_expediteur`),
  KEY `message_FK_1` (`id_recepteur`),
  CONSTRAINT `message_FK` FOREIGN KEY (`id_expediteur`) REFERENCES `utilisateur` (`id`),
  CONSTRAINT `message_FK_1` FOREIGN KEY (`id_recepteur`) REFERENCES `utilisateur` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,'Bonjour amar, comment ça va?',1,2,'2022-11-02 16:58:04'),(2,'cc',3,1,'2022-11-02 16:59:50'),(3,'SAmoussa, zakaria me reponds pas?',3,4,'2022-11-02 17:00:55'),(4,'Je ne sais pas',4,3,'2022-11-02 17:01:22'),(5,'fatma elle deuh',1,5,'2022-11-02 17:16:38'),(9,'bonjour a tous',2,NULL,'2022-11-02 17:44:43'),(10,'bonjour a tous aaaaaaa',1,NULL,'2022-11-07 15:34:46'),(11,'bnjr',3,NULL,'2022-11-07 15:46:24'),(12,'Bonjour a tout le monde',2,NULL,'2022-11-09 13:10:12'),(15,'bonjour fatma',2,3,'2022-11-02 17:44:43'),(24,'fatma',2,NULL,'2022-11-15 13:11:48'),(48,'slt',3,NULL,'2022-11-16 15:03:10'),(50,'buenos dias',3,NULL,'2022-11-16 15:05:25'),(51,'me hablo espagnol',3,NULL,'2022-11-16 15:06:29'),(55,'booooooooooooooooooooonjouuuuuuuuuuuuuuuuuuuuuuuuur',3,NULL,'2022-11-16 15:11:18'),(56,'auuuuuuuuuu reeeeeeeeeeeeeevoooooiiiiiiiiiiirrr',3,NULL,'2022-11-16 15:11:28'),(59,'&#128528;',2,NULL,'2022-11-16 15:17:18'),(60,'&#128528;',2,NULL,'2022-11-16 15:17:32'),(61,'&#128528',2,NULL,'2022-11-16 15:17:57'),(98,'vu...',2,3,'2022-11-17 15:32:43'),(99,'repon un peu',2,3,'2022-11-17 15:33:03');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur`
--

LOCK TABLES `utilisateur` WRITE;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
INSERT INTO `utilisateur` VALUES (1,'Hanafi','Zakaria','zakaria@hanafi.fr','123','zakarialogo.gif','zakaria213'),(2,'Allilat','Amar','amar@allilat.fr','123','amar.jpeg','amar144'),(3,'بودبوس','فاطمة','fatma@bou.fr','123','fatma.jpg','fatma216'),(4,'Soumsa','Kwami','soumsa@kwami.com','123','index.jpeg','kwami228'),(5,'Illoul','Amine','amine@illoul.fr','123','amine.jpeg','amine33'),(6,'Idrismoussa','Abdousalam','idrismoussa@abdousalam.fr','123','abdou.jpg','saviola');
/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-17 22:22:31
