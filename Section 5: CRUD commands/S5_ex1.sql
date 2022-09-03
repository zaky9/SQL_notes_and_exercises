# Excercise from slide 71
# Write the SQL that selects the following:
# +--------+
# | cat_id |
# +--------+
# |      1 |
# |      2 |
# |      3 |
# |      4 |
# |      5 |
# |      6 |
# |      7 |
# +--------+
# Answer:
SELECT cat_id FROM cats;

# Write the SQL that selects the following:
# +----------------+------------+
# | name           | breed      |
# +----------------+------------+
# | Ringo          | Tabby      |
# | Cindy          | Maine Coon |
# | Dumbledore     | Maine Coon |
# | Egg            | Persian    |
# | Misty          | Tabby      |
# | George Michael | Ragdoll    |
# | Jackson        | Sphynx     |
# +----------------+------------+

# Answer:
SELECT name, breed FROM cats;

# Write the SQL that selects the following:
# (Just the Tabby cats)
# +-------+------+
# | name  | age  |
# +-------+------+
# | Ringo |    4 |
# | Misty |   13 |
# +-------+------+

# Answer:
SELECT name, age FROM cats WHERE breed='Tabby';

# Write the SQL that selects the following:

# cat_id is same as age
# +--------+------+
# | cat_id | age  |
# +--------+------+
# |      4 |    4 |
# |      7 |    7 |
# +--------+------+

# Answer:
SELECT cat_id, age FROM cats WHERE cat_id=age;