# Section 7: Using the dataset from book_data.sql 

# +----------------+--------------+------+-----+---------+----------------+
# | Field          | Type         | Null | Key | Default | Extra          |
# +----------------+--------------+------+-----+---------+----------------+
# | book_id        | int(11)      | NO   | PRI | NULL    | auto_increment |
# | title          | varchar(100) | YES  |     | NULL    |                |
# | author_fname   | varchar(100) | YES  |     | NULL    |                |
# | author_lname   | varchar(100) | YES  |     | NULL    |                |
# | released_year  | int(11)      | YES  |     | NULL    |                |
# | stock_quantity | int(11)      | YES  |     | NULL    |                |
# | pages          | int(11)      | YES  |     | NULL    |                |
# +----------------+--------------+------+-----+---------+----------------+

# Documentation  for String and Function and operators 
# https://dev.mysql.com/doc/refman/8.0/en/string-functions.html

# 102. Working with CONCAT: combine multiple of data
# It does not affect the original data
# Syntax:SELECT CONCAT(<coumn1>, <column2>) FROM <database>;
SELECT CONCAT('Hello', 'World', '...');

# Eg: combining author_fname with author_lname
SELECT author_fname, author_lname FROM books;

SELECT CONCAT(author_fname, ' ', author_lname) FROM books;
# To rename the column name:
SELECT CONCAT(author_fname, ' ', author_lname) AS 'Full name' FROM books;

# To select the first name, last name and full name in three columns
SELECT author_fname as 'Fisrt name', author_lname 'Last name',
CONCAT(author_fname, ' ',author_lname) AS 'Full name' FROM books;

# CONCAT_WS:- CONCAT with seperation 
# Syntax:
# SELECT CONCAT_WS('<seperated variable>', <column1>, <column2>, <column_n>) FROM <database>;
# Eg:
SELECT CONCAT_WS('-', title, author_fname, author_lname) FROM books;

# 104. Introducing SUBSTRING: allow us to select individual parts or portion of a string.
# Syntax:
# SELECT SUBSTRING(<strings>, <start>, <end>);
SELECT SUBSTRING('Hello World', 2); # SQL count from 1 not 0 therefore output is 'ello World'
SELECT SUBSTRING('Hello World', 1, 4); # 'Hell' 
SELECT SUBSTRING('Hello World', -3); #  'rld' last 3 string (count from the back)

# To select the title of the book where using only 10 characters
SELECT SUBSTRING(title,1,10) AS 'Title shorten' FROM books;
SELECT CONCAT(SUBSTRING(title,1,10),'...') AS 'Short title' FROM books;

# 106. Introduction to REPLACE 
# syntax: SELECT REPLACE(<strings>, '<word to replace>', '<word replaced with>');
SELECT REPLACE('Hello world', 'Hell', '%$#@') AS 'Cencored'; # return:  %$#@o world

SELECT REPLACE('Hello world', 'l', '7'); # return: He77o wor7d
SELECT REPLACE('cheese bread coffee milk', ' ', ' and '); # cheese and bread and coffee and milk 

# replace all e to 3 in the title column
SELECT REPLACE(title, 'e', '3') FROM books;

# replace all e to 3 in the title column and only showing 10 char
SELECT SUBSTRING(REPLACE(title, 'e', '3'), 1, 10) FROM books;

# Combining concat, substring and replace
SELECT CONCAT(SUBSTRING(REPLACE(title, 'e', '3'), 1, 10),'...') FROM books;

# 108. reverse strings 
SELECT REVERSE('Hello world'); # return: dlrow olleH

SELECT REVERSE(author_fname) FROM books;
 
SELECT CONCAT_WS(' ','woof', REVERSE('woof'));

SELECT CONCAT(author_fname, REVERSE(author_fname)) FROM books;

# 110. Working with CHAR LENGTH: count characters in String 
SELECT CHAR_LENGTH('Hello world'); # return: 11

SELECT author_fname AS 'First name',
       CHAR_LENGTH(author_fname) AS 'length'
       FROM books;

SELECT CONCAT_WS(' ', author_fname,'is',CHAR_LENGTH(author_fname),'characters long') AS 'sentences' FROM books;

# 112 Changing case with UPPER and LOWER: Change a string case
SELECT UPPER('Hello world');
SELECT LOWER('HELLO WORLD');

SELECT CONCAT('MY FAVORITE BOOK IS', UPPER(title)) FROM books;
SELECT CONCAT('my favorite book is', LOWER(title)) FROM books;

SELECT UPPER(CONCAT(author_fname, ' ', author_lname)) AS "full name in caps" FROM books;
# or 
SELECT CONCAT(UPPER(author_fname), ' ', UPPER(author_lname)) AS "full name in caps"  FROM books;