# Insert data to the tables:
# INSERT INTO table_name(column_name) VALUES (data);

INSERT INTO cats(name,age) VALUES("Dassy",12);""

SELECT * FROM cats; # to view the table

# Multiple inserting data
INSERT INTO cats(name,age)
VALUES('Charlie',10),("Sadie",3),('Bob',9);

# Check warning:
SHOW WARNING;

# describe the table
# DESC <table_name>;

# 54. By default the data is set as NULL, to change:
CREATE TABLE cats2(name VARCHAR(100) NOT NULL,
                  age INT NOT NULL);

# 56. Setting Default Values:
# - by default the placeholder for no insert data is NULL, to change:
CREATE TABLE cats3(name VARCHAR(100) DEFAULT 'nameless',
                  age INT DEFAULT 99);

# Delete tables
# DROP TABLE <table_name>;

# 57. A primer on primary keys- a unique identifier 
# The PRIMARY KEY constraint uniquely identifies each record in a table
CREATE TABLE unique_cats(cat_id INT NOT NULL, name VARCHAR(100),
                        age INT,
                        PRIMARY KEY (cat_id));
# to have auto increment of id:
CREATE TABLE unique_cats_auto(cat_id INT NOT NULL AUTO_INCREMENT,
                             name VARCHAR(100),
                             age INT,
                             PRIMARY KEY(cat_id));
INSERT INTO unique_cats_auto(name, age) VALUES('Skippy',4); # add auto id
                             

