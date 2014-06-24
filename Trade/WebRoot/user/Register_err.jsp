<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>
<%=session.getAttribute("type_err") %>
<%=session.getAttribute("username") %>,2秒后返回注册页面 
<% response.setHeader("refresh", "2;URL="+path+"/user/regesiter.jsp");%>
</h1>


</body>
</html>