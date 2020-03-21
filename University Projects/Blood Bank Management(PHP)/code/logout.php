<?php 


require './Controller/BloodController.php';
$con = new mysqli('localhost', 'root','', 'blooddb');
//Check connection
if ($con->connect_error) {
   die("Connection failed: " . $con->connect_error);
} 
echo "Connected successfully";
echo "<br>";



//include 'head.php';
session_start();
unset($_SESSION['sess_user']);
session_destroy();
header("location:login.php");
?>
