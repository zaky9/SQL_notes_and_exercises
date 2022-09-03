# using dataset from ig_clone_data.sql
# SOURCE ig_clone_data.sql;

# 260. Challenge 1
# find the 5 oldest users 
SELECT * FROM users 
ORDER BY created_at LIMIT 5; 

# 262. Challenge 2 
# What day of the week do most users registere on? 
SELECT 
    DAYNAME(created_at) AS 'day',
    COUNT(*) AS 'total'
FROM users
GROUP BY day
ORDER BY total DESC;

# 264. Find the user who have never posted a photos (inactive user) 
-- user and photo table 
SELECT * FROM photos;
SELECT * FROM users; 

SELECT username
FROM photos 
RIGHT JOIN users 
    ON users.id = photos.user_id
WHERE photos.id IS NULL;

# 266. Which user and photo has the highest likes 
SELECT * FROM likes;
SELECT * FROM photos; 

SELECT 
    username,
    photos.id,
    photos.image_url, 
    COUNT(*) AS total
FROM photos
INNER JOIN likes
    ON likes.photo_id = photos.id
INNER JOIN users
    ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY total DESC
LIMIT 5;

# 268. How many times does the average user post?
-- total number of post/total number of users 
SELECT COUNT(*) FROM photos; 
SELECT COUNT(*) FROM users;

SELECT ROUND(((SELECT COUNT(*) FROM photos)/(SELECT COUNT(*) FROM users)),2) AS 'Average No. of post';

# 270. Challenge 6
# What are the top 5 most commonly used hashtags? 
SELECT * FROM tags;
SELECT * FROM photo_tags;

SELECT * FROM photo_tags
JOIN tags
	ON photo_tags.tag_id = tags.id 
GROUP BY tags.id;

SELECT tags.tag_name, 
       Count(*) AS total 
FROM   photo_tags 
       JOIN tags 
         ON photo_tags.tag_id = tags.id 
GROUP  BY tags.id 
ORDER  BY total DESC 
LIMIT  5; 

# 273. Challenge 7
# Find users who have liked every single photo on the site 
# Finding bots - liked every photo  on the site (using table users and like) 
SELECT username,
	user_id,
	COUNT(*) AS num_likes
FROM users
INNER JOIN likes
	on user.id = likes.user_id
GROUP BY like.user_id 
HAVING num_likes = (SELECT COUNT(*) FROM photos);
# HAVING allow us to filter data based on a clouse from the group by.
# (SELECT COUNT(*) FROM photos) is the total number of photos