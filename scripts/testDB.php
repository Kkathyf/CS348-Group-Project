<!DOCTYPE html>
<html>
<body>
<?php
$servername = "127.0.0.1";
$username = "user1";
$password = "Password0!";
$dbname = "testDB";
// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
$conn->connect_error;
$sql = "SELECT uid FROM movies"; $result = $conn->query($sql); 
echo $result->num_rows." movies in the movies table";
$conn->close();
?>
</body>
</html>