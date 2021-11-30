<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@include file ="static/header.jsp" %> 
<link rel="stylesheet" href="static/main.css">
<div id = "body-wrapper">
      <div id ="body-content">
	<h2>사용자님의 새로운 이름을 입력해주세요.</h2>
	<form action="info_name_user.jsp" method=post>
	나의 아이디 : <input type="text" name="myid">
	<br /> <br />
	새로운 이름 : <input type="text" name="newname"> 
	<br /> <br />
	비밀번호 확인 : <input type="text" name="pw">
	<input type="reset" value="Reset"> 
	<input type="submit"value="Submit">
	<br /> <br />
	<br /> <br />
	<br /> <br />
	<a href = 'Main.jsp'>메인 페이지</a>
   </div>
   
   <%@include file ="static/footer.jsp" %>
</div>