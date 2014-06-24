package userServlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import JavaBean.user.*;


public class LoginServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public LoginServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		user u=new user(); 
		String xm="";  
		String ps=""; 
		xm=request.getParameter("username");
		ps=request.getParameter("password"); 
		u.setUsername(xm);  
		u.setPassword(ps);  
		HttpSession s=request.getSession(true);  
		s.setAttribute("username",xm);  
		db_op d=new db_op();
		HttpSession s1=request.getSession(true); 
		int tf=d.select_1(u); 
		if(tf==1){  
			//System.out.println("admin");
			 
			s1.setAttribute("role","admin");
			response.sendRedirect("main1.jsp");
			}  
		else{
			if(tf==2){   
				//System.out.println("worker");
				
				s1.setAttribute("role","worker");
				response.sendRedirect("main1.jsp");
			}
		   else
		   {
			   //System.out.println("wrong");
			response.sendRedirect("wrong.jsp"); 
			}
			}
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
