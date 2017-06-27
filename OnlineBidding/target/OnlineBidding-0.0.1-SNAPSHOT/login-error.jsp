<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
    <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>E-Store</title>

    <!-- Bootstrap core CSS -->
    <link href="../../dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="../../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="signin.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/assets/js/ie-emulation-modes-warning.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
   
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

    <link href="carousel-css.css" rel="stylesheet">

    <!-- Bootstrap core CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
	<style>
	body{
	background-position: center 0px; 
	height: 600px; 
	background-image: url("http://www.acertarconsultoria.com/wp-content/uploads/2015/04/escritorio2.jpg"); 
	background-size: 1920px auto;
	}
	h2,p, h3,label{
	color: white;
	}
	</style>
</head>
<body>
	<div class="navbar-wrapper">
      <div class="container">

        <nav class="navbar navbar-inverse navbar-static-top">
          <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
			  <h3 style="font-style: white" align="center">Online Shopping Centre</h2>
              <!--<a class="navbar-brand" href="#" >E-Store.com</a>-->
            </div>
            <div  id="navbar" class="nav navbar-nav">
				
              <!--<ul class="nav navbar-nav">
                <li margin="10px">Username:<input type="text" name="username"></li>
                
                <li>Password:<input type="text" name="password"></li>
                <li><a href="carousel.htm">Login</a></li>
				
                  </ul>
                </li>
              </ul>-->
            </div>
          </div>
        </nav>

      </div>
    </div>
		<div class="featurette-divider"></div>
	 <div class="container marketing" >

      <!-- Three columns of text below the carousel -->
      <div class="row" >
        <div class="col-lg-4">
          <img class="img-circle" src="https://c2.staticflickr.com/6/5766/30855016725_a32f1fa298_q.jpg" alt="Generic placeholder image" width="140" height="140">
          <h2>I Want to Sell</h2>
          <p id="test1">LAPTOPS</br>MOBILES</br>IPODS</br>BOOKS</p>
          <!--<p><a class="btn btn-default" id="test" href="Selling.html" role="button">Sell &raquo;</a></p>-->
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <img class="img-circle" src="https://c2.staticflickr.com/6/5447/30554029910_2e9533c317_q.jpg" alt="Generic placeholder image" width="140" height="140">
          <h2>I Want to Bid</h2>
          <p>LAPTOPS</br>MOBILES</br>IPODS</br>BOOKS</p>
         <!-- <p><a class="btn btn-default" href="Bidding.html" role="button">Bid &raquo;</a></p>-->
        </div><!-- /.col-lg-4 -->
        <div class="col-lg-4">
          <img class="img-circle" src="https://c2.staticflickr.com/6/5638/30855016805_68db951440_q.jpg" alt="Generic placeholder image" width="140" height="140">
          <h2>I Want to Buy</h2>
          <p>LAPTOPS</br>MOBILES</br>IPODS</br>BOOKS</p>
        <!--  <p><a class="btn btn-default" href="Bidding.html" role="button">Buy &raquo;</a></p>-->
        </div><!-- /.col-lg-4 -->
      </div><!-- /.row -->


    <div class="container">
		<div class="container">
		<h4 style="color: white;" class="form-signin-heading" align="center">Sorry. Wrong Username or Password. Try Again !</h4>
      <form class="form-signin" action="SessionControllerServlet" method="post">
        <h2 class="form-signin-heading" align="center">Please sign in</h2>
        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="text" name="username" id="inputEmail" class="form-control" placeholder="Username" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> Remember me
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
		
      </form>
	  <form  class="form-signin" action="RegistrationPage.html">
	  <div align="center">
		<h3 class="form-signin-heading" align="center">New User?</h2>
		<button class="btn btn-lg btn-primary" align="center" >Register Now</button>
		</div>
		</form>
		<%
		if(request.getAttribute("mesg")!=null)
		{
			out.println("<font color='red'>"+request.getAttribute("mesg"));
		}
		%>
	</div>
		
    </div> <!-- /container -->


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
 
</body>
</html>

