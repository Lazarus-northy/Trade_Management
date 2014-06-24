<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" import="JavaBean.Contract.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:useBean id="selectall" scope="page" class="JavaBean.Contract.do_time" />
<jsp:setProperty name="selectall" property="*" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>提醒页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/alert.css">
	

  </head>
  
  <body>
  <% 
  Date today = new Date();
  java.text.SimpleDateFormat dformat = new java.text.SimpleDateFormat("yyyy-MM-dd");  
  String cal = dformat.format(today);
//System.out.println("the date is"+cal);
%>
    <div id="cotainer"><!-- 页面层容器 -->
        <div id="topside"><br><br><!-- 页面上边 -->
        <div id="PageBody"><!-- 页面主体 -->
            <div id="left"><!-- 左边时间提醒 -->
            <table align="center" witdh=50% cellpadding="20px">
			<thead>
				<tr>
					<th><h2>
						日期
					</h2></th>
					<th><h2>
						合同号
					</h2></th>
					<th><h2>
						事项详情
					</h2></th>
					<th><h2>
						操作
					</h2></th>
				</tr>
			</thead>
			<tbody align="center">
            <%
					List<Object> list = selectall.selectAllUser();
					//System.out.println("the lenth is"+list.size());
					if (list != null && !list.isEmpty()) {
						for (int i = 0; i < list.size(); i++) {

							time tc = (time) list.get(i);
							String Contract_id = tc.getContract_id();//合同ID
							Date time_ship_flight = tc.gettime_ship_flight();//装船时间
							Date lading_bill_date = tc.getlading_bill_date();//得到提单日期
							Date arriving_port_date = tc.getarriving_port_date();//到港日期
							Date bills_alert_date=tc.getbills_alert_date();//报关准备日期
							Date switch_bill_date = tc.getswitch_bill_date();//换单日期
							Date paytime = tc.getpaytime();//付款时间
							if(lading_bill_date == null && (int)((today.getTime()-time_ship_flight.getTime())/(24*60*60*1000))>=7)
							{//如果获得提单为空，且超过七天则提醒查看提单
							%>
								<tr align="center">
					                    <td><%=cal %></td>
					                    <td><%=Contract_id%></td>
					                      <td>确认是否获得提单</td>
					                      <td><a href="addtidan?Contract_id=<%=Contract_id%>&lading_bill_date=<%=cal %>">已获得提单</td>
			                             	</tr>
								
								<%
							}
							if(arriving_port_date==null){
								if((int)((today.getTime()-time_ship_flight.getTime())/(24*60*60*1000))>=7)
								{//如果装船时间过了7天，则提醒确认到港日期
								%>
								<tr align="center">
					                    <td><%=cal %></td>
					                    <td><%=Contract_id%></td>
					                      <td>确认到港日期</td>
					                      <td><a href="time/daogang.jsp?Contract_id=<%=Contract_id%>">输入到港日期</td>
			                             	</tr>
								
								<%
								
								}
							}
							else if((int)((today.getTime()-bills_alert_date.getTime())/(24*60*60*1000))>=0 && (int)((arriving_port_date.getTime()-today.getTime())/(24*60*60*1000))>=0)
							{//今天在报关提醒日期之后，在到港之前
							%>
								<tr align="center">
					                    <td><%=cal %></td>
					                    <td><%=Contract_id%></td>
					                      <td>报关手续准备，为换单做准备</td>
			                             	</tr>
								
								<%
							
							
							}

							else  if((int)((today.getTime()-switch_bill_date.getTime())/(24*60*60*1000))>=0)
							{//今天在换单日期之后
							%>
								<tr align="center">
					                    <td><%=cal %></td>
					                    <td><%=Contract_id%></td>
					                      <td>换单，进行国内清关</td>
			                             	</tr>
								
								<%
							
							
							}
							if((int)((today.getTime()-paytime.getTime())/(24*60*60*1000))>=0)
							{//今天在换单日期之后
							%>
								<tr align="center">
					                    <td><%=cal %></td>
					                    <td><%=Contract_id%></td>
					                      <td>查看客户是否付款，并关闭合同</td>
					                      <td><a href="closecontract?Contract_id=<%=Contract_id%>">关闭合同</td>
			                             	</tr>
								
								<%
							
							
							}
							
							
							
				%>
            
           
           
            <%
					}
					} else
						System.out.println("sorry");
				%></tbody></table>
            
            </div>
            <div id="right"><br><br><br><!-- 右边工作流程 -->
            <table id = "table" align="center"><tr><td align="center" valign="middle">
            <h1>国内清关流程</h1>
            </td></tr><tr>
            <td align="center" valign="middle"><h3>
            换单<br>
            ↓<br>
            报检<br>
             ↓<br>
            报关<br>
             ↓<br>
            出税<br>
             ↓<br>
            核税、海关放行<br>
             ↓<br>
            标签整改<br>
             ↓<br>
            提货<br>
            
            </h3>
            </td></tr></table></div>
        </div>
        <div id="footside"><a href="mailto&#58;drop&#64;destroydrop&#46;com">&copy;2014-2088 Geir Landr&ouml;</a><!-- 页面下边 --></div>
    </div>
    
  </body>
</html>
