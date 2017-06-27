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
import org.apache.log4j.Priority;
import org.codehaus.jettison.json.JSONObject;

import com.google.gson.Gson;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.core.util.MultivaluedMapImpl;

import beans.UserBean;

//Login servlet
@WebServlet("/SessionControllerServlet")
public class SessionControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final static Logger logger = Logger.getLogger(SessionControllerServlet.class);   

    public SessionControllerServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/json");
		PrintWriter out=response.getWriter();
		
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String location = request.getParameter("location");
				
		UserBean bean=new UserBean();
		bean.setUserName(username);
		bean.setPassword(password);
		bean.setLastLoginLocation(location);
		request.setAttribute("bean",bean);
		
		Boolean status = false;
		try {			 
			Client client = Client.create();
			WebResource webResource = client.resource("http://localhost:9090/OnlineBiddingServices/rest/loginservices/checkuservalidity");
			
			Gson userJson = new Gson();
			String data = userJson.toJson(bean);
			
			ClientResponse restResponse = webResource
				.header("secret", AuthKey.KEY)
			    .type(MediaType.APPLICATION_JSON)
			    .post(ClientResponse.class, data);
			
			if (restResponse.getStatus() != 200) {
				throw new RuntimeException("Failed : HTTP error code : " + restResponse.getStatus());
			}
			
			Gson gson = new Gson();
			UserBean user = gson.fromJson(restResponse.getEntity(String.class), UserBean.class);
			bean = user;
			status = user.isValidUser();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if(status){
			HttpSession session = request.getSession();
			session.setAttribute("USER", bean);
			UserBean userBean=(UserBean)session.getAttribute("USER");
			System.out.println("session data: " + userBean.getUserName());
			RequestDispatcher rd=request.getRequestDispatcher("MainPage.jsp");
			rd.forward(request, response);
			logger.info("Login attempt from: "+ username+": SUCCESS");
		}
		else{
			RequestDispatcher rd=request.getRequestDispatcher("Error.jsp");
			logger.info("Login attempt from: "+ username+": FAIL");
			rd.forward(request, response);
		}
	}

}
