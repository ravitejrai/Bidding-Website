package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.MultivaluedMap;

import org.apache.log4j.Logger;
import org.codehaus.jettison.json.JSONObject;

import com.google.gson.Gson;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.core.util.MultivaluedMapImpl;

import beans.BidBean;
import beans.PostBean;
import beans.ProductsBean;
import beans.RegisterBidBean;
import beans.RegisterBidsBean;


@WebServlet("/CheckBidsServlet")
public class CheckBidsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final static Logger logger = Logger.getLogger(CheckBidsServlet.class);   

    public CheckBidsServlet() {
        super();
    }

	
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("do post is running!!");
		response.setContentType("text/json");
		PrintWriter out=response.getWriter();
		    
		String searchText = request.getParameter("itemid");
		
		PostBean postBean = new PostBean();
		//System.out.println("searchtext:" + searchText);
		postBean.setPost(searchText);
		
		RegisterBidsBean products=new RegisterBidsBean();
		Boolean status = false;
		try {
			 
			Client client = Client.create();
			WebResource webResource = client.resource("http://localhost:9090/OnlineBiddingServices/rest/displaypostbids/display");
			
			Gson userJson = new Gson();
			String data = userJson.toJson(postBean);

			ClientResponse restResponse = webResource
				    .type(MediaType.APPLICATION_JSON)
				    .post(ClientResponse.class, data);
			
			if (restResponse.getStatus() != 200) {
				throw new RuntimeException("Failed : HTTP error code : " + restResponse.getStatus());
			}
 
			Gson gson = new Gson();
			RegisterBidsBean searchResult = gson.fromJson(restResponse.getEntity(String.class), RegisterBidsBean.class);
				
			//System.out.println("servlet printing now: ");
			
			products = searchResult;
			
			status = products.isValidPost();
			//System.out.println("servlet status: " + status);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(status){
			//System.out.println("status is good!");
			HttpSession session = request.getSession();
			session.setAttribute("BIDS", products);
			RequestDispatcher rd=request.getRequestDispatcher("BiddingDescriptionPage.jsp");
			rd.forward(request, response);
			logger.info("Bids post page SUCCESS");
		}
		else{
			RequestDispatcher rd=request.getRequestDispatcher("Error.jsp");
			rd.forward(request, response);
			logger.info("Bids post page FAIL");
		}
		
		
		//now send request to service
		
	}


}
