# DATA TYPES 
# 154. CHAR and VARCHAR 
# CHAR has a fix length (the length can  be any value from 0 to 255)
# CHAR  is faster for fixed length text (eg: abbreviation and boolean)

# table below show a fixed length of char (4, 4bytes)
# Value	    Char(4)	Storage	Varchar(4)	Storage
# ' '	     '    '	4 bytes	' '	        1 byte
# 'ab'	     'ab  '	4 bytes	'ab'	    3 bytes
# 'abcd      'abcd'	4 bytes	'abcd'	    5 bytes
# 'abcdefg'	 'abcd'	4 bytes	'abcdefg'	5 bytes

DROP DATABASE dog_db;
CREATE DATABASE dog_db;
USE dog_db;
CREATE TABLE dogs (name CHAR(5), breed VARCHAR(10));
INSERT INTO dogs(name, breed) VALUES ('bob','beagle'), 
                                     ('robby', 'corgi'),
                                     ('Princess Jane', 'Retriever'); # abv into 'Princ' 
# 157. Decimal:- fixed -point type and calcualtion are exact 
# DECIMAL(total No. of digits, No. of digits after decimal) 
# DECIMAL is better than floats/double when percision calculation is needed 
CREATE TABLE items(price DECIMAL(5,2));
INSERT INTO items(price) VALUES(7),(7986544), (34.88), (298.999), (0.233);
# +--------+
# | price  |
# +--------+
# |   7.00 |
# | 999.99 | # too large No. give the highest possible specified No.
# |  34.88 |
# | 299.00 | # it automatical round number
# |   0.23 |
# +--------+

# 159. FLOAT and DOUBLE : floating-point types and calculation are approximate
# store larger numbers using less space but lacking of precision (accurate) 

# Data Type|	Memory Needed|	Precision Issues
# FLOAT	   |      4 Bytes	 |     ~7 digits
# DOUBLE   |      8 Bytes	 |     ~15 digits 

CREATE TABLE thingies(price_float FLOAT, price_double DOUBLE);
INSERT INTO thingies(price_float, price_double) \
       VALUES(11222.22, 11222.22),
             (8877.45,8877.45),
             (88777444433.4545,88777444433.4545);
SELECT * FROM thingies;
# +-------------+------------------+
# | price_float | price_double     |
# +-------------+------------------+
# |     11222.2 |         11222.22 |
# |     8877.45 |          8877.45 |
# | 88777400000 | 88777444433.4545 | # float missed printing after 7 digits 
# +-------------+------------------+

# 162. DATE, TIME and DATETIME 
# DATE: 'YYYY-MM-DD' Format 
# TIME: 'HH:MM:SS' Format 
# DATETIME: 'YYYY-MM-DD HH:MM:SS' 
CREATE TABLE people(name VARCHAR(100),
                   birthdate DATE,
                   birthtime TIME, 
                   birthdt DATETIME);

INSERT INTO people (name, birthdate, birthtime, birthdt)
            VALUES ('Padma', '1983-11-11', '10:07:35', '1983-11-11 10:07:35'),
                   ('Larry', '1943-12-25', '04:10:42', '1943-12-25 04:10:42');


# 165. CURDATE, CURTIME, and NOW 
# url: https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html
# CURTIME() # current time 
# CURDATE() # current date 
# NOW() # current datetime 

INSERT INTO people (name, birthdate, birthtime, birthdt) VALUES 
            ('Bamboo', CURDATE(), CURTIME(), NOW());
# SELECT * FROM people; 

# 167. Formating DATES 
# DAY()
# DAYNAME() 
# DAYOFWEEK() 
# DAYOFYEAR() 

SELECT name, birthdate, DAY(birthdate) AS 'the day date',
                        DAYNAME(birthdate) AS 'day name',
                        DAYOFWEEK(birthdate) AS 'day of week',
                        DAYOFYEAR(birthdate) AS 'day of year'
                        FROM people;

# TIME():- HOUR, MINUTE 
# DATE(): DAY(), DAYNAME(), DAYOFWEEK(), DAYOFYEAR() MONTH(), MONTHNAME(), MONTHOFWEEK(), MONTHOFYEAR() 
# DATETIME(): HOUR(), MINUTE(), MONTH(), MONTHNAME(), MONTHOFWEEK(), MONTHOFYEAR() 

# DATE_FORMAT():- specify the date according to the format 
# url: https://www.mysqltutorial.org/mysql-date_format/
# %M : month name (january, february,..)
# %m : month numeric (00..12)
# %W : weekday name (Sunday, Monday, ..)
# %w : day of the week (0=Sunday..6= Saturday)
# %a : Abbreviated weekday name(Sun..Sat) 

SELECT name, birthdate, 
                        DATE_FORMAT(birthdate, '%W') AS 'day name',
                        DATE_FORMAT(birthdate, '%w') AS 'day of week',
                        DATE_FORMAT(birthdate, '%Y') AS 'year'
                        FROM people;

SELECT name, DATE_FORMAT(birthdt, 'Was born on a %W') FROM people;

SELECT DATE_FORMAT(birthdt, '%m/%d/%Y') FROM people;
SELECT DATE_FORMAT(birthdt, '%m/%d/%Y at %h:%i') FROM people;

# 169.Date math 
# DATEDIFF: difference between date 
SELECT name, birthdt, NOW(),DATEDIFF(NOW(), birthdt) AS "current date - birthdate" FROM people;

# DATE_ADD(date, INTERVAL, expr_unit), DATE_SUB(date, INTERVAL expr_unit) 
SELECT birthdt, DATE_ADD(birthdt, INTERVAL 1 MONTH) FROM people; # add 1 month to the birthdt(DATE()) 
SELECT birthdt, DATE_ADD(birthdt, INTERVAL 10 SECOND) FROM people;# add 10 SECOND to the birthdt(DATE()) 

# using +/- 
SELECT birthdt, birthdt + INTERVAL 1 MONTH FROM people; # add 1 month to the birthdt(DATE()) 
SELECT birthdt, birthdt - INTERVAL 5 MONTH FROM people; # substract 5 month 

# multiple operation: 
SELECT birthdt, birthdt + INTERVAL 15 MONTH 
                        + INTERVAL 10 HOUR 
                        - INTERVAL 20 SECOND AS 'multple operation'
FROM people;

# 171. Working with TIMESTAMP
# DATETIME range from 1000-01-01 00:00:00 to 9999-12-31 23:59:59 (YYYY-MM-DD HH:MM:SS)
# TIMESTAMP range from 1970-01-01 to 2038-01-19 03:14:07 (YYYY-MM-DD HH:MM:SS)
# TIMESTAMP take less space compared to DATETIME 

CREATE TABLE comments(content VARCHAR(100),
                      created_at TIMESTAMP DEFAULT NOW() # take the current time 
                         );
INSERT INTO comments(content) VALUES ('Hello world'),
                                     ('I love to eat');
SELECT * FROM comments; 

CREATE TABLE comments2(content VARCHAR(100),
                      created_at TIMESTAMP DEFAULT NOW() 
                       ON UPDATE CURRENT_TIMESTAMP  # this will update the timestamp into the latest changes/update
                         );
INSERT INTO comments2(content) VALUES ('I LIKE CATS AND DOGS'),
                                     ('I love SQL');                       
SELECT * FROM comments2; 

UPDATE comments2 SET content='THIS IS NOT GIBBERISH' where content='I LIKE CATS AND DOGS'; 
SELECT * FROM comments2; 