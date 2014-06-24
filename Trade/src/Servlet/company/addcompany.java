package Servlet.company;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import JavaBean.company.*;

public class addcompany extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public addcompany() {
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
//		  request.setCharacterEncoding("UTF-8");
//		   response.setContentType("text/html;charset=UTF-8");
//		response.setCharacterEncoding("UTF-8"); 
		//System.out.println("jjjjjjjjjjjjjjjjjjj");
		String Company_id=(String)request.getParameter("Company_id");
		String Company_name=new String(request.getParameter("Company_name").getBytes("ISO-8859-1"),"UTF-8");
		String Company_shortname=new String(request.getParameter("Company_shortname").getBytes("ISO-8859-1"),"UTF-8");
		String Company_address=new String(request.getParameter("Company_address").getBytes("ISO-8859-1"),"UTF-8");
		String Company_contact_p=new String(request.getParameter("Company_contact_p").getBytes("ISO-8859-1"),"UTF-8");
		String Company_contact=new String(request.getParameter("Company_contact").getBytes("ISO-8859-1"),"UTF-8");
		String Company_work=new String(request.getParameter("Company_work").getBytes("ISO-8859-1"),"UTF-8");
		String Company_note=new String(request.getParameter("Company_note").getBytes("ISO-8859-1"),"UTF-8");

		
		company_op b=new company_op();
		if(b.select_company(Company_id)==false){
			company c=new company();
			c.setCompany_id(Company_id);c.setCompany_name(Company_name);c.setCompany_shortname(Company_shortname);
			c.setCompany_address(Company_address);c.setCompany_contact_p(Company_contact_p);c.setCompany_contact(Company_contact);
			c.setCompany_work(Company_work);c.setCompany_note(Company_note);
			b.addcompany(c);
			company_op b1=new company_op();
		     if(b1.select_company(Company_id)){

			response.setContentType("text/html;charset=UTF-8;pageEncoding=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script language = javascript contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'>alert('添加成功！add succeed!');");
			out.println("location.href='company/company.jsp'</script>");}
		     else{
			response.setContentType("text/html;charset=UTF-8;pageEncoding=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script language = javascript contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'>alert('添加失败，请核对信息!Failed, please check the information!');");
			out.println("location.href='company/newcompany.jsp'</script>");
			}
		
		}else{
			response.setContentType("text/html;charset=UTF-8;pageEncoding=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script language = javascript contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'>alert('该公司已经存在!The Company has been existed');");
			out.println("location.href='company/newcompany.jsp'</script>");
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
