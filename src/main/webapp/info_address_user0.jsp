<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 주소 변경</title>
</head>
<body>
	<h2>사용자님의 새로운 주소를 입력해주세요.</h2>
	<form action="info_address_user.jsp" method=post>
	나의 아이디 : <input type="text" name="myid">
	<br /> <br />
	새로운 주소 : <input type="text" name="newaddr"> 
	<br /> <br />
	비밀번호 확인 : <input type="text" name="pw">
	<input type="reset" value="Reset"> 
	<input type="submit"value="Submit">
	<br /> <br />
	<br /> <br />
	<br /> <br />
	<a href = 'Main.jsp'>메인 페이지</a>
	<br>
</body>
</html>