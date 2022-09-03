# 300. Exercises:

# Q1 Find the earliest date a user joined 
SELECT 
	DATE_FORMAT(MIN(created_at), "%M %D %Y" AS 'Earliest date'
FROM users;
                
# Q2 Find the email of the first(earliest) user 
SELECT *
FROM userrs WHERE created_at = (SELECT MIN(created_at FROM users));
                
# Q3. Users according to the month they joined 
SELECT MONTHNAME(created_at) AS 'month',
       COUNT(*) AS 'count'
FROM users
GROUP BY month
ORDER BY count DESC;

# Q4. Count number of users with Yahoo emails 
SELECT COUNT(*) as yahoo_users
FROM users
WHERE email LIKE '%@yahoo.%';

# Q5. Calculate total number of users for each email host 
SELECT 
    CASE
        WHEN email LIKE '%@yahoo.com' THEN 'yahoo'
        WHEN email LIKE '%@gmail.com' THEN 'gmail'
        WHEN email LIKE '%@hotmail.com' THEN 'hotmail'
        ELSE 'others'
    END as email_provider,
    COUNT(*) AS total_users
FROM users 
GROUP BY email_provider
ORDER BY total_users DESC;
        
                
                