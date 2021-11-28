<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선물할 대상 조회</title>
</head>
<body>
	<h2> 선물하고자 하는 분의 아이디를 입력해주세요.</h2>
	<br/>
	<form method="post" action = "gift_Show_preference.jsp">
	선물 취향 조회 : <input type="text" name="recvid">
	
	<input type="reset" value="Reset"> 
	<input type="submit"value="Submit">
</body>
</html>