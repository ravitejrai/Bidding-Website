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
   <script language="javascript" type="text/javascript" src="actb.js"></script><!-- External script -->
	<script language="javascript" type="text/javascript" src="tablefilter.js"></script>
    <script src="http://code.jquery.com/jquery-latest.js">   
        </script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
		<style>
		th{ background-color:#003366; color:#FFF; padding:2px; border:1px solid #ccc;table-layout: fixed; }
		</style>
  </head>

  <body>
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
		products=(ProductsBean)session.getAttribute("PRODUC");
		UserBean userBean=(UserBean)session.getAttribute("USER");
		//UserBean bean=(UserBean)request.getAttribute("bean");
		if(userBean.getUserName() == null || userBean == null || userBean.getUserName() == "" )
		{
	    	String address = "/login-error.jsp";
	    	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(address);
	    	dispatcher.forward(request,response);
		}
		
		out.print("Welcome, "+ userBean.getUserName());
		user=userBean.getUserName();
		userEmail=userBean.getEmail();
				
		System.out.println("hello user " + userBean.getUserName());
	}
%>
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="btn btn-lg btn-primary"  class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Selling Stuff</a>
        </div>
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
			
          
			<h2 class="sub-header" align="center">Select a Category to Bid</h2>
          <div class="row placeholders">
            <div class="col-xs-6 col-sm-3 placeholder">
             <a href="#"> <img src="https://c2.staticflickr.com/6/5520/30848542076_ec95c455cb_q.jpg" width="200" height="200" class="img-responsive" alt="Generic placeholder thumbnail"></a>
              <a href="#"><h4>Mobiles</h4></a>
             <a href="#"> <span class="text-muted">Select to Sell</span></a>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <a href="#"><img src="https://c2.staticflickr.com/6/5578/30848542056_f71a6bcd0a_q.jpg" width="200" height="200" class="img-responsive" alt="Generic placeholder thumbnail"></a>
              <a href="#"><h4>Laptops</h4></a>
              <a href="#"><span class="text-muted">Select to Sell</span></a>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <a href="#"><img src="https://c2.staticflickr.com/6/5528/30796248991_f403fd488d_q.jpg" width="200" height="200" class="img-responsive" alt="Generic placeholder thumbnail"></a>
              <a href="#"><h4>Music Players</h4></a>
              <a href="#"><span class="text-muted">Select to Sell</span></a>
            </div>
            <div  class="col-xs-6 col-sm-3 placeholder">
              <a href="#"><img  src="https://c2.staticflickr.com/6/5587/30796249001_6b588fd2ce_q.jpg" width="200" height="200" class="img-responsive" alt="Generic placeholder thumbnail">
              <a href="#"><h4 >Desktops</h4></a>
              <a href="#"><span class="text-muted">Select to Sell</span></a>
            </div>
          </div>
			 
          <h2 class="sub-header" align="center">Check Items People are looking for?</h2>
		  <h3 class="sub-header"align="center">Wanna Bid?</h3>
          <div class="table-responsive">
          <!--  <table id="table1" cellspacing="0" cellspacing="0" class="mytable filterable" >  --> 
          
          
          <table class="  mytable, table table-striped ">
          <col width="130"><col width="130"><col width="130"><col width="130"><col width="130"><col width="130"><col width="130"><col width="130"><col width="130"><col width="130"><col width="130"><col width="130">
            <tr>
                <!--    <th>User name</th>-->
                  <!-- <th>Item Id</th> -->
                  <th>Item Name</th>
                  <th>Price</th>
                  <th>Description</th>
                  <th>Category</th>
                  <th>Quality</th>
                  <th>add1</th>
                  <th>add2</th>
				  <th>City</th>
				  <th>State</th>
                  <th>Country</th>
                 <!--   <th>image</th>-->
                  <th>Bid For It</th>				  
                </tr>
                
                </table>
        <table id="table2" class="sortable,   mytable, table table-striped ">
        <col width="130"><col width="130"><col width="130"><col width="130"><col width="130"><col width="130"><col width="130"><col width="130"><col width="130"><col width="130"><col width="130"><col width="130">
           	<tr style="display:none;">
                <!--    <th>User name</th>-->
                  <!-- <th>Item Id</th> -->
                  <th>Item Name</th>
                  <th>Price</th>
                  <th>Description</th>
                  <th>Category</th>
                  <th>Quality</th>
                  <th>add1</th>
                  <th>add2</th>
				  <th>City</th>
				  <th>State</th>
                  <th>Country</th>
                 <!--   <th>image</th>-->
                  <th>Bid For It</th>				  
                </tr>
              
               
               <% for(int index = 0; index < products.getListSize(); index++)
	    {
            	   
	    	%>
	    		
	    		<tr class="table">
	    		
	    	      <td  name ="itemnam" value=<%products.getITEMNAME(index);%> ><%out.print(products.getITEMNAME(index)); %></td>
	    	      <td  name="itempric" value=<%products.getITEMPRICE(index);%>><%out.print(products.getITEMPRICE(index)); %></td>
	    	      <td  name ="itemdes" value=<%products.getITEMDESC(index);%>><%out.print(products.getITEMDESC(index)); %></td>
	    	      <td  name ="itemcategor" value=<%products.getITEMCATEGORY(index);%>><%out.print(products.getITEMCATEGORY(index)); %></td>
	    	      <td  name ="itemqualit" value=<%products.getITEMQUALITY(index); %>><%out.print(products.getITEMQUALITY(index)); %></td>
	    	      <td  name ="add1" value=<%products.getADD1(index); %>><%out.print(products.getADD1(index)); %></td>
	    	      <td  name ="add2" value=<%products.getADD2(index); %>><%out.print(products.getADD2(index)); %></td>
	    	      <td  name ="city" value=<%products.getCITY(index); %>><%out.print(products.getCITY(index)); %></td>
	    	      <td  name ="state" value=<%products.getSTATE(index); %>><%out.print(products.getSTATE(index)); %></td>
	    	      <td  name ="country" value=<%products.getCOUNTRY(index); %>><%out.print(products.getCOUNTRY(index)); %></td>
	    	      
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
        				<input class="btn btn-lg btn-primary btn-block" type="submit" name="action" value="Bid"  style="width:150px;">
        			 </form>
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
	            <td><c:out value="${current.getAdd1()}"/></td>
	            <td><c:out value="${current.getAdd2()}"/></td>
	            <td><c:out value="${current.getCity()}"/></td>
	            <td><c:out value="${current.getState()}"/></td>
	            <td><c:out value="${current.getCountry()}"/></td>
	            
	              <td>
	    	      <!-- 	<form name="modelDetail1" method="post" action="ProductDescriptionPage.html">
        				<button class="btn btn-lg btn-primary" type="submit" name="action" value="Bid" style="width:150px;">Add to Cart</button>
        				
        			</form> --> 
        		  </td>
	        </tr>        	
	    </c:forEach>
             <!--   <tr>
                  <td>1001</td>
                  <td>image</td>
                  <td>iPhone</td>
				  <td>6S</td>
                  <td>200$</td>
                  <td>New</td>
				  <td>Mccallum Blvd</td>
				  <td>Dallas</td>
				  <td><a href="ProductDescriptionPage.html"><
 type="button" class="btn btn-lg btn-primary"  onClick="" value="Bid"></a></td>
				  
				 </tr>
                 --> 
             
            
            </table>
           
			            
			<script language="javascript" type="text/javascript">
			//<![CDATA[	
				var table2_Props = 	{					
								col_0: "select",
								col_1: "select",
								col_2: "select",
								col_3: "select",
								col_4: "select",
								col_5: "select",
								col_6: "select",
								col_7: "select",
								col_8: "select",
								col_9: "select",
								col_10: "none",
								
								display_all_text: "Show all   ",
								
								rows_always_visible:[0,1]
				};
				
				setFilterGrid( "table2",table2_Props );
			//]]>
			</script>
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
