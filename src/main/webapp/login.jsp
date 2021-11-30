<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file ="static/header.jsp" %> 
<div id = "body-wrapper">
	
	<style>
		#input_text {
			width: 430px;
			height:60px;
			
		}
		
		#input_radio {
			height:60px;
		}
	</style>
   	<div id ="body-content">
	<form method="post" action="loginAction.jsp">
		
		<h3 style="margin-left:47%; font-size:40px;">로그인</h3>
		
		<input id="input_text" type="text" placeholder="아이디" name="userID" maxlength="50" style="margin-left:30%;">
		
		<br> 
		<br> 
		<input id="input_text" type="password" placeholder="비밀번호" name="userPassword" maxlength="50" style="margin-left:30%;"> <br> 
			
		<br>
		<br> 		
		<input id="input_radio" type="radio" name="userType" value="basic" checked="checked" style="margin-left:35%;">일반 사용자
		<input id="input_radio" type="radio" name="userType" value="donate" style="margin-left:50px;">기부 단체
		<input id="input_radio" type="radio" name="userType" value="outsourcing" style="margin-left:50px;">외주 업체
		
		<br>
		<br> 
		<div class="container2" style="width:700px">
		<input type="submit" value="로그인" style="border:0; outline:0;" class ="btn btn-1"><p4></p4></a>
		<a class ="btn btn-1" href='join.jsp'><p4>회원 가입</p4></a>

		</div>
		
	</form>
	
	
	
	</div>	
	
	<%@include file ="static/footer.jsp" %> </div>