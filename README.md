# CS348 Group Project

This application is based on datasets of movies and TV shows, and allows movie and TV show fans to search, view, rate and leave comments for each movie and TV show.

# Installation
1. In the MySQL server, run the initial.sql by `source initial.sql;`, creates a user with name 'user1' and password 'Password0!'.

# Funcionalties of Mysql
1. View information about the movie selected based on the name. (ex. `The Matrix`)
2. Find all movies with rating in a specific range. (ex. `> 7.0/10.0`)
3. Find all movies directed by a specific director. (ex. `Hiner Saleem`)
4. Find movies with `top-n` ratings. (ps. now only support `n <= 4`)
5. Leave both a rate and a comment on a specific movie.

# Funcionalties of database-driven application
1. View information about the movie selected based on the name. (ex. `The Matrix`)

# Instruction on Mysql
1. log into Mysql using your username and password.
2. Type `source create-tables.sql`. This will create a new database called `CS348_Movie_DB` and all the tables needed.
3. Type `sample-data.sql`. This will insert some sample data into the tables.
4. Type `test-sample.sql`. This will show the output for the 5 functionalities we have so far.

# Instruction on Back End
Type `python3 main.py` in back-end to start.

# Instruction on User Interface
1. `npm install`
2. `npm start`

The program currently supports the search feature.

# Members
Claire Sheng

Ganlin Feng

Junyi Liu

Yuming Long

