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
    
    <title>My JSP 'newcost.jsp' starting page</title>
    
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
 <!-- 合同ID，费用类型（-预付/-预收/+发生），费用发生地（北京/天津/其他【检疫标签】），费用项目名称，金额，备注，费用发生日期 -->
  <form action="addcost" method="post">
    <table align="center">
    <tr><td>费用编号：</td><td><input type="text" name="Cost_id"></td></tr>
    <tr><td>合同编号：</td><td><select name="Contract_id">
<%
					List<Object> list = selectall.selectAllUser();
						for (int i = 0; i < list.size(); i++) {
							contract tc = (contract) list.get(i);
				%>
<option value="<%=tc.getContract_id()%>"><%=tc.getContract_id()%></option>
<%}%>
</select>
</td></tr>

    <tr><td>费用类型：</td><td><select name="Costtype">
    <option value="yufu" selected>预付</option>
    <option value="yushou">预收</option>
    <option value="happen">发生</option>
    </select></td></tr>
    <tr><td>费用发生地：</td><td><select name="Cost_happened">
    <option value="beijing" selected>北京</option>
    <option value="tianjin">天津</option>
    <option value="other">其他</option>
    </select></td></tr>
    <tr><td>费用项目名称：</td><td><input type="text" name="ProjectName"></td></tr>
    <tr><td>金额：</td><td><input type="text" name="Money"></td></tr>
    <tr><td>备注：</td><td><input type="text" name="note"></td></tr>
    <tr><td>费用发生日期：</td><td><input class="Wdate" type="text" name="Cost_date" id="d16" onfocus="WdatePicker({position:{right:100,bottom:50}})"/></td></tr>
    </table>
    <div align="center">
   
    <input type="Submit" name="submit" value="提交">&nbsp;&nbsp;&nbsp;
    <a href="<%=path %>/cost/cost.jsp">返回</a>
    
    </div>
    </form>
  </body>
</html>
