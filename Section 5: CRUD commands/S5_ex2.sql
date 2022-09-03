# Exercise from slide 78
# Change Jackson's name to "Jack"
SELECT name FROM cats;
UPDATE cats SET name='Jack' WHERE name  = 'Jackson';
SELECT name FROM cats;

# Change Ringo's breed to "British Shorthair"
UPDATE cats SET breed = 'British Shorthair' WHERE name= 'Ringo';
SELECT name, breed FROM cats;

# Update both Maine Coons' ages to be 12
UPDATE cats SET age = 12 WHERE breed = 'Maine Coon';
SELECT breed, age FROM cats WHERE breed= 'Maine Coon';