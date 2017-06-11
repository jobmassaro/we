<!DOCTYPE html>
<html ng-app="app">
<head>
<title>
  
  <?php 
 
  
	if (isset($page_title)) 
    { 
	    echo $page_title; 
	} else 
    { 
			echo 'TT - ?'; 
	} 
  
  $application = "/igigli";
         
	?>
</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="description" content="Place your description here" /> 
<meta name="keywords" content="put, your, keyword, here" /> 
<meta name="author" content="Templates.com - website templates provider" /> 
<link href="<?php echo $application; ?>/dist/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="<?php echo $application; ?>/dist/css/jquery.tablesorter.pager.css" rel="stylesheet" type="text/css" />
<link href="<?php echo $application; ?>/dist/css/custom-theme/jquery-ui-1.9.2.custom.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css"  href="<?php echo $application; ?>/dist/css/sweetalert.css">
<link href="<?php echo $application; ?>/dist/css/style.css" rel="stylesheet"  />
<link rel="stylesheet" href="<?php echo $application; ?>/dist/css/print.css" type="text/css" media="print" />
<!-- custom scripts -->
	

<!--[if lt IE 7]>
   <script type="text/javascript" src="/js/ie_png.js"></script>
   <script type="text/javascript">
       ie_png.fix('.png, .logo h1, .box .left-top-corner, .box .right-top-corner, .box .left-bot-corner, .box .right-bot-corner, .box .border-left, .box .border-right, .box .border-top, .box .border-bot, .box .inner, .special dd, #contacts-form input, #contacts-form textarea');
   </script>
<![endif]-->
</head>
<body class="container">

<?php 
    if($_SESSION['user'] != null)
    {

 ?>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#"></a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"></a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
           <img src="../dist/images/weLogo.png"> Ciao <b id=ciao><?php echo $_SESSION['user']; ?>!</b>
            <span class="caret"></span>
            </a>
          <ul class="dropdown-menu">
            <li><a href="<?php echo $application; ?>/logout.php">Logout</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>
<?php }

else{
 
}
 ?>