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
<%@page import="beans.SearchBean" %>
<%@page import ="beans.RegisterBidBean" %>

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
		products=(RegisterBidsBean)session.getAttribute("PRODUCT");
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
          <a class="navbar-brand" href="#">Bidding Stuff</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="MainPage.jsp">Home</a></li>
            <li><a href="ProfilePage.jsp">Profile</a></li>
            <li><a href="#">Shopping Cart</a></li>
            <li><a href="LoginPage.jsp">Sign Out</a></li>
          </ul>
          <form class="navbar-form navbar-right" action="SearchBiddersServlet" method="post">
            <input type="text" class="form-control" name="search"  placeholder="Search">
          </form>
        </div>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="#">Overview <span class="sr-only">(current)</span></a></li>
            <li><a href="#">Reports</a></li>
            <li><a href="#">Analytics</a></li>
            <li><a href="#">Export</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="">Nav item</a></li>
            <li><a href="">Nav item again</a></li>
            <li><a href="">One more nav</a></li>
            <li><a href="">Another nav item</a></li>
            <li><a href="">More navigation</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="">Nav item again</a></li>
            <li><a href="">One more nav</a></li>
            <li><a href="">Another nav item</a></li>
          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<h2 class="sub-header" align="center">Post an Item </h2>
          <h3 class="page-header" align="center">Categories You May Be Looking For</h3>

          <div class="row placeholders">
            <div class="col-xs-6 col-sm-3 placeholder">
             <a href="AddProduct.jsp"> <img src="https://c2.staticflickr.com/6/5520/30848542076_ec95c455cb_q.jpg" width="200" height="200" class="img-responsive" alt="Generic placeholder thumbnail"></a>
              <a href="AddProduct.jsp"><h4>Mobiles</h4></a>
             <a href="AddProduct.jsp"> <span class="text-muted">Select to Bid</span></a>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <a href="AddProduct.jsp"><img src="https://c2.staticflickr.com/6/5578/30848542056_f71a6bcd0a_q.jpg" width="200" height="200" class="img-responsive" alt="Generic placeholder thumbnail"></a>
              <a href="AddProduct.jsp"><h4>Laptops</h4></a>
              <a href="AddProduct.jsp"><span class="text-muted">Select to Bid</span></a>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <a href="AddProduct.jsp"><img src="https://c2.staticflickr.com/6/5528/30796248991_f403fd488d_q.jpg" width="200" height="200" class="img-responsive" alt="Generic placeholder thumbnail"></a>
              <a href="AddProduct.jsp"><h4>Music Players</h4></a>
              <a href="AddProduct.jsp"><span class="text-muted">Select to Bid</span></a>
            </div>
            <div  class="col-xs-6 col-sm-3 placeholder">
              <a href="AddProduct.jsp"><img  src="https://c2.staticflickr.com/6/5587/30796249001_6b588fd2ce_q.jpg" width="200" height="200" class="img-responsive" alt="Generic placeholder thumbnail">
              <a href="AddProduct.jsp"><h4 >Desktops</h4></a>
              <a href="AddProduct.jsp"><span class="text-muted">Select to Bid</span></a>
            </div>
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
	    	      <td>
	    	      	<form  name="modelDetail1" method="post" onsubmit="validateForm('myForm');" action="RegisterBidServlet">
		    	      	<input type="hidden" name="itemId" value=<% out.print(products.getITEMID(index)); %>>
		    	      	<input type="hidden" name="bidderId" value=<% out.print(products.getBIDDERID(index)); %>>
		    	      	<input type="hidden" name="postUserId" value=<% out.print(products.getPOSTUSERID(index)); %>>
		    	      	<input type="hidden" name="expDesc" value=<% out.print(products.getEXPDESC(index)); %>>
		    	      	<input type="hidden" name="expQuality" value=<% out.print(products.getEXPQUALITY(index)); %>>
		    	      	<input type="hidden" name="expPrice" value=<% out.print(products.getEXPPRICE(index)); %>>
		    	      	<input type="hidden" name="actDesc" value=<% out.print(products.getACTDESC(index)); %>>
		    	      	<input type="hidden" name="actQuality" value=<% out.print(products.getACTQUALITY(index)); %>>
		    	      	<input type="hidden" name="actPrice" value=<% out.print(products.getACTPRICE(index)); %>>
	    	      	
        				<input  class="btn btn-lg btn-primary btn-block" type="submit" name="action" value="Add to Cart" style="width:150px;">
        			</form> 
        		  </td>
        	 </tr><%
	    	//System.out.println(books.getISBN(index));
	    }
    	%>
	    <c:forEach items="${PRODUCT}" var="current">
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
