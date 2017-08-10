


CREATE TABLE org
(userid INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
empname VARCHAR(100),
position VARCHAR(100),
supervisorid INT);

INSERT INTO org (empname, position, supervisorid)
VALUES
('Steve Jobs', 'CEO', null),
('Timothy Cook', 'COO', 1),
('Johnathan Ive', 'SVP, Industrial Design', 1),
('Jeffrey Williams', 'SVP, Operations', 2),
('Rita Lane', 'VP, Operations', 4);


SELECT 
emps.empname AS 'Employee Name',
sups.empname AS 'Supervisor'
FROM org AS emps
LEFT JOIN org AS sups
ON emps.supervisorid = sups.userid
ORDER BY emps.empname;

