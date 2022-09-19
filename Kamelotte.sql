-- create Kaamelotte
CREATE DATABASE Kaamelotte;
-- les bases de données que j'ai sur mon PC
SHOW DATABASES;
-- se connecter sur une base données
USE Kaamelotte;
-- vérifier qu'on est connecté sur quele base de données
SELECT DATABASE ();

-- create a table knight

CREATE TABLE knight (
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL , 
name_knight VARCHAR(80) ,
age INT 

);

SHOW TABLES;
