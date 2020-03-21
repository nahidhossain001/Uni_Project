<?php

require ("Entities/BloodEntity.php");
//connect
$con = new mysqli('localhost', 'root','', 'blooddb');
// Check connection
if ($con->connect_error) {
    die("Connection failed: " . $con->connect_error);
} 
//echo "Connected successfully";
echo "<br>";

//contains database related code for the bloodbank page

class BloodModel 
{
    //get all types of blood grp from the datebase and return them in an array
    
    function GetBloodType()
    {
       require 'Credentials.php';
       
       // open connection and select database
        mysql_connect($host,$user,$passwd) or die(mysql_error());
       mysql_select_db($database);
       $result =mysql_qurey("SELECT DISTINCT type FROM BloodGroup") or die(mysql_error());
       $type = array();
       
       //get data from database
       while($row =mysql_fetch_array($result))
       {
           
           array_push($types, $row[0]);
       }
            
     //close connection and return result
       mysql_close();
       return $types;
    }
    
    function GetBloodByType($type)
    {
        require 'Credentials.php';
        
        //open connection and select database
        mysql_connect($host, $user, $passwd) or die(mysql_error());
        mysql_select_db($database);
        
        $qurey = "SELECT FROM blood WHERE type LIKE'$type'";
        $result=mysql_query($qurey) or die(mysql_error());
        $bloodArray= array();
        
        //get data from database
        while($row=mysql_fetch_array($result))
        {
            $id=$row[0];
            $name = $row[1];
            $type = $row[2];
            $area= $row[3];
            $number = $row[4];
            
            //create blood object and store them in an array.
            
            $blood = new BloodEntity($id, $name, $type, $area, $number);
            array_push($bloodArray, $blood);
            
           
        }
         //close connection
            
            mysql_close();
            return $bloodArray;
            
    }
    
    
    function GetBloodById($id)
    {
              require 'Credentials.php';
        
        //open connection and select database
        mysql_connect($host, $user, $passwd) or die(mysql_error());
        mysql_select_db($database);
        
        $qurey = "SELECT FROM blood WHERE id = $id";
        $result=mysql_query($qurey) or die(mysql_error());
        
        
        //get data from database
        while($row=mysql_fetch_array($result))
        {
            $name = $row[1];
            $type = $row[2];
            $area= $row[3];
            $number = $row[4];
            
            //create blood 
            
            $blood = new BloodEntity($id, $name, $type, $area, $number);
      
            
           
        }
         //close connection
            
            mysql_close();
            return $blood;
        
    }
    
    
    function InsertBlood(BloodEntity $blood){
        
        $query =sprintf("INSERT INTO blood
                    (name,type,area,number)
                    VALUES
                    ('%s','%s','%s','%s')",
                
        mysql_real_escape_string($blood->name),
        mysql_real_escape_string($blood->type),
        mysql_real_escape_string($blood->area),
        mysql_real_escape_string($blood->number));
                   
        
        
        $this->PerformQuery($query);

    }
    
    
    
    
    
     function UpdateBlood($id, BloodEntity $blood){
        
        $query=sprintf("UPDATE blood
                        SET name='%s', type= '%s', area='%s', number='%s'
                       WHERE id= $id",
         mysql_real_escape_string($blood->name),
        mysql_real_escape_string($blood->type),
        mysql_real_escape_string($blood->area),
        mysql_real_escape_string($blood->number));
        
        $this->PerformQuery($query);
    }
    
    
    
    
    
    
    
    
     function DeleteBlood($id){
        $query ="DELET FROM blood WHERE id= $id";
        $this->PerformQuery($query);
        
    }
    
    
   
    
    
    
    
    function PerformQuery($query){
        
              
        
        require ('./Credentials.php');
        mysql_connect($host, $user ,$passwd) or(mysql_error());
        mysql_select_db($database);
       
        
        mysql_query($query) or die(mysql_error());
        mysql_close();
    }
    
 
   
}


?>