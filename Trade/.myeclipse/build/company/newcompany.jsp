<%@ page language="java" import="java.util.*"  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>北京汇腾德国际贸易有限公司——新增客户公司</title>
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
  <form action="addcompany" method="post">
    <table align="center">
    <tr><td>客户公司编号：</td><td><input type="text" name="Company_id" size="4"></td></tr>
    <tr><td>客户公司名称：</td><td><input type="text" name="Company_name"></td></tr>
    <tr><td>客户公司简称：</td><td><input type="text" name="Company_shortname"></td></tr>
    <tr><td>地址：</td><td><input type="text" name="Company_address"></td></tr>
    <tr><td>联系人：</td><td><input type="text" name="Company_contact_p"></td></tr>
    <tr><td>联系电话：</td><td><input type="text" name="Company_contact"></td></tr>
    <tr><td>主营业务：</td><td><input type="text" name="Company_work"></td></tr>
    <tr><td>备注：</td><td><input type="text" name="Company_note"></td></tr>

    </table>
    <div align="center">
   
    <input type="Submit" name="submit" value="提交">&nbsp;&nbsp;&nbsp;
    <a href="<%=path %>/company/company.jsp">返回</a>
    
    </div>
    </form>
  </body>
</html>
