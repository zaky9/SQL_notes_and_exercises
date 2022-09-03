# Q1. Evaluate the following 
SELECT 10 != 10; # False
SELECT 15 > 14 && 99 - 5 <= 94; # True
SELECT 1 IN (5,3) || 9 BETWEEN 8 AND 10; # True 

# Q2. Select All Books Written Before 1980 (non inclusive) 
SOURCE book_data.sql; 
SELECT * FROM books WHERE released_year < 1980;

# Q3. Select All Books Written By Eggers Or Chabon
SELECT * FROM books WHERE author_lname IN('Eggers', 'Chabon');
# or
SELECT * FROM books WHERE author_lname='Eggers' OR author_lname='Chabon';
 
# Q4. Select All Books Written By Lahiri, Published after 2000 
SELECT * FROM books WHERE author_lname = 'Lahiri' AND released_year > 2000;

# Q5. Select All books with page counts between 100 and 200 
SELECT title, released_year, pages FROM books WHERE pages BETWEEN 100 AND 200;
# or
SELECT title, released_year, pages FROM books WHERE pages >= 100 && pages <=200;

# Q6. Select all books where author_lname  starts with a 'C' or an 'S'' 
SELECT title, author_lname FROM books WHERE author_lname LIKE 'C%' OR 'S%';
# or 
SELECT title, author_lname FROM books WHERE SUBSTR(author_lname,1,1) = 'C' OR SUBSTR(author_lname,1,1) = 'S';
# or
SELECT title, author_lname FROM books WHERE SUBSTR(author_lname,1,1) IN ('C', 'S');

# Q7. Create new column TYPE where: 
#     If title contains 'stories'   -> Short Stories
#     Just Kids and A Heartbreaking Work  -> Memoir
#     Everything Else -> Novel 

SELECT title, author_lname,
       CASE 
           WHEN title LIKE '%stories%' THEN 'Short stories'
           WHEN title = 'Just kids' OR title = 'A Heartbreaking Work' THEN 'Memoir' 
           ELSE 'Novel'
       END AS 'TYPE'
       FROM books;

 
SELECT author_fname, author_lname,
    CASE 
        WHEN COUNT(*) = 1 THEN '1 book'
        ELSE CONCAT(COUNT(*), ' books')
    END AS 'COUNT'
FROM books 
GROUP BY author_lname, author_fname;