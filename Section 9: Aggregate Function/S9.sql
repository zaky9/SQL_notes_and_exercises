# aggregate functions: to combine data 

# 135. The COUNT Function 
SELECT COUNT(*) FROM books; # 19 books (including the duplicate)
SELECT COUNT(DISTINCT author_fname) FROM books; # 12
SELECT COUNT(DISTINCT author_fname, author_lname) FROM books; # 12 authors

# how many titles contain 'the'
SELECT COUNT(title) AS "No. title with 'the'" FROM books WHERE title LIKE '%the%'; # or 
SELECT COUNT(*) FROM books WHERE title LIKE '%the%';

# 137. Group by: Summarizes or aggregates identical data into single rows 
SELECT title, author_fname, author_lname FROM books; 
SELECT title, author_fname, author_lname FROM books GROUP BY author_lname;

# count how many of the authors have written 
SELECT CONCAT(author_fname,' ', author_lname) AS "Author's full name", 
       COUNT(*) AS 'No. of books'
FROM books 
GROUP BY author_lname, author_fname;

# how many books released per year 
SELECT released_year,
       COUNT(*) 
FROM books 
GROUP BY released_year;

SELECT CONCAT('In ', released_year, ' ', COUNT(*), ' book(s) is/are released') AS 'In sentences' 
FROM books GROUP BY released_year;

# 140. Min and Max Basics  
SELECT Min(released_year) FROM books;
SELECT Min(pages) FROM books;

SELECT Max(released_year) FROM books;
SELECT Max(pages) FROM books;

# SELECT the longest and shortest book
SELECT * FROM books WHERE pages = (SELECT Max(pages) FROM books); # the query read the bracket first 
SELECT * FROM books WHERE pages = (SELECT Min(pages) FROM books); 
# or
SELECT * FROM books ORDER BY pages DESC limit 1;
SELECT * FROM books ORDER BY pages ASC limit 1; # faster way because there is only 1 query 

# 114. Using Min and Max with GROUP BY 
# Find the year each author published their first book 
SELECT author_fname AS 'First name', 
       author_lname AS 'Last name', 
       Min(released_year) AS 'First book released year'
FROM books 
GROUP BY author_lname, author_fname;

# Find the longest page count for each author 
SELECT author_fname AS 'First name',
       author_lname AS 'Last name',
       Min(pages) AS 'No. of pages'
FROM books
GROUP BY author_fname, author_lname 
ORDER BY pages DESC;

SELECT
  CONCAT(author_fname, ' ', author_lname) AS author,
  MAX(pages) AS 'longest book'
FROM books
GROUP BY author_lname,
         author_fname;
         
# 146. The SUM Function 
# Sum all pages in the entire database 
SELECT Sum(released_year) FROM books; 

# Sum all pages each author has written 
SELECT author_fname, author_lname, Sum(pages) 
FROM books 
GROUP BY author_fname, author_lname
ORDER BY Sum(pages) DESC;

# 148. The Avg Function 
# Calculate the average released_year across all books 
SELECT AVG(released_year) FROM books;

# Calculate the average stock quantity for books released in the same year
SELECT released_year , AVG(stock_quantity)
FROM books 
GROUP BY released_year
ORDER BY released_year DESC;