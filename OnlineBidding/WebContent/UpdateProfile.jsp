 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="beans.UserBean"%>
<!DOCTYPE html>
<html>

<head>
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />
	
	<title>Dynamic Page | Home</title>
	
	<link rel='stylesheet' type='text/css' href='css/style.css' />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700' rel='stylesheet' type='text/css'>

	<!--<link rel="stylesheet" href="css/reset.css"> 
	<link rel="stylesheet" href="css/style2.css">  --> 
	<script src="js/modernizr.js"></script> <!-- Modernizr -->
	<!--[if IE]>
      <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
	
		<link href="ie10-viewport-bug-workaround.css" rel="stylesheet">
		<link rel='stylesheet' type='text/css' href='css/style.css' />
		<link href="dashboard.css" rel="stylesheet">
			
   <script src="http://iamrohit.in/lab/js/location.js"></script>
	<script type="text/javascript" src="js/modernizr-1.5.min.js"></script>
	
	    <link href="carousel-css.css" rel="stylesheet">
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
   
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

			<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">
			
			
			<script type='text/javascript' src='js/jquery.ba-hashchange.min.js'></script>
			<script type='text/javascript' src='js/dynamicpage.js'></script>
			<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/assets/js/ie-emulation-modes-warning.js"></script>
				
    
    <script type='text/javascript' src='js/jquery.ba-hashchange.min.js'></script>
    <script type='text/javascript' src='js/dynamicpage.js'></script>
	  <script>
		   //tab js//
		$(document).ready(function(e) {
			

		$('.form').find('input, textarea').on('keyup blur focus', function (e) {
		  
		  var $this = $(this),
			  label = $this.prev('label');

			  if (e.type === 'keyup') {
					if ($this.val() === '') {
				  label.removeClass('active highlight');
				} else {
				  label.addClass('active highlight');
				}
			} else if (e.type === 'blur') {
				if( $this.val() === '' ) {
					label.removeClass('active highlight'); 
					} else {
					label.removeClass('highlight');   
					}   
			} else if (e.type === 'focus') {
			  
			  if( $this.val() === '' ) {
					label.removeClass('highlight'); 
					} 
			  else if( $this.val() !== '' ) {
					label.addClass('highlight');
					}
			}

		});

		$('.tab a').on('click', function (e) {
		  
		  e.preventDefault();
		  
		  $(this).parent().addClass('active');
		  $(this).parent().siblings().removeClass('active');
		  target = $(this).attr('href');

		  $('.tab-content > div').not(target).hide();
		  
		  $(target).fadeIn(600);
		  
		});
		//canvas off js//
		$('#menu_icon').click(function(){
				if($("#content_details").hasClass('drop_menu'))
				{
				$("#content_details").addClass('drop_menu1').removeClass('drop_menu');
			}
				else{
					$("#content_details").addClass('drop_menu').removeClass('drop_menu1');
					}
			
			
			});
			
		//search box js//


			$("#flip").click(function(){
				$("#panel").slideToggle("5000");
			});

		// sticky js//

		$(window).scroll(function(){
			if ($(window).scrollTop() >= 500) {
			   $('nav').addClass('stick');
			}
			else {
			   $('nav').removeClass('stick');
			}
		});




		});
   </script>
	<style>
	#page-wrap { 
    width: 800px; margin: 40px auto 5px; background: #91c7ff; 
    padding: 8px;
    background: -webkit-gradient(linear, left top, left bottom, from(#eee), to(#ccc));
	background: -moz-linear-gradient(top,  #eee,  #ccc);
	-webkit-border-radius: 16px;
	-moz-border-radius: 16px;
}

		body { 
				background:#aaaaaa;
				<!--background-image: url("https://c2.staticflickr.com/6/5509/30803966521_7d8f42e957_b.jpg") ;-->
				background-color: #333;
				background-size: 100% auto;
				-webkit-background-size: 100% auto;
				-moz-background-size: 100% auto;
				-o-background-size: 100% auto;
				background-position: center 0px; 
			}

		/*nav css*/
		.navbar-inverse {background-color: #ffffff;border-radius: 0px;height:80px;width:100%;position: fixed;z-index: 999;border: 0px solid;
		-webkit-box-shadow: 0px 2px 7px 0px rgba(0,0,0,0.75);transition:all ease 0.8s;
		-moz-box-shadow: 0px 2px 7px 0px rgba(0,0,0,0.75);
		box-shadow: 0px 2px 7px 0px rgba(0,0,0,0.75);}
		.navbar-inverse .navbar-nav>.open>a, .navbar-inverse .navbar-nav>.open>a:hover, .navbar-inverse .navbar-nav>.open>a:focus {
		color:rgb(0, 4, 51) !important;background-color: #0e364c;}
		.navbar-brand {padding: 0;margin-left: 0px !important;}
		.navbar-brand img { height:50px;margin-left: 20px;margin-top: 9%;transition:all ease 0.8s;}
		.navbar-inverse .navbar-nav>li>a {color:rgb(159, 185, 241);font-family: 'Open Sans', sans-serif; line-height:3;font-weight: bold;}
		.navbar-inverse .navbar-nav>li>a:hover, .navbar-inverse .navbar-nav>li>a:focus {color:rgb(0, 4, 51) !important;}
		.menu { display:none;}
		.search-box1 {padding: 20px 0px;z-index: 99999;width: 100%;}
		.search {padding: 30px 0px;float: left;width: 100%;}
		.serach-footer {left: 20px;position: absolute;top: 10px;}
		.search-wrap {display: block;width: 100%;height: 40px;padding: 6px 12px;font-size: 14px;line-height: 1.42857143;color: #555;background-color: #fff;
		background-image: none;border: 1px solid #e2e2e2;border-radius: 20px;
		-webkit-box-shadow: inset 0 0px 0px rgba(0,0,0,.075);
		box-shadow: inset 0 0px 0px rgba(0,0,0,.075);
		-webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
		-o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
		transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
		width: 100% !important;padding-left: 45px;}
		.search-btn {background:rgb(0, 4, 51);
		width: 100%;border-radius: 0px 20px 20px 0px;color: #fff !important;height: 40px;border: 0px solid;font-weight: 600;font-size: 14px;}
		.search-btn:hover, .search-btn:focus {background:rgb(0, 4, 51);color: #fff !important;}
		.modal-dialog {width: 90% !important;margin: 20% auto;}
		.modal-content { background-color:rgb(159, 185, 241);}
		.modal-title {color: #ffffff !important;}



		/*nav css close*/





.page-header {background:#ccc;margin:0;}

.profile-head { width:100%;background-color: rgb(159, 185, 241);float: left;padding: 15px 5px;}
.profile-head img { height:150px; width:150px; margin:0 auto; border:5px solid #fff; border-radius:5px;}
.profile-head h5 {width: 100%;padding:5px 5px 0px 5px;text-align:justify;font-weight: bold;color: #fff;font-size: 25px;text-transform:capitalize;
margin-bottom: 0;}
.profile-head p {width: 100%;text-align: justify;padding:0px 5px 5px 5px;color: #fff;font-size:17px;text-transform:capitalize;margin:0;}
.profile-head a {width: 100%;text-align: center;padding: 10px 5px;color: #fff;font-size: 15px;text-transform: capitalize;}

.profile-head ul { list-style:none;padding: 0;}
.profile-head ul li { display:block; color:#ffffff;padding:5px;font-weight: 400;font-size: 15px;}
.profile-head ul li:hover span { color:rgb(0, 4, 51);}
.profile-head ul li span { color:#ffffff;padding-right: 10px;}
.profile-head ul li a { color:#ffffff;}
.profile-head h6 {width: 100%;text-align: center;font-weight: 100;color: #fff;font-size: 15px;text-transform: uppercase;margin-bottom: 0;}

		.nav-tabs {margin: 0;padding: 0;border: 0;}
		.nav-tabs > li > a {background: #DADADA;border-radius: 0;
			box-shadow: inset 0 -8px 7px -9px rgba(0,0,0,.4),-2px -2px 5px -2px rgba(0,0,0,.4);}
		.nav-tabs > li.active > a,
		.nav-tabs > li.active > a:hover {background: #F5F5F5;
			box-shadow: inset 0 0 0 0 rgba(0,0,0,.4),-2px -3px 5px -2px rgba(0,0,0,.4);}
		.tab-pane {background: #ffffff;box-shadow: 0 0 4px rgba(0,0,0,.4);border-radius: 0;text-align: center;padding: 10px;}
		.tab-content>.active {margin-top:50px;/*width:100% !important;*/} 

		/* edit profile css*/

		.hve-pro {    background-color:rgb(159, 185, 241);padding: 5px; width:100%; height:auto;float:left;}
		.hve-pro p {float: left;color:#fff;font-size: 15px;text-transform: capitalize;padding: 5px 20px;font-family: 'Noto Sans', sans-serif;}
		h2.register { padding:10px 25px; text-transform:capitalize;font-size: 25px;color: rgb(159, 185, 241);}
		.fom-main { overflow:hidden;}

		legend {font-family: 'Bitter', serif;color:#ff3200;border-bottom:0px solid;}
		.main_form {background-color: #;}
		label.control-label {font-family: 'Noto Sans', sans-serif;font-weight: 100; margin-bottom:5px !important; 
		text-align:left !important; text-transform:uppercase; color:#798288;}
		.submit-button {color: #fff;background-color:rgb(159, 185, 241);width:190px;border: 0px solid;border-radius: 0px; transition:all ease 0.3s;margin: 5px;
		float:left;}
		.submit-button:hover, .submit-button:focus {color: #fff;background-color:rgb(0, 4, 51);}
		.hint_icon {color:#ff3200;}
		.form-control:focus {border-color: #ff3200;}
		select.selectpicker { color:#99999c;}
		select.selectpicker option { color:#000 !important;}
		select.selectpicker option:first-child { color:#99999c;}
		.input-group { width:100%;}
		.uplod-picture {width: 100%; background-color:#;color: #fff; padding:20px 10px;margin-bottom:10px;}
		.uplod-file {position: relative;overflow: hidden;color: #fff;background-color: rgb(0, 4, 51);border: 0px solid #a02e09;border-radius: 0px;
		 transition:all ease 0.3s;margin: 5px;}
		.uplod-file input[type=file] {position: absolute;top: 0;right: 0;min-width: 100%;min-height: 100%;font-size: 100px;text-align: right;
		filter: alpha(opacity=0);opacity: 0;outline: none;background: white;cursor: inherit;display: block;}
		.uplod-file:hover, .uplod-file:focus {color: #fff;background-color:rgb(159, 185, 241);}
		h4.pro-title { font-size:24px; color:rgba(0, 4, 51, 0.96); text-transform:capitalize; text-align:justify;padding: 10px 15px;font-family: 'Bitter', serif;}
		.bio-table { width:75%;border:0px solid;}
		.bio-table td {text-transform: capitalize;text-align: left;font-size: 15px;}
		.bio-table>tbody>tr>td { border:0px solid;text-transform: capitalize;color: rgb(0, 4, 51); font-size:15px;}
		.responsiv-table { border:0px solid;}
		.nav-menu li a {margin: 5px 5px 5px 5px;position: relative;display: block;padding: 10px 50px;border: 0px solid !important;box-shadow: none !important;
		background-color: rgb(0, 4, 51) !important;color: #fff !important;    white-space: nowrap;}
		.nav-menu li.active a {background-color: rgb(159, 185, 241) !important;}
		.stick{position:fixed !important;top:0;z-index:999 !important;width:100%;background:#ffffff !important;height:auto; transition:all ease 0.8s;
		-webkit-box-shadow: 0px 2px 7px 0px rgba(0,0,0,0.75);
		-moz-box-shadow: 0px 2px 7px 0px rgba(0,0,0,0.75);
		box-shadow: 0px 2px 7px 0px rgba(0,0,0,0.75);}
		.stick a { line-height:20px !important;}
		.stick img { margin:0 !important;}



		@media all and (max-width:768px){

		.navbar-inverse .drop_menu {display: block;visibility: visible;width: 110px;height:1000px;padding:0px 20px;position: absolute;right:-100px;
		transition:all ease 0.5s;border-top: 0px solid;cursor: pointer;}
		.navbar-brand {padding: 0;margin-left: 10px !important;}
		a.menu { display:block !important;margin: 9px 2px;float: right;color: rgba(255, 102, 0, 0.98); border:0px solid; background:none; font-size:30px;width:27px;position: relative;
		cursor:pointer;}
		a.menu:hover, a.menu:focus { color:rgb(0, 4, 51);}

		.drop_menu1 { display: block;visibility: visible;width:250px;height:1000px;padding:5px 30px;position: absolute;right:0 !important;
		background-color:#ffffff !important; transition:all ease 0.5s;border-top: 0px solid;cursor: pointer;}

		}

		@media all and (max-width:430px){
		.profile-head ul li {font-size: 12px !important;}
		.nav-menu li { width:50%;}
		.bio-table>tbody>tr>td {font-size: 13px;}

		}


	</style>
</head>

<body>
	<% 
	String user="";
	String firstName="";
	String lastName ="";
	String stAddress1 = "";
	String email="";
	String phone="";
	String lastLogin = "";
	String failedAttempts="";
	String stAddress2="";
	String dateofbirth="";
	String gender="";
	String city="";
	String country="";
	String state="";
	if (session == null)
  	{
    	String address = "/login-error.jsp";
    	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(address);
    	dispatcher.forward(request,response);
  	} 
	
	if (session != null)
	{
		UserBean userBean=(UserBean)session.getAttribute("USER");
		//UserBean bean=(UserBean)request.getAttribute("bean");
		if(userBean.getUserName() == null || userBean == null || userBean.getUserName() == "" )
		{
	    	String address = "/login-error.jsp";
	    	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(address);
	    	dispatcher.forward(request,response);
		}
		
		out.print("Welcome, "+ userBean.getFirstName());
		user=userBean.getUserName();
		firstName = userBean.getFirstName();
		lastName= userBean.getLastName();
		stAddress1 = userBean.getAddress1();
		stAddress2 = userBean.getAddress2();
		city = userBean.getCity();
		state = userBean.getState();
		country = userBean.getCountry();
		email = userBean.getEmail();
		phone = userBean.getPhone();
		dateofbirth = userBean.getDateOfBirth();
		lastLogin = String.valueOf(userBean.getLastLogin());
		failedAttempts = String.valueOf(userBean.getLoginAttempts());
		gender = userBean.getGender();
				
		System.out.println("hello user " + userBean.getUserName());
	}
%>
 	<nav class="navbar navbar-inverse navbar-fixed-top" style="background-color: black">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="ProfilePage.jsp">Your Profile</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="MainPage.jsp">Home</a></li>
            <li><a href="Bidding.jsp">Buying</a></li>
			<li><a href="Selling.jsp">Bidding</a></li>
            <li><a href="ShoppingCart.jsp">Shopping Cart</a></li>
            <li><a href="LogoutPage.jsp">Sign Out</a></li>
          </ul>
          <form class="navbar-form navbar-right">
            <input type="text" class="form-control" placeholder="Search...">
          </form>
        </div>
      </div>
    </nav>
    


	<br>
	<br>
	<br>
	<section>

	<div class="container" style="margin-top: 30px; ">
	<div class="profile-head">
	<div class="col-md- col-sm-4 col-xs-12">
	<img src="http://www.newlifefamilychiropractic.net/wp-content/uploads/2014/07/300x300.gif" class="img-responsive" />
	<h6><% out.print(firstName); %></h6>
	</div><!--col-md-4 col-sm-4 col-xs-12 close-->


	<div class="col-md-5 col-sm-5 col-xs-12">
	<h5><% out.print(firstName); %></h5>
	<p>Web Designer / Develpor </p>
	<ul>
	<li><span class="glyphicon glyphicon-briefcase"></span> <% out.print(dateofbirth); %></li>
	<li><span class="glyphicon glyphicon-map-marker"></span> <% out.print(country); %></li>
	<li><span class="glyphicon glyphicon-home"></span> <% out.print(stAddress1); %> <% out.print(stAddress2); %></li>
	<li><span class="glyphicon glyphicon-phone"></span> <a href="#" title="call"><% out.print(phone); %></a></li>
	<li><span class="glyphicon glyphicon-envelope"></span><a href="#" title="mail"><% out.print(email); %></a></li>

	</ul>

	</div><!--col-md-8 col-sm-8 col-xs-12 close-->




	</div><!--profile-head close-->
	</div><!--container close-->


	<div id="sticky" class="container">
		
		<!-- Nav tabs -->
		<ul class="nav nav-tabs nav-menu" role="tablist">
		  <li class="active">
			  <a href="ProfilePage.jsp" role="tab" data-toggle="tab" data-type="page-transition">
				  <i class="fa fa-male"></i> Profile
			  </a>
		  </li>
		  <li><a href="UpdateProfile.jsp" role="tab" data-toggle="tab">
			  <i class="fa fa-key"></i> Edit Profile
			  </a>
		  </li>
		</ul><!--nav-tabs close-->
	</div>
	<div id="page-wrap">
	<section id="main-content">
		<div >

			<p id="b" align="center" style="background-color: grey; font-style: white;">
					<h3 align="center">Edit Profile</h3>
					<form name="myForm" id="myForm" action="UpdateProfileServlet" onsubmit="return validateForm('myForm');" method="post">
					<table frame="void" id="myTable" align= "center" >
						<colgroup>
							  <col width="35%">
							  <col width="50%">
							  <col width="50%">
							  <col width="35%">
						</colgroup>
						<tbody frame="void" >
						
						<!--<br> <tr align= "center"><th>FIRST NAME </th><th>LAST NAME </th><th>EMAIL</th><th>TELEPHONE</th><th>BUTTON</th></tr>-->
							  <tr><td><div><b>FIRST NAME</b></div></td><td><div><input type="text" name="inputFirstName" pattern="[a-zA-Z]+"  maxlength="10" required autofocus></div></td><td>
							  <div><b>LAST NAME</b></div></td><td><div ><input type="text" name="inputLastName"  maxlength="10"required></div></td></tr>
							  
							  <tr><td><div><b>DATE OF BIRTH</b></div></td><td><div ><input type="date" name="inputDate" required></div></td><td><div><b>GENDER</b></div></td><td><div >
							   <select name="Gender" required>
						           <option value="male">Male</option>
						           <option value="female">Female</option>
						       </select>

							  </div></td></tr>
							  <tr><td><div><b>PHONE NO.</b></div></td><td><div ><input type="tel" name="inputPhoneNumber" required>
							  </div></td><td><div><b>EMAIL ID</b></div></td><td><div ><input type="email" name="inputEmail" required>
							  </div></td></tr>
							 
							  <tr><td><div><b>ADDRESS LINE 1</b></div></td><td><div ><input type="text" name="inputAddress1"  maxlength="20" required></div></td><td><div><b>ADDRESS LINE 2</b></div></td><td><div ><input type="text" name="inputAddress2"  maxlength="20" required></div></td></tr>
							 
							  <tr><td><div><b>COUNTRY</b></div></td><td><div >
								<select name="inputCountry" class="countries" id="countryId" required>
									<option value="">Select Country</option>
								</select>
							  </div></td>
							  <td><div><b>STATE</b></div></td><td><div >
								<select name="inputState" class="states" id="stateId" required>
									<option value="">Select State</option>
								</select>
							  </div></td></tr>
							 
							  <tr><td><div><b>CITY</b></div></td><td><div >
								  <select name="inputCity" class="cities" id="cityId" required>
									  <option value="">Select City</option>
								  </select>
							  </div></td><td><!-- <div><b>UPLOAD IMAGE</b></div></td><td><div ><input type="file" name="image" ></div>--></td></tr>	  
								<tr><td><div><b>USERNAME</b></div></td><td><div ><input type="text" name="inputUsername" value= <% out.print(user); %>  readonly></div></td>
								<td><div><b>PASSWORD</b></div></td><td><div ><input type="password" name="inputPassword" required></div></td></tr>
							 
							  
							  
						</tbody>
				   </table>
				 <div align="center">
				<!--<form action="LoginPage.html">
					<input class="btn btn-lg btn-primary" type="submit" value="Go To Login Page" />
				</form>-->
					<input class="btn btn-lg btn-primary" type="submit" value="Update" id="click."/>
				</form>
				
				</div>
				 <!--<input class="btn btn-lg btn-primary" type="submit" value="Register" id="click."/>     
				 <a href=""><input class="btn btn-lg btn-primary" type="submit" value="Login" ></a>-->
			
			</p>
			</div>
		</section>
	</div>
</body>
<script src="js/jquery-2.1.1.js"></script>
<script src="js/main.js"></script> <!-- Resource jQuery -->
</html>
