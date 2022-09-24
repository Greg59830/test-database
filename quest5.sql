-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)

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

DROP DATABASE IF EXISTS `wild_db_quest`;
CREATE DATABASE `wild_db_quest`;
USE `wild_db_quest`;

-- Table structure for table `school`

DROP TABLE IF EXISTS `school`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `capacity` int DEFAULT NULL,
  `country` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Dumping data for table `school`

LOCK TABLES `school` WRITE;
/*!40000 ALTER TABLE `school` DISABLE KEYS */;
INSERT INTO `school` VALUES (2,'Castelobruxo',380,'Brazil'),(3,'Durmstrang Institute',570,'Sweden'),(4,'Hogwarts School of Witchcraft and Wizardry',450,'United Kingdom'),(5,'Ilvermorny School of Witchcraft and Wizardry',300,'USA'),(6,'Koldovstoretz',125,'Russia');
/*!40000 ALTER TABLE `school` ENABLE KEYS */;
UNLOCK TABLES;

-- Table structure for table `wizard`

DROP TABLE IF EXISTS `wizard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wizard` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `birthday` date NOT NULL,
  `birth_place` varchar(255) DEFAULT NULL,
  `biography` text,
  `is_muggle` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

-- Dumping data for table `wizard`

LOCK TABLES `wizard` WRITE;
/*!40000 ALTER TABLE `wizard` DISABLE KEYS */;
/*!40000 ALTER TABLE `wizard` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

SHOW tables;
-- delette wizard
truncate wizard;

-- add table player
UNLOCK TABLES;
DROP TABLE player;
CREATE TABLE player (
    `id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `wizard_id` INT ,
    `team_id` INT ,
    `role`	VARCHAR (50),
    `enrollment_date` DATE ,
    CONSTRAINT fk_player_wizzard  
        FOREIGN KEY (wizard_id)             
        REFERENCES wizard(id)   ,
	CONSTRAINT fk_player_team 
        FOREIGN KEY (team_id)             
        REFERENCES team(id)  
);
SELECT * from team;
ALTER TABLE wizard 
DROP COLUMN birthday, 
DROP COLUMN birth_place,
DROP COLUMN biography,
DROP COLUMN is_muggle;

-- add table team

CREATE TABLE `team` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
 PRIMARY KEY (`id`)
);

SHOW TABLES;

-- add key with team

ALTER TABLE player
ADD CONSTRAINT fk_wizard_player
FOREIGN KEY (team_id) 
REFERENCES team(id);

-- Retourne les noms, prénoms, rôle et équipe de tous les joueurs, classés dans l’ordre alphabétique par équipe, puis par rôle dans l’équipe, puis par nom de famille, puis par prénom.

SELECT lastname, firstname, role, name AS teamname FROM wizard
INNER JOIN player 
ON player.wizard_id = wizard.id
INNER JOIN team
ON player.team_id = team.id
ORDER BY name, role,lastname, firstname;

-- Retourne uniquement les prénoms et noms des joueurs ayant le rôle de seeker (attrapeur), classés par ordre alphabétique de nom puis prénom
SELECT lastname, firstname FROM wizard
INNER JOIN player
ON player.wizard_id = wizard.id
WHERE role = 'seeker'
ORDER BY lastname, firstname;

-- Retourne la liste de tous les sorciers qui ne pratiquent pas le quidditch.

SELECT lastname, firstname FROM wizard
LEFT JOIN player
ON player.wizard_id = wizard.id
WHERE wizard_id IS NULL;