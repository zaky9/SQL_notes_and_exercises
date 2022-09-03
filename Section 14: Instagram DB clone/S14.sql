-- Create Instagram database clone 
DROP DATABASE IF EXISTS ig_clone;
CREATE DATABASE ig_clone;
USE ig_clone;

# 241. Table <USERS>: id, username, created_at 
CREATE TABLE users(
	id INT AUTO_INCREMENT PRIMARY KEY,
	username VARCHAR(255) UNIQUE NOT NULL,
	created_at TIMESTAMP DEFAULT NOW()
);

# 243. Table <photos>: id, image_id, user_id, createed_at 
CREATE TABLE photos(
    id INT AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    user_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id)
);

# 245. Table <comments>: id, comment_text, user_id, photo_id, created_at
CREATE TABLE comments(
id INT AUTO_INCREMENT PRIMARY KEY,
    comment_text VARCHAR(225) NOT NULL,
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id)
);

# 247. Table <likes> : user_id, photo_id, created_at
CREATE TABLE likes(
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES user(id),
    FOREIGN KEY(photo_id) REFERENCES photo(id),
    PRIMARY KEY(user_id, photo_id)
);

# 249. Table <follows> : follower_id, followee_id, created_at
CREATE TABLE follows (
    follower_id INTEGER NOT NULL,
    followee_id INTEGER NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES users(id),
    FOREIGN KEY(followee_id) REFERENCES users(id),
    PRIMARY KEY(follower_id, followee_id)
);

# 253. Table hashtags 
CREATE TABLE tags(
    id INT AUTO_INCREMENT PRIMARY KEY,
    tag_name VARCHAR(255) UNIQUE,
    created_at TIMESTAMP DEFAULT NOW()
); 

# CREATE TABLE photo_tags (
#     photo_id INT NOT NULL,
#     tag_id INT NOT NULL,
#     FOREIGN KEY(photo_id) REFERENCES photos(id),
#     FOREIGN KEY(tag_id) REFERENCES tags(id),
#     PRIMARY KEY(photo_id, tag_id)
# );