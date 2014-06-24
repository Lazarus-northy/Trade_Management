<%@ page language="java" import="java.util.*"  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="JavaBean.company.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="selectall" scope="page" class="JavaBean.company.company_op" />
<jsp:setProperty name="selectall" property="*" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>客户公司</title>
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
   <table class="tableborder" cellSpacing="0" cellPadding="0"
			width="100%" border="0">
			<tbody>
				<tr class="header">
					<td class="altbg1" width="20%" align="center">
						<b></b>
					</td>
					<td class="altbg1" width="15%" align="center">
						<b><a href="company/newcompany.jsp">新增公司</a>&nbsp;&nbsp; <a href=""></a></B>
					</td>
				</tr>
			</tbody>
		</table>


		<table border="1" cellSpacing="0" cellPadding="0" width="98%"
			align="center">
			<thead>
				<tr>
					<th>
						客户公司编号
					</th>
					<th>
						客户公司名称
					</th>
					<th>
						简称
					</th>
					<th>
						地址
					</th>
					<th>
						联系人
					</th>
					<th>
						联系电话
					</th>
					<th>
						主营业务
					</th>
					<th>
						备注
					</th>
					<th>
						选项
					</th>
				</tr>
			</thead>
			<tbody align="center">

				<%
					List<Object> list = selectall.selectAllUser();
					if (list != null && !list.isEmpty()) {
						for (int i = 0; i < list.size(); i++) {

							company tc = (company) list.get(i);
				%>
				<!-- 将list集合里的内容转为实体类对象 -->

				<tr align="center">
					<td width="160"><%=tc.getCompany_id()%></td>
					<td width="100"><%=tc.getCompany_name()%></td>
					<td width="100"><%=tc.getCompany_shortname()%></td>
					<td width="100"><%=tc.getCompany_address()%></td>
					<td width="80"><%=tc.getCompany_contact_p()%></td>
					<td width="80"><%=tc.getCompany_contact()%></td>
					<td width="80"><%=tc.getCompany_work()%></td>
					<td width="80"><%=tc.getCompany_note()%></td>
					<td width="160">
						<a href="company/update_company.jsp?Company_id=<%=tc.getCompany_id()%>&Company_name=<%=tc.getCompany_name()%>&Company_shortname=<%=tc.getCompany_shortname()%>&Company_address=<%=tc.getCompany_address()%>&Company_contact_p=<%=tc.getCompany_contact_p()%>&Company_contact=<%=tc.getCompany_contact()%>&Company_work=<%=tc.getCompany_work()%>&Company_note=<%=tc.getCompany_note()%>">修改</a>&nbsp;
						<a 
							href="<%=path %>/delete_company?Company_id=<%=tc.getCompany_id()%>">删除</a>
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
