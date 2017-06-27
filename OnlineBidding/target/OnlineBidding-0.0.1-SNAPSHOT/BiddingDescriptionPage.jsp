<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.io.*,java.util.*, javax.servlet.*, java.text.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="beans.PostBean"%>
    <%@page import="beans.ProductsBean"%>
    <%@page import="beans.ProductBean" %>
    <%@page import="beans.UserBean" %>
<%@page import="beans.RegisterBidsBean" %>


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

    <title>Post Product</title>

    <!-- Bootstrap core CSS -->
    <link href="../../dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">


    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="../../assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="dashboard.css" rel="stylesheet">
	<script type="text/javascript" src="sorttable.js"></script>
    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="../../assets/js/ie-emulation-modes-warning.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/assets/js/ie-emulation-modes-warning.js"></script>
	<script type="text/javascript" src="js/modernizr-1.5.min.js"></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
 
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script>
			$(document).ready(function(){
			$("submit").click(function(){
					alert("Bid Successful..Proceed to Cart !")
					});
				
			});
			
	</script>
	<script>
	  function validateForm(formId)
      {
        
		 alert("Bid Successful..Proceed to Cart !");
	
          }
      
	</script>
  </head>

  <body>
		<% 
	RegisterBidsBean products = new RegisterBidsBean();
	UserBean user = new UserBean();
	
	if (session == null)
  	{
    	String address = "/login-error.jsp";
    	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(address);
    	dispatcher.forward(request,response);
  	} 
	
	if (session != null)
	{
		products=(RegisterBidsBean)session.getAttribute("BIDS");
		user=(UserBean)session.getAttribute("USER");
		System.out.println("*************** " + user.getUserName());
		System.out.println("*************** " + products.getITEMID(0));
		
		if(products.getITEMID(0) == null )
		{
	    	String address = "/login-error.jsp";
	    RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(address);
	    dispatcher.forward(request,response);
		}
		System.out.println("the jsp page has the data now: ");
		System.out.println("product list size:  " + products.getListSize());
		//products.getBooks();
	}
