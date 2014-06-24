<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/css.css">
	

  </head>
  
  <body>
    <div id="cotainer"><!-- 页面层容器 -->
        <div id="Header"><!-- 页面头部 -->
        <div id="menu">
        <ul>
           <li><a href="#">首页</a></li>
           <li class="menuDiv"></li>   <!-- 便于插入一些分割样式 -->
           <li><a href="#">博客</a></li>
           <li class="menuDiv"></li>
           <li><a href="#">设计</a></li>
           <li class="menuDiv"></li>
           <li><a href="#">相册</a></li>
           <li class="menuDiv"></li>
           <li><a href="#">论坛</a></li>
           <li class="menuDiv"></li>
           <li><a href="#">关于</a></li>
           <li class="menuDiv"></li>
        </ul>
        </div>
        <div id="banner"></div>
        </div>
        <div id="PageBody"><!-- 页面主体 -->
            <div id="Sidebar"><iframe id="left" width="200" height="1000" src="tree.jsp" scrolling="no" frameborder="1"></iframe> <!-- 侧边栏 --></div>
            <div id="MainBody"><iframe name="content1" width="800" height="1000" src="main.jsp" scrolling="no" frameborder="1"><!-- 主体内容 --></div>
        </div>
        <div id="Footer"><a href="mailto&#58;drop&#64;destroydrop&#46;com">&copy;2002-2003 Geir Landr&ouml;</a><!-- 页面底部 --></div>
    </div>
    
  </body>
</html>
