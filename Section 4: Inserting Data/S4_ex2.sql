# Define an employee table with the following fields 
# id- number (automatically increments), mandatory, primary key
# last_name - text, mandatory 
# first_name - text, mandatory
# middle_name - text, not mandatory 
# age - number, mandatory 
# current_status - text, mandatory, defaults to employed 

CREATE DATABASE db_eployee;

USE db_eployee;
CREATE TABLE employees(id INT NOT NULL AUTO_INCREMENT,
                      last_name VARCHAR(20) NOT NULL,
                      first_name VARCHAR(20) NOT NULL,
                      middle_name VARCHAR(20),
                      age INT NOT NULL,
                      current_status VARCHAR(20) NOT NULL DEFAULT 'employed',
                      PRIMARY KEY(id)
                      );
INSERT INTO employees(first_name,last_name,age) VALUES('Dora', 'Smith', 58);
                     