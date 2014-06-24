<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<script src="../js/jquery-1.4.3.js"></script>
	<script>
		

		var txtNickName=false;
		var txtPassword=false;
		var txtRepeatPass = false;
	
					
			$(function(){
				$('#txtNickName').blur(function(){
					var nickname= $('#txtNickName').val();
					var pattern=/^[\u4e00-\u9fa5a-zA-z0-9]{4,20}$/;
					if(!pattern.test(nickname)){
						$('#name\\.info').html("<img src='../img/wrong.gif'/>用户名不可用!");
						txtNickName=false;
						
					}else{
						$('#name\\.info').html("<img src='../img/right.gif'/>用户名可用!");
						txtNickName=true;
					}
				
				});
			});
			$(function(){
				$('#txtPassword').blur(function(){
					var password = $('#txtPassword').val();
					var pattern=/\b([a-zA-z0-9]{6,20}$)\b/;
					if(!pattern.test(password)){
						$('#password\\.info').html("<img src='../img/wrong.gif'/>格式不正确!");
						txtPassword = false;
					}else{
						$('#password\\.info').html("<img src='../img/right.gif'/>格式正确!");
						txtPassword=true;
					}
				});
			});
			$(function(){
				$('#txtRepeatPass').blur(function(){
					var RepeatPass = $('#txtRepeatPass').val();
					var password = $('#txtPassword').val();
					if(RepeatPass!=password||RepeatPass==""){
						$('#password1\\.info').html("<img src='../img/wrong.gif'/>两次密码不一致!");
						txtRepeatPass = false;
					}else{
						$('#password1\\.info').html("<img src='../img/right.gif'/>输入正确!");
						txtRepeatPass = true;
					}
				});
			});
			
			$(function(){
				$('#f').submit(function(){
				var flag = false;
				flag = txtVerifyCode&&emailvali&&txtNickName&&txtPassword&&txtRepeatPass;
				$('#form_error_msg').html('<font style="color:red">(表单填写错误)</font>');
					return flag;
				});
			
			});
			
		</script>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Regesiter</title>
	</head>
	<body>
		<div align="center">
			<h1 align="center"> 
				新增用户 
			</h1>
		</div>

		<div class="fill_message">
			<form action="<%=path%>/RegisterServlet" method="post">
				<div align="center">
					<table align="center" border="2" cellpadding="10">


						<tr>
							<td align="right" valign="top">
								用户名：
							</td>
							<td valign="top" align="left">
								<input type="text" name="username" size=20 id="txtNickName">
								<div class="text_left" id="nickNameValidMsg">
									<p>
										您的昵称可以由小写英文字母、中文、数字组成，
									</p>
									<p>
										长度4－20个字符，一个汉字为两个字符。
									</p>
									<span id="name.info" style="color: red"></span>
								</div>
							</td>
						</tr>
						<tr>
							<td align="right" valign="top">
								密&nbsp;&nbsp;码：
							</td>
							<td valign="middle" align="left">
								<input type="password" name="password" size=20 id="txtPassword">
								<div class="text_left" id="passwordValidMsg">
									<p>
										您的密码可以由大小写英文字母、数字组成，长度6－20位。
									</p>
									<span id="password.info" style="color: red"></span>
								</div>
							</td>
						</tr>
						<tr>
							<td align="right" valign="top">
								再次输入密码：
							</td>
							<td valign="top" align="left">
								<input type="password" name="repassword" size=20
									id="txtRepeatPass">
								<div class="text_left" id="repeatPassValidMsg">
									<span id="password1.info" style="color: red"></span>
								</div>
							</td>
						</tr>
						<tr>
							<td align="right" valign="top">
								权&nbsp;&nbsp;限：
							</td>
							<td valign="top" align="left">
								<input type="radio" value="admin" name="role">
								admin&nbsp;
								<input type="radio" value="user" name="role" checked="checked">
								user
							</td>
						</tr>
						<tr>
							<td align="center">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="submit" name="submit" size=40 value="注册">
							</td>
							<td align="left" width="600">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="reset" name="Reset" value="重置">
							</td>

						</tr>
					</table>
				</div>
			</form>
			<div align="center">
				<a href="user.jsp">返回用户页面</a>
			</div>
	</body>
</html>