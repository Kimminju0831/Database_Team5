<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 변경</title>
</head>
<body>
	<h1>다른 사이트와 아이디가 같으시다구요?</h1>
	<h2>DㅓBㅔ풀기만의 특별한 아이디로 변경하세요!</h2>
	<form action="info_id_user.jsp" method=post>
	나의 아이디 : <input type="text" name="oldid"> 
	<br /> <br />
	새로운 아이디 : <input type="text" name="newid">
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