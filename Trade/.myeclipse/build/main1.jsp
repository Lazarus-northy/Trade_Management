<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>主页</title>
</head>
<script type="text/javascript" src="你的js文件地址" charset=“gb2312”></script>

<frameset rows="90,*">
	<frame name="top" src="top.jsp" frameborder="1"/>
	<frameset cols="200,*">
		<frame name="left" src="tree.jsp" frameborder="1"/>
		<frame name="content" src="time/alert_index.jsp"frameborder="1">
	</frameset>
</frameset>


<body>
<!-- 
<table align="center">
<tr><td align="center"><iframe id="top" width="1000" height="90" src="top.jsp" scrolling="no" frameborder="1" ></iframe>
</td>
     </tr>
<tr><td>
<table>
<tr>
<td><iframe id="left" width="200" height="1000" src="left.jsp" scrolling="no" frameborder="1"></iframe>    </td>
<td><iframe id="content" width="800" height="1000" src="user/regesiter.jsp" scrolling="no" frameborder="1"></iframe>       </td>
</tr>
</table>
</td></tr>
</table>


 
	<h1>
		<%=session.getAttribute("username")%>,管理员,登陆成功！
	</h1>
-->
</body>
</html>
