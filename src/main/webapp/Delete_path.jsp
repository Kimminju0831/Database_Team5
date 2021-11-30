<%@page import="user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@ page language = "java" import = "java.text.*, java.sql.*" %>    
<%@include file ="static/header.jsp" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 페이지</title>
</head>
<body>
<div id = "body-wrapper">
   	<div id ="body-content">
	<p>Delete Site - 탈퇴 페이지</p>
	<br>
	
<%
	String userid = "";
	String Password = request.getParameter("D_password");
	userid = (String)session.getAttribute("userID");

	if(userid.compareTo("admin")==0){
	
		%>
		
		<form action="./Delete.jsp" method="post">
	  		<b>삭제할 유저 ID 를 입력해주세요.</b>
	  		<input type="text" name = "request_user">
			<br><br> 
			<b>삭제를 위해 관리자 PW 를 입력해주세요. </b>
			<input type="text" name="D_password"><br>
			<a><input type="reset" value="Reset"><input type="submit" value="Submit"></a>
		</form>
		<%
		
		
	}else{
		
		%>
		<form action="./Delete.jsp" method="post">
	  		<a><b>탈퇴 절차를 위해 비밀번호를 입력해주세요.</b>
			<br><br> 현재 비밀번호  <input type="text" name="D_password"><br></a>
			<a><br><br><input type="reset" value="Reset"><input type="submit" value="Submit"></a>
		</form>
		<%
	}
%>
		
		<%@include file ="static/footer.jsp" %> 
		
	</div>
	</div>
</body>
</html>