<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
<meta charset="EUC-KR">
<title>query_product_result</title>
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
		out.println("<a href='login.jsp'>�α���</a>");
	} else {
		userid = (String) session.getAttribute("userID");
		out.println(userid + " �� �ȳ��ϼ���, �ݰ����ϴ�! <br>");
		out.println("<a href='logout.jsp'>  �α׾ƿ�</a>");
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
	//Query 4
	String estimated_date = request.getParameter("estimated_date");
	if (estimated_date != null) {
		sql = "SELECT Production_type, SUM(Product_num)\n" + "FROM OUTSOURCING_COMPANY\n"
		+ "WHERE Estimated_date <= TO_DATE('" + estimated_date + "', 'yyyy-mm-dd')\n" + "GROUP BY Production_type";
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
	//Query 15
	String check2 = request.getParameter("query_radio_2");
	if (check2 != null) {
		if (check2.equals("yes")) {
			sql = "SELECT T.Product_name, COUNT(*) as numprefer\n" + "FROM PRODUCT T, PREFERENCE\n"
			+ "WHERE T.UIDN = US_ID\n" + "GROUP BY T.Product_name\n" + "ORDER BY numprefer DESC";

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
	//Query 16
	String production_count_2 = request.getParameter("production_count_2");
	if (production_count_2 != null){
	sql = "SELECT USER_ID, COUNT(*) as count\n" + "FROM USERS, GIVES_A_PRESENT_TO\n" + "WHERE USER_ID = Use_id\n"
			+ "GROUP BY USER_ID\n" + "HAVING COUNT(*) >=" + production_count_2 + "\n" + "ORDER BY count DESC";
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
	//Query 17
	String quantity = request.getParameter("quantity");
	if (quantity != null){
	sql = "SELECT NAME, PRODUCT_TYPE, PRODUCT_ID\n" + "FROM USERS, PRODUCT, MALL, MAKE\n" + "WHERE USER_ID = UIDN\n"
			+ "AND PRODUCT_ID = P_I\n" + "AND NO_LINK = NORMAL_LINK\n" + "AND BE_LINK = BETTER_LINK\n" + "AND QUANTITY >= "
			+ quantity;
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
		out.println("<td>" + rs.getString(3) + "</td>");
		out.println("</tr>");
	}
	out.println("</table><br>");
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
	<a href='Main.jsp'>���� ������</a>
</body>
</html>