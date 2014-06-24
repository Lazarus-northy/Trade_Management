<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" import="JavaBean.company.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:useBean id="selectall" scope="page" class="JavaBean.company.company_op" />
<jsp:setProperty name="selectall" property="*" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>北京汇腾德国际贸易有限公司——新增合同</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script language="javascript" type="text/javascript" src="<%=path%>/js/My97DatePicker/WdatePicker.js"></script>
  </head>
  
  <body>
  <form action="addcontract" method="post">
    <table align="center">
    <tr><td>合同编号：</td><td>HTD<input type="text" name="Contract_id" size="4"></td></tr>
    <tr><td>客户公司：</td><td><select name="Company_id">
<%
List<Object> list = selectall.selectAllUser();
for(int i=0;i<list.size();i++){
   company te = (company) list.get(i);
%>
<option value="<%=te.getCompany_id()%>"><%=te.getCompany_name()%></option>
<%}%>

</select>
</td></tr>
    <tr><td>发货人：</td><td><input type="text" name="shipper"></td></tr>
    <tr><td>收货人：</td><td><input type="text" name="consignee"></td></tr>
    <tr><td>通知方：</td><td><input type="text" name="notify"></td></tr>
    <tr><td>装运港：</td><td><input type="text" name="port_of_loading"></td></tr>
    <tr><td>卸货港：</td><td><input type="text" name="port_of_discharge"></td></tr>
    <tr><td>付款方式：</td><td><input type="text" name="payment"></td></tr>
    <tr><td>付款时间：</td><td><input class="Wdate" type="text" name="paytime" id="d16" onfocus="WdatePicker({position:{right:100,bottom:50}})"/></td></tr>
    <tr><td>价格条款：</td><td><select name="price_terms">
    <option value="FOB" selected>FOB</option>
    <option value="CIF">CIF</option>
    <option value="EXW">EXW</option>
    </select>
    </td></tr>
    <tr><td>运输方式</td><td><select name="transport_method">
    <option value="ship" selected>海运</option>
    <option value="flight">空运</option>
    </select></td></tr>
    <tr><td>装船/装机时间：</td><td><input class="Wdate" type="text" name="time_ship_flight" id="d161" onfocus="WdatePicker({position:{right:100,bottom:50}})"/></td></tr>
    <tr><td>船期/航班：</td><td><input type="text" name="shipment_flight"></td></tr>
    <tr><td>合同状态：</td><td><select name="state">
    <option value="open" selected>进行中</option>
    <option value="close">已结束</option>
    </select></td></tr>
    </table>
    <div align="center">
   
    <input type="Submit" name="submit" value="提交">&nbsp;&nbsp;&nbsp;
    <a href="<%=path %>/contract/contract.jsp">返回</a>
    
    </div>
    </form>
  </body>
</html>
