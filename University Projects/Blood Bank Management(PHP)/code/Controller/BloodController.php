<script>
    function showConfirm(id){
        
        var c=confirm("Are you sure you wish to delete this item?");
        
        if(c)
            window.location="Bloodoverview.php?delete=" + id;
        
    }
    
    
</script>
<?php

$con = new mysqli('localhost', 'root','', 'blooddb');
// Check connection
if ($con->connect_error) {
    die("Connection failed: " . $con->connect_error);
} 
//echo "Connected successfully";
echo "<br>";
require ("Model/BloodModel.php");


//contains non-database functions like drop down list etc
class BloodController {
  
    
    function CreateOverviewTable(){
        
        $result ="
                   <table class='overviewTable'>
                    <tr>
                        <td></td>
                        <td></td>
                        <td><b>Id</b><b>
                        <td><b>Name</b><b>
                        <td><b>Area</b><b>
                        <td><b>Number</b><b>
                    </tr>";
                 
        
        $bloodArray= $this->GetBloodByType('%');
        
        foreach ($bloodArray as $key=> $value)
        {
            $result = $result.
                    "<tr>
                        <td><a href='BloodAdd.php?update=$value->id'>Update</a></td>
                        <td><a href='#'onclick='showConfirm($value->id')>Delete</a></td>
                        <td>$value->id</td>
                        <td>$value->name</td>
                        <td>$value->area</td>
                         <td>$value->number</td>   
                   </tr>";
        }
        $result=$result . "</table>";
        return $result;
        
    }
    
    
    
    
            function CreateBloodDropdownList()
    {
        
        $bloodModel = new BloodModel();
        $result ="<form action = '' method = 'post' width= '200px'>
                    Please select a type:
                    <select name='types' >
                           <option value = '%' > ALL </option>
                           ".$this->CreateOptionValues($bloodModel->GetBloodType()).
                    "</select>
                    <input type = 'submit' value = 'Search' />
                    </form>";
        
            
        return $result;
                
                
    }
    
    
    function CreateOptionValues(array $valueArray)
    {
        
        $result = "";
        
        foreach ($valueArray as $value){
            $result = $result . "<option value='$value'>$value</option>";
        }
        
        return $result;
    }
    
    
    function CreateBloodTables($types){
        
        $bloodModel = new BloodModel();
        $bloodArray = $bloodModel->GetBloodByType($types);
        $result ="";
        
        //generate a bloodtable for each bloodEntity in array
        
        foreach($bloodArray as $key=> $blood)
        {
            $result = $result .
                    "<table clss = 'bloodTable'>
                        <tr>
                            <th><th>
                            <th>NAME: </th>
                            <td>$blood->name<td>
                        </tr>
                        
                        <tr>
                        
                            <th>TYPE: </th>
                            <td>$blood->type<td>
                        </tr>
                        
                        <tr>
                        
                            <th>AREA: </th>
                            <td>$blood->area<td>
                        </tr>
                        

                        <tr>
                        
                            <th>NUMBER: </th>
                            <td>$blood->number<td>
                        </tr>
              

                    </table>";
            
        }
        return $result;
        
    }
    
    
    //set
    function InsertBlood (){
        
        $name=$_POST["txtName"];
        $type=$_POST["ddlType"];
        $area=$_POST["area"];
        $number=$_POST["number"];
          
        $blood=new BloodEntity(-1,$name, $type, $area, $number);
        $coffeemodel= new BloodModel();
        $bloodModel->InsertBlood($blood);
            }
    
    function UpdateBlood($id){
        
        $name=$_POST["txtName"];
        $type=$_POST["ddlType"];
        $area=$_POST["area"];
        $number=$_POST["number"];
          
        $blood=new BloodEntity($id,$name, $type, $area, $number);
        $bloodModel= new BloodModel();
        $bloodModel->UpdateBlood($id, $blood);
    }
    
    function DeleteBlood($id){
        
        $bloodModel=new BloodModel();
        $bloodModel->DeleteBlood($id);
        
        
        
    }
    
    //<editor-fold>
    function GetBloodById($id){
        
        $bloodModel =new BloodModel();
        return $bloodModel->GetBloodById($id);
        }
    
    function GetBloodByType($type){
        
        
        $bloodModel =new BloodModel();
        return $bloodModel->GetBloodByType($type);
    }
    
    
    function GetBloodTypes(){
        
        $bloodModel =new BloodModel();
         return $bloodModel->GetBloodByType();
    }
    
    //</editor-fold>
}



?>
