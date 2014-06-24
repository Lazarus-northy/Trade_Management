<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" import="java.sql.Date"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>合同更新</title>
    
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
     <%
		String Contract_id=(String)request.getParameter("Contract_id").trim();
		String Company_id=(String)request.getParameter("Company_id").trim();
		String shipper=(String)request.getParameter("shipper").trim();
		String consignee=(String)request.getParameter("consignee").trim();
		String notify=(String)request.getParameter("notify").trim();
		String port_of_loading=(String)request.getParameter("port_of_loading").trim();
		String port_of_discharge=(String)request.getParameter("port_of_discharge").trim();
		String payment=(String)request.getParameter("payment").trim();
		Date paytime=Date.valueOf(request.getParameter("paytime"));
		String price_terms=(String)request.getParameter("price_terms").trim();
		String transport_method=(String)request.getParameter("transport_method").trim();
		Date time_ship_flight=Date.valueOf(request.getParameter("time_ship_flight"));
		String shipment_flight=(String)request.getParameter("shipment_flight").trim();
		String state=(String)request.getParameter("state").trim();
			
		%>
  <form action="update_contract?Contract_id=<%=Contract_id%>" method="post">
    <table align="center">
   <tr><td>合同编号：</td><td><a><%=Contract_id%></a></td></tr>
    <tr><td>客户公司：</td><td><input type="text" name="Company_id" value="<%=Company_id%>"></td></tr>
    <tr><td>发货人：</td><td><input type="text" name="shipper" value="<%=shipper%>"></td></tr>
    <tr><td>收货人：</td><td><input type="text" name="consignee" value="<%=consignee%>"></td></tr>
    <tr><td>通知方：</td><td><input type="text" name="notify" value="<%=notify%>"></td></tr>
    <tr><td>装运港：</td><td><input type="text" name="port_of_loading" value="<%=port_of_loading%>"></td></tr>
    <tr><td>卸货港：</td><td><input type="text" name="port_of_discharge" value="<%=port_of_discharge%>"></td></tr>
    <tr><td>付款方式：</td><td><input type="text" name="payment" value="<%=payment%>"></td></tr>
    <tr><td>付款时间：</td><td><input class="Wdate" type="text" name="paytime" id="d16" onfocus="WdatePicker({position:{right:100,bottom:50}})" value="<%=paytime%>"/></td></tr>
    <tr><td>价格条款：</td><td><select name="price_terms">
    <%if(price_terms.equals("FOB")){%>
    <option value="FOB" selected>FOB</option>
    <option value="CIF">CIF</option>
    <option value="EXW">EXW</option>
    <%} %>
     <%if(price_terms.equals("CIF")){%>
    <option value="FOB">FOB</option>
    <option value="CIF" selected>CIF</option>
    <option value="EXW">EXW</option>
    <%} %>
     <%if(price_terms.equals("EXW")){%>
    <option value="FOB">FOB</option>
    <option value="CIF">CIF</option>
    <option value="EXW" selected>EXW</option>
    <%} %>
    </select>
    </td></tr>
    <tr><td>运输方式</td><td><select name="transport_method">
    <%if(transport_method.equals("ship")){%>
  <option value="ship" selected>海运</option>
    <option value="flight">空运</option>
    <%} %>
     <%if(transport_method.equals("flight")){%>
   <option value="ship" >海运</option>
    <option value="flight"selected>空运</option>
    <%} %>
    </select></td></tr>
    <tr><td>装船/装机时间：</td><td><input class="Wdate" type="text" name="time_ship_flight" id="d161" onfocus="WdatePicker({position:{right:100,bottom:50}})" value="<%=time_ship_flight%>"/></td></tr>
    <tr><td>船期/航班：</td><td><input type="text" name="shipment_flight" value="<%=shipment_flight%>"></td></tr>
    <tr><td>合同状态：</td><td><select name="state">
    <%if(state.equals("open")){%>
   <option value="open" selected>进行中</option>
    <option value="close">已结束</option>
    <%} %>
     <%if(state.equals("close")){%>
    <option value="open" >进行中</option>
    <option value="close" selected>已结束</option>
    <%} %>
    </select></td></tr>
    </table>
    <div align="center">
   
    <input type="Submit" name="submit" value="提交">&nbsp;&nbsp;&nbsp;
    <a href="<%=path %>/contract/contract.jsp">返回</a>
    
    </div>
    </form>
  </body>

</html>
