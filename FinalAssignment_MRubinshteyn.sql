#Question 1
DROP SCHEMA IF EXISTS BuildingEnergy;
CREATE SCHEMA BuildingEnergy;
USE BuildingEnergy;
DROP TABLE IF EXISTS EnergyCategories;
DROP TABLE IF EXISTS EnergyTypes;

#Question 2
CREATE TABLE EnergyCategories
(EnergyCategoryID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
EnergyCategoryName VARCHAR(50) NULL);

INSERT INTO EnergyCategories
(EnergyCategoryName)
VALUES
('Fossil'),
('Renewable');

CREATE TABLE EnergyTypes
(EnergyTypeID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
EnergyTypeName VARCHAR(50) NULL,
EnergyCategoryID INT NULL,
CONSTRAINT FOREIGN KEY (EnergyCategoryID)
REFERENCES EnergyCategories(EnergyCategoryID)
ON UPDATE CASCADE ON DELETE SET NULL);

INSERT INTO EnergyTypes
(EnergyTypeName, EnergyCategoryID)
VALUES
('Electricity', 1),
('Gas', 1),
('Steam', 1),
('Fuel Oil', 1),
('Solar', 2),
('Wind', 2);

#Question 3
SELECT EnergyCategoryName AS 'Energy Category', EnergyTypeName AS 'Energy Type'
FROM EnergyCategories
INNER JOIN EnergyTypes
ON EnergyCategories.EnergyCategoryID = EnergyTypes.EnergyCategoryID;

#Question 4
DROP TABLE IF EXISTS Buildings;
CREATE TABLE Buildings
(BuildingID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
BuildingName VARCHAR(100) NULL);

INSERT INTO Buildings
(BuildingName)
VALUES
('Empire State Building'),
('Chrysler Building'),
('Borough of Manhattan Community College');

DROP TABLE IF EXISTS Buildings_EnergyTypes;
CREATE TABLE Buildings_EnergyTypes
(Buildings_EnergyTypesID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
BuildingID INT NULL,
EnergyTypeID INT NULL,
CONSTRAINT FOREIGN KEY (BuildingID)
REFERENCES Buildings(BuildingID)
ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT FOREIGN KEY (EnergyTypeID)
REFERENCES EnergyTypes(EnergyTypeID)
ON UPDATE CASCADE ON DELETE CASCADE);

INSERT INTO Buildings_EnergyTypes
(BuildingID, EnergyTypeID)
VALUES
(3,5),
(3,1),
(3,3),
(2,1),
(2,3),
(1,1),
(1,2),
(1,3);

#Question 5
SELECT BuildingName AS 'Building Name', EnergyTypeName AS 'Energy Type'
FROM Buildings
LEFT JOIN Buildings_EnergyTypes ON Buildings_EnergyTypes.BuildingID = Buildings.BuildingID
LEFT JOIN EnergyTypes ON Buildings_EnergyTypes.EnergyTypeID = EnergyTypes.EnergyTypeID;

#Question 6
INSERT INTO Buildings
(BuildingName)
VALUES
('Bronx Lion House'),
('Brooklyn Childrens Museum');

INSERT INTO EnergyTypes
(EnergyTypeName, EnergyCategoryID)
VALUES
('Geothermal', 2);

INSERT INTO Buildings_EnergyTypes
(BuildingID, EnergyTypeID)
VALUES
(4,7),
(5,1),
(5,7);

#Question 7
SELECT BuildingName AS 'Building Name', EnergyTypeName AS 'Energy Type', EnergyCategoryName AS 'Energy Category'
FROM Buildings
LEFT JOIN Buildings_EnergyTypes ON Buildings_EnergyTypes.BuildingID = Buildings.BuildingID
LEFT JOIN EnergyTypes ON Buildings_EnergyTypes.EnergyTypeID = EnergyTypes.EnergyTypeID
LEFT JOIN EnergyCategories ON EnergyTypes.EnergyCategoryID = EnergyCategories.EnergyCategoryID
WHERE EnergyTypes.EnergyCategoryID=2;

#Question 8
SELECT EnergyTypeName AS 'Energy Type', COUNT(EnergyTypeName) AS 'Count'
FROM EnergyTypes
RIGHT JOIN Buildings_EnergyTypes ON Buildings_EnergyTypes.EnergyTypeID = EnergyTypes.EnergyTypeID
LEFT JOIN Buildings ON Buildings.BuildingID = Buildings_EnergyTypes.BuildingID
GROUP BY EnergyTypeName
ORDER BY COUNT(EnergyTypeName) DESC;