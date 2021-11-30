<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file ="static/header.jsp" %> 
<div id = "body-wrapper">
   	<div id ="body-content">
	<form method="post" action="loginAction.jsp">
		
		<h3>로그인</h3>
		
		<input type="text" placeholder="아이디" name="userID" maxlength="50">
		
		<br> 
		
		<input type="password" placeholder="비밀번호" name="userPassword" maxlength="50"> <br> 
			
		<br>
				
		<input type="radio" name="userType" value="basic" checked="checked">일반 사용자
		<input type="radio" name="userType" value="donate">기부 단체
		<input type="radio" name="userType" value="outsourcing">외주 업체
		
		<br>
		
		<input type="submit" value="로그인">
			
		<a href = "join.jsp">회원가입</a>
		
		
	</form>
	
	
	
	</div>	
	
	<%@include file ="static/footer.jsp" %> </div>