<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- import JDBC package -->
<%@ page import="user.UserDao"%>
<%@ page language = "java" import = "java.text.*, java.sql.*" %>   

<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
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
	out.println(userid+" 님 반갑습니다! <br>");
	out.println("<a href='logout.jsp'>로그아웃</a>");
	
%>

	<a href = 'Delete.html'>회원 탈퇴 페이지</a>
	<a href = 'Mypage.jsp'>마이 페이지</a>
	<a href = 'prefer.jsp'>취향 페이지</a>
	<a href = 'support.html'>지원 페이지</a>
	
<% 
}
%>
</body>
</html>