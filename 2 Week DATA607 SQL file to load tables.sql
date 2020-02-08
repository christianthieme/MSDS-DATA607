-- Week 2 DATA607 - Data Aquisition and Management
-- 2/06/2020
-- Christian Thieme

-- -------------------- CREATION OF SCHEMA -----------------------------------------------------

CREATE SCHEMA `movie_ratings` ;

-- -------------------- CREATION AND POPULATIONS OF FRIENDS TABLE  -----------------------------

CREATE TABLE movie_ratings.friends (
friend_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL, 
friend_first_name VARCHAR (200) NOT NULL, 
friend_last_name VARCHAR (200) NOT NULL
);

INSERT INTO movie_ratings.friends 
(friend_first_name, friend_last_name)
VALUES 
('Abby', "Fife"),
("Janis", "Bartholomew"),
("Thomas", "Fife"), 
("Savannah", "Dotson"), 
("Royce", "Bartholomew");

-- Test to see if friend table is working properly
SELECT * FROM movie_ratings.friends;

-- -------------------- CREATION AND POPULATIONS OF MOVIES TABLE  -----------------------------

CREATE TABLE movie_ratings.movies (
movie_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL, 
movie_name VARCHAR (200) NOT NULL, 
release_year INT NOT NULL
);

INSERT INTO movie_ratings.movies 
(movie_name, release_year)
VALUES 
("Star Wars: Episode IX - The Rise of Skywalker", 2019),
("The Lion King", 2019),
("Just Mercy", 2019), 
("Jumanji: The Next Level", 2019), 
("Avengers: Endgame", 2019), 
("Frozen II", 2019), 
("Gemini Man", 2019);

-- Test to see if movie table is working properly
SELECT * FROM movie_ratings.movies;

-- -------------------- CREATION AND POPULATIONS OF RATINGS TABLE  -----------------------------
CREATE TABLE movie_ratings.ratings (
rating_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL, 
id_friend INT NOT NULL,
id_movie INT NOT NULL, 
rating INT 
);

INSERT INTO movie_ratings.ratings 
(id_friend, id_movie, rating)
VALUES 
(1,1,5), (1,2,3), (1,3,5), (1,4,4), (1,5,4), (1,6,5), (1,7,2),
(2,1,4), (2,2, NULL), (2,3,4), (2,4,4), (2,5,5), (2,6,4), (2,7,NULL),
(3,1,4), (3,2,NULL), (3,3,NULL), (3,4,5), (3,5,4), (3,6,3), (3,7,2),
(4,1,NULL), (4,2,2), (4,3,4), (4,4,2), (4,5,4), (4,6,5), (4,7,NULL),
(5,1,5), (5,2,3), (5,3,5), (5,4,5), (5,5,5), (5,6,5), (5,7,NULL)
;

-- Test to see if ratings table is working properly
SELECT * FROM movie_ratings.ratings;

-- -------------------- SQL Query to bring data together  -----------------------------

SELECT 
r.rating_id,
m.movie_name, 
m.release_year,
f.friend_first_name,
f.friend_last_name,
r.rating
FROM movie_ratings.ratings r
LEFT JOIN movie_ratings.movies m ON r.id_movie = m.movie_id
LEFT JOIN movie_ratings.friends f ON r.id_friend = f.friend_id