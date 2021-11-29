<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- import JDBC package -->
<%@ page import="user.UserDao"%>
<%@ page import="user.DAO"%>
<%@ page import="user.Select"%>
<%@ page import="user.DonateDTO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>

<%@ page language = "java" import = "java.text.*, java.sql.*" %>   

<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userAddress" />
<jsp:setProperty name="user" property="userPhone" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 정보 수정</title>
</head>
<body>
<%
	
	String userid = ""; 
	if (session.getAttribute("userID") == null) {
		out.println("<a href='login.jsp'>로그인</a>");
	}else
	{
		userid = (String)session.getAttribute("userID");
		String usert = (String)session.getAttribute("userType");
		out.println(usert + " 회원 | " + userid+" 님 반갑습니다! <br>");
		out.println("<a href='logout.jsp'>로그아웃</a>");
		
		out.println("<a href='info_id_user.html'>아이디 변경</a>");
		out.println("<br>");
		out.println("<a href='info_pw_user.html'>비밀번호 변경</a>");
		out.println("<br>");
		out.println("<a href='info_name_user.html'>이름 변경</a>");
		out.println("<br>");
		out.println("<a href='info_phone_user.html'>전화번호 변경</a>");
		out.println("<br>");
		out.println("<a href='info_address_user.html'>주소 변경</a>");
		out.println("<br>");
		
	}
	
	
%>
	<a href = 'Main.jsp'>메인 페이지</a>
	<br>

</body>
</html>