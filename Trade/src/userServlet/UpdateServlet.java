package userServlet;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import JavaBean.user.*;;


public class UpdateServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UpdateServlet() {
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
		int id = Integer.valueOf(request.getParameter("id"));
		String username=(String)request.getParameter("username");    
		String password=(String)request.getParameter("password");    
		String role=(String)request.getParameter("role");

		user u=new user();
		u.setID(id);
		u.setUsername(username);
		u.setPassword(password);
		u.setrole(role);
		
		db_op d = new db_op();
		
		if (d.UpdateUser(u)) {
			System.out.println("update succedd");
			// JOptionPane.showMessageDialog(null, this,"鍒犻櫎鎴愬姛", id);
			response.setContentType("text/html;charset=UTF-8;pageEncoding=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script language = javascript contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'>alert('更改成功！Update succeed!');");
			out.println("location.href='user/user.jsp'</script>");
			//out.println("window.history.go(-1)</script>"); 
			
		} else {
			System.out.println("update failed");
			// JOptionPane.showMessageDialog(null, this,"涓嶅彲琚垹闄わ紝绠＄悊鍛樹笉鍙鍒犻櫎", id);
			response.setContentType("text/html;charset=UTF-8;pageEncoding=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script language = javascript contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'>alert('更改失败！Update failed!');");
			out.println("location.href='Update_page.jsp'</script>");  } 
			//out.println("window.history.go(-1)</script>"); 

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
