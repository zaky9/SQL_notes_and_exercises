USE cat_app;

CREATE TABLE cats_default(name VARCHAR(20) DEFAULT 'nameless',
                          age INT DEFAULT '-999')
                    
# To prevent NULL value in the dataset:
CREATE TABLE cats_default_no_null(name VARCHAR(20) NOT NULL DEFAULT 'nameless',
                          age INT NOT NULL DEFAULT '-999')
                         
