
'''
# 200. Relationship basic 
1. One to one relationship: one element of A  only be linked to one element of B, and vice versa. 
                            eg: customers details table, where each detail belong to a costumer 
2. One to many relationship: an element of A may be linked to many elements of B, but a member of B is linked to only one element of A.
                            eg: book reviews. there are many book reviews but each  reviews only associated with one book
3. Many to many relationship: occurs when multiple records in a table (A) are associated with multiple records in another table (B)
                            eg: books and authors. a book can be writen by many authors and each authors can write many books

# 201. One to many
costumers and orders: costumers have many orders, orders have one customer associated with them 

Eg: 
table 1: Customers
customer_id (PRIMARY KEY)
first_name
last_name
email

table 2: Orders
order_id (PRIMARY KEY)
order_date
amount
customer_id (FOREIGN KEY)

PRIMARY KEY: to ensure data in the specific column is unique
FOREIGN KEY: a column or group of columns in a relational database table that provides a link between data in two tables
'''
DROP DATABASE IF EXISTS customers_and_orders;
CREATE DATABASE customers_and_orders;
USE customers_and_orders;

CREATE TABLE customers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE orders(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES customers(id) 
    ON DELETE CASCADE
);

INSERT INTO customers(first_name, last_name, email)
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George','Michael','gm@gmail.com'),
       ('David', 'Bowie',' david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette','Davis','bette@aol.com');

INSERT INTO orders( order_date, amount, customer_id)
    VALUES ('2016/02/10', 99.99, 1),
           ('2017/11/11', 35.50, 1),
           ('2014/12/12', 800.67, 2),
           ('2015/01/03', 12.50, 2),
           ('1999/04/11', 450.25, 5);
           
# 204. join:- Used to generate a paired combination of each row of the first table with each row of the second table.
          # - Join two table by taking data from another and stick them together
          # - REFFERENCE: https://www.codeproject.com/Articles/33052/Visual-Representation-of-SQL-Joins
          
# 206. INNER JOIN: Selects records that have matching values in both tables
# IMPLICIT INNER JOIN: 
SELECT first_name, last_name, order_date, amount FROM customers, orders WHERE customers.id= orders.customer_id;  
# EXPLICIT INNER JOIN:
SELECT first_name, last_name, order_date, amount FROM customers JOIN orders ON customers.id = orders.customer_id; 

 
 SELECT customer_id, first_name, last_name, order_date, amount
 FROM customers 
 JOIN orders 
     ON customers.id = orders.customer_id 
GROUP BY orders.customer_id; # group by customer_id (therfore customer id that available in the order table)

 SELECT customer_id, first_name, last_name, order_date, SUM(amount) AS total_spent 
 FROM customers 
 JOIN orders 
     ON customers.id = orders.customer_id 
GROUP BY orders.customer_id
ORDER BY total_spent DESC;

# 208. LEFT JOIN: return all of the records in the left table (table A) that do not match any records in the right table (table B). 
#                 It will also return any matching records from the right table
SELECT 
    first_name, 
    last_name,
    IFNULL(SUM(amount), 0) AS total_spent # left join also include all the data from table customers
FROM customers
LEFT JOIN orders 
    ON customers.id = orders.customer_id
GROUP BY customers.id
ORDER BY total_spent; 

# 210. RIGHT JOINS: return all of the records in the right table (table B) regardless if any of those records have a match in the left table (table A). 
#                   It will also return any matching records from the left table. 
