package Servlet.cost;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import JavaBean.Contract.contract;
import JavaBean.Contract.do_time;
import JavaBean.Contract.newcontract;
import JavaBean.cost.cost;
import JavaBean.cost.do_cost;

public class addcost extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public addcost() {
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

		request.setCharacterEncoding("UTF-8");
		   response.setContentType("text/html;charset=UTF-8");
		String Cost_id = (String)request.getParameter("Cost_id");
		String Contract_id=(String)request.getParameter("Contract_id");
		String Costtype = (String)request.getParameter("Costtype");
		String Cost_happened = (String)request.getParameter("Cost_happened");
		String ProjectName = (String)request.getParameter("ProjectName");
		float Money = Float.parseFloat(request.getParameter("Money"));
		String note = (String)request.getParameter("note");
		Date Cost_date=Date.valueOf(request.getParameter("Cost_date"));
		
		
		do_cost b=new do_cost();
		if(b.select_cost(Cost_id)){
			response.setContentType("text/html;charset=UTF-8;pageEncoding=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script language = javascript contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'>alert('该费用已经存在!The Cost has been existed');");
			out.println("location.href='cost/newcost.jsp'</script>");	
		
		}else{
			cost c=new cost();
			c.setContract_id(Contract_id);c.setCost_id(Cost_id);c.setCosttype(Costtype);c.setCost_happened(Cost_happened);
			c.setProjectName(ProjectName);c.setMoney(Money);c.setnote(note);c.setCost_date(Cost_date);
			b.addcost(c);
			do_cost b1=new do_cost();
		     if(b1.select_cost(Cost_id)){
			response.setContentType("text/html;charset=UTF-8;pageEncoding=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script language = javascript contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'>alert('费用建立成功add succeed!');");
			out.println("location.href='cost/cost.jsp'</script>");}
		     else{
			response.setContentType("text/html;charset=UTF-8;pageEncoding=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script language = javascript contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'>alert('费用建立失败!Failed, please check the information!');");
			out.println("location.href='cost/newcost.jsp'</script>");
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
