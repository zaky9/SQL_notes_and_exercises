# Excercise slide 83
# DELETE all 4 year old cats
DELETE FROM cats WHERE age=4;
SELECT * FROM cats WHERE age=4;

# DELETE cats whose age is the same as their cat_id
DELETE FROM cats WHERE age=cat_id;
SELECT * FROM cats;

DELETE FROM cats;
SELECT * from cats;