<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

		<title>Insert title here</title>
	</head>
	<body background="css/logo3.jpg">

		<table >
			<tr>
				<td>
					<h4>
						<%
					
						
							if (session.getAttribute("role").equals("admin")) {
						%>
						<%=session.getAttribute("username")%>,管理员,欢迎你！
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

						<a href="user/user.jsp" target="_parent">管理账户</a>
						<%
							} else {
						%><%=session.getAttribute("username")%>,普通用户,欢迎你！

						<%
							}
						%>
					</h4>
				</td>
				<td></td>
				<td>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="<%=path%>/login.jsp" target="_parent">注销</a>
				</td>
				
			</tr>
		</table>


	</body>
</html>