<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
<form action = "registration.php" method="POST">
    <div>
        <label>park code</label>
        <input type="text" name="park_code">
</div>



<div>
    <lable>park name</label>
    <input type="text" name="park name">
</div>



<div>
    <lable>park city:</label>
    <input type="text" name="park_city">
</div>



<div>
    <label>park country:</lable>

    <input type="text" name="park_country">
</div>

<input type="hidden" name="form submitted" values="1"/>
<input type="submit" values="submit">
</form>
</body>
</html>

















<?php

$username = "root";
$password = "";
try {
$conn = new PDO("mysql:host=localhost;dbname=p190053_jawad", $username, $password);
// set the PDO error mode to exception
$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
echo "Connected successfully";
// echo 'HI';
echo '<pre>';
// print_r($_POST);
//var_dump($_POST);

} 

catch(PDOException $e) {
echo "Connection failed: " . $e->getMessage();
}




$park_code      = $_POST['park_code'];
$park_name      = $_POST['park_name'];
$park_city      = $_POST['park_city'];
$park_country   = $_POST['park_country'];


    $conn->query("insert into THEMEPARK 
    (park_code,park_name,park_city,park_country) values 
    ('$park_code','$park_name','$park_city','$park_country')" )  ;



echo '<br>';
echo 'Your form has been submitted successfully';
echo '<a href="./reg_form.php">Click here to go back to main page</a>';

?>

