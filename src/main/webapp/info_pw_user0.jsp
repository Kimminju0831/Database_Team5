<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@include file ="static/header.jsp" %> 
<link rel="stylesheet" href="static/main.css">
<div id = "body-wrapper">
      <div id ="body-content">
	<h2>안전한 비밀번호로 내 정보를 보호하세요!</h2>
	<form action="info_pw_user.jsp" method=post>
	나의 아이디 : <input type="text" name="myid"> 
	<br /> <br />
	현재 비밀번호 : <input type="text" name="oldpw"> 
	<br /> <br />
	새 비밀번호 : <input type="text" name="newpw">
	<br /> <br />
	새 비밀번호 확인 : <input type="text" name="renewpw">
	<input type="reset" value="Reset"> 
	<input type="submit"value="Submit">
	<br /> <br />
	<a href = 'Main.jsp'>메인 페이지</a>
	<a href = 'Mypage.jsp'>정보 수정 페이지</a>
   </div>
   
   <%@include file ="static/footer.jsp" %>
</div>