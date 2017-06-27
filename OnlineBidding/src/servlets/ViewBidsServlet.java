package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.MultivaluedMap;

import org.apache.log4j.Logger;

import com.google.gson.Gson;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.core.util.MultivaluedMapImpl;

import beans.PostBean;
import beans.ProductBean;
import beans.ProductsBean;
//import beans.SearchBean;
import beans.UserBean;

import java.util.ArrayList;

@WebServlet("/ViewBidsServlet")
public class ViewBidsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final static Logger logger = Logger.getLogger(ViewBidsServlet.class);   

    public ViewBidsServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/json");

		String searchText = request.getParameter("users");
		ProductsBean products = new ProductsBean();
		PostBean postBean = new PostBean();
		postBean.setPost(searchText);
		
		Boolean status = false;
		try {
			 
			Client client = Client.create();
			WebResource webResource = client.resource("http://localhost:9090/OnlineBiddingServices/rest/displaybids/display");
			
			Gson userJson = new Gson();
			String data = userJson.toJson(postBean);
			
			ClientResponse restResponse = webResource
				    .type(MediaType.APPLICATION_JSON)
				    .post(ClientResponse.class, data);
			
			if (restResponse.getStatus() != 200) {
				throw new RuntimeException("Failed : HTTP error code : " + restResponse.getStatus());
			}
 
			Gson gson = new Gson();
			ProductsBean searchResult = gson.fromJson(restResponse.getEntity(String.class), ProductsBean.class);
				
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
			session.setAttribute("PRODUCTS", products);
			RequestDispatcher rd=request.getRequestDispatcher("Selling.jsp");
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
