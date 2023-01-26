CREATE DATABASE testDB;
USE testDB;
CREATE TABLE movies (uid integer PRIMARY KEY, name VARCHAR(50), score DECIMAL(3,2));
INSERT INTO movies VALUES(1, 'Forest Gump', 9.9);
INSERT INTO movies VALUES(2, 'Shining', 8.9);
SELECT * FROM movies;