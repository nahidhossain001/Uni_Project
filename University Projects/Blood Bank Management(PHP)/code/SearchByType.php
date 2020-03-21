<!doctype html>
<?php






//include 'head.php';
//echo "Connection Status:";
$con = new mysqli('localhost', 'root','', 'blooddb');
// Check connection
if ($con->connect_error) {
    die("Connection failed: " . $con->connect_error);
} 
//echo "Connected successfully";
echo "<br>";


//$sql = "SELECT * FROM blood";
//$result = $con->query($sql);
/*echo "<pre>";
print_r($result);

echo "</pre>";

create a+,b+ ect 8 page and insert insted of blood.php*/
?>
<html>
    <head>
    	<title>SearchByType</title>
    	<style>
    	body {background-image: url(./Images/search.jpg);}
    	h3 {color: red;text-align: center;}


    	</style>
    	       	   	</head>
    	   	<body>

<table align="center">
<br/>
<br/><br/> <br/><br/>


<a href="A+.php"><button type="button"><h3>Click for A+ Blood Group</h3><line>Here you will find Information about your desired doner</line></a>
<br/>
<br/><br/>

<a href="A-.php"><button type="button"><h3> Click for A- Blood Group</h3><line>Here you will find Information about your desired doner</line> </a>
<br/>
<br/><br/>

<a href="B+.php"><button type="button"><h3> Click for B+ Blood Group</h3><line>Here you will find Information about your desired doner</line> </a>
<br/>
<br/><br/>

<a href="B-.php"><button type="button"><h3> Click for B- Blood Group</h3><line>Here you will find Information about your desired doner</line> </a>
<br/>
<br/><br/>


<a href="AB+.php"><button type="button"><h3> Click for AB+ Blood Group</h3><line>Here you will find Information about your desired doner</line> </a>
<br/>
<br/><br/>

<a href="AB-.php"><button type="button"><h3> Click for AB- Blood Group</h3><line>Here you will find Information about your desired doner</line> </a>
<br/>
<br/><br/>

<a href="O+.php"><button type="button"><h3> Click for O+ Blood Group</h3><line>Here you will find Information about your desired doner</line> </a>
<br/>
<br/><br/>

<a href="O-.php"><button type="button"><h3> Click for O- Blood Group</h3><line>Here you will find Information about your desired doner</line> </a>
<br/>
<br/><br/>

</table>
</body>
