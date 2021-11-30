<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@ page import="user.UserDao"%>
<%@ page import="user.DAO"%>
<%@ page import="user.Select"%>
<%@ page import="user.DonateDTO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>

<%@ page language = "java" import = "java.text.*, java.sql.*" %>   

<!-- import JDBC package -->
<%@include file ="static/header.jsp" %> 
<link rel="stylesheet" href="static/main.css">
<div id = "body-wrapper">
      <div id ="body-content">
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
		out.println("<br>");
		out.println("<a href='info_id_user0.jsp'>아이디 변경</a>");
		out.println("<br>");
		out.println("<a href='info_pw_user0.jsp'>비밀번호 변경</a>");
		out.println("<br>");
		out.println("<a href='info_name_user0.jsp'>이름 변경</a>");
		out.println("<br>");
		out.println("<a href='info_phone_user0.jsp'>전화번호 변경</a>");
		out.println("<br>");
		out.println("<a href='info_address_user0.jsp'>주소 변경</a>");
		
		out.println("<br>");out.println("<br>");
		out.println("<a href='info_gi_user0.jsp'>선물 취향 변경</a>");
		out.println("<br>");
		out.println("<a href='info_do_user0.jsp'>기부 취향 변경</a>");
		
	}
	
	
%>
	<a href = 'Main.jsp'>메인 페이지</a>
	<br>
   </div>
   
   <%@include file ="static/footer.jsp" %>
</div>