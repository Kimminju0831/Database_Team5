<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 이름 변경</title>
</head>
<body>
	<h2>사용자님의 새로운 전화번호을 입력해주세요.</h2>
	<form action="info_phone_user.jsp" method=post>
	나의 아이디 : <input type="text" name="myid">
	<br /> <br />
	새로운 전화번호 : <input type="text" name="newphone"> 
	<br /> <br />
	비밀번호 확인 : <input type="text" name="pw">
	<input type="reset" value="Reset"> 
	<input type="submit"value="Submit">
	<br /> <br />
	<br /> <br />
	<br /> <br />
	<a href = 'Main.jsp'>메인 페이지</a>
</body>
</html>