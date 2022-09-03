CREATE DATABASE shirts_db;
USE shirts_db;
DROP TABLE shirts;
CREATE TABLE shirts(shirt_id INT NOT NULL AUTO_INCREMENT,
                    article VARCHAR(20), 
                    color VARCHAR(20),
                    shirt_size VARCHAR(3),
                    last_worn INT, # the last day that the shirt is worn
                    PRIMARY KEY(shirt_id)
                   );
DESC shirts;
INSERT INTO shirts(article, color, shirt_size, last_worn)
             VALUES ('t-shirt', 'white', 'S', 10),
                    ('t-shirt', 'green', 'S', 200),
                    ('polo shirt', 'black', 'M', 10),
                    ('tank top', 'blue', 'S', 50),
                    ('t-shirt', 'pink', 'S', 0),
                    ('polo shirt', 'red', 'M', 5),
                    ('tank top', 'white', 'S', 200),
                    ('tank top', 'blue', 'M', 15);

# Q1. Add a new shirt Purple polo shirt, size M last worn 50 days ago
INSERT INTO shirts(article, color, shirt_size, last_worn)
VALUES ('polo shirt', 'purple', 'M', 50);
SELECT * FROM shirts;

# Q2. SELECT all shirts But Only Print Out Article and Color
SELECT article, color FROM shirts;

# Q3. SELECT all medium shirts Print Out Everything But shirt_id
SELECT article, color, shirt_size FROM shirts WHERE shirt_size= 'M';

# Q4. Update all polo shirts Change their size to L
UPDATE shirts SET shirt_size='L' WHERE article='polo shirt';
SELECT * FROM shirts WHERE article='polo shirt';

# Q5. Update the shirt last worn 15 days ago Change last_worn to 0
SELECT * FROM shirts WHERE last_worn = 15;
UPDATE shirts SET last_worn = 0 WHERE last_worn = '15';
SELECT * FROM shirts WHERE last_worn = 15;

# Q6. Update all white shirts Change size to 'XS' and color to 'off white'
UPDATE shirts SET shirt_size = 'XS', color = 'off white' WHERE color = 'white';
SELECT * FROM shirts WHERE color= 'off white';

# Q7. Delete all old shirts Last worn 200 days ago
SELECT * FROM shirts WHERE last_worn = 200;
DELETE FROM shirts WHERE last_worn = 200;
SELECT * FROM shirts;

# Q8. Delete all tank tops Your tastes have changed...
SELECT * FROM shirts WHERE article='tank top';
DELETE FROM shirts WHERE article = 'tank top';
SELECT * FROM shirts;

# Q9. Delete all shirts Catastrophe!
DELETE FROM shirts;
SELECT * FROM shirts;

# Q10. Drop the entire shirts table Catastrophe Again!
DROP TABLE  shirts;
SHOW TABLES;