# 222. Manny to Many 

# Reviewers:
# - id, first_name, last_name 

# Reviews:
# - id, rating, series_id, reviewer_id

# Series:
# - id, title, released_year, genre 

DROP DATABASE IF EXISTS tv_reviews_apps; # 
CREATE  DATABASE tv_reviews_apps;
USE tv_reviews_apps;

# 223. Creating tables 
CREATE TABLE reviewers( 
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100)
);
INSERT INTO reviewers (first_name, last_name) VALUES
    ('Thomas', 'Stoneman'),
    ('Wyatt', 'Skaggs'),
    ('Kimbra', 'Masters'),
    ('Domingo', 'Cortes'),
    ('Colt', 'Steele'),
    ('Pinkie', 'Petit'),
    ('Marlon', 'Crafford');
    
# SELECT * FROM reviewers;

CREATE TABLE series(
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    released_year year(4), # four digit year
    genre VARCHAR(100));
    
INSERT INTO series (title, released_year, genre) VALUES
    ('Archer', 2009, 'Animation'),
    ('Arrested Development', 2003, 'Comedy'),
    ("Bob's Burgers", 2011, 'Animation'),
    ('Bojack Horseman', 2014, 'Animation'),
    ("Breaking Bad", 2008, 'Drama'),
    ('Curb Your Enthusiasm', 2000, 'Comedy'),
    ("Fargo", 2014, 'Drama'),
    ('Freaks and Geeks', 1999, 'Comedy'),
    ('General Hospital', 1963, 'Drama'),
    ('Halt and Catch Fire', 2014, 'Drama'),
    ('Malcolm In The Middle', 2000, 'Comedy'),
    ('Pushing Daisies', 2007, 'Comedy'),
    ('Seinfeld', 1989, 'Comedy'),
    ('Stranger Things', 2016, 'Drama');

# SELECT * FROM series;

CREATE TABLE reviews(
    id INT AUTO_INCREMENT PRIMARY KEY,
    rating DECIMAL(2,1),
    series_id INT,
    reviewer_id INT,
    FOREIGN KEY(series_id) REFERENCES series(id),
    FOREIGN KEY(reviewer_id) REFERENCES reviewers(id));
    
INSERT INTO reviews(series_id, reviewer_id, rating) VALUES
    (1,1,8.0),(1,2,7.5),(1,3,8.5),(1,4,7.7),(1,5,8.9),
    (2,1,8.1),(2,4,6.0),(2,3,8.0),(2,6,8.4),(2,5,9.9),
    (3,1,7.0),(3,6,7.5),(3,4,8.0),(3,3,7.1),(3,5,8.0),
    (4,1,7.5),(4,3,7.8),(4,4,8.3),(4,2,7.6),(4,5,8.5),
    (5,1,9.5),(5,3,9.0),(5,4,9.1),(5,2,9.3),(5,5,9.9),
    (6,2,6.5),(6,3,7.8),(6,4,8.8),(6,2,8.4),(6,5,9.1),
    (7,2,9.1),(7,5,9.7),(8,4,8.5),(8,2,7.8),(8,6,8.8),
    (8,5,9.3),(9,2,5.5),(9,3,6.8),(9,4,5.8),(9,6,4.3),
    (9,5,4.5),(10,5,9.9),(13,3,8.0),(13,4,7.2),(14,2,8.5),
    (14,3,8.9),(14,4,8.9);
    
# 225. TV Joins Challange 1 
SELECT title, rating FROM series
JOIN reviews
    ON series.id = reviews.series_id;

# 227. TV Joins Challange 2
# taking random rating not average
SELECT 	series.id, title, rating FROM series 
JOIN reviews 
	ON series.id = reviews.series_id
GROUP BY series.id;

# taking average rating with descending order
SELECT title, AVG(rating) as avg_rating FROM series 
JOIN reviews 
	ON series.id = reviews.series_id
GROUP BY series.id
ORDER BY avg_rating DESC;

# 228. TV Joins Challenge 3
# first_name, last_name, rating 
SELECT * FROM reviewers;
SELECT * FROM reviews;

SELECT first_name, last_name, rating FROM reviewers
INNER JOIN reviews 
	ON reviewers.id = reviews.reviewer_id;
    
SELECT first_name, last_name, rating FROM reviews
INNER JOIN reviewers
    ON reviewers.id = reviews.reviewer_id
ORDER BY first_name;

# 231. TV Joins Challenge 4 
# identify the unreviewed series
SELECT title AS unreviewed_series
FROM series 
LEFT JOIN reviews # since title are in from series, hence left join 
    ON series.id = reviews.series_id 
WHERE rating IS NULL;

# 233 TV Joins Challenge 5 
# show table based on genre and their avg_rating 
SELECT title, genre, rating FROM series
JOIN reviews
	ON series.id = reviews.series_id;

SELECT genre, 
ROUND(AVG(rating),2) AS 'avg_rating'
FROM series 
INNER JOIN reviews ON series.id = reviews.series_id
GROUP BY genre;

# 235. TV Joins Challenge 6 
# show tables based on the author's first and last name with 
# the number of reviews, min, max & avg rating and status based on their activity review (active or inactive) 

SELECT first_name, 
	   last_name, 
       count(rating) AS 'COUNT',
       IFNULL(MIN(rating), 0) AS 'MIN',
       IFNULL(MAX(rating), 0) AS 'MAX',
       ROUND(IFNULL(AVG(rating), 0),2) AS 'AVG',
       IF(COUNT(rating) >= 1, 'ACTIVE', 'INACTIVE') AS 'STATUS'
    		# CASE
    		# WHEN COUNT(rating) >= 1 THEN 'ACTIVE'
    		# ELSE 'INACTIVE'
    		# END AS 'STATUS'
    
FROM reviewers 
JOIN reviews 
	ON reviewers.id = reviews.reviewer_id
GROUP BY reviewers.id;

# 237. TV Joins Challenge 7 
# show tables that has title with their rating and the full name of the reviewers 

SELECT title,
	   rating,
       CONCAT(first_name,' ',last_name) AS 'reviewers'
FROM reviewers
INNER JOIN reviews # taking on the overlaped btw reviewer_id and id
	ON reviewers.id =  reviews.reviewer_id
INNER JOIN series
	ON series.id = reviews.series_id
ORDER BY title;