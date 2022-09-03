'''
1.First create database by:
CREATE DATABASE <db_name>;

2.Select  the database by:
USE <db_name>;

2a. show available database:
SHOW databases;

2c. USE <database name>; => to select which database to be used

2d. SELECT database(); => show which database is currently used

3.Create table:
CREATE TABLE table_name
  (
    column_name data_type,
    column_name data_type
  );
  
4. To check the table:
SHOW COLUMNS FROM <table_name>; or DESC <table_name>;

5. to drop/delete table:
DROP TABLE <table_name>

6. show available tables in the dataset;
SHOW TABLES; or SHOW FULL TABLES; -> optional FULL modifier will show the table type as a second output column
'''
CREATE TABLE cats
  (
    name VARCHAR(100),
    age INT
  );