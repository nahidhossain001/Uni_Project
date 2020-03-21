<?php
    
    //Login data for the database,Use this file in all Models

	$con = new mysqli('localhost', 'root','', 'blooddb');
// Check connection
if ($con->connect_error) {
    die("Connection failed: " . $con->connect_error);
} 
//echo "Connected successfully";
echo "<br>";
    $host="localhost";
    $user="root";
    $passwd="";
    $database="blooddb";
            



?>

