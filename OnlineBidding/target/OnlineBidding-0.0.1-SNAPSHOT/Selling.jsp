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

    <title>Sell Product</title>

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
    <script src="http://code.jquery.com/jquery-latest.js">   
        </script>
        <script>
            $(document).ready(function() {                        
                $('#submit').click(function(event) {  
                    var username=$('#user').val();
                 $.get('ActionServlet',{user:username},function(responseText) { 
                        $('#welcometext').text(responseText);         
                    });
                });
            });
        </script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

		<script>
			    $("tr.table").click(function() {
			    var tableData = $(this).children("td").map(function() {
			        return $(this).text();
			    }).get();
			
			    alert($.trim(tableData[0]) + " , " + $.trim(tableData[1]));
			    //Here, Make a Ajax call to your Servlet payCheckInfo 
			});
		 </script>
  </head>

  <body>
  <%
   // Set refresh, autoload time as 5 seconds
   
   // Get current time
   %>

<% 

	String user="";
    String userEmail="";
	ProductsBean products = new ProductsBean();
	if (session == null)
  	{
    	String address = "/login-error.jsp";
    	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(address);
    	dispatcher.forward(request,response);
  	} 
	
	if (session != null)
	{
		products=(ProductsBean)session.getAttribute("PRODUCTS");
		UserBean userBean=(UserBean)session.getAttribute("USER");
		//UserBean bean=(UserBean)request.getAttribute("bean");
		if(userBean.getUserName() == null || userBean == null || userBean.getUserName() == "" )
		{
	    	String address = "/login-error.jsp";
	    	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(address);
	    	dispatcher.forward(request,response);
		}
		
		//out.print("Welcome, on selling.jsp page"+ userBean.getUserName());
		user=userBean.getUserName();
		userEmail=userBean.getEmail();

				
		System.out.println("hello user " + userBean.getUserName());
	}
%> 
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="MainPage.jsp">Home</a></li>
            <li><a href="ProfilePage.jsp">Profile</a></li>
            <li><a href="#">Shopping Cart</a></li>
            <li><a href="LoginPage.jsp">Sign Out</a></li>
          </ul>
          <form class="navbar-form navbar-right" action="SearchProductsServlet" method="post">
            <input type="text" class="form-control" name="Search" placeholder="Search...">
          </form>
        </div>
      </div>
    </nav>

    
			 
          <h2 class="sub-header" align="center">Check Items People are looking for?</h2>
		  <h3 class="sub-header"align="center">Wanna Bid?</h3>
          <div class="table-responsive">
           
            <table class="table table-striped, sortable">
              
                <tr>
                  <th>User name</th>
                  <th>Item Name</th>
                  <th>Price</th>
                  <th>Description</th>
                  <th>Category</th>
                  <th>Quality</th>
                  <th>City</th>
				  <th>State</th>
                  <!--  <th>image</th>-->
                  <td></td>				  
                </tr>
               <% for(int index = 0; index < products.getListSize(); index++)
	    {
            	   
	    	%>
	    	
	    		<tr class="table">
	    		  <td  name ="usernam" value=<%products.getUSERNAME(index); %>><%out.print(products.getUSERNAME(index)); %></td>
	    	      <td  name ="itemnam" value=<%products.getITEMNAME(index);%> ><%out.print(products.getITEMNAME(index)); %></td>
	    	      <td  name="itempric" value=<%products.getITEMPRICE(index);%>><%out.print(products.getITEMPRICE(index)); %></td>
	    	      <td  name ="itemdes" value=<%products.getITEMDESC(index);%>><%out.print(products.getITEMDESC(index)); %></td>
	    	      <td  name ="itemcategor" value=<%products.getITEMCATEGORY(index);%>><%out.print(products.getITEMCATEGORY(index)); %></td>
	    	      <td  name ="itemqualit" value=<%products.getITEMQUALITY(index); %>><%out.print(products.getITEMQUALITY(index)); %></td>
	    	      <td  name ="city" value=<%products.getCITY(index); %>><%out.print(products.getCITY(index)); %></td>
	    	      <td  name ="state" value=<%products.getSTATE(index); %>><%out.print(products.getSTATE(index)); %></td>
	    	      <td>
	    	      	 <form name="modelDetail1" method="post" action="BidControllerServlet">
                  		<input type="hidden" name="users" value=<% out.print(user); %> >
                  		<input type="hidden" name="useremail" value=<% out.print(userEmail); %> >
                  		<input type="hidden" name="itemname" value=<% out.print(products.getITEMNAME(index)); %> >
	    	      		<input type="hidden" name="username" value=<%out.print(products.getUSERNAME(index)); %> >
	    	      		<input type="hidden" name="itemid" value=<%out.print(products.getITEMID(index)); %> >
	    	      		<input type="hidden" name="itemprice" value=<%out.print(products.getITEMPRICE(index)); %> >
	    	      		<input type="hidden" name="itemdesc" value=<%out.print(products.getITEMDESC(index));%> >
	    	      		<input type="hidden" name="itemquality" value=<%out.print(products.getITEMQUALITY(index)); %>>
	    	      		<input type="hidden" name="postuseremail" value=<%out.print(products.getEMAILID(index)); %>>
        				<input class="btn btn-lg btn-primary btn-block" type="submit" name="action" value="Bid"  style="width:100px;">
        			 </form>
        			 
        			 <form method="post" action="DeleteItemServlet" >
	    	      		<input type="hidden" name="users" value="<% out.print(user); %> ">
					  <input type="hidden" name="itemname" value="<%out.print(products.getITEMNAME(index)); %>" >
					  <input class="btn btn-lg btn-primary btn-block" type="submit" name="action" value="DeleteBid"  style="width:100px;">
					</form></a>
        		  </td>
        		  
        	 </tr>
        	  
        	 <%
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
	            <td><c:out value="${current.getCity()}"/></td>
	            <td><c:out value="${current.getState()}"/></td>
	              <td>
	    	  
        		  </td>
	        </tr>        	
	    </c:forEach>
             
            </table>
          </div>
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
