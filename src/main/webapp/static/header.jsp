<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language = "java" import="java.text.*, java.sql.*" %>
<%@page import="java.util.*" %>
<%@ page import="user.Gift"%> 
<%@ page language = "java" import = "java.text.*, java.sql.*" %>    
<%@ page import="user.*"%>
<link rel="stylesheet" href="static/layout.css">
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
<title>HelloMyPage</title>
</head>
<body>
<%
if (session.getAttribute("userID") == null) {
	out.println("<a href='login.jsp'>로그인</a>");
}else
{
	String userid = (String)session.getAttribute("userID");
	String usert = (String)session.getAttribute("userType");		

%>
	<header>
		<div id = "header-total">
			<div id="header-content">
				<div id="header-logo">
					<a href="Main.jsp"><img id="header-logo-img" src="static/logo_not_shadow.png"></a>
				</div>
				<div id="header-content1">
					<a id="header-text1"></a>
				</div>
				<div id="header-content2">
					<a id="header-text2"><%=usert %> 회원 - <%=userid %> 님 반갑습니다!</a>
				</div>
				<div id="header-content3">
					<a id="header-text3" href='logout.jsp'>로그아웃</a>
				</div>
			</div>
			<div id="header-banner">
				<div id="header-banner1">
					<a id="banner-donate" href = 'Donation_list.jsp'>기부</a>
				</div>
				<div id="header-banner2">
					<a id="banner-present" href = 'gift_Gives_presents_to.jsp'>선물</a>
				</div>
				<div id="header-banner3">
					<a id="banner-mypage" href = 'Mypage.jsp'>마이페이지</a>
				</div>
				<div id="header-banner4">
					<a id="banner-FAQ" href = 'select_query_menu.jsp'>FAQ</a>
				</div>
				<div id="header-banner5">
					<a id="banner-support" href = 'support.jsp'>지원페이지</a>
				</div>
			</div>
		</div>
<%
	}
%>		
	</header>