<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" import= "JavaBean.Contract.*"%>
<table border="1" cellSpacing="0" cellPadding="0" width="98%"
			align="center">
			<thead>
				<tr>
					<th>
						合同编号
					</th>
					<th>
						装船时间
					</th>
					<th>
						得到提单日期
					</th>
					<th>
						到港日期
					</th>
					<th>
						报关准备日期
					</th>
					<th>
						换单日期
					</th>
					<th>
					    付款时间
					</th>
				</tr>
			</thead>
			<tbody align="center">

				<%
				response.setContentType("text/html;charset=UTF-8");
				
				 List<Object> list = (List<Object>)request.getAttribute("list");
					if (list != null && !list.isEmpty()) {
						for (int i = 0; i < list.size(); i++) {

							time tc = (time) list.get(i);
							%>
				<!-- 将list集合里的内容转为实体类对象 -->

				<tr align="center">
					<td width="160"><%=tc.getContract_id()%></td>
					<td width="100"><%=tc.gettime_ship_flight()%></td>
					<td width="100"><%=tc.getlading_bill_date()%></td>
					<td width="100"><%=tc.getarriving_port_date()%></td>
					<td width="80"><%=tc.getbills_alert_date()%></td>
					<td width="80"><%=tc.getswitch_bill_date()%></td>
					<td width="80"><%=tc.getpaytime()%></td>
					
				</tr>
				<!-- 在td里输出对象的某个属性 -->

				<%
					}
					} else
						System.out.println("sorry");
				%>
			</tbody>
		</table>