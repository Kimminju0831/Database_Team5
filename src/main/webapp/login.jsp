<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login.jsp</title>
</head>
<body>

	<form method="post" action="loginAction.jsp">
		<h3>로그인</h3>
		
		<input type="text" placeholder="아이디" name="userID" maxlength="50">
		
		<br> 
		
		<input type="text" placeholder="비밀번호" name="userPassword" maxlength="50"> <br> 
			
		<br>
		
		<p>Type</p>
		<label><input type="checkbox" name="userType" value="basic">일반 사용자</label>
		<label><input type="checkbox" name="userType" value="donate">기부 단체</label>
		<label><input type="checkbox" name="userType" value="outsourcing">외주 업체</label>
		
		<br>
		
		<input type="submit" value="로그인">
			
		<a href = "join.jsp">회원가입</a>
		
	</form>

</body>

</html>