<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" import="JavaBean.Contract.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:useBean id="selectall" scope="page" class="JavaBean.Contract.newcontract" />
<jsp:setProperty name="selectall" property="*" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>北京汇腾德国际贸易公司</title>
    
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
						<b><a href="contract/newcontract.jsp">新增合同</a>&nbsp;&nbsp; <a href="">历史合同</a></B>
					</td>
				</tr>
			</tbody>
		</table>


		<table border="1" cellSpacing="0" cellPadding="0" width="98%"
			align="center">
			<thead>
				<tr>
					<th>
						合同编号
					</th>
					<th>
						客户公司
					</th>
					<th>
						发货人
					</th>
					<th>
						收货人
					</th>
					<th>
						通知方
					</th>
					<th>
						装运港
					</th>
					<th>
						卸货港
					</th>
					<th>
						付款方式
					</th>
					<th>
						付款时间
					</th>
					<th>
						价格条款
					</th>
					<th>
					    运送方式
					</th>
					<th>
						装船/装机时间
					</th>
					<th>
						船期/航班
					</th>
					<th>
					    状态
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

							contract tc = (contract) list.get(i);
				%>
				<!-- 将list集合里的内容转为实体类对象 -->

				<tr align="center">
					<td width="160"><%=tc.getContract_id()%></td>
					<td width="100"><%=tc.getCompany_id()%></td>
					<td width="100"><%=tc.getshipper()%></td>
					<td width="100"><%=tc.getconsignee()%></td>
					<td width="80"><%=tc.getnotify()%></td>
					<td width="80"><%=tc.getport_of_loading()%></td>
					<td width="80"><%=tc.getport_of_discharge()%></td>
					<td width="80"><%=tc.getpayment()%></td>
					<td width="80"><%=tc.getpaytime()%></td>
					<td width="160"><%=tc.getprice_terms()%></td>
					<td width="100"><%=tc.gettransport_method()%></td>
					<td width="100"><%=tc.gettime_ship_flight()%></td>
                    <td width="100"><%=tc.getshipment_flight()%></td>
                    <td width="100"><%=tc.getstate()%></td>
					<td width="160">
						<a href="contract/update_contract.jsp?Contract_id=<%=tc.getContract_id()%>&Company_id=<%=tc.getCompany_id()%>&shipper=<%=tc.getshipper()%>&consignee=<%=tc.getconsignee()%>&notify=<%=tc.getnotify()%>&port_of_loading=<%=tc.getport_of_loading()%>&port_of_discharge=<%=tc.getport_of_discharge()%>&payment=<%=tc.getpayment()%>&paytime=<%=tc.getpaytime()%>&price_terms=<%=tc.getprice_terms()%>&transport_method=<%=tc.gettransport_method()%>&time_ship_flight=<%=tc.gettime_ship_flight()%>&shipment_flight=<%=tc.getshipment_flight()%>&state=<%=tc.getstate() %>">修改</a>&nbsp;
						<a 
							href="<%=path %>/delete_contract?Contract_id=<%=tc.getContract_id()%>">删除</a>
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
