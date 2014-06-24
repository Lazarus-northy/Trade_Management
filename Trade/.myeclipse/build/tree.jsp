<%@ page language="java" import="java.util.*"   pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
	<title>Destroydrop &raquo; Javascripts &raquo; Tree</title>

	<link rel="StyleSheet" href="dtree/dtree.css" type="text/css" />
	<script type="text/javascript" src="dtree/dtree.js"></script>

</head>

<body style="background-color:#0094DD">

<!--<h1><a href="/">Destroydrop</a> &raquo; <a href="/javascripts/">Javascripts</a> &raquo; <a href="/javascripts/tree/">Tree</a></h1>

<h2>Example</h2>!-->

<div class="dtree" >
<h3>
	<!--<p><a href="javascript: d.openAll();">open all</a> | <a href="javascript: d.closeAll();">close all</a></p>!-->

	<script type="text/javascript">
		<!--

		d = new dTree('d');

		d.add(0,-1,'北京汇腾德国际贸易有限公司','','北京汇腾德国际贸易有限公司');
		d.add(1,0,'首页','time/alert_index.jsp','','content');
		d.add(2,0,'合同管理','','','content');
		d.add(3,0,'运输管理','','','content');
		d.add(4,0,'费用管理','','','content');
		d.add(5,0,'查询管理','');
		
		d.add(7,2,'合作公司基本信息','company/company.jsp','','content');
		d.add(8,2,'合同查看','contract/contract.jsp','Pictures of Gullfoss and Geysir','content');
		d.add(9,2,'合同录入','contract/newcontract.jsp','Pictures I\'ve taken over the years','content','','img/imgfolder.gif');
		d.add(10,2,'货品详细信息录入','','','content','');
		d.add(11,3,'运输公司基本信息','','','content');
		d.add(13,3,'运单录入','','','content');
		d.add(12,3,'运单查看','','','content');
		d.add(14,3,'运单修改','','','content');
		d.add(15,4,'费用查看','','','content');
		d.add(16,4,'新增费用','','','content');
		d.add(17,4,'费用修改','','','content');
		d.add(18,4,'费用统计','','','content');
		d.add(19,5,'时间查询','','','content');
		d.add(20,5,'合同查询','find/contract_finder.jsp','','content');
		d.add(21,5,'费用查询','','','content');
		d.add(22,5,'运输查询','','','content');

		document.write(d);

		//-->
	</script>
</h3>
</div>

<!-- <p><a href="mailto&#58;drop&#64;destroydrop&#46;com">&copy;2002-2003 Geir Landr&ouml;</a></p> -->

</body>

</html>
