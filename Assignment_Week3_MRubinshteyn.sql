/*1 Create & Populate Videos Table*/

CREATE TABLE videotutorials
(VideoID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
VideoTitle VARCHAR(150),
VideoLength INT,
VideoURL VARCHAR(250));

INSERT INTO videotutorials (VideoTitle, VideoLength, VideoURL)
VALUES
('Create Schema and table', '7', 'https://www.youtube.com/watch?v=1xs8LbEL_CI'),
('MySQL Workbench Insert Read Updateb Delete Data Rows','4', 'https://www.youtube.com/watch?v=qb7abQ6ROy4'),
('How to create database and tables in MySql Workbench 6.3', '6', 'https://www.youtube.com/watch?v=u6p2OU491Ss');


/*2 Create & Populate Reviews Table*/

CREATE TABLE videoreviews
(VideoID INT NOT NULL,
UserName VARCHAR(100),
Rating INT,
ReviewText VARCHAR(250));


INSERT INTO videoreviews (VideoID, UserName, Rating, ReviewText)
VALUES
('1', 'sqlmaster', '5', 'easy to understand. well done!'),
('3', 'n00b', '2', 'hard to follow for a beginner'),
('1', 'jane e', '1', 'disagree with sqlmaster. not intuitive for a new user'),
('3', 'hedgiehogs', '3', 'could definitely use more clarity');


/*3 JOIN statement that shows info from both tables*/

SELECT 
videotutorials.VideoID AS 'VideoID',
videoreviews.VideoID AS 'VideoID',
videotutorials.VideoTitle,
videotutorials.VideoLength,
videotutorials.VideoURL,
videoreviews.UserName,
videoreviews.Rating,
videoreviews.ReviewText
FROM videotutorials
LEFT JOIN videoreviews
ON videotutorials.VideoID = videoreviews.VideoID
ORDER BY videotutorials.videoid;