%>
   <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="MainPage.jsp">Home</a></li>
            <li><a href="ProfilePage.jsp">Profile</a></li>
            <li><a href="LoginPage.jsp">Sign Out</a></li>
          </ul>
          <form class="navbar-form navbar-right">
            <input type="text" class="form-control" placeholder="Search...">
          </form>
        </div>
      </div>
    </nav>
    
    <
            
          </div>
			 <h2 class="sub-header" align="center">VIEW BIDS ON YOUR POST</h2>
          <h3 class="sub-header" align="center">ADD BIDS TO CART</h3>
          <!-- <form action="ViewPostsServlet" method="post">
          	<input type="hidden" name="users" value=<% out.print(user.getUserName()); %> > 
         	 <input class="btn btn-lg btn-primary btn-block" type="submit" value="View Your Posts"></input>-->
          
          
          <div class="table-responsive">
            <table class="table table-striped, sortable">
              
                <tr>
                  <th>BID ID</th>
                  <th>ITEM'S ID</th>
                  <th>BIDDER'S ID</th>
                  <th>ITEM'S DESCRIPTION</th>
                  <th>ITEM'S QUALITY OFFERED</th>
                  <th>PRICE OFFERED</th>
                  <th>Select</th>	
                  <th>Bid_Time</th>
                  <th>Expire_Time</th>			  
                </tr>
              <!--products.getListSize()-->
	           
               <% for(int index = 0; index < products.getListSize(); index++)
	    {
	    	%><tr>
	    	 	  <td name ="bidid" value=<%products.getBIDID(index); %>><%out.print(products.getBIDID(index)); %></td>
	    		  <td name ="itemname" value=<%products.getITEMID(index);%> ><%out.print(products.getITEMID(index)); %></td>
	    	      <td name="bidderid" value=<%products.getBIDDERID(index);%>><%out.print(products.getBIDDERID(index)); %></td>
	    	      <td name ="actdesc" value=<%products.getACTDESC(index);%>><%out.print(products.getACTDESC(index)); %></td>
	    	      <td name ="actquality" value=<%products.getACTQUALITY(index); %>><%out.print(products.getACTQUALITY(index)); %></td>
	    	      <td name ="actprice" value=<%products.getACTPRICE(index); %>><%out.print(products.getACTPRICE(index)); %></td>
	    	      <%-- <td name ="Bid_Time" value=<%products.getBid_Time(index); %>><%out.print(products.getACTPRICE(index)); %></td>
	    	      <td name ="Expire_Time" value=<%products.getExpire_Time(index); %>><%out.print(products.getACTPRICE(index)); %></td> --%>
	    	      <td>
	    	      	<%-- <form  name="modelDetail1" method="post" onsubmit="validateForm('myForm');" action="AddToCartServlet">
		    	      	<input type="hidden" name="bidId" value=<% out.print(products.getBIDID(index)); %>>
		    	      	<input type="hidden" name="itemId" value=<% out.print(products.getITEMID(index)); %>>
		    	      	<input type="hidden" name="bidderId" value=<% out.print(products.getBIDDERID(index)); %>>
		    	      	<input type="hidden" name="postUserId" value=<% out.print(products.getPOSTUSERID(index)); %>>
		    	      	<input type="hidden" name="expDesc" value=<% out.print(products.getEXPDESC(index)); %>>
		    	      	<input type="hidden" name="expQuality" value=<% out.print(products.getEXPQUALITY(index)); %>>
		    	      	<input type="hidden" name="expPrice" value=<% out.print(products.getEXPPRICE(index)); %>>
		    	      	<input type="hidden" name="actDesc" value=<% out.print(products.getACTDESC(index)); %>>
		    	      	<input type="hidden" name="actQuality" value=<% out.print(products.getACTQUALITY(index)); %>>
		    	      	<input type="hidden" name="actPrice" value=<% out.print(products.getACTPRICE(index)); %>>
		    	      	<input type="hidden" name="itemName" value=<% out.print(products.getITEMNAME(index)); %>>
		    	      	<input type="hidden" name="postUserEmail" value=<% out.print(products.getPOSTUSEREMAIL(index)); %>>
		    	      	<input type="hidden" name="bidUserEmail" value=<% out.print(products.getBIDUSEREMAIL(index)); %>> --%>
		    	      	
		    	      	<form name="modelDetail1" method="post" action="EmailCartServlet">
	    	      		<input type="hidden" name="postuser" value=<% out.print(user.getUserName()); %> >
	    	      		<input type="hidden" name="biduser" value=<% out.print(products.getBIDDERID(index)); %> >
	    	      		<input type="hidden" name="itemid" value=<% out.print(products.getITEMID(index)); %> >
	    	      		<input type="hidden" name="itemname" value=<% out.print(products.getITEMNAME(index)); %> >
                  		<input type="hidden" name="itemcount" value=<% out.print(products.getITEMCOUNT(index)); %> >
	    	      		<input type="hidden" name="itemprice" value=<%out.print(products.getACTPRICE(index)); %> >
	    	      		<input type="hidden" name="biduseremail" value=<%out.print(products.getBIDUSEREMAIL(index)); %>>
	    	      		<input type="hidden" name="postuseremail" value=<%out.print(products.getPOSTUSEREMAIL(index)); %>>
	    	      	
        				<input  class="btn btn-lg btn-primary btn-block" type="submit" name="action" value="Sell" style="width:150px;"> 
        		  </form>
        		  </td>
        	 </tr><%
	    	//System.out.println(books.getISBN(index));
	    }
    	%>
	    <c:forEach items="${PRODUCTS}" var="current">
	        <tr style="display:none;">
	            <td><c:out value="${current.getUserName()}"/></td>
	            <td><c:out value="${current.getItemName()}"/></td>
	            <td><c:out value="${current.getItemPrice()}"/></td>
	            <td><c:out value="${current.getItemDesc()}"/></td>
	            <td><c:out value="${current.getItemCategory()}"/></td>    
	            <td><c:out value="${current.getItemQuality()}"/></td>
	            <td><c:out value="${current.getAdd1()}"/></td>
	            <td><c:out value="${current.getAdd2()}"/></td>
	            <td><c:out value="${current.getCity()}"/></td>
	            <td><c:out value="${current.getState()}"/></td>
	            <td><c:out value="${current.getCountry()}"/></td>
	            <!--<td><c:out value="${current.getImage()}"/></td>-->
	              
	        </tr>        	
	    </c:forEach>
           
             
            
            </table>
            </div>
            </form>
          </div>
        </div>
      </div>
 

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="../../dist/js/bootstrap.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
  
    <!-- Just to make our placeholder images work. Don't actually copy the next line! -->
    <script src="../../assets/js/vendor/holder.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
