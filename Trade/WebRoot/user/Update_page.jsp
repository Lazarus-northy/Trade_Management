<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<script src="../js/jquery-1.4.3.js"></script>
	<script>
		

		var txtPassword=false;
		var txtRepeatPass = false;
	
			$(function(){
				$('#txtPassword').blur(function(){
					var password = $('#txtPassword').val();
					var pattern=/\b([a-zA-z0-9]{6,20}$)\b/;
					if(!pattern.test(password)){
						$('#password\\.info').html("<img src='../img/wrong.gif'/>格式不正确!");
						txtPassword = false;
					}else{
						$('#password\\.info').html("<img src='../img/right.gif'/>格式正确!");
						txtPassword=true;
					}
				});
			});
			$(function(){
				$('#txtRepeatPass').blur(function(){
					var RepeatPass = $('#txtRepeatPass').val();
					var password = $('#txtPassword').val();
					if(RepeatPass!=password||RepeatPass==""){
						$('#password1\\.info').html("<img src='../img/wrong.gif'/>两次密码不一致!");
						txtRepeatPass = false;
					}else{
						$('#password1\\.info').html("<img src='../img/right.gif'/>输入正确!");
						txtRepeatPass = true;
					}
				});
			});
			
		</script>

	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'Update_page.jsp' starting page</title>

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
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String role = request.getParameter("role");
			int id = Integer.valueOf(request.getParameter("id"));
			
		%>
		<form action="<%=path%>/UpdateServlet?id=<%=id%>" method="post">
			<div align="center">
				<table align="center" border="1" cellpadding="10">


					<tr>
						<td align="right" valign="top">
							用户名：
						</td>
						<td valign="top" align="left">
							
								<%=username%>
	
						</td>
					</tr>
					<tr>
						<td align="right" valign="top">
							密&nbsp;&nbsp;码：
						</td>
						<td valign="middle" align="left">
							<input type="password" name="password" size=20 id="txtPassword"
								value="<%=password%>">
							<div class="text_left" id="passwordValidMsg">
								<p>
									您的密码可以由大小写英文字母、数字组成，长度6－20位。
								</p>
								<span id="password.info" style="color: red"></span>
							</div>
						</td>
					</tr>
					<tr>
						<td align="right" valign="top">
							再次输入密码：
						</td>
						<td valign="top" align="left">
							<input type="password" name="repassword" size=20
								id="txtRepeatPass">
							<div class="text_left" id="repeatPassValidMsg">
								<span id="password1.info" style="color: red"></span>
							</div>
						</td>
					</tr>
					<tr>
						<td align="right" valign="top">
							权&nbsp;&nbsp;限：
						</td>
						<td valign="top" align="left">
							<%
								if (role.equals("admin")) {
							%>
							<input type="radio" value="admin" name="role" checked="checked">
							admin&nbsp;
							<input type="radio" value="user" name="role">
							user
							<%
								} else {
							%><input type="radio" value="admin" name="role">
							admin&nbsp;
							<input type="radio" value="user" name="role" checked="checked">
							user<%
								}
							%>


						</td>
					</tr>
					<tr>
						<td align="right">
						确认无误：
						</td>
						<td align="center"width="400">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="submit" name="submit" size=40 value="提交">

						</td>
					

					</tr>
				</table>
			</div>
		</form>
		<div align="center">
			<a href="user/user.jsp">返回用户页面</a>
		</div>
	</body>
</html>
