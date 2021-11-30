<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@include file ="static/header.jsp" %> 
<link rel="stylesheet" href="static/main.css">
<div id = "body-wrapper">
   	<div id ="body-content">


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선물 취향 공개</title>
</head>
<body>
	<h1 style="margin-top:10%;" >조회하신 아이디의 선물 취향을 알려드립니다.</h1>
	
	<%
	PreparedStatement ps;
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs;
	
	window con = window.getInstance();
	
	conn = con.connect();
	
	stmt = conn.createStatement();

	%>
	
	<%
		request.setCharacterEncoding("UTF-8");
		String recvid = request.getParameter("recvid");//선물 줄 사람 아이디
	%>
		<a style="margin-top:7%;" >
	<%
		String result[] = new String[3];
		
		String gift_search = "SELECT product_type, product_name, R_DATE FROM preference WHERE us_id = '"+ recvid +"'";
		rs = stmt.executeQuery(gift_search);
		
        while(rs.next()) {
        	result[0] = rs.getString(1);
			result[1] = rs.getString(2);
			result[2] = rs.getString(3).substring(0,10);
       	}
		
		out.println("<a style=\"font-size:20px;\">검색하신 " + recvid +"님의 선물 취향을 알려드립니다.</a>");
		out.println("<hr>");
		out.print("<table style=\"border-spacing: 0 20px; font-size: 20px; \">");
        out.print("<tr>");
        out.print("<td style=\"font-weight:bold;\" width = \"100px\">" + "ID" + "</td>");
        out.print("<td style=\"font-weight:bold;\" width = \"200px\">" + "상품 종류" + "</td>");
        out.print("<td style=\"font-weight:bold;\" width = \"200px\">" + "상품" + "</td>");
        out.print("<td style=\"font-weight:bold;\" width = \"200px\">" + "등록일자" + "</td>");
        out.print("</tr>");
        
        out.println("<td>" + recvid + "</td>");
        out.println("<td>" + result[0] + "</td>");
        out.println("<td>" + result[1] + "</td>");
        out.println("<td>" + result[2] + "</td>");
        out.println("</table>");
        
	%>

	<br/>
	<br>
	<br/>
	<br>
	<a href = "gift_mall.jsp?protype=<%=result[0]%>&product=<%=result[1]%>&recvid=<%=recvid%>&user="
			style="font-size:30px; text-decoration-line: none; font-weight: bold;">
		<div>
			<%=recvid%>님의 선물 취향과 관련된 사이트가 궁금하신가요?
		</div>
	</a>
	<hr>
	
	<br/><br/>
	<a href = 'gift_list.jsp'>선물 주문내역 페이지</a>
</div>
	
	<%@include file ="static/footer.jsp" %>
</div> 