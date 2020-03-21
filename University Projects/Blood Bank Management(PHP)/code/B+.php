<?php

require './Controller/BloodController.php';
$con = new mysqli('localhost', 'root','', 'blooddb');
//Check connection
if ($con->connect_error) {
   die("Connection failed: " . $con->connect_error);
} 
//echo "Connected successfully";
echo "<br>";

$sql = 'SELECT user_table.name, blood_group_table.blood_type, user_table.age, address_detail.area, address_detail.fb_link
FROM user_table
LEFT JOIN address_detail
ON user_table.id=address_detail.user_table_id
LEFT JOIN blood_group_table
ON user_table.id=blood_group_table.user_table_id
WHERE blood_group_table.blood_type="B+"';
//die($sql);0
$result = $con->query($sql);

//include 'head.php';
?>

<html>
    <head>
    	<title>SearchByType</title>
    	<style>
    	body {background-image: url(./Images/blood-donation-donor-2.jpg); background-repeat: no-repeat;
    background-size: cover;}
    	


    	</style>
    	       	   	</head>
    	   	<body>

<table border="1px"; align="center">
	<thead>
		<tr>
					
			<td><span style="font-weight:bold">Name</span></td>
			<td><span style="font-weight:bold">Blood Group</span></td>
			<td><span style="font-weight:bold">Area</span></td>
			<td><span style="font-weight:bold">FaceBook Link</span></td>
			<td><span style="font-weight:bold">Age</span></td>
		</tr>
	</thead>
	<tbody>
		<?php
		while($row = $result->fetch_assoc()){
			echo "<tr>";
			
			echo "<td>".$row['name']."</td>";
			echo "<td>".$row['blood_type']."</td>";
			echo "<td>".$row['area']."</td>";
			echo "<td>".$row['fb_link']."</td>";
			//echo "<td>".$row['phone']."</td>";
			echo "<td>".$row['age']."</td>";

			echo "</tr>";
		}
		?>
	</tbody>
</table>
</body>
</html>



