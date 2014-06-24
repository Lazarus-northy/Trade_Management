<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'daogang.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script language="javascript" type="text/javascript" src="<%=path%>/js/My97DatePicker/WdatePicker.js"></script>
  </head>
  
  <body>
   <%
		String Contract_id=(String)request.getParameter("Contract_id");
		%>

<form method="post" action="update_daogang?Contract_id=<%=Contract_id%>">
  <div align = "center">
   <table align="center" width="70%" border="1">
   <tr><td>合同编号：</td><td><a><%=Contract_id%></a></td></tr>
   <tr><td>到港日期</td><td><input class="Wdate" type="text" name="arriving_port_date" id="d16" onfocus="WdatePicker({position:{right:100,bottom:50}})"/></td></tr>
   </table>
    <input type="Submit" name="submit" value="提交">&nbsp;&nbsp;&nbsp;
    <a href="<%=path %>/time/alert_index.jsp">返回</a>
  </div>
  
  
  </form>
  </body>
</html>
