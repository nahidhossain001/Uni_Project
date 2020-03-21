    <!doctype html>
    <?php

    require './Controller/BloodController.php';
   
    //echo "Connected successfully";
    echo "<br>";
    //include './Template.php';


    //include 'head.php';
    ?>
    <html>
    <head>
    <title>Register</title>
    <link rel="stylesheet" type="text/css" href="Styles/Stylesheet.css"/>
    
</head>
    <style>

body {background-image: url(./Images/reg_04.jpg); background-repeat: no-repeat;
    background-size: cover; color: white


    }


    </style>
    </head>
    <body>

    <p><a href="register.php">Register</a> | <a href="login.php">Login</a></p>
    <h3 class="register">Registration Form</h3>
    <form action="" method="POST">

    <table  align="center" class="dip">
        <tr>
            <td><span style="font-weight:bold"><font color="black">Full Name</font> </span></td>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
        	<td><span style="font-weight:bold"><font color="black">  User Name </font> </span></td>
        	<td><input type="text" name="username"></td>

        </tr>
        <tr>
        	<td><span style="font-weight:bold"><font color="black">Password</font> </span> </td>
        	<td><input type="password" name="password"></td>
        </tr>
        <tr>    
            <td><span style="font-weight:bold"><font color="black">Blood Group</font></span></td>
            <td><input type="text" name="blood_type"></td>
        </tr>
        <tr>    
            <td><span style="font-weight:bold"><font color="black">Age</font> </span> </td>
            <td><input type="int" name="age"></td>
        </tr>
        <tr>
            <td><span style="font-weight:bold"><font color="black">Phone</font></span></td>
            <td><input type="text" name="phone"></td>
        </tr>
         <tr>
            <td><span style="font-weight:bold"><font color="black">Facebook Profile Link</font></span></td>
            <td><input type="text" name="fb_link"></td>
        </tr>
        <tr>
            <td><span style="font-weight:bold"><font color="black">Address</font></span></td>
            <td><input type="text" name="address"></td>
        </tr>
         <tr>
            <td><span style="font-weight:bold"><font color="black">Area</font></span></td>
            <td><input type="text" name="area"></td>
        </tr>
        <tr>
            <td><span style="font-weight:bold"><font color="black">National ID</font></span></td>
            <td><input type="text" name="n_id"></td>
        </tr>
        
        <tr>
            <td></td>
            <td><input type="submit" value="Register" name="submit" /></td>
        </tr>
        
    </table>


    </form>
    <?php
    if(isset($_POST["submit"])){

    if(!empty($_POST['username']) && !empty($_POST['password']) && !empty($_POST['name']) && !empty($_POST['blood_type']) && !empty($_POST['age']) && !empty($_POST['phone']) && !empty($_POST['fb_link']) && !empty($_POST['area']) && !empty($_POST['n_id']) ) {
    	$username=$_POST['username'];
    	$password=$_POST['password'];
        $name=$_POST['name'];
        $blood_type=$_POST['blood_type'];
        $age=$_POST['age'];
        $phone=$_POST['phone'];
        $fb_link=$_POST['fb_link'];
        $address=$_POST['address'];
        $area=$_POST['area'];
        $n_id=$_POST['n_id'];



    	 @mysql_connect('localhost','root','') or die(mysql_error());
           mysql_select_db('blooddb') or die("cannot select DB");

    	$query=mysql_query("SELECT * FROM login WHERE username='".$username."'");
    	$numrows=mysql_num_rows($query);
    	if($numrows==0)
    	{
         $sql="INSERT INTO user_table (name, phone, age, n_id) VALUES ('$name','$phone', '$age', '$n_id')";
       // $sql="INSERT INTO user_table (name, phone, age, n_id) VALUES ('Asif','1234', '22', '12345')";
        $result1 = mysql_query($sql);
        //$sql1 = "INSERT INTO login (username, password) VALUES ('$username', '$password')";
        $sql = "INSERT INTO login (username, password) VALUES ('$username', '$password')";
        $result2 = mysql_query($sql);
        $sql = "INSERT INTO blood_group_table (blood_type) VALUES ('$blood_type')";
        $result3 = mysql_query($sql);
        $sql = "INSERT INTO address_detail (address, area, fb_link) VALUES ('$address','$area','$fb_link')";
        $result4 = mysql_query($sql);
        
        if($result1){
            echo "1";
        }
        if($result2)
            echo "2";
        if($result3)
            echo "3";
        if($result4)
            echo "4";

        if($result1 && $result2 && $result3 && $result4){
        echo "Account Successfully Created";
        session_start();
        header("Location: member.php");
        } else {

    	echo "Failure!";
    	}

        /*
        //second table
        $sql2="INSERT INTO login(username,password) VALUES('$username','$password')";
        //  WHERE login.user_table_id=user_table.id";


        $result2=mysql_query($sql2);


        if($result2){
        echo "Account Successfully Created";
        } else {
        echo "Failure!";
       }
        //third table 
        $sql3="INSERT INTO blood_group_table(blood_type) VALUES('$blood_type')";

        $result3=mysql_query($sql3);


        if($result3){
        echo "Account Successfully Created";
        } else {
        echo "Failure!";
        }

         //forth table 
        $sql4="INSERT INTO address_detail(address, area, fb_link) VALUES('$address','$area','$fb_link')";

        $result4=mysql_query($sql4);


        /*if($result4){
        //echo "Account Successfully Created";
        //} else {
        //echo "Failure!";
        }*/


    	} else {
    	echo "That username already exists! Please try again with another.";
    	}

    } else {
    	echo "All fields are required!";
    }
    }
    ?>

    </body>
    </html>