/* Step 1 */

CREATE TABLE users
(userid INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
username VARCHAR(100),
usergroup VARCHAR(100));

INSERT INTO users (username, usergroup)
VALUES
('Modesto', 'I.T.'),
('Ayine', 'I.T.'),
('Christopher', 'Sales'),
('Cheong woo', 'Sales'),
('Saulat', 'Administration'),
(null, 'Operations'),
('Heidy', null);

/*Step 2 */

CREATE TABLE roomaccess
(usergroup VARCHAR(100),
room VARCHAR(100));


INSERT INTO roomaccess (usergroup, room)
VALUES
('I.T.', '101'),
('I.T.', '102'),
('Sales', '102'),
('Sales', 'Auditorium A'),
('Administration', null),
('Operations', null),
(null,'Auditorium B');


/* Select Statement 1*/

SELECT username, usergroup 
FROM users
WHERE usergroup IS NOT NULL;


/* Select Statement 2*/

SELECT room, usergroup
FROM roomaccess;


/* Select Statement 3*/

SELECT users.username, users.usergroup, roomaccess.room
FROM users
LEFT JOIN roomaccess
ON users.usergroup = roomaccess.usergroup
WHERE users.username IS NOT NULL
ORDER BY users.username, users.usergroup, roomaccess.room;