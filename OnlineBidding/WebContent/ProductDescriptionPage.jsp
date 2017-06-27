<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="beans.UserBean"%>
   <%@page import="beans.BidBean"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <!--<link rel="icon" hrefgetbootstrap.com/favicon.ico">
	<!-- Latest compiled and minified CSS -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
   
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

	<!-- Optional theme -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

	<!-- Latest compiled and minified JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

    <title>Bid Your Product</title>

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

    <!-- Custom styles for this template -->
    <link href="carousel-css.css" rel="stylesheet">
	
	<script type="text/javascript" src="js/jquery-1.7.1.min.js">
	</script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="http://iamrohit.in/lab/js/location.js"></script>
	<script>
        function validateForm(formId)
        {
            var inputs, index;
            var form=document.getElementById(formId);
            inputs = form.getElementsByTagName('input');
            for (index = 0; index < inputs.length; ++index) {
                // deal with inputs[index] element.
                if (inputs[index].value==null || inputs[index].value=="")
                {
                    alert("One or More Field is empty");
                    
                }
				else
				{
				alert("Your Bid Request has been submitted. Thanks!");
				return false;
				}
            }
        }
	</script>
	
	<script>
			
			
			
			$(document).ready(function(){
			$("#click").click(function(){
					$("#myTable").append('<tr id="tdr"><td id="tdr"><div ></div></td><td id="tdr"><div ></div></td><td id="tdr"><div ></div></td><td id="tdr"><div contenteditable></div></td><td><input type="button" onClick="$(this).parent().parent().remove();" value="Delete"></td></tr>');
				});
				
			});
			
	</script>
		
	
	<script>
			$(document).ready(function(){
				$("td").keydown(function(){
					$(this).hover(function(){
						$(this).css("background-color", "").css("color", "");
				},
				function(){
				  $(this).unbind("keydown");
				 
				  $(this).css("background-color", "").css("color", "");
				}
				
				);
				});
				$("td").keyup(function(){
				 $(this).unbind("hover");
					$(this).css("background-color", "").css("color", "");
				});
			});
	</script>
	<script>
	$(document).ready(function(){
			$("td").hover(function() {

				$(this).keydown(function(e) {
					
					if(e.altKey)
					$(this).css("background-color", "blue").css("color", "red");
				});
				$("td").keyup(function(e) {
					$(this).unbind("hover");
					if(e.altKey)
					$(this).css("background-color", "").css("color", "");
				});
				

			}, function() {

				 // unbind the keydown handler on mouseleave
			   $(this).unbind("keydown");

			   $(this).css("background-color", "").css("color", "");
			});
			});
   </script>
   
   	
	<script>
			$(document).ready(function(){
				$("#tdr").keydown(function(){
					$(this).hover(function(){
						$(this).css("background-color", "").css("color", "");
				},
				function(){
				  $(this).unbind("keydown");
				 
				  $(this).css("background-color", "").css("color", "");
				}
				
				);
				});
				$("#tdr").keyup(function(){
				 $(this).unbind("hover");
					$(this).css("background-color", "").css("color", "");
				});
			});
	</script>
	<script>
	$(document).ready(function(){
			$("#tdr").hover(function() {

				$(this).keydown(function(e) {
					
					if(e.altKey)
					$(this).css("background-color", "blue").css("color", "red");
				});
				$("#tdr").keyup(function(e) {
					$(this).unbind("hover");
					if(e.altKey)
					$(this).css("background-color", "").css("color", "");
				});
				

			}, function() {

				 // unbind the keydown handler on mouseleave
			   $(this).unbind("keydown");

			   $(this).css("background-color", "").css("color", "");
			});
			});
   </script>

	</head>
<!-- NAVBAR
================================================== -->
  <body>
  <% 
	String itemId="";
  	String username="";
    String postUserID="";
    String itemDesc="";
    String itemQuality="";
    String itemPrice="";
    String postUserEmail="";
    String bidUserEmail="";
    String itemName="";
	if (session == null)
  	{
    	String address = "/login-error.jsp";
    	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(address);
    	dispatcher.forward(request,response);
  	} 
	
	if (session != null)
	{	
		BidBean bean=(BidBean)session.getAttribute("BID");
		//UserBean userBean=(UserBean)session.getAttribute("USER");
		//UserBean bean=(UserBean)request.getAttribute("bean");
		if(bean.getItemID() == null || bean == null || bean.getItemID() == "" )
		{
	    	String address = "/login-error.jsp";
	    	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(address);
	    	dispatcher.forward(request,response);
		}
		
		//out.print("Welcome  "+ bean.getItemID());
		itemId=bean.getItemID();
		itemDesc=bean.getItemDesc();
		itemQuality=bean.getItemQuality();
		itemPrice=bean.getItemPrice();
		username=bean.getUsername();
		postUserID=bean.getPostUserID();
		postUserEmail=bean.getPostUserEmail();
		bidUserEmail=bean.getBidUserEmail();
		itemName=bean.getItemName();
		System.out.println("User is Bidding for item :id>description>name  " + itemId+ itemDesc+ itemName);
	}
%>
    <div class="navbar-wrapper">
      <div class="container">

         <nav class="navbar navbar-inverse navbar-fixed-top" style="background-color: black">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">My Bid</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="MainPage.jsp">Home</a></li>
            <li><a href="Selling.jsp">Bidding</a></li>
			<li><a href="Bidding.jsp">Post/Buy</a></li>
            <li><a href="LoginPage.jsp">Sign Out</a></li>
          </ul>
          <form class="navbar-form navbar-right">
            <input type="text" class="form-control" placeholder="Search...">
          </form>
        </div>
      </div>
    </nav>

      </div>
    </div>


   
	

	<p id="b" align="center"><br/><br/>
					<h1 align="center">DETAILS OF THE PRODUCT FOR WHICH YOU ARE GOING TO BID</h1>
					<form name="myForm1" id="myForm1" action="RegisterBidServlet" onsubmit="validateForm('myForm1');" method="post">
					
					<table frame="void" id="myTable" align= "center" >
						<colgroup>
							  <col width="35%">
							  <col width="50%">
							  <col width="50%">
							  <col width="35%">
						</colgroup>
						<tbody frame="void" >
						
						<!--<br> <tr align= "center"><th>FIRST NAME </th><th>LAST NAME </th><th>EMAIL</th><th>TELEPHONE</th><th>BUTTON</th></tr>-->
							  <tr><td><div><b>Description:</b></div></td><td><div >
							  <textarea name="expDescription" readonly rows="4" cols="50"><%out.print(itemDesc);%> </textarea></div></td></tr>
							  <tr><td><div><b>Product Quality Desired: </b></div></td><td><div ><input name="expQuality" type="text" readonly value=<%out.print(itemQuality);%>>
							  <!-- <select name="Category" required>
						           <option value="new">New</option>
						           <option value="old">Old</option>
								   <option value="new/old">Old or New</option>
						        </select> -->
							  </div></td></tr>
							  <tr><td><div><b>Price User Wants to Sell at:</b></div></td><td><div ><input name="expPrice" type="text" readonly value=<%out.print(itemPrice);%>><!--<input type="number" min="1" step="any" required />--></div></td></tr>
							 <!-- <tr><td><div><b>Address to deliver the Item : </b></div></td><td><div ><input name="expAddress" type="text" readonly> <%  %></input>  </div></td>  -->
							  
						</tbody>
				   </table>
				   <h1 align="center">INTERESTED IN THIS ITEM ?</h1>
					<h2 align="center">Then Lets Bid for it</h2>
					
					<table frame="void" id="myTable" align= "center" >
						<colgroup>
							  <col width="35%">
							  <col width="50%">
							  <col width="50%">
							  <col width="35%">
						</colgroup>
						<tbody frame="void" >
						
						
							 <!--  <tr><td><div><b>Description:</b></div></td><td><div >
							  <textarea name="actDescription" rows="4" cols="50">Enter your Product's Description.</textarea></div></td></tr>
							  <tr><td><div><b>You Want to Sell a New/Old Item?:</b></div></td><td><div >
							   <select name="actQuality" required>
						           <option value="new">New</option>
						           <option value="old">Old</option>
								   <option value="new/old">Old or New</option>
						        </select>
							  </div></td></tr> -->
							 <div align= "center"><b>Price you want to buy at:</b></div><div>
							<input align= "center" name="actPrice" type="number" min="1" step="any" required >
							<input type="hidden" name="bidderId" value= <% out.print(username); %> >
							<input type="hidden" name="itemId" value= <% out.print(itemId); %> >
							<input type="hidden" name="postUserId" value= <% out.print(postUserID); %> >
							<input type="hidden" name="itemName" value= <% out.print(itemName); %> >
							<input type="hidden" name="postUserEmail" value= <% out.print(postUserEmail); %> >
							<input type="hidden" name="bidUserEmail" value= <% out.print(bidUserEmail); %> ></div></td>
							 </tr>
						</tbody>
				   </table >
				 <div align="center">
				<!--<form action="LoginPage.html">
					<input class="btn btn-lg btn-primary" type="submit" value="Go To Login Page" />
				</form>-->
					<input class="btn btn-lg btn-primary" type="submit" value="Click To Bid" id="clicks"/>
					<input class="btn btn-lg btn-primary" type="reset" value="Reset Details" id="cli"/>
				</form>
				 
				 
				</div>
				 <!--<input class="btn btn-lg btn-primary" type="submit" value="Register" id="click."/>     
				 <a href=""><input class="btn btn-lg btn-primary" type="submit" value="Login" ></a>-->
			
			</p>

	<div id="box">

	</div>
		<div>

      


     

    </div><!-- /.container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/dist/js/bootstrap.min.js"></script>
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/assets/js/vendor/holder.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
