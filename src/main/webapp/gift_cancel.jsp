<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language = "java" import="java.text.*, java.sql.*" %>
<%@page import="java.util.*" %>
<%@ page import="user.Gift"%> 

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
<title>선물 취소하기</title>
</head>
<body>
	<h3>주문 취소 결과</h3>
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
		}
	
		out.println("<br><br>");	
	%>
	
	<%
			Gift manage = Gift.getInstance();
	%>
		
		<%
		request.setCharacterEncoding("UTF-8");
		String pid = request.getParameter("pid");
		
		%>
		
		
		<%
		int result;	
		int mresult;
		result = manage.delete_order(pid);
		
		if(result == 0)
		{
			out.println("주문 취소에 실패했습니다.");
		}
		
		else if(result == 1)
		{
			out.println("주문 취소에 성공하였습니다. ");
			
		}
		
		
	%>
	<a href = 'Main.jsp'>메인 페이지</a>
	<a href = 'gift_list.jsp'>주문내역 바로가기</a>
</body>
</html>