<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@ page import="user.UserDao"%>
<%@	page import="java.time.LocalDate"%>
<%@ page import="java.time.ZoneId"%>
<%@ page import="user.mac"%> 
<%@ page import="user.window"%> 
<%@ page language="java" import="java.text.*, java.sql.*"%>

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
<link href="./style.css" rel="stylesheet">
<link rel="stylesheet" href="static/button.css">

<title>query_product_result</title>
</head>
<body>

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
	//Query 2
	String production_count = request.getParameter("production_count");
	sql = "SELECT PRODUCTION_TYPE, DELIVERY_CHARGE\n" + "FROM OUTSOURCING_COMPANY\n" + "WHERE PRODUCT_NUM < "
			+ production_count+"\n AND PRODUCTION_TYPE != '$'";
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
	//Query 4
	String estimated_date = request.getParameter("estimated_date");
	sql = "SELECT Production_type, SUM(Product_num)\n" + "FROM OUTSOURCING_COMPANY\n" + "WHERE Estimated_date <= TO_DATE('"
			+ estimated_date + "', 'yyyy-mm-dd')\n"+"AND PRODUCTION_TYPE != '$'\n" + "GROUP BY Production_type";
	System.out.println(sql);
	pstmt = conn.prepareStatement(sql);
	System.out.println(sql);
	rs = pstmt.executeQuery();
	out.println("<table border=\"1\">");
	rsmd = rs.getMetaData();
	cnt = rsmd.getColumnCount();
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
	//Query 10
	sql = "SELECT PRODUCT_TYPE, COUNT(BETTER_LINK)\n" + "FROM MALL, REFER_TO\n" + "WHERE NORMAL_LINK = N_LINK\n"
			+ "AND BETTER_LINK = B_LINK\n" + "GROUP BY PRODUCT_TYPE";
	
	String check = request.getParameter("query_radio");
	//for test
	System.out.println("check: " + check);
	if (check != null) {
		if (check.equals("yes")) {
	
	System.out.println(sql);
	pstmt = conn.prepareStatement(sql);
	System.out.println(sql);
	rs = pstmt.executeQuery();
	out.println("<table border=\"1\">");
	rsmd = rs.getMetaData();
	cnt = rsmd.getColumnCount();
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
	
	
		}}
	//Query 15
	sql = "SELECT T.Product_name, COUNT(*) as numprefer\n" + "FROM PRODUCT T, PREFERENCE\n" + "WHERE T.UIDN = US_ID\n"
			+ "GROUP BY T.Product_name\n" + "ORDER BY numprefer DESC";
	System.out.println(sql);
	pstmt = conn.prepareStatement(sql);
	System.out.println(sql);
	rs = pstmt.executeQuery();
	out.println("<table border=\"1\">");
	rsmd = rs.getMetaData();
	cnt = rsmd.getColumnCount();
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
	
	//Query 16
	String production_count_2 = request.getParameter("production_count_2");
	if (production_count != null){
	sql = "SELECT USER_ID, COUNT(*) as count\n" + "FROM USERS, GIVES_A_PRESENT_TO\n" + "WHERE USER_ID = Use_id\n"
			+ "GROUP BY USER_ID\n" + "HAVING COUNT(*) >=" + production_count_2 + "\n" + "ORDER BY count DESC";
	System.out.println(sql);
	pstmt = conn.prepareStatement(sql);
	System.out.println(sql);
	rs = pstmt.executeQuery();
	out.println("<table border=\"1\">");
	rsmd = rs.getMetaData();
	cnt = rsmd.getColumnCount();
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
	//Query 17
	String quantity = request.getParameter("quantity");
	if (quantity != null)
	{
	sql = "SELECT NAME, PRODUCT_TYPE, PRODUCT_ID\n" + "FROM USERS, PRODUCT, MALL, MAKE\n" + "WHERE USER_ID = UIDN\n"
			+ "AND PRODUCT_ID = P_I\n" + "AND NO_LINK = NORMAL_LINK\n" + "AND BE_LINK = BETTER_LINK\n" + "AND QUANTITY >= "
			+ quantity;
	System.out.println(sql);
	pstmt = conn.prepareStatement(sql);
	System.out.println(sql);
	rs = pstmt.executeQuery();
	out.println("<table border=\"1\">");
	rsmd = rs.getMetaData();
	cnt = rsmd.getColumnCount();
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
	//Query 19
	String quantity_2 = request.getParameter("quantity_2");
	if (quantity_2 != null){
	sql = "SELECT PRODUCT_TYPE, MIN(PRICE)\n"+
			"FROM PRODUCT, MALL, MAKE\n"+
			"WHERE QUANTITY = "+quantity_2+"\n"+
			"AND PRODUCT_ID = P_I\n"+
			"AND NORMAL_LINK = NO_LINK\n"+
			"AND BETTER_LINK = BE_LINK\n"+
			"GROUP BY PRODUCT_TYPE\n"+
			"ORDER BY PRODUCT_TYPE ASC";
	System.out.println(sql);
	pstmt = conn.prepareStatement(sql);
	System.out.println(sql);
	rs = pstmt.executeQuery();
	out.println("<table border=\"1\">");
	rsmd = rs.getMetaData();
	cnt = rsmd.getColumnCount();
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
	
	conn.close();
	%>
	<div class="container2">
<a class ="btn btn" href='Main.jsp'><p4>메인 페이지</p4></a>
<a class ="btn btn" href='select_query_menu.jsp'><p4>질의 메뉴 페이지로 이동하기</p4></a>

</div></body>
</html>