# Section 11: logical operators 

# 177. Not Equal (!=)
SOURCE book_data.sql; 
SELECT title, released_year FROM books WHERE released_year = 2017;
SELECT title, released_year FROM books WHERE released_year != 2017;

# 179. Like and not like; to match patterns. usually for strings 
SELECT title FROM books WHERE title LIKE 'W%'; # title that start with W
SELECT title FROM books WHERE title LIKE '%W%'; # title that has W
SELECT title FROM books WHERE title LIKE '%W'; # title that end with W
SELECT title FROM books WHERE title NOT LIKE 'W%'; # title that does not start with W 

# 181. Greater than (>) or Greater than equal to(>=)
SELECT * FROM books WHERE released_year > 2000; # books that released at 2000 year above 
SELECT title, released_year FROM books ORDER BY released_year; 
SELECT title, released_year FROM books WHERE released_year >= 2000
                                       ORDER BY released_year;  
                                       
SELECT 99 > 1; # PRINT true (1)
SELECT 99 > 999; # print false (0)v 

# 184. Less Than 
SELECT title, released_year FROM books WHERE released_year < 2000; 
SELECT title, released_year FROM books WHERE released_year <= 2000; 

# 185. Logical AND or && :- based on multiple criteria, both creteria must be true to get true
SELECT title, author_lname, released_year FROM books WHERE author_lname = 'Eggers' AND released_year > 2010; # SELECT books written by Dave Eggers, published after the year 2010 
1 < 5 && 7 = 9 # false, as AND both statement must be true 
SELECT * FROM books WHERE author_lname = 'Eggers' AND released_year > 2010 AND title LIKE '%novel%'; 

# 187. Logical OR or || :- either statement must be true to get true
SELECT title, author_lname, released_year FROM books WHERE author_lname = 'Eggers' OR released_year > 2010; # SELECT books written by Eggers and released above 2010 
SELECT title, author_lname, released_year FROM books WHERE author_lname = 'Eggers' OR 
                                                           released_year > 2010 OR 
                                                           stock_quantity >=100 # SELECT books written by Eggers, released above 2010 and has stock quantity greater and equal to 100
SELECT 40 <= 100 || -2 > 0; # true 
SELECT 10 > 5 || 5 = 5; # true 
SELECT 'a' = 5 || 3000 > 2000; # true 

# 189. Between 
SELECT title, released_year AS '2014 to 2015'FROM books WHERE released_year >= 2004 && released_year <= 2015; # instead calling the same statement use BETWEEN 
SELECT title, released_year AS '2014 to 2015' FROM books WHERE released_year BETWEEN 2004 AND 2015; 

SELECT title, released_year FROM books WHERE released_year NOT BETWEEN 2004 AND 2015 ORDER BY released_year; # SELECT book released not in between 2004 to 2015 

# CAST() ;- convert the values to desired data type. its best to use cast when using between with daste or time values. 
SELECT CAST('2017-05-02' AS DATETIME); 

# SELECT name, birthdt FROM people WHERE birthdt BETWEEN '1980-01-01' AND '2000-01-01';
# SELECT name, birthdt FROM people WHERE birthdt BETWEEN CAST('1980-01-01' AS DATETIME) AND CAST('2000-01-01' AS DATETIME);

# 191. IN and NOT IN 
# it is similar to:
SELECT title, author_lname FROM books WHERE author_lname = 'Carver' OR 
                                            author_lname = 'Lahiri' OR 
                                            author_lname = 'Smith';
# Instead use IN: 
SELECT title, author_lname FROM books WHERE author_lname IN('Carver', 'Lahiri', 'Smith'); 

# IN can be used for number too 
SELECT title, released_year FROM books WHERE released_year IN(2017, 1985); # in can be used for number too 

# NOT IN
# it is similar to:
SELECT title, author_lname FROM books WHERE author_lname != 'Carver' OR 
                                            author_lname != 'Lahiri' OR 
                                            author_lname != 'Smith';
# Instead use IN: 
SELECT title, author_lname FROM books WHERE author_lname NOT IN('Carver', 'Lahiri', 'Smith'); 

SELECT title, released_year FROM books WHERE released_year != 2000 AND
                                             released_year != 2002 AND
                                             released_year != 2004 AND
                                             released_year != 2006 AND
                                             released_year != 2008 AND
                                             released_year != 2010 AND
                                             released_year != 2012 AND
                                             released_year != 2014 AND
                                             released_year != 2016;
 
SELECT title, released_year FROM books
WHERE released_year NOT IN(2000,2002,2004,2006,2008,2010,2012,2014,2016);
 
SELECT title, released_year FROM books WHERE released_year >= 2000 
                                       AND released_year NOT IN(2000,2002,2004,2006,2008,2010,2012,2014,2016);
 
SELECT title, released_year FROM books WHERE released_year >= 2000 
                                       AND released_year % 2 != 0 # use % for calculating the reminders. 
                                                                  # select released_year where the reminders is not zero when divided by 2 (odd year)
                                       ORDER BY released_year;

# 193. CASE Statements:- Conditional statement. to add logic
SELECT title, released_year,
       CASE 
           WHEN released_year >= 2000 THEN 'Modern Lit'
           ELSE '20th Century Lit'
       END AS 'Genre'
FROM books;

SELECT title, stock_quantity,
       CASE 
           WHEN stock_quantity < 0 THEN 'Error'
           WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
           WHEN stock_quantity BETWEEN 51 AND 100 THEN '***'
           WHEN stock_quantity BETWEEN 101 AND 150 THEN '***'
           ELSE '****'
      END AS 'Stock stars'
FROM books;

# or
SELECT title, stock_quantity,
    CASE 
        WHEN stock_quantity <= 50 THEN '*'
        WHEN stock_quantity <= 100 THEN '**'
        ELSE '***'
    END AS STOCK
FROM books; 