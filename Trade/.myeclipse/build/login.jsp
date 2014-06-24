<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>北京汇腾德国际贸易有限公司</title>
    
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
    <body background='img/loginpage.jpg' style="background-position:center; background-repeat:no-repeat;">


	<br>
	<br>

	<br>
	<br>
	<br>
	<br>
	<br><br><br><br><br><br>
	<br>
	<div align="center">
		<!--  <table  >
			<tr>
	
			
				<td>--><form action="LoginServlet" method="POST">
						<!--  <table bgcolor="#ffffff" style="filter:alpha(opacity=40)">
							
							<tr>
								<td>-->
									<h1 align="center">用户登录</h1>
								<!-- </td>
							</tr>
							<tr>
								<td>-->用户名： <input type="text" name="username"
									onfocus="if(this.value=='Your name')this.value='';"><!-- </td>
							</tr>
							<tr>
								<td>--><br><br>密&nbsp;&nbsp;&nbsp;&nbsp;码： <input
									type="password" name="password"
									onfocus="if(this.value=='Your password')this.value='';"><!--</td>
							</tr>
							<%--
     if(session.getAttribute("msg")!=null)
     {out.println("密码错误，请重新输入");}
     --%>
							<tr>
								<td></td>
							</tr>
							<tr>
								<td align="center">--><br><br><input type="submit" name="submit" value="提交">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" name="Reset"
									value="重置"><!--</td>
							</tr>
							
						</table>
					--></form><!--</td>
			</tr>
		</table>-->
		
	</div>


</body>

</html>
