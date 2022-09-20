use wild_db_quest;
show tables;

select * from wizard;


SHOW TABLES

CREATE TABLE `wild_db_quest`.`wizard` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(100) NOT NULL,
  `lastname` VARCHAR(100) NOT NULL,
  `birthday` DATE NOT NULL,
  `birth_place` VARCHAR(255) NULL,
  `biography` TEXT NULL,
  PRIMARY KEY (`id`));
  
 CREATE DATABASE school;
-- ajouter is muggle

ALTER TABLE wizard
ADD ( `is muggle` BIT NOT NULL);
-- add table school
CREATE TABLE `wild_db_quest`.`school` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `capacity`INT,
`country` VARCHAR(255) NULL,
    PRIMARY KEY (`id`));
    
SHOW TABLES;
DESCRIBE school;


