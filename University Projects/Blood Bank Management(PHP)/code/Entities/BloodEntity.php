<?php

$con = new mysqli('localhost', 'root','', 'blooddb');
// Check connection
if ($con->connect_error) {
    die("Connection failed: " . $con->connect_error);
} 
//echo "Connected successfully";
echo "<br>";
class BloodEntity {
  
    public $id;
    public $name;
    public $type;
    public $area;
    public $number;
    
    function __construct($id, $name, $type, $area, $number) {
        $this->id = $id;
        $this->name = $name;
        $this->type = $type;
        $this->area = $area;
        $this->number = $number;
    }

}

    
?>
