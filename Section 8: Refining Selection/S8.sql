       
SELECT title FROM books;

# 121. DISTINCT: to not show duplicate data
SELECT DISTINCT author_lname FROM books; 

SELECT  author_lname, author_fname  released_year FROM books;
SELECT  author_lname, author_fname DISTINCT released_year FROM books;

# Distinct full names? 
SELECT DISTINCT author_fname, author_lname FROM books;
SELECT DISTINCT CONCAT(author_fname,' ',author_lname) AS 'Distinct full name' FROM books;

# 123. Soring data with ORDER BY: sorting results
SELECT author_lname FROM books ORDER BY author_lname; # by defaut order in ascending order
SELECT author_lname FROM books ORDER BY author_lname DESC; # DESC order in descending order 

SELECT title, released_year FROM books ORDER BY released_year; # OR 
SELECT title, released_year FROM books ORDER BY 2; # 2 refered to released_year (its for shortcut!) 

# order by 2 column data.
SELECT author_fname, author_lname FROM books ORDER BY author_lname, author_fname; 

# 125. Using LIMIT: define how many data you want to display 
SELECT title FROM books LIMIT 3;

# show only the 5 most recent books:
SELECT title, released_year FROM books ORDER BY released_year DESC LIMIT 5;
# or
SELECT title, released_year FROM books ORDER BY released_year DESC LIMIT 0,5; # LIMIT <first> <last>
# if you are not sure the number of the last data use huge number eg:
SELECT title, released_year FROM books ORDER BY released_year DESC LIMIT 5,9999; # 

# 127. Better searches with LIKE: search based on not specific data 
SELECT title, author_fname FROM books WHERE author_fname LIKE '%da%'; # search by first name that have 'da' 
SELECT title, author_fname FROM books WHERE author_fname LIKE 'da%'; # similar to the previous but search based on only start with da 

# use '_' to search based on number of character 
# LIKE '_' -> 1 character '__' -> 2 character

SELECT title, stock_quantity FROM books WHERE stock_quantity LIKE '__'; # show title of books that has 2 digit stock 

# if the data has % or _  use \ to seperate the difference 
SELECT title FROM books WHERE title LIKE '%\%%';
SELECT title FROM books WHERE title LIKE '%\_%';
