USE wild_db_quest;
INSERT INTO school (name, country, capacity) VALUES ('Hogwarts School of Witchcraft and Wizardry', 'United Kingdom', 400);
INSERT INTO school (name, country, capacity) 
VALUES ('Beauxbatons Academy of Magic', 'France', 550), 
('Castelobruxo', 'Brazil', 380), 
('Durmstrang Institute', 'Sweden', 570);
INSERT INTO school (name, country, capacity) 
VALUES ('Ilvermorny School of Witchcraft and Wizardr', 'USA', 300), 
('Koldovstoretz', 'Russia', 125), 
('Mahoutokoro School of Magic', 'Japan', 700),
('Uagadou School of Magic', 'Uganda', 350);
DESCRIBE school;
SELECT name,capacity,country 
FROM school;

-- reset
TRUNCATE school;

-- update

INSERT INTO school (name, country, capacity) 
VALUES ('Beauxbatons Academy of Magic', 'France', 550), 
('Castelobruxo', 'Brazil', 380), 
('Durmstrang Institute', 'Norway', 570);

-- show
SELECT name,country,capacity
FROM school;

-- insert new school

INSERT INTO school (name, country, capacity) 
VALUES ('Hogwarts School of Witchcraft and Wizardry', 'United Kingdom', 450), 
('Ilvermorny School of Witchcraft and Wizardry', 'USA', 300), 
('Koldovstoretz', 'Russia', 125),
('Mahoutokoro School of Magic', 'Japan', 800),
('Uagadou School of Magic', '	Uganda', 350);

-- show update

SELECT name,country,capacity,ID
FROM school;

-- update Norway/ Sweden

UPDATE school
SET country = 'Sweden'
WHERE id = 3;

-- show update

SELECT name,country,capacity,ID
FROM school;

-- update Japan school

UPDATE school
SET capacity = 700
WHERE id = 7;

-- show update

SELECT name,country,capacity,ID
FROM school;

-- delete magic

DELETE FROM school
WHERE name like '%Magic%';

SELECT name,country,capacity,ID
FROM school;