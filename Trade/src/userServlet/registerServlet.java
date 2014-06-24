package userServlet;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.*;
import javax.servlet.http.*;

import JavaBean.*;
import JavaBean.user.*;;


public class registerServlet extends HttpServlet{
	

/**
	 * 
	 */
	private static final long serialVersionUID = 30361098790859579L;

public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {  
	doPost(request,response);
	}
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// TODO Auto-generated method stub
	String xm=(String)request.getParameter("username");    
	String mm=(String)request.getParameter("password");  
	String role2=(String)request.getParameter("role"); 
	db_op b=new db_op();    
	if(b.select_2(xm)){
		user u=new user();u.setUsername(xm);u.setPassword(mm);u.setrole(role2);  
		db_op d=new db_op();         d.append(u);    
		response.setContentType("text/html;charset=UTF-8;pageEncoding=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script language = javascript contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'>alert('添加成功！register succeed!');");
		out.println("location.href='user/user.jsp'</script>");
		
		}  else{  
			response.setContentType("text/html;charset=UTF-8;pageEncoding=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script language = javascript contentType='text/html; charset=UTF-8' pageEncoding='UTF-8'>alert('添加失败，该用户已存在!The user has been existed');");
			out.println("location.href='user/regesiter.jsp'</script>");
				}
}
}
