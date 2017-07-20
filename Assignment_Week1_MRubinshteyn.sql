/* 1*/
SELECT distance, dest
FROM flights
ORDER BY distance DESC
LIMIT 1;

/*2A*/
SELECT COUNT(DISTINCT engines)
AS 'Distinct Number Of Engines'
FROM planes;

/*2B*/
SELECT DISTINCT engines AS 'Distinct Number Of Engines', 
model,
MAX(seats)
FROM planes
GROUP BY engines;

/*3*/
SELECT COUNT(*) AS 'Number Of Flights'
FROM flights;

/*4*/
SELECT carrier, COUNT(*) AS 'Number Of Flights'
FROM flights
GROUP BY carrier;

/*5*/
SELECT carrier, COUNT(*) AS 'Number Of Flights'
FROM flights
GROUP BY carrier
ORDER BY COUNT(*) DESC;

/*6*/
SELECT carrier, COUNT(*) AS 'Number Of Flights'
FROM flights
GROUP BY carrier
ORDER BY COUNT(*) DESC
LIMIT 5;

/*7*/
SELECT carrier, COUNT(*) AS 'Number Of Flights'
FROM flights
WHERE distance >= 1000
GROUP BY carrier
ORDER BY COUNT(*) DESC
LIMIT 5;

/*8*/

/* QUESTION:  Which origin has the most departing flights?*/

SELECT origin, COUNT(*) AS 'Number Of Flights'
FROM flights
GROUP BY origin
ORDER BY COUNT(*) DESC
LIMIT 1;

