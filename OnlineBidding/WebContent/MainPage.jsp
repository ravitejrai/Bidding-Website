<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="beans.UserBean"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*, java.text.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="beans.PostBean"%>
    <%@page import="beans.ProductsBean"%>
    <%@page import="beans.ProductBean" %>
     <%@page import="beans.UserBean" %>
  
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Auctionware</title>

    <!-- Bootstrap core CSS -->
    
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
		<link href="ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
			<link href="cover.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
   
	<script type="text/javascript" src="js/modernizr-1.5.min.js"></script>

	
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
   
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">


	<!-- Latest compiled and minified JavaScript -->
	
    

    <!-- Bootstrap core CSS -->
   

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
	
	<style>
				a,
			a:focus,
			a:hover {
			  color: #fff;
			}

			/* Custom default button */
			.btn-default,
			.btn-default:hover,
			.btn-default:focus {
			  color: #333;
			  text-shadow: none; /* Prevent inheritance from `body` */
			  background-color: #fff;
			  border: 1px solid #fff;
			}


			html,
			body {
			  height: 100%;
			  background-image: url("img/background.png") ;
			  background-color: #333;
			  background-size: 100% auto;
			  -webkit-background-size: 100% auto;
			  -moz-background-size: 100% auto;
			  -o-background-size: 100% auto;
			  background-position: center 0px; 
	


			}
			body {
			  color: #fff;
			  text-align: center;
			  text-shadow: 0 1px 3px rgba(0,0,0,.5);
			}

			/* Extra markup and styles for table-esque vertical and horizontal centering */
			.site-wrapper {
			  display: table;
			  width: 100%;
			  height: 100%; /* For at least Firefox */
			  min-height: 100%;
			  -webkit-box-shadow: inset 0 0 100px rgba(0,0,0,.5);
					  box-shadow: inset 0 0 100px rgba(0,0,0,.5);
			}
			.site-wrapper-inner {
			  display: table-cell;
			  vertical-align: top;
			}
			.cover-container {
			  margin-right: auto;
			  margin-left: auto;
			}

			/* Padding for spacing */
			.inner {
			  padding: 30px;
			}


			/*
			 * Header
			 */
			.masthead-brand {
			  margin-top: 10px;
			  margin-bottom: 10px;
			}

			.masthead-nav > li {
			  display: inline-block;
			}
			.masthead-nav > li + li {
			  margin-left: 20px;
			}
			.masthead-nav > li > a {
			  padding-right: 0;
			  padding-left: 0;
			  font-size: 16px;
			  font-weight: bold;
			  color: #fff; /* IE8 proofing */
			  color: rgba(255,255,255,.75);
			  border-bottom: 2px solid transparent;
			}
			.masthead-nav > li > a:hover,
			.masthead-nav > li > a:focus {
			  background-color: transparent;
			  border-bottom-color: #a9a9a9;
			  border-bottom-color: rgba(255,255,255,.25);
			}
			.masthead-nav > .active > a,
			.masthead-nav > .active > a:hover,
			.masthead-nav > .active > a:focus {
			  color: #fff;
			  border-bottom-color: #fff;
			}

			@media (min-width: 768px) {
			  .masthead-brand {
				float: left;
			  }
			  .masthead-nav {
				float: right;
			  }
			}


			/*
			 * Cover
			 */

			.cover {
			  padding: 0 20px;
			}
			.cover .btn-lg {
			  padding: 10px 20px;
			  font-weight: bold;
			}


			/*
			 * Footer
			 */

			.mastfoot {
			  color: #999; /* IE8 proofing */
			  color: rgba(255,255,255,.5);
			}


			/*
			 * Affix and center
			 */

			@media (min-width: 768px) {
			  /* Pull out the header and footer */
			  .masthead {
				position: fixed;
				top: 0;
			  }
			  .mastfoot {
				position: fixed;
				bottom: 0;
			  }
			  /* Start the vertical centering */
			  .site-wrapper-inner {
				vertical-align: middle;
			  }
			  /* Handle the widths */
			  .masthead,
			  .mastfoot,
			  .cover-container {
				width: 100%; /* Must be percentage or pixels for horizontal alignment */
			  }
			}

			@media (min-width: 992px) {
			  .masthead,
			  .mastfoot,
			  .cover-container {
				width: 700px;
			  }
			}

	</style>
  </head>

  <body background-image= 'url("img/background.png")'; 
">
  <input type="hidden" name="location" id="location">
  <% 
	String user="";
	if (session == null)
  	{
    	String address = "/login-error.jsp";
    	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(address);
    	dispatcher.forward(request,response);
  	} 
	
	if (session != null)
	{
		UserBean userBean =(UserBean)session.getAttribute("USER");
		//UserBean bean=(UserBean)request.getAttribute("bean");
		if(userBean.getUserName() == null || userBean == null )
		{
	    	String address = "/login-error.jsp";
	    	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(address);
	    	dispatcher.forward(request,response);
		}
		//out.print("Welcome, "+bean.getName());
		user = userBean.getUserName();
		
	}
	
%>
  

    <div class="site-wrapper"  >

      
	  <div class="site-wrapper-inner">

        <div class="cover-container">

          <div class="masthead clearfix">
            <div class="inner">
              <h3 class="masthead-brand">Auctionware</h3>
              <nav>
                <ul class="nav masthead-nav">
				  <li class="active"><a href="MainPage.jsp">Home</a></li>
                   <li><a href="ProfilePage.jsp">Profile</a></li>
                  <li><a href="LogoutPage.jsp">Log Out</a></li>
                </ul>
              </nav>
            </div>
          </div>
		</div>
		<div class="cover-container">
            <form method="post" action="ViewBidsServlet">  
          		<input type="hidden" name="users" value=<% out.print(user); %> >
         		<input class="btn btn-lg btn-primary btn-block" name="" type="submit" value="Bid on already posted items"></input>
          </form>
		</div> 
		
		<br/>
		<div class="cover-container">
            <p class="lead">
              <a href="Bidding.jsp"  class="btn btn-lg btn-warning btn-block">Post new items</a>
            </p>
		</div>
		
		<div class="cover-container">
          <form action="ViewPostsServlet" method="post">
          	<input type="hidden" name="users" value=<% out.print(user); %> >
         	 <input class="btn btn-lg btn-primary btn-block" type="submit" value="View Your Posts"></input>
            </form>
			</div>            
        </div>
      </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    </body>
</html>
