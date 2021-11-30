<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language = "java" import="java.text.*, java.sql.*" %>
<%@page import="java.util.*" %>
<%@ page import="user.Gift"%> 
<!-- import JDBC package -->
<%@include file ="static/header.jsp" %> 
<link rel="stylesheet" href="static/main.css">
<div id = "body-wrapper">
   	<div id ="body-content">
	<h3>주문 취소 결과</h3>
	<%
	
		String userid = ""; 
		if (session.getAttribute("userID") == null) {
		}else
		{
			userid = (String)session.getAttribute("userID");
			String usert = (String)session.getAttribute("userType");
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
		result = manage.delete_refer_to(pid, userid);
		
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
</div>
	
	<%@include file ="static/footer.jsp" %>
</div> 