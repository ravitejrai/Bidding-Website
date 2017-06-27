package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.MultivaluedMap;

import com.google.gson.Gson;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.core.util.MultivaluedMapImpl;

import beans.SearchBean;
import beans.UserBean;
import beans.ProductsBean;
import beans.RegisterBidsBean;
import beans.ProductBean;

import java.util.ArrayList;

/**
 * Servlet implementation class DeleteCartItemServlet
 */
@WebServlet("/DeleteItemServlet")
public class DeleteItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteItemServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPOST(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/json");
		
		String item = request.getParameter("itemname");
		String username = request.getParameter("users");
		RegisterBidsBean products = new RegisterBidsBean();
		SearchBean searchBean = new SearchBean();
		searchBean.setSearch(item);
		searchBean.setSearch2(username);
		System.out.println("deleteitemfromcart servlet itemname: "+ item);
		System.out.println("deleteitemfromcart servlet username: "+ username);
		Boolean status = false;
		try {
			 
			Client client = Client.create();
			WebResource webResource = client.resource("http://localhost:9090/OnlineBiddingServices/rest/DeleteItemService/view");
			
			Gson userJson = new Gson();
			String data = userJson.toJson(searchBean);
			//String data1 = userJson.toJson(bean);
			System.out.println("deleteitemfromcart servle json data: "+ data);
			//System.out.println("deleteitemfromcart servle json data: "+ data2);
											
			//ClientResponse restResponse = webResource
			//    .type(MediaType.APPLICATION_FORM_URLENCODED_TYPE)
			//    .post(ClientResponse.class, formData);
			ClientResponse restResponse = webResource
				    .type(MediaType.APPLICATION_JSON)
				    .post(ClientResponse.class, data);
			//System.out.println("deleteitemfromcart responsedata: "+ restResponse);
			if (restResponse.getStatus() != 200) {
				throw new RuntimeException("Failed : HTTP error code : " + restResponse.getStatus());
			}
 
			Gson gson = new Gson();
			RegisterBidsBean searchResult = gson.fromJson(restResponse.getEntity(String.class), RegisterBidsBean.class);
				
			System.out.println("servlet printing now: ");
			//searchResult.getBooks();
			
			products = searchResult;
			//System.out.print(products.getACTPRICE(0));
			
			
			//String statusString = restResponse.getEntity(String.class);
			//status = Boolean.parseBoolean(statusString);
			status = products.isValidSearch();
			System.out.println("servlet status: " + status);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(status){
			System.out.println("status is good!");
			HttpSession session = request.getSession();
			session.setAttribute("PRODUCT1", products);
			RequestDispatcher rd=request.getRequestDispatcher("Selling.jsp");
			rd.forward(request, response);
		}
		else{
			RequestDispatcher rd=request.getRequestDispatcher("login-error.jsp");
			rd.forward(request, response);
		}
		
		
		//now send request to service
		
	}


}

