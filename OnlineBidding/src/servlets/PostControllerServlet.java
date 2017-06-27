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

import beans.ProductBean;

@WebServlet("/PostControllerServlet")
public class PostControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final static Logger logger = Logger.getLogger(PostControllerServlet.class);   

    public PostControllerServlet() {
        super();
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("do post is running!!");
		response.setContentType("text/json");
		PrintWriter out=response.getWriter();
		
		String itemName=request.getParameter("itemName");
		String itemPrice=request.getParameter("itemPrice");
		String itemDesc=request.getParameter("itemDesc");
		String itemCategory=request.getParameter("itemCategory");
		String itemQuality=request.getParameter("itemQuality");
		String add1=request.getParameter("add1");
		String add2=request.getParameter("add2");
		String country=request.getParameter("country");
		String state=request.getParameter("state");
		String city=request.getParameter("city");
		//String image=request.getParameter("image");
		String username=request.getParameter("inputUsername");
		
		ProductBean bean=new ProductBean();
		bean.setItemName(itemName);
		bean.setItemPrice(itemPrice);
		bean.setItemDesc(itemDesc);
		bean.setItemCategory(itemCategory);
		bean.setItemQuality(itemQuality);
		bean.setAdd1(add1);
		bean.setAdd2(add2);
		bean.setCountry(country);
		bean.setState(state);
		bean.setCity(city);
		//bean.setImage(image);
		bean.setUserName(username);
		request.setAttribute("bean",bean);

		Boolean status = false;
		try {
			 
			Client client = Client.create();
			WebResource webResource = client.resource("http://localhost:9090/OnlineBiddingServices/rest/postservices/newpost");
			
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

			System.out.println("status: " + status);
			RequestDispatcher rd=request.getRequestDispatcher("Bidding.jsp");
			rd.forward(request, response);
			logger.info("Bid SUCCESS");
		}
		else{
			RequestDispatcher rd=request.getRequestDispatcher("Error.jsp");
			rd.forward(request, response);
			logger.info("Bid FAIL");
		}
	
	}
    
    }
    
