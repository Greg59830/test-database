

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

SELECT * FROM knight;

-- insertion des données:

INSERT INTO knight (name_knight,age)
VALUES
('Arthur', 40),
('Perceval', 35),
('Lancelot', 38)
;

-- vérification
SELECT*FROM knight;
-- UPDATE personnal Age

UPDATE knight
SET age=36
WHERE name_knight ='Perceval';

select * from knight;

-- remove lancelot 
DELETE FROM knight
WHERE name_knight = 'Lancelot';

-- verif
SELECT * FROM knight;

-- create table weapon

CREATE TABLE weapon(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
name_weapon VARCHAR (50)
);

SHOW TABLES;

-- insert weapons
INSERT INTO weapon(name_weapon)
VALUE ('sword'),
('bow'),
('spear'),
('catapulte');

-- vérification

SELECT*FROM weapon;

-- chevalier ayant plus de 37

SELECT * FROM knight
WHERE age > 37;

-- vider ma table
TRUNCATE knight;

-- vérif

SELECT*FROM knight;