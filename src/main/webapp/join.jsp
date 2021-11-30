<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file ="static/header.jsp" %> 
	
<!DOCTYPE html>
<html>
<head>
<title>join.jsp</title>
</head>
<body>

<style>
		#input_text {
			width: 430px;
			height:60px;
			margin-left:30%;
		}
</style>
	
<div id = "body-wrapper">
   	<div id ="body-content">
	<div class="container">

		<form method="post" action="joinAction.jsp">
			<h3  style="font-size:40px; text-align: center;">회원가입</h3>

			<input id="input_text" type="text" placeholder="아이디" name="userID" maxlength="50">
			<br>
			</br>
			<input id="input_text" type="password" placeholder="비밀번호" name="userPassword" maxlength="50"> 
			<br>
			</br>
			<input id="input_text" type="text" placeholder="이름" name="userName" maxlength="50"> 
			<br>
			</br>
			<input id="input_text" type="text" placeholder="주소" name="userAddress" maxlength="50"> 
			<br>
			</br>
			<input id="input_text" type="text" placeholder="전화번호" name="userPhone" maxlength="50">
			<br>
			<br> 
			<div class="container2" style="width:700px">
			<input type="submit" value="회원가입" style="border:0; outline:0;" class ="btn btn-1"><p4></p4></a>
	
			</div>
		</form>
	</div>

<%@include file ="static/footer.jsp" %> 
	
	
	</div></div>


</body>
</html>