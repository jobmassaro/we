<?php

session_start();

require('./inc/mysql.inc.php');

$page_title = 'iGIGLI - ';

include('./includes/header.php');

//$r = mysqli_query($dbc, "SELECT * FROM test");

if(isset($_SESSION['user']))
{
    include('./accounts/index.php');
}else{

    include('./views/home.php');
}
include('./includes/footer.php');

?>