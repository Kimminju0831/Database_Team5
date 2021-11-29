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
	// 로그인 할 때 아이디 입력, 패스워드 미입력 , 타입 입력 >> 로그인액션에 멈춤
	// 로그인 할 때 아이디 입력, 패스워드 입력, 타입 미입력 >> Main 에러
	if (session.getAttribute("userID") == null) {
		out.println("<a href='login.jsp'>로그인</a>");
	} else {
		String userid = (String) session.getAttribute("userID");
		String usert = "null";
		usert= (String) session.getAttribute("userType");

	out.println(usert + " 회원 | " + userid + " 님 반갑습니다! <br>");
	out.println("<a href='logout.jsp'>로그아웃</a>");
	%>

	<a href='Delete_path.jsp'>회원 탈퇴 페이지</a>
	<br>
	<a href='Mypage.jsp'>마이 페이지</a>
	<br>
	<a href='support.html'>지원 페이지</a>
	<br>
	<a href='select_query_menu.jsp'>질의 메뉴 페이지</a>

	<%
	if (usert.equals("donate")) {
	%>
	<br>
	<a href='Duser/people.jsp'>기부 참여자 조회 페이지</a>
	<br>
	<a href='Donation_list.jsp'>기부 목록 페이지</a>
	<%
	} else if (usert.equals("outsourcing")) {
	%>
	<br>
	<a href='Ouser/order_list.jsp'>주문 페이지</a>
	<br>
	<a href='Duser/out_list.jsp'>외주 업체 조회 페이지</a>
	<%
	} else {
	%>
	<br>
	<a href='prefer.jsp'>취향 페이지</a>
	<br>
	<a href='Donation_list.jsp'>기부 목록 페이지</a>
	<%
	}
	}
	%>

</body>
</html>