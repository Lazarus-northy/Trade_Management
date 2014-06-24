<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" import="java.sql.Date"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'update_cost.jsp' starting page</title>
    
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
     <%
        String Cost_id = (String)request.getParameter("Cost_id").trim();
        String Contract_id=(String)request.getParameter("Contract_id").trim();
		String Costtype = (String)request.getParameter("Costtype").trim();
		String Cost_happened = (String)request.getParameter("Cost_happened").trim();
		String ProjectName = (String)request.getParameter("ProjectName").trim();
		float Money = Float.parseFloat(request.getParameter("Money"));
		String note = (String)request.getParameter("note").trim();
		Date Cost_date=Date.valueOf(request.getParameter("Cost_date"));
		
		
		%>
 <!-- 合同ID，费用类型（-预付/-预收/+发生），费用发生地（北京/天津/其他【检疫标签】），费用项目名称，金额，备注，费用发生日期 -->
  <form action="update_cost?Cost_id=<%=Cost_id%>&Contract_id=<%=Contract_id %>" method="post">
    <table align="center">
    <tr><td>费用编号：</td><td><a><%=Cost_id%></a></td></tr>
    <tr><td>合同编号：</td><td><a><%=Contract_id%></a></td></tr>
    <tr><td>费用类型：</td><td><select name="Costtype">
    <%if(Costtype.equals("yufu")){%>
    <option value="yufu" selected>预付</option>
    <option value="yushou">预收</option>
    <option value="happen">发生</option>
    <%} %>
     <%if(Costtype.equals("yushou")){%>
    <option value="yufu">预付</option>
    <option value="yushou" selected>预收</option>
    <option value="happen">发生</option>
    <%} %>
     <%if(Costtype.equals("happen")){%>
    <option value="yufu">预付</option>
    <option value="yushou">预收</option>
    <option value="happen"  selected>发生</option>
    <%} %>
    </select></td></tr>
    <tr><td>费用发生地：</td><td><select name="Cost_happened">
    <%if(Cost_happened.equals("beijing")){%>
   <option value="beijing" selected>北京</option>
    <option value="tianjin">天津</option>
    <option value="other">其他</option>
    <%} %>
     <%if(Cost_happened.equals("tianjin")){%>
    <option value="beijing">北京</option>
    <option value="tianjin" selected>天津</option>
    <option value="other">其他</option>
    <%} %>
     <%if(Cost_happened.equals("other")){%>
    <option value="beijing">北京</option>
    <option value="tianjin">天津</option>
    <option value="other" selected>其他</option>
    <%} %>
    </select></td></tr>
    <tr><td>费用项目名称：</td><td><input type="text" name="ProjectName" value="<%=ProjectName%>"></td></tr>
    <tr><td>金额：</td><td><input type="text" name="Money" value="<%=Money%>"></td></tr>
    <tr><td>备注：</td><td><input type="text" name="note" value="<%=note%>"></td></tr>
    <tr><td>费用发生日期：</td><td><input class="Wdate" type="text" name="Cost_date" id="d16" onfocus="WdatePicker({position:{right:100,bottom:50}})" value="<%=Cost_date%>"/></td></tr>
    </table>
    <div align="center">
   
    <input type="Submit" name="submit" value="提交">&nbsp;&nbsp;&nbsp;
    <a href="<%=path %>/cost/cost.jsp">返回</a>
    
    </div>
    </form>
  </body>
</html>
