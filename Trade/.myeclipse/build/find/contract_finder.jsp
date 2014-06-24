<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" import="JavaBean.Contract.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

  <head>
   <script src="<%=path %>/js/jquery-1.11.1.min.js"></script>
    <base href="<%=basePath%>">
    
    <title>My JSP 'contract_finder.jsp' starting page</title>
   
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<div>
</div>
<form id = "searchForm">
<input type = "text" name = "Contract_id" placeholder = "请输入关键字"/> 
<button type ="submit">提交</button><br />
<input type = "radio" name = "selectName" value = "mohu" checked="checked"/> 模糊查询
<input type = "radio" name = "selectName" value="jingque"/>精确查询
</form>
<div id = "result">

<!-- 服务器返回的内容将在此处显示!服务器返回的内容中不应该再含有html和body标签.-->
</div>

<!-- 最好把脚本写到body的最下端 -->
<script>
//------------通过设置下面几个变量的值进行自定义.--------------
// 查询提交地址
var targetUrl = "contract_jingque_find";

// 内容id.应该把返回的内容放到哪个div中显示.
var idOfContent = "result";

// 按哪个按钮的时候,向服务器请求数据.
var idOfSearchForm = "searchForm";

// 表单数据提交方式,GET 或者 POST
var methodOfFormSubmit = "POST";

// -------------------封装的一个函数-----------------------
// 在表单出发submit表单提交事件时,通过ajax技术向服务器请求数据.
$("#"+idOfSearchForm).submit(function(event){

	// 表单各项的数据.
	var fields = $( this ).serializeArray();

	// ajax向服务器请求数据.
	$.ajax({
		type:methodOfFormSubmit,
		url: targetUrl,
		data: fields,
		success: function( data ){
			$("#"+idOfContent).html( data );},
		dataType: "html",
		cache:false
		});
	// 阻止表单默认的提交行为
	event.preventDefault();
  });
</script>
</body>
</html>
