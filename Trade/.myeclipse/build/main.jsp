<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
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
  
  <center>
<table border="0" width="72%" height="297">
  <tr>
    <td width="20%" height="47" align="center"><img src="Pic/sbjb-01.jpg" width="50" height="40" border="0" name="Image20">
    </td>
    <td width="20%" height="47" align="center"><img src="Pic/sblb-01.jpg" width="50" height="42" border="0" name="Image10">
    </td>
    <td width="20%" height="47" align="center"><img src="Pic/jldw-01.jpg" width="50" height="37" border="0" name="Image9">
    </td>
    <td width="20%" height="47" align="center"><img src="Pic/sbpm-01.jpg" width="50" height="45" border="0" name="Image12">
    </td>
  </tr>
  <tr>
    <td width="20%" height="15" align="center"><a href="pc/pc.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image20','','Pic/sbjb-02.jpg',1)">
      <font size="2">PC信息</font></a> 
    </td>
    <td width="20%" height="15" align="center"><a href="jcsz/jldw.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image9','','Pic/jldw-02.jpg',1)"><font size="2">合作公司信息</font></a> 
    </td>
    <td width="20%" height="15" align="center"><a href="jcsz/sptype.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image10','','Pic/sblb-02.jpg',1)"><font size="2">商品类别</font></a> 
    </td>
    <td width="20%" height="15" align="center"><a href="jcsz/sptype.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image11','','Pic/sbpp-02.jpg',1)"><font size="2">商品品牌</font></a> 
    </td>
  </tr>
  <tr>
    <td width="20%" height="44" align="center"><img src="Pic/sbpp-01.jpg" width="50" height="40" border="0" name="Image11">
    </td>
    <td width="20%" height="44" align="center"><img src="Pic/sskf-01.jpg" width="44" height="40" border="0" name="Image14">
    </td>
    <td width="20%" height="44" align="center"><img src="Pic/bm-01.jpg" width="40" height="42" border="0" name="Image16">
    </td>
    <td width="20%" height="44" align="center"><img src="Pic/mx-01.jpg" width="50" height="40" border="0" name="Image15">
    </td>
  </tr>
  <tr>
    <td width="20%" height="15" align="center"><a href="jcsz/ghsj.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image13','','Pic/ghsj-02.jpg',1)"><font size="2">供货商家</font></a> 
    </td>
    <td width="20%" height="15" align="center"><a href="jcsz/khxx.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image14','','Pic/sskf-02.jpg',1)"><font size="2">客户信息</font></a> 
    </td>
    <td width="20%" height="15" align="center"><a href="jcsz/qyxx.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image15','','Pic/mx-02.jpg',1)"><font size="2">企业信息</font></a> 
    </td>
    <td width="20%" height="15" align="center"><a href="jcsz/ckxx.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image16','','Pic/bm-02.jpg',1)"><font size="2">部门信息</font></a> 
    </td>
  </tr>
  <tr>
    <td width="20%" height="49" align="center"><img src="Pic/ssry-01.jpg" width="50" height="35" border="0" name="Image18">
    </td>
    <td width="20%" height="49" align="center"><img src="Pic/dq-01.jpg" width="50" height="47" border="0" name="Image19">
    </td>
    <td width="20%" height="49" align="center"><img src="Pic/fysz-01.jpg" width="32" height="40" border="0" name="Image21">
    </td>
    <td width="20%" height="49" align="center"><img src="Pic/sbzs-01.jpg" width="50" height="41" border="0" name="Image1">
    </td>
  </tr>
  <tr>
    <td width="20%" height="15" align="center"><a href="jcsz/khxx.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image18','','Pic/ssry-02.jpg',1)"><font size="2">企业职员</font></a> 
    </td>
    <td width="20%" height="15" align="center"><a href="jcsz/khxx.jsp1" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image19','','Pic/dq-02.jpg',1)"><font size="2">地区信息</font></a> 
    </td>
    <td width="20%" height="15" align="center"><a href="jcsz/khxx.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image21','','Pic/fysz-02.jpg',1)"><font size="2">款项设置</font></a> 
    </td>
    <td width="20%" height="15" align="center"><a href="jcsz/khxx.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','Pic/sbzs-02.jpg',1)"><font size="2">工程项目</font></a>
    </td>
  </tr>
  <tr>
    <td width="20%" height="45" align="center">　<img src="Pic/ghsj-01.jpg" width="42" height="41" border="0" name="Image13">
    </td>
    <td width="20%" height="45" align="center">　<img src="Pic/sfk-01.jpg" width="50" height="38" border="0" name="Image17">
    </td>
    <td width="20%" height="45" align="center">　</td>
    <td width="20%" height="45" align="center">　</td>
  </tr>
  <tr>
    <td width="20%" height="13" align="center"><a href="jcsz/khxx.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image12','','Pic/sbpm-02.jpg',1)"><font size="2">商品品名</font></a> 
    </td>
    <td width="20%" height="13" align="center"><a href="jcsz/khxx.jsp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image17','','Pic/sfk-02.jpg',1)"><font size="2">收付方式</font></a> 
    </td>
    <td width="20%" height="13" align="center"></td>
    <td width="20%" height="13" align="center"></td>
  </tr>
  <tr>
    <td width="20%" height="18"></td>
    <td width="20%" height="18"></td>
    <td width="20%" height="18"></td>
    <td width="20%" height="18"></td>
  </tr>
</table></center>
    
    
  </body>
</html>
