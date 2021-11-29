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
	<header>
		<div id="header-content">
			<div id="header-logo">
				<img id="header-logo-img" src="static/logo.png">
			</div>
			<div id="header-content1">
				<a id="header-text1">헤더입니동</a>
			</div>
			<div id="header-content2">
				<a id="header-text2">정보를 쓸겁니동</a>
			</div>
			<div id="header-content3">
				<a id="header-text3">로그아웃</a>
			</div>
		</div>
		<div id="header-banner">
			<div id="header-banner1">
				<a id="banner-donate">기부</a>
			</div>
			<div id="header-banner2">
				<a id="banner-present">선물</a>
			</div>
			<div id="header-banner3">
				<a id="banner-mypage">마이페이지</a>
			</div>
			<div id="header-banner4">
				<a id="banner-FAQ">FAQ</a>
			</div>
			<div id="header-banner5">
				<a id="banner-support">지원페이지</a>
			</div>
		</div>
		
	</header>