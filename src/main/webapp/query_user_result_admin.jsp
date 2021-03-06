<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@ page import="user.UserDao"%>
<%@	page import="java.time.LocalDate"%>
<%@ page import="java.time.ZoneId"%>
<%@ page import="user.mac"%> 
<%@ page import="user.window"%> 
<%@ page language="java" import="java.text.*, java.sql.*"%>
<%@include file ="static/header.jsp" %> 


<jsp:useBean id="user2" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userAddress" />
<jsp:setProperty name="user" property="userPhone" />

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="./style.css" rel="stylesheet">
<link rel="stylesheet" href="static/button.css">

<title>query_user_result</title>
</head>
<body>
<div id = "body-wrapper">
   	<div id ="body-content">
	<%
	
	String sql = "";

	PreparedStatement ps;


	Connection conn = null;
	Statement stmt = null;
	ResultSet rs;

	PreparedStatement pstmt;
	window con = window.getInstance();
	
	conn = con.connect();
	
	stmt = conn.createStatement();


	//======================================================================================//
	String userid = "";
	if (session.getAttribute("userID") == null) {
		out.println("<a href='login.jsp'><p2>로그인</p2></a>");
	} else {
		userid = (String) session.getAttribute("userID");
		out.println("<p2>"+userid + " 님 안녕하세요, 반갑습니다!</p2> <br>");
		out.println("<a href='logout.jsp'><p2>  로그아웃</p2></a>");
	}
	request.setCharacterEncoding("UTF-8");
	//Query 3
	String beneficiary = request.getParameter("beneficiary");
	if (beneficiary != null) {
		sql = "SELECT Duser_id\n FROM DONATION_PREFERENCE\n WHERE Beneficiary = '" + beneficiary + "'";
		System.out.println(sql);
		pstmt = conn.prepareStatement(sql);
		System.out.println(sql);
		rs = pstmt.executeQuery();
		out.println("<table border=\"1\">");
		ResultSetMetaData rsmd = rs.getMetaData();
		int cnt = rsmd.getColumnCount();
		for (int i = 1; i <= cnt; i++) {
			out.println("<th>" + rsmd.getColumnName(i) + "</th>");
		}
		while (rs.next()) {
			out.println("<tr>");
			out.println("<td><p2>" + rs.getString(1) + "</p2></td>");
			out.println("</tr>");
		}
		out.println("</table><br>");
	}
	//Query 5
	String production_design = request.getParameter("production_design");
	String production_type = request.getParameter("production_type");
	if (production_design != null && production_type != null) {
		sql = "SELECT NAME, PHONE, ADDRESS\n FROM USERS, OUTSOURCING_COMPANY\nWHERE UR_ID = USER_ID\n" + "AND DESIGN = '"
		+ production_design + "'" + "AND PRODUCTION_TYPE = '" + production_type + "'\n AND PRODUCTION_TYPE != '$'" ;
		System.out.println(sql);
		pstmt = conn.prepareStatement(sql);
		System.out.println(sql);
		rs = pstmt.executeQuery();
		out.println("<table border=\"1\">");
		ResultSetMetaData rsmd = rs.getMetaData();
		int cnt = rsmd.getColumnCount();
		for (int i = 1; i <= cnt; i++) {
			out.println("<th>" + rsmd.getColumnName(i) + "</th>");
		}
		while (rs.next()) {
			out.println("<tr>");
			out.println("<td><p2>" + rs.getString(1) + "</p2></td>");
			out.println("<td><p2>" + rs.getString(2) + "</p2></td>");
			out.println("<td><p2>" + rs.getString(3) + "</p2></td>");
			out.println("</tr>");
		}
		out.println("</table><br>");
	}
	//Query 6
	String production_count = request.getParameter("production_count");
	if (production_count != null) {
		sql = "SELECT NAME, PRODUCT_NAME\n" + "FROM USERS\n" + "JOIN PRODUCT\n" + "ON USER_ID = UIDN\n"
		+ "WHERE quantity > '" + production_count + "'";
		System.out.println(sql);
		pstmt = conn.prepareStatement(sql);
		System.out.println(sql);
		rs = pstmt.executeQuery();
		out.println("<table border=\"1\">");
		ResultSetMetaData rsmd = rs.getMetaData();
		int cnt = rsmd.getColumnCount();
		for (int i = 1; i <= cnt; i++) {
			out.println("<th>" + rsmd.getColumnName(i) + "</th>");
		}
		while (rs.next()) {
			out.println("<tr>");
			out.println("<td><p2>" + rs.getString(1) + "</p2></td>");
			out.println("<td><p2>" + rs.getString(2) + "</p2></td>");
			out.println("</tr>");
		}
		out.println("</table><br>");
	}
	//Query 7
	String beneficiary_2 = request.getParameter("beneficiary_2");
	if (beneficiary_2 != null) {
		sql = "SELECT NAME, PHONE\n" + "FROM USERS, DONATION_PREFERENCE\n" + "WHERE USER_ID = U_ID\n"
		+ "AND BENEFICIARY = '" + beneficiary_2 + "'";
		System.out.println(sql);
		pstmt = conn.prepareStatement(sql);
		System.out.println(sql);
		rs = pstmt.executeQuery();
		out.println("<table border=\"1\">");
		ResultSetMetaData rsmd = rs.getMetaData();
		int cnt = rsmd.getColumnCount();
		for (int i = 1; i <= cnt; i++) {
			out.println("<th>" + rsmd.getColumnName(i) + "</th>");
		}
		while (rs.next()) {
			out.println("<tr>");
			out.println("<td><p2>" + rs.getString(1) + "</p2></td>");
			out.println("<td><p2>" + rs.getString(2) + "</p2></td>");
			out.println("</tr>");
		}
		out.println("</table><br>");
	}
  
	//Query 9
	String production_count_2 = request.getParameter("production_count_2");
	if (production_count_2 != null) {
		sql = "SELECT BENEFICIARY, SUM( PRODUCT_NUM )" + "FROM OUTSOURCING_COMPANY , DONATION_ORGANIZATION\n"
		+ "WHERE ORGAN_ID = ORG_ID\n" + "AND PRODUCT_NUM >= " + production_count_2 + "\n AND PRODUCTION_TYPE != '$'\n" + "GROUP BY BENEFICIARY";
		System.out.println(sql);
		pstmt = conn.prepareStatement(sql);
		System.out.println(sql);
		rs = pstmt.executeQuery();
		out.println("<table border=\"1\">");
		ResultSetMetaData rsmd = rs.getMetaData();
		int cnt = rsmd.getColumnCount();
		for (int i = 1; i <= cnt; i++) {
			out.println("<th>" + rsmd.getColumnName(i) + "</th>");
		}
		while (rs.next()) {
			out.println("<tr>");
			out.println("<td><p2>" + rs.getString(1) + "</p2></td>");
			out.println("<td><p2>" + rs.getString(2) + "</p2></td>");
			out.println("</tr>");
		}
		out.println("</table><br>");
	}
	//Query 11
	String production_type_2 = request.getParameter("production_type_2");
	if (production_type_2 != null) {
		sql = "SELECT NAME, PHONE\n" + "FROM USERS\n" + "WHERE NAME IN(\n" + "SELECT NAME\n" + "FROM USERS, PREFERENCE\n"
		+ "WHERE USER_ID = US_ID\n" + "AND PRODUCT_NAME = '" + production_type_2 + "')";
		System.out.println(sql);
		pstmt = conn.prepareStatement(sql);
		System.out.println(sql);
		rs = pstmt.executeQuery();
		out.println("<table border=\"1\">");
		ResultSetMetaData rsmd = rs.getMetaData();
		int cnt = rsmd.getColumnCount();
		for (int i = 1; i <= cnt; i++) {
			out.println("<th>" + rsmd.getColumnName(i) + "</th>");
		}
		while (rs.next()) {
			out.println("<tr>");
			out.println("<td><p2>" + rs.getString(1) + "</p2></td>");
			out.println("<td><p2>" + rs.getString(2) + "</p2></td>");
			out.println("</tr>");
		}
		out.println("</table><br>");
	}
	//Query 12
	String check = request.getParameter("query_radio");
	if (check != null) {
		if (check.equals("yes")) {
			sql = "SELECT DISTINCT NAME\n" + "FROM USERS\n" + "WHERE EXISTS (SELECT *\n" + "FROM GIVES_A_PRESENT_TO\n"
			+ "WHERE USER_ID = Use_id)";
			System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			System.out.println(sql);
			rs = pstmt.executeQuery();
			out.println("<table border=\"1\">");
			ResultSetMetaData rsmd = rs.getMetaData();
			int cnt = rsmd.getColumnCount();
			for (int i = 1; i <= cnt; i++) {
		out.println("<th>" + rsmd.getColumnName(i) + "</th>");
			}
			while (rs.next()) {
				out.println("<tr>");
				out.println("<td><p2>" + rs.getString(1) + "</p2></td>");
				out.println("</tr>");
			}
			out.println("</table><br>");
		}
	}
	
	conn.close();
	%>
	
	<div class="container2">
<a class ="btn btn" href='Main.jsp'><p4>메인 페이지</p4></a>
<a class ="btn btn" href='select_query_menu.jsp'><p4>질의 메뉴 페이지로 이동하기</p4></a>

</div>

	<%@include file ="static/footer.jsp" %>

</div>
</div>
</body>
</html>