-- Create users
CREATE user 'user1'@'localhost' identified by 'Password0!'; 
GRANT all on CS348_MOVIE_DB.* to 'user1'@'localhost'; 
ALTER user 'user1'@'localhost' identified with mysql_native_password by 'Password0!';