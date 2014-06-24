package Servlet.company;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import JavaBean.company.*;

public class update_company extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public update_company() {
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

		doGet(request,response);
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
		request.setCharacterEncoding("UTF-8");
		   response.setContentType("text/html;charset=UTF-8");
		String Company_id=(String)request.getParameter("Company_id");
		String Company_name=(String)request.getParameter("Company_name");
		String Company_shortname=(String)request.getParameter("Company_shortname");
		String Company_address=(String)request.getParameter("Company_address");
		String Company_contact_p=(String)request.getParameter("Company_contact_p");
		String Company_contact=(String)request.getParameter("Company_contact");
		String Company_work=(String)request.getParameter("Company_work");
		String Company_note=(String)request.getParameter("Company_note");
		
		
		company_op b=new company_op();
		company c=new company();
		c.setCompany_id(Company_id);c.setCompany_name(Company_name);c.setCompany_shortname(Company_shortname);
		c.setCompany_address(Company_address);c.setCompany_contact_p(Company_contact_p);c.setCompany_contact(Company_contact);
		c.setCompany_work(Company_work);c.setCompany_note(Company_note);
		
		
		if (b.update_company(c)) {
			response.setContentType("text/html;charset=UTF-8;pageEncoding=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script language = javascript contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'>alert('更新成功Update succeed!');");
			out.println("location.href='company/company.jsp'</script>");
			
			
		} else {
			response.setContentType("text/html;charset=UTF-8;pageEncoding=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script language = javascript contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'>alert('更新失败Update failed!');");
			out.println("location.href='update_company.jsp'</script>");  } 
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
