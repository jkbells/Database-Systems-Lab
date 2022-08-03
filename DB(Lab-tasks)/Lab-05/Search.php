<html>
<head>
<title>Search Form</title>
</head>
<body>
<?php if (isset($_POST['form_submitted'])){
//this code is executed when the form is submitted
?>
<?php }
else { ?>
<h2>Theme Park Records</h2>
<form action="search_db.php" method="POST">
Search Park Code here:
<br>
<input type="text" name="park_code">
<br>
<br>
<input type="hidden" name="form_submitted" value="1" />
<input type="submit" value="Search">
</form>
<?php } ?>
</body>
</html>