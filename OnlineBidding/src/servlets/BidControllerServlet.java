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

@WebServlet("/BidControllerServlet")
public class BidControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final static Logger logger = Logger.getLogger(BidControllerServlet.class);   

    public BidControllerServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("do post is running!!");
		response.setContentType("text/json");
		PrintWriter out=response.getWriter();
		    
		String itemID = request.getParameter("itemid"); 
		String username = request.getParameter("users"); 
		String postUserID = request.getParameter("username");
		String itemDesc = request.getParameter("itemdesc"); 
		String itemQuality = request.getParameter("itemquality");
		String itemPrice = request.getParameter("itemprice");
		String postUserEmail = request.getParameter("postuseremail");
		String itemName = request.getParameter("itemname");
		String bidUserEmail = request.getParameter("useremail");
		//System.out.println("controller : "+postUserID );
		
		BidBean bean=new BidBean();

		bean.setBidUserEmail(bidUserEmail);
		bean.setItemName(itemName);
		bean.setPostUserEmail(postUserEmail);
		bean.setItemID(itemID);
		bean.setUsername(username);
		bean.setPostUserID(postUserID);
		bean.setItemDesc(itemDesc);
		bean.setItemQuality(itemQuality);
		bean.setItemPrice(itemPrice);
		
		request.setAttribute("bean",bean);
		
	
		HttpSession session = request.getSession();
		session.setAttribute("BID",bean);
		
		RequestDispatcher rd=request.getRequestDispatcher("ProductDescriptionPage.jsp");
		rd.forward(request, response);
		
		logger.info("Bid controller servlet");
		
		}
	
	}
    
 