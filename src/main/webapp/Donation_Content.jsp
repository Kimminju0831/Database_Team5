<%@page import="user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@ page language = "java" import = "java.text.*, java.sql.*" %>    
<%@ page import = "java.util.List" %>
<%@ page import = "user.DAO" %>
<%@ page import = "user.UserDao" %>
<%@ page import = "user.ExBoardDTO" %>
<!DOCTYPE html5>
<%
	

	String userid = (String)session.getAttribute("userID");
	
	String org_id = request.getParameter("org_id");
	String no = request.getParameter("no");
	String period = request.getParameter("period");
	String benefit = request.getParameter("benefit");
	String name = request.getParameter("name");
	
	System.out.println(org_id+ no+ period);
	
	UserDao manager = new UserDao();
	
	manager.donate(org_id, userid, name);
	

%>

<html>

<head>
<meta charset="EUC-KR">
<title>Donation Fund page</title>
</head>

<body>
		<script>
			alert('더 베풀어 주셔서 감사합니다!')
			history.back()
		</script>
		
</body>
</html>