<%@page import="user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@ page language = "java" import = "java.text.*, java.sql.*" %>    
<%@ page import="user.UserDao"%>
<%@ page import="user.DAO"%>
<%@ page import="user.Select"%>
<%@ page import="user.DonateDTO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import = "user.ExBoardDTO" %>
<!DOCTYPE html>
<html>
<head>
<%

		int pageNum = 15;
		
		String PageNum = request.getParameter("pageNum");
		if(PageNum  == null){
			PageNum  = "1";
		}
		
		int current = Integer.parseInt(PageNum);
		
		int start = (current -1) * pageNum +1;
		int end = current * pageNum ;
		
		
		String userid = (String)session.getAttribute("userID");
		
		DAO manager = DAO.getInstance();
		
		List<DonateDTO> list = null;
		
		list = manager.getList_donate(userid);
		
		int count = 0;
		
		if(list != null){
			count = list.size();		// 총 데이터 갯수
		}
		
		
		if(end>count){
			end = count;
		}
%>
<%
	
	DAO manager2 = DAO.getInstance();
	
	List<User> user_list = null;
	
	
	
	int donate_count = 0;
	

%>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
		<h3>기부 참여자 목록</h3>
		<table>
			<tr>
				<td width = "10%">번호</td>
				<td width = "20%">유저 이름</td>
				<td width = "30%">유저 주소</td>
				<td width = "20%">유저 전화번호</td>
				<td width = "20%">상태</td>
			</tr>
</body>
</html>