package Servlet.contract;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import JavaBean.Contract.*;


public class update_contract extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public update_contract() {
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
		String Contract_id=(String)request.getParameter("Contract_id");
		String Company_id=(String)request.getParameter("Company_id");
		String shipper=(String)request.getParameter("shipper");
		String consignee=(String)request.getParameter("consignee");
		String notify=(String)request.getParameter("notify");
		String port_of_loading=(String)request.getParameter("port_of_loading");
		String port_of_discharge=(String)request.getParameter("port_of_discharge");
		String payment=(String)request.getParameter("payment");
		Date paytime=Date.valueOf(request.getParameter("paytime"));
		String price_terms=(String)request.getParameter("price_terms");
		String transport_method=(String)request.getParameter("transport_method");
		Date time_ship_flight=Date.valueOf(request.getParameter("time_ship_flight"));
		String shipment_flight=(String)request.getParameter("shipment_flight");
		String state=(String)request.getParameter("state");
		
		
		newcontract b=new newcontract();
		contract c=new contract();
		c.setContract_id(Contract_id);c.setCompany_id(Company_id);c.setshipper(shipper);c.setconsignee(consignee);
		c.setnotify(notify);c.setport_of_loading(port_of_loading);c.setport_of_discharge(port_of_discharge);c.setpayment(payment);
		c.setpaytime(paytime);c.setprice_terms(price_terms);c.settransport_method(transport_method);c.settime_ship_flight(time_ship_flight);
		c.setshipment_flight(shipment_flight);c.setstate(state);
		
		if (b.update_contract(c)) {
			response.setContentType("text/html;charset=UTF-8;pageEncoding=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script language = javascript contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'>alert('更新成功Update succeed!');");
			out.println("location.href='contract/contract.jsp'</script>");
			
			
		} else {
			response.setContentType("text/html;charset=UTF-8;pageEncoding=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script language = javascript contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'>alert('更新失败Update failed!');");
			out.println("location.href='contract/update_contract.jsp'</script>");  } 
		
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
