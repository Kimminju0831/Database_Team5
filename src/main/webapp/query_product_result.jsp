<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@ page import="user.UserDao"%>
<%@	page import="java.time.LocalDate"%>
<%@ page import="java.time.ZoneId"%>
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
<title>query_product_result</title>
<meta charset="utf-8">
<link href="./style.css" rel="stylesheet">
</head>
<body>

	<%
	String sql = "";
	/*
	String serverIP = "localhost";
	String strSID = "xe";
	String portNum = "1600";
	String user = "ta";
	String pass = "ta";
	String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
	*/
	/*
	String serverIP = "localhost";
	String strSID = "orcl";
	String portNum = "1521";
	String user = "Team";
	String pass = "aaaa";
	String url = "jdbc:oracle:thin:@" + serverIP + ":" + portNum + ":" + strSID;
	*/
	String serverIP = "localhost";
	String strSID = "orcl";
	String portNum = "1521";
	String username = "team";
	String pass = "1234";
	String url = "jdbc:oracle:thin:@" + serverIP + ":" + portNum + ":" + strSID;

	Connection conn = null;
	PreparedStatement pstmt;
	ResultSet rs;
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, username, pass);

	//======================================================================================//

	String userid = "";
	if (session.getAttribute("userID") == null) {
		out.println("<a href='login.jsp'>로그인</a>");
	} else {
		userid = (String) session.getAttribute("userID");
		out.println(userid + " 님 안녕하세요, 반갑습니다! <br>");
		out.println("<a href='logout.jsp'>  로그아웃</a>");
	}

	request.setCharacterEncoding("UTF-8");

	//Query 2
	String production_count = request.getParameter("production_count");
	
	if (production_count != null) {
		sql = "SELECT PRODUCTION_TYPE, DELIVERY_CHARGE\n" + "FROM OUTSOURCING_COMPANY\n" + "WHERE PRODUCT_NUM < "
		+ production_count;
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
			out.println("<td>" + rs.getString(1) + "</td>");
			out.println("<td>" + rs.getString(2) + "</td>");
			out.println("</tr>");
		}
		out.println("</table><br>");
	}
	
	//Query 10
	String check = request.getParameter("query_radio");
	if (check != null) {
		if (check.equals("yes")) {

			sql = "SELECT PRODUCT_TYPE, COUNT(BETTER_LINK)\n" + "FROM MALL, REFER_TO\n" + "WHERE NORMAL_LINK = N_LINK\n"
			+ "AND BETTER_LINK = B_LINK\n" + "GROUP BY PRODUCT_TYPE";
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
		out.println("<td>" + rs.getString(1) + "</td>");
		out.println("<td>" + rs.getString(2) + "</td>");
		out.println("</tr>");
			}
			out.println("</table><br>");
		}
	}
	
	

	//Query 19
	String quantity_2 = request.getParameter("quantity_2");
	if (quantity_2 != null){
	sql = "SELECT PRODUCT_TYPE, MIN(PRICE)\n" + "FROM PRODUCT, MALL, MAKE\n" + "WHERE QUANTITY = " + quantity_2 + "\n"
			+ "AND PRODUCT_ID = P_I\n" + "AND NORMAL_LINK = NO_LINK\n" + "AND BETTER_LINK = BE_LINK\n"
			+ "GROUP BY PRODUCT_TYPE\n" + "ORDER BY PRODUCT_TYPE ASC";
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
		out.println("<td>" + rs.getString(1) + "</td>");
		out.println("<td>" + rs.getString(2) + "</td>");
		out.println("</tr>");
	}
	out.println("</table><br>");
	}

	conn.close();
	%>
	<a href='Main.jsp'>메인 페이지</a>
</body>
</html>