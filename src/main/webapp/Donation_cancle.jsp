<%@page import="user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@ page language = "java" import = "java.text.*, java.sql.*" %>    
<%@ page import = "java.util.List" %>
<%@ page import = "user.Delete" %>
<%@ page import = "user.UserDao" %>
<%@ page import = "user.ExBoardDTO" %>
<!DOCTYPE html5>
<%
	

	String userid = (String)session.getAttribute("userID");	//현재 유저 아이디 가져오기
	
	String orgid = request.getParameter("orgid");	//기부단체 아이디 가져오기

	
	System.out.println(userid + orgid);
	
	Delete manager = Delete.getInstance();
	
	int result = manager.donate_delete(orgid, userid);
	
	
%>

<html>

<head>
<meta charset="EUC-KR">
<title>Donation Fund page</title>
</head>

<body>
<%	
	if (result == 1){
%>		
		<script>
			alert('해지했습니다. 나눔을 이어가 주세요!')
			location.href="Mypage.jsp";
		</script>
<% 		
	}else{
%>		
		<script>
			alert("Error! 해지할 수 없습니다.")
			location.href="Mypage.jsp";
		</script>
<% 	
	}

%>
		
		
</body>
</html>