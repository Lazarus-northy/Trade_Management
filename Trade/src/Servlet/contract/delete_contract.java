package Servlet.contract;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import JavaBean.Contract.*;

public class delete_contract extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public delete_contract() {
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
		request.setCharacterEncoding("UTF-8");
		   response.setContentType("text/html;charset=UTF-8");
		String Contract_id=(String)request.getParameter("Contract_id");
		newcontract b=new newcontract();

		if(b.delete_contract(Contract_id)){
			response.setContentType("text/html;charset=UTF-8;pageEncoding=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script language = javascript contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'>alert('删除成功Delete succeed!');");
			out.println("location.href='contract/contract.jsp'</script>");
		}else{
			response.setContentType("text/html;charset=UTF-8;pageEncoding=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script language = javascript contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'>alert('删除失败Delete failed');");
			out.println("location.href='contract/contract.jsp'</script>");   
		}
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

		doGet(request,response);
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
