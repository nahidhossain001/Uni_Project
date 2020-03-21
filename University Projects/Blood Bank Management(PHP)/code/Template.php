<!DOCTYPE html>



<html>
    <head>
        <meta charset="UTF-8">
        <title><?php echo $title; ?> </title>
        <link rel="stylesheet" type="text/css" href="Styles/Stylesheet.css"/>
    </head>
    <style>
    h2 {
      color: white;
    }
    h4{
      color: red;
    }
    </style>
    <body>
       <div id ="wrapper">
           
        <div id="banner">
            
            </div>
           
           <nav id="navigation">
               <ul id="nav">
                   <li><a href="index.php">Home</a></li>

                   <li><a href="SearchBytype.php">Search</a></li>
                   <li><a href="login.php">Donor</a></li>
                   <li><a href="About.php">About</a></li>
               </nav>
           
           <div id="content_area">
               <?php echo $content; ?>
               
               </div>
           
           <div id="sideber">
            <br/>
            


           <a href="register.php"><h4>Register</h4></a>
               </div>
           
           <footer><h2><p>All Rights Reserved to  ©Nahid Hossain and Team<h2></p></footer>
    </body>
</html>
