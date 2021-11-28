<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- import JDBC package -->
<%@ page import="user.UserDao"%>
<%@ page language="java" import="java.text.*, java.sql.*"%>

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
	} else {
		String userid = (String) session.getAttribute("userID");
		String usert = (String) session.getAttribute("userType");
		out.println(usert + " 회원 | " + userid + " 님 반갑습니다! <br>");
		out.println("<a href='logout.jsp'>로그아웃</a>");
	%>

	<br>
	<br>

	<a href='query_user.jsp'>사용자 관련 질의 페이지</a>
	<br>
	<a href='query_product.jsp'>상품 자체 관련 질의 페이지</a>
	<br>
	<a href='query_user.jsp'>기부 관련 질의 페이지</a>
	<br>
	<a href='query_user.jsp'>선물 관련 질의 페이지</a>
	<br>

	<%
	}
	%>
</body>
</html>