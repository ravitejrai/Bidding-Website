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
import beans.RegisterBidBean;

@WebServlet("/RegisterBidServlet")
public class RegisterBidServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final static Logger logger = Logger.getLogger(RegisterBidServlet.class);   

    public RegisterBidServlet() {
        super();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//
    	//System.out.println("do post is running!!");
		response.setContentType("text/json");
		PrintWriter out=response.getWriter();
	   
		String itemID = request.getParameter("itemId"); 
		String bidderId = request.getParameter("bidderId"); 
		String postUserID = request.getParameter("postUserId");
		String expDesc = request.getParameter("expDescription"); 
		String actDesc = request.getParameter("actDescription"); 
		String expQuality = request.getParameter("expQuality");
		String actQuality = request.getParameter("actQuality");
		String expPrice = request.getParameter("expPrice");
		String actPrice = request.getParameter("actPrice");
		String itemName = request.getParameter("itemName");
		String postUserEmail= request.getParameter("postUserEmail");
		String bidUserEmail = request.getParameter("bidUserEmail");
		
		//System.out.println("RegisterBidServlet-postuserid : "+ postUserID );
		
		RegisterBidBean bean=new RegisterBidBean();

		bean.setItemName(itemName);
		bean.setPostUserEmail(postUserEmail);
		bean.setBidUserEmail(bidUserEmail);
		bean.setItemID(itemID);
		bean.setBidderId(bidderId);
		bean.setPostUserID(postUserID);
		bean.setExpDesc(expDesc);
		bean.setExpQuality(expQuality);
		bean.setExpPrice(expPrice);
		bean.setActDesc(actDesc);
		bean.setActQuality(actQuality);
		bean.setActPrice(actPrice);
		
		request.setAttribute("bean",bean);
		
		Boolean status = false;
		try {
			 
			Client client = Client.create();
			WebResource webResource = client.resource("http://localhost:9090/OnlineBiddingServices/rest/bidservices/newbid");
			
			Gson userJson = new Gson();
			String data = userJson.toJson(bean);

			ClientResponse restResponse = webResource
				    .type(MediaType.APPLICATION_JSON)
				    .post(ClientResponse.class, data);
			
			if (restResponse.getStatus() != 200) {
				throw new RuntimeException("Failed : HTTP error code : " + restResponse.getStatus());
			}
 
			String statusString = restResponse.getEntity(String.class);
			status = Boolean.parseBoolean(statusString);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		if(status){
			//System.out.println("session at the end with postuserId= "+ bean.getPostUserID() );
			RequestDispatcher rd=request.getRequestDispatcher("MainPage.jsp");
			rd.forward(request, response);
			logger.info("Bid posting SUCCESS");
		}
		else{
			RequestDispatcher rd=request.getRequestDispatcher("Error.jsp");
			rd.forward(request, response);
			logger.info("Bid posting FAIL");
		}
	
    }
}
 