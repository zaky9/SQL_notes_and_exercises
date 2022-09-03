# CRUD (Create Read Update Delete)
#  65. Prepare our data 

CREATE DATABASE dp_cats;
USE dp_cats;
# drop table cats;
DROP TABLE cats;

# Create table cats
CREATE TABLE cats
(
    cat_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100),
    breed VARCHAR(100),
    age INT,
    PRIMARY KEY(cat_id)
);

# Describe table cats
DESC cats;

# insert data
INSERT INTO cats(name, breed, age)
VALUES ('Ringo', 'Tabby', 4),
       ('Cindy', 'Maine Coon', 10),
       ('Dumbledore', 'Maine Coon', 11),
       ('Egg', 'Persian', 4),
       ('Misty', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphynx', 7);
       
# 67. READ table
# Read every data from table cats
SELECT * FROM cats;

# read only specific column 
SELECT age FROM cats;
SELECT name FROM cats;
SELECT cat_id FROM cats;
SELECT name, age FROM cats;
SELECT name, age, breed FROM cats; # the order of the specified column matter

# 69. WHERE clause - to specify reading the data (condition)
# Note: by default the WHERE clause is case insensitive
SELECT * FROM cats WHERE age=4; # only select data from cats table where the age is 4
SELECT * FROM cats WHERE name='Egg'; # only select data where the name is 'Egg'

# 74. Aliases: specify how data shoud be displayed back to user
# renamae the column without altering the original column name
SELECT cat_id as id FROM cats;
SELECT cat_id as id, name AS 'cat name' , breed AS 'kitty breed' FROM cats;
DESC cats;

# 76. The UPDATE command: to alter the existing data 
# UPDATE <table_name> SET <column_name>=<replaced_data>  WHERE <column_name> = <specified_data>
# Replace breed 'Tabby' into 'Shorthair'
UPDATE cats SET breed='Shorthair' WHERE breed='Tabby';
SELECT name, breed FROM cats WHERE breed='Shorthair';

# Replace the age of 'Misty' to 14
SELECT name, age FROM cats WHERE name= 'Misty';
UPDATE cats SET age=14 WHERE name='Misty';
SELECT name, age FROM cats WHERE name= 'Misty';

# 81. DELETE: delete data
# DELETE FROM <_table_name> WHERE <column_name>=<data>
DELETE FROM cats WHERE name='Egg';

