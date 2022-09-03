# Q1. What's a good use case for CHAR? 

# CHAR is good for fixed length text such as abbreviation or boolean (eg: sex(M or F), language(EN,FR) 

# Q2. Fill In The Blanks 
# CREATE TABLE inventory (
#     item_name ____________,
#     price ________________,
#     quantity _____________
# );

CREATE TABLE inventory(item_name VARCHAR(100),
                      price DECIMAL(8,2), 
                      quantity INT)

# Q4. What's the difference between DATETIME and TIMESTAMP?

# - DATETIME range from 1000-01-01 00:00:00 to 9999-12-31 23:59:59 (YYYY-MM-DD HH:MM:SS)
#   while TIMESTAMP range from 1970-01-01 to 2038-01-19 03:14:07 (YYYY-MM-DD HH:MM:SS)
# - TIMESTAMP take less space compared to DATETIME and 
# - TIMESTAMP is usually used to collect the latest data while DATETIME usually be used 
#   to collect previously available data

# Q5. Print Out The Current Time 

SELECT CURTIME();

# Q6. Print Out The Current Date (but not time) 

SELECT CURDATE();

# Q7. Print Out The Current Day Of The Week (The Number)

SELECT DAYOFWEEK(CURDATE());
#  OR 
SELECT DATE_FORMAT(CURDATE(), '%w') +1;

# Q8. Print Out The Current Day Of The Week (The Day Name) 

SELECT DAYNAME(NOW());
# OR 
SELECT DATE_FORMAT(NOW(), '%W'); 

# Q9. Print out the current day and time using this format:  mm/dd/yyyy 

SELECT DATE_FORMAT(NOW(), '%m/%d/%Y'); # OR SELECT DATE_FORMAT(CURDATE(), '%m/%d/%Y');

# Q10. Print out the current day and time using this format: 
# January 2nd at 3:15 April 1st at 10:18 

SELECT DATE_FORMAT(NOW(), '%M %D at %h:%i');

# Q11. Create a tweets table that stores:
# The Tweet content
# A Username
# Time it was created 

DROP DATABASE IF EXISTS tweets;
CREATE DATABASE tweets;
USE tweets; 
CREATE TABLE tweet_table(tweet_content VARCHAR(100),
                        username VARCHAR(30),
                        created_at TIMESTAMP DEFAULT NOW()); 
                        
INSERT INTO tweet_table (tweet_content, username) VALUES('this is a tweet', 'SQLboy');
SELECT * FROM tweet_table; 

