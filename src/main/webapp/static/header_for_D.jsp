<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language = "java" import="java.text.*, java.sql.*" %>
<%@page import="java.util.*" %>
<%@ page import="user.Gift"%> 
<%@ page language = "java" import = "java.text.*, java.sql.*" %>    
<%@ page import="user.*"%>
<link rel="stylesheet" href="../static/button.css">
<link rel="stylesheet" href="../static/layout.css">
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
<%
if (session.getAttribute("userID") == null) {
	%>
	<header>
		<div id = "header-total">
			<div id="header-content">
				<div id="header-logo" style="width: 100%; margin-left:0px;">
					<a href="Main.jsp"><img id="hello-img" src="../static/logo_not_shadow.png" style="margin-top:10px;"></a>
				</div>
				<div id="header-content1" style="margin-left:80%; margin-top: 80px;">
					<a id="header-login" style="margin-right:20px;" href = '../login.jsp'>로그인</a>
				</div>
				<div id="header-content2" style="margin-left:0; float:right; width: 100px; margin-top: 80px;">
					<a id="header-join" href = '../join.jsp'>회원가입</a>
				</div>
			</div>
		</div>
<% 
	}else
{
	String userid = (String)session.getAttribute("userID");
	String usert = (String)session.getAttribute("userType");		

	if(usert.equals("basic")){
		%>
			<header>
				<div id = "header-total">
					<div id="header-content">
						<div id="header-logo">
							<a href="Main.jsp"><img id="header-logo-img" src="../static/logo_not_shadow.png"></a>
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
							<a id="banner-donate" href = '../Donation_list.jsp'>기부</a>
						</div>
						<div id="header-banner2">
							<a id="banner-present" href = '../gift_Gives_presents_to.jsp'>선물</a>
						</div>
						<div id="header-banner3">
							<a id="banner-mypage" href = '../Mypage.jsp'>마이페이지</a>
						</div>
						<div id="header-banner4">
							<a id="banner-FAQ" href = '../select_query_menu.jsp'>FAQ</a>
						</div>
						<div id="header-banner5">
							<a id="banner-support" href = '../support.jsp'>지원페이지</a>
						</div>
					</div>
				</div>
		<%
	}else if (usert.equals("donate")){
		%>
		<header>
			<div id = "header-total">
				<div id="header-content">
					<div id="header-logo">
						<a href="Main.jsp"><img id="header-logo-img" src="../static/logo_not_shadow.png"></a>
					</div>
					<div id="header-content1">
						<a id="header-text1"></a>
					</div>
					<div id="header-content2">
						<a id="header-text2"><%=usert %> 회원 - <%=userid %> 님 반갑습니다!</a>
					</div>
					<div id="header-content3">
						<a id="header-text3" href='../logout.jsp'>로그아웃</a>
					</div>
				</div>
				<div id="header-banner">
					<div id="header-banner1" style="margin-left:15%;">
						<a id="banner-donate" href = '../Donation_list.jsp'>기부</a>
					</div>
					<div id="header-banner2"  style="margin-left:3%">
						<a id="banner-present" href = '../Duser/Donate_order.jsp'>주문</a>
					</div>
					<div id="header-banner3"  style="margin-left:4%">
						<a id="banner-mypage" href = '../Mypage.jsp'>마이페이지</a>
					</div>
					<div id="header-banner4" style="margin-left:3%">
						<a id="banner-cont" href = 'people.jsp'>참여자페이지</a>
					</div>
					<div id="header-banner5"  style="margin-left:12%">
						<a id="banner-support" href = '../support.jsp'>지원페이지</a>
					</div>
					<div id="header-banner6"  style="margin-left:3%">
						<a id="banner-FAQ" href = '../select_query_menu.jsp'>FAQ</a>
					</div>
				</div>
			</div>
	<%
		
	}
	else if(usert.equals("outsourcing")){
		%>
		<header>
			<div id = "header-total">
				<div id="header-content">
					<div id="header-logo">
						<a href="../Main.jsp"><img id="header-logo-img" src="../static/logo_not_shadow.png"></a>
					</div>
					<div id="header-content1">
						<a id="header-text1"></a>
					</div>
					<div id="header-content2">
						<a id="header-text2"><%=usert %> 회원 - <%=userid %> 님 반갑습니다!</a>
					</div>
					<div id="header-content3">
						<a id="header-text3" href='../logout.jsp'>로그아웃</a>
					</div>
				</div>
				<div id="header-banner">
					<div id="header-banner1">
						<a id="banner-donate" href = 'out_list.jsp'>등록</a>
					</div>
					<div id="header-banner2">
						<a id="banner-present" href = '../Ouser/order_list.jsp'>의뢰</a>
					</div>
					<div id="header-banner3">
						<a id="banner-mypage" href = '../Mypage.jsp'>마이페이지</a>
					</div>
					<div id="header-banner4">
						<a id="banner-FAQ" href = '../select_query_menu.jsp'>FAQ</a>
					</div>
					<div id="header-banner5">
						<a id="banner-support" href = '../support.jsp'>지원페이지</a>
					</div>
				</div>
			</div>
	<%	
		
		
	}

	}
%>		
	</header>

</head>
<body>


