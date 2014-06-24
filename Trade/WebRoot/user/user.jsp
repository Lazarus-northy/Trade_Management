<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="JavaBean.user.user"%>

<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="selectall" scope="page" class="JavaBean.user.db_op" />
<jsp:setProperty name="selectall" property="*" />



<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<body>

		<table class="tableborder" cellSpacing="0" cellPadding="0"
			width="100%" border="0">
			<tbody>
				<tr class="header">
					<td class="altbg1" width="20%" align="center">
						<b><a href="<%=path%>/main1.jsp">主页</a> </b>
					</td>
					<td class="altbg1" width="15%" align="center">
						<b><a href="regesiter.jsp">新增用户</a> </B>
					</td>
				</tr>
			</tbody>
		</table>


		<table border="1" cellSpacing="0" cellPadding="0" width="80%"
			align="center">
			<thead>
				<tr>
					<th>
						ID
					</th>
					<th>
						username
					</th>
					<th>
						password
					</th>
					<th>
						role
					</th>
					<th>
						option
					</th>
				</tr>
			</thead>
			<tbody align="center">

				<%
					List<Object> list = selectall.selectAllUser();
					if (list != null && !list.isEmpty()) {
						for (int i = 0; i < list.size(); i++) {

							user tc = (user) list.get(i);
				%>
				<!-- 将list集合里的内容转为实体类对象 -->

				<tr align="center">
					<td><%=tc.getID()%></td>
					<td><%=tc.getUsername()%></td>
					<td><%=tc.getPassword()%></td>
					<td><%=tc.getrole()%></td>

					<td width="120">
						<a href="Update_page.jsp?id=<%=tc.getID()%>&username=<%=tc.getUsername()%>&password=<%=tc.getPassword()%>&role=<%=tc.getrole()%>">修改</a>&nbsp;
						<a
							href="DeleteServlet.do?id=<%=tc.getID()%>">删除</a>
					</td>
				</tr>
				<!-- 在td里输出对象的某个属性 -->

				<%
					}
					} else
						System.out.println("sorry");
				%>
			</tbody>
		</table>










	</body>
</html>