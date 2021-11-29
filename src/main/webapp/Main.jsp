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
<meta charset="utf-8">
<link href="./style.css" rel="stylesheet">
</head>
<body>
<%

if (session.getAttribute("userID") == null) {
	out.println("<p1><a href='login.jsp'>로그인</a></p1>");
}else
{
	String userid = (String)session.getAttribute("userID");
	String usert = (String)session.getAttribute("userType");
	out.println("<p1>"+usert + " 회원 | " + userid+" 님 반갑습니다! <br></p1>");
	out.println("<p1><a href='logout.jsp'>로그아웃</a></p1>");
	
	
%>
<p>
	<a href = 'Delete_path.jsp'>회원 탈퇴 페이지</a>
	<br>
	<a href = 'Mypage.jsp'>마이 페이지</a>
	<br>
	<a href = 'prefer.jsp'>취향 페이지</a>
	<br>
	<a href = 'support.html'>지원 페이지</a>
	<br>
	<a href = 'Donation_list.jsp'>기부 목록 페이지</a>

	<br>
	<a href = 'Duser/write.jsp'>기부 추가 페이지</a>
	<br>
	<a href = 'select_query_menu.jsp'>질의 메뉴 페이지</a>
</p>
<% 
	if(usert.equals("donate")){
%>
<b>
	<br>
	<a href = 'Duser/Donate_order.jsp'>기부 혜택 주문 페이지</a>
	<br>
	<a href = 'Duser/people.jsp'>기부 참여자 조회 페이지</a>
</b>
<%		
	}else if(usert.equals("outsourcing")){
%>
<b>
	<br>
	<a href = 'Ouser/order_list.jsp'>주문 페이지</a>
</b>
<%		
	}
}


%>
</body>
</html>