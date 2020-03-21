<?php 


require './Controller/BloodController.php';
$con = new mysqli('localhost', 'root','', 'blooddb');
//Check connection
if ($con->connect_error) {
   die("Connection failed: " . $con->connect_error);
} 
//echo "Connected successfully";
echo "<br>";



//include 'head.php';

session_start();
if(!isset($_SESSION["sess_user"])){
	header("location:login.php");
} else {
?>
<!doctype html>
<html>
<head>
<title>Welcome</title>
<style>
h2,p {

	color: white;
}
body{

background-color: #ed1047;


}

</style>
</head>
<body>
<h2>Welcome, <?=$_SESSION['sess_user'];?>! <a href="logout.php">Logout</a></h2>
<p>
Thank You for Registration.
</p>
</body>
</html>
<?php
}
?>


