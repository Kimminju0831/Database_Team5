<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>join.jsp</title>
</head>
<body>

	<div class="container">

		<form method="post" action="joinAction.jsp">
			<h3 style="text-align: center;">회원가입</h3>

			<input type="text" placeholder="아이디" name="userID" maxlength="50">

			<input type="password" placeholder="비밀번호" name="userPassword" maxlength="50"> 
			<input type="text" placeholder="이름" name="userName" maxlength="50"> 
			<input type="text" placeholder="주소" name="userAddress" maxlength="50"> 
			<input type="text" placeholder="전화번호" name="userPhone" maxlength="50">
			<input type="submit" value="회원가입">

		</form>
	</div>




</body>
</html>