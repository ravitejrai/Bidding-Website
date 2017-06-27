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

import org.apache.log4j.Logger;

import com.google.gson.Gson;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.core.util.MultivaluedMapImpl;

import beans.SearchBean;
import beans.UserBean;
import beans.ProductsBean;
import beans.ProductBean;

import java.util.ArrayList;

/**
 * Servlet implementation class SearchServlet
 */
@WebServlet("/SearchProductsServlet")
public class SearchProductsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final static Logger logger = Logger.getLogger(SearchProductsServlet.class);
	
    public SearchProductsServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/json");
		
		String searchText = request.getParameter("Search");
		searchText = "%" + searchText + "%";
		ProductsBean products = new ProductsBean();
		SearchBean searchBean = new SearchBean();
		searchBean.setSearch(searchText);
		
		Boolean status = false;
		try {
			 
			Client client = Client.create();
			WebResource webResource = client.resource("http://localhost:9090/OnlineBiddingServices/rest/searchproductsservices/search");
			
			Gson userJson = new Gson();
			String data = userJson.toJson(searchBean);

			ClientResponse restResponse = webResource
				    .type(MediaType.APPLICATION_JSON)
				    .post(ClientResponse.class, data);
			
			if (restResponse.getStatus() != 200) {
				throw new RuntimeException("Failed : HTTP error code : " + restResponse.getStatus());
			}
 
			Gson gson = new Gson();
			ProductsBean searchResult = gson.fromJson(restResponse.getEntity(String.class), ProductsBean.class);
						
			products = searchResult;

			status = products.isValidSearch();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(status){
			HttpSession session = request.getSession();
			session.setAttribute("PRODUC", products);
			RequestDispatcher rd=request.getRequestDispatcher("SearchProducts.jsp");
			rd.forward(request, response);
			logger.info("Results found for: "+ searchText);
		}
		else{
			RequestDispatcher rd=request.getRequestDispatcher("Error.jsp");
			rd.forward(request, response);
			logger.info("Some error occured for: "+ searchText);
		}
		
	}

}
