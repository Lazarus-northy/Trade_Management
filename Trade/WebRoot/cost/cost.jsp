<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"  import="JavaBean.cost.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:useBean id="selectall" scope="page" class="JavaBean.cost.do_cost" />
<jsp:setProperty name="selectall" property="*" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'cost.jsp' starting page</title>
    
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
						<b><a href="cost/newcost.jsp">新增费用</a>&nbsp;&nbsp; <a href="">历史费用</a></B>
					</td>
				</tr>
			</tbody>
		</table>


		<table border="1" cellSpacing="0" cellPadding="0" width="98%"
			align="center">
			<thead>
				<tr>
				    <th>
						费用编号
					</th>
					<th>
						合同编号
					</th>
					<th>
						费用类型（-预付/-预收/+发生）
					</th>
					<th>
						费用发生地（北京/天津/检疫标签）
					</th>
					<th>
						费用项目名称
					</th>
					<th>
						金额
					</th>
					<th>
						备注
					</th>
					<th>
						费用发生日期客户公司
					</th>
					<th>
						选项
					</th>
				</tr>
			</thead>
			<tbody align="center">

				<%
					List<Object> list = selectall.selectAllCost();
					if (list != null && !list.isEmpty()) {
						for (int i = 0; i < list.size(); i++) {

							cost tc = (cost) list.get(i);
				%>
				<!-- 将list集合里的内容转为实体类对象 -->

				<tr align="center">
				    <td width="160"><%=tc.getCost_id()%></td>
					<td width="160"><%=tc.getContract_id()%></td>
					<td width="100"><%=tc.getCosttype()%></td>
					<td width="100"><%=tc.getCost_happened()%></td>
					<td width="100"><%=tc.getProjectName()%></td>
					<td width="80"><%=tc.getMoney()%></td>
					<td width="80"><%=tc.getnote()%></td>
					<td width="80"><%=tc.getCost_date()%></td>
					<td width="160">
						<a href="cost/update_cost.jsp?Cost_id=<%=tc.getCost_id()%>&Contract_id=<%=tc.getContract_id()%>&Costtype=<%=tc.getCosttype()%>&Cost_happened=<%=tc.getCost_happened()%>&ProjectName=<%=tc.getProjectName()%>&Money=<%=tc.getMoney()%>&note=<%=tc.getnote()%>&Cost_date=<%=tc.getCost_date()%>">修改</a>&nbsp;
						<a 
							href="<%=path %>/delete_cost?Cost_id=<%=tc.getCost_id()%>">删除</a>
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
