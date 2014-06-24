<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" import="JavaBean.Contract.*" %>
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
				</tr>
			</thead>
			<tbody align="center">

				<%
				response.setContentType("text/html;charset=UTF-8");
				
				 List<Object> list = (List<Object>)request.getAttribute("list");
					if (list != null && !list.isEmpty()) {
					System.out.println(list.size());
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
					
				</tr>
				<!-- 在td里输出对象的某个属性 -->

				<%
					}
					} else
						System.out.println("sorry");
				%>
			</tbody>
		</table>