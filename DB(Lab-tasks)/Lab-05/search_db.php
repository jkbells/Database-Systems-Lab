<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <title>Courses</title>
</head>
<body>
    

<div class="container">
    <h4>ThemePark Records</h4>

    <?php
    $username = 'root';
    $password = '';
    // Check connection
    try {
        $conn = new PDO("mysql:host=localhost;dbname=umair", $username, $password);
        // set the PDO error mode to exception
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        // echo "Connected successfully";
    } catch(PDOException $e) {
        echo "Connection failed: " . $e->getMessage();
    }

    $park_code      = $_POST['park_code'];

  
    //with prepared statement
     $query_1 = $conn->prepare('
    select PARK_CODE,PARK_NAME,PARK_CITY,PARK_COUNTRY from THEMEPARK 
     where PARK_CODE = ? limit 1');
     $query_1->execute([$park_code]);
       
        // $result   = $query_2->fetchAll(PDO::FETCH_ASSOC);
        $result   = $query_1->fetchAll(PDO::FETCH_OBJ);

        // echo "<pre>";
        // print_r($result);
        // die;

  

        ?>

      <table class="table mt-3">
            <thead>
            <th>Park Code</th>
            <th>Park Name</th>
            <th>Park City</th>
            <th>Park Country</th>

            
            </thead>
            <tbody>
            <?php
            
            foreach ($result as $value){

    
                // uncomment if you have used FETCH_ASSOC method
                // while fetching data from Database.
                // echo "<tr>
                // <td>".$value['PARK_CODE']."</td>
                // <td>".$value['PARK_NAME']."</td>
                // <td>".$value['PARK_CITY']."</td>
                // <td>".$value['PARK_COUNTRY']."</td>
                // </tr>";

                
                echo "<tr>
                <td>$value->PARK_CODE</td>
                <td>$value->PARK_NAME</td>
                <td>$value->PARK_CITY</td>
                <td>$value->PARK_COUNTRY</td>
                </tr>";
                
            }
            ?>

            </tbody>
        </table>
</div>
