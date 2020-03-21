<?php

$title ="Managment";
$con = new mysqli('localhost', 'root','', 'blooddb');
// Check connection
if ($con->connect_error) {
    die("Connection failed: " . $con->connect_error);
} 
echo "Connected successfully";
echo "<br>";

$content = '<h3>Blood</h3>
            <a href="BloodAdd.php">Add New Blood Group</a><br/>
            <a href="Bloodoverview.php">Blood Group Overview</a><br/>';
            
include './Template.php';

?>
