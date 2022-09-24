USE wild_db_quest_6;
-- Q.1

SELECT firstname, lastname 
FROM wizard as w
WHERE w.id IN (SELECT p.wizard_id
FROM player as p
WHERE enrollment_date BETWEEN '1995-01-01' AND '1998-12-31');

-- Q.2

SELECT w.firstname,w.lastname
FROM wizard AS w
WHERE w.id IN (SELECT p.wizard_id
FROM player as p
WHERE p.enrollment_date BETWEEN '1995-01-01' AND '1998-12-31'
AND p.role='keeper');

-- Q3
SELECT firstname,lastname,role
FROM wizard AS w
JOIN player AS p
ON w.id = p.wizard_id
WHERE w.id IN 
(SELECT wizard_id
FROM player WHERE enrollment_date BETWEEN '1995-01-01' AND '1998-12-31'
AND p.role = 'chaser');

-- Q.4

CREATE VIEW view_q4 AS(
SELECT t.name , role, COUNT(role)
FROM player as p
INNER JOIN team AS t
ON p.team_id = t.id
GROUP BY t.name, role);
SELECT * FROM view_q4;

-- Q5

CREATE VIEW view_q5 AS( 
SELECT t.name AS name, w.firstname AS firstname, w.lastname AS lastname, role
FROM player
INNER JOIN wizard AS w
ON wizard_id = w.id
INNER join team AS t
ON team_id= t.id
WHERE name='Gryffindor'
AND role='Chaser');
SELECT * FROM view_q5;