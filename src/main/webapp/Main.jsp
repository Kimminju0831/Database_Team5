<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- import JDBC package -->
<%@ page import="user.UserDao"%>
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
<title>Insert title here</title>
</head>
<body>
<%
if (session.getAttribute("userID") == null) {
	out.println("<a href='login.jsp'>로그인</a>");
}else
{
	String userid = (String)session.getAttribute("userID");
	String usert = (String)session.getAttribute("userType");
	out.println(usert + " 회원 | " + userid+" 님 반갑습니다! <br>");
	out.println("<a href='logout.jsp'>로그아웃</a>");
	
%>

	<a href = 'Delete_path.jsp'>회원 탈퇴 페이지</a>
	<br>
	<a href = 'Mypage.jsp'>마이 페이지</a>
	<br>
	<a href = 'prefer.jsp'>취향 페이지</a>
	<br>
	<a href = 'support.html'>지원 페이지</a>
	<br>
	<a href = 'Donation_list.jsp'>기부 목록 페이지</a>
<% 
}
%>
</body>
</html>