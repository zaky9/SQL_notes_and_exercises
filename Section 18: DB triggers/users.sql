# 320. Introduction to database triggers 
-- Trigers: SQL statements that are automatically run when is triggered 
-- rg: inserting new inapropriate data (eg: age limit),

-- Syntax 
# CREATE TRIGGER trigger_name 
# 	trigger_time (BEFORE,AFTER) trigger_event (INSERT, UPDATE,DELETE,..) ON table_name FOR EACH ROW 
#     BEGIN
#     ... 
#     END;

DROP DATABASE IF EXISTS trigger_demo;
CREATE DATABASE trigger_demo;
USE trigger_demo;

CREATE TABLE users(
    username VARCHAR(100),
    age INT
);

INSERT INTO users (username, age) VALUES("Bobby", 23);


-- Trigger: Preventing user to input age <18
DELIMITER $$ # changing the delimiter to $$ so that it treated the whole code at once,  not individually

CREATE TRIGGER must_be_adult # Name of the trigger 
     BEFORE INSERT ON users FOR EACH ROW # BEFORE refer to running after/before it trigger
     BEGIN
          IF NEW.age < 18 # NEW is the placeeholder and age refer to the column
          THEN
              SIGNAL SQLSTATE '45000' #  error code (unhandled user defined exception)
                    SET MESSAGE_TEXT = 'Must be an adult!';
          END IF;
     END;
$$

DELIMITER ; # changing back the delimiter to ";"

# INSERT INTO users (username, age) VALUES("Bobby", 12);

IF NEW.follower_id = NEW.followee_id