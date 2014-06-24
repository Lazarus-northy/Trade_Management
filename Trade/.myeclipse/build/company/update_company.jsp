<%@ page language="java" import="java.util.*"  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>公司信息更改</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
     <%
		String Company_id=(String)request.getParameter("Company_id");
		String Company_name=(String)request.getParameter("Company_name");
		String Company_shortname=(String)request.getParameter("Company_shortname");
		String Company_address=(String)request.getParameter("Company_address");
		String Company_contact_p=(String)request.getParameter("Company_contact_p");
		String Company_contact=(String)request.getParameter("Company_contact");
		String Company_work=(String)request.getParameter("Company_work");
		String Company_note=(String)request.getParameter("Company_note");
			
		%>
  <form action="update_company?Company_id=<%=Company_id%>" method="post">
    <table align="center">
  <tr><td>客户公司编号：</td><td><input type="text" name="Company_id" size="4" value="<%=Company_id%>"></td></tr>
    <tr><td>客户公司名称：</td><td><input type="text" name="Company_name" value="<%=Company_name %>"></td></tr>
    <tr><td>客户公司简称：</td><td><input type="text" value="<%=Company_shortname %>" name="Company_shortname"></td></tr>
    <tr><td>地址：</td><td><input type="text" name="Company_address" value="<%=Company_address %>"></td></tr>
    <tr><td>联系人：</td><td><input type="text" name="Company_contact_p" value="<%=Company_contact_p %>"></td></tr>
    <tr><td>联系电话：</td><td><input type="text" name="Company_contact" value="<%=Company_contact %>"></td></tr>
    <tr><td>主营业务：</td><td><input type="text" name="Company_work" value="<%=Company_work %>"></td></tr>
    <tr><td>备注：</td><td><input type="text" name="Company_note" value="<%=Company_note %>"></td></tr>
    </table>
    <div align="center">
   
    <input type="Submit" name="submit" value="提交">&nbsp;&nbsp;&nbsp;
    <a href="<%=path %>/company/company.jsp">返回</a>
    
    </div>
    </form>
  </body>
</html>
