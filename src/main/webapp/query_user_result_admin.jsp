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
<title>query_user_result</title>
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

	//Query 3
	String beneficiary = request.getParameter("beneficiary");

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
		out.println("<td>" + rs.getString(1) + "</td>");
		out.println("</tr>");
	}
	out.println("</table><br>");

	//Query 5
	String production_design = request.getParameter("production_design");
	String production_type = request.getParameter("production_type");

	sql = "SELECT NAME, PHONE, ADDRESS\n FROM USERS, OUTSOURCING_COMPANY\nWHERE UR_ID = USER_ID\n" + "AND DESIGN = '"
			+ production_design + "'" + "AND PRODUCTION_TYPE = '" + production_type + "'";
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
		out.println("<td>" + rs.getString(1) + "</td>");
		out.println("<td>" + rs.getString(2) + "</td>");
		out.println("<td>" + rs.getString(3) + "</td>");
		out.println("</tr>");
	}
	out.println("</table><br>");

	//Query 6
	String production_count = request.getParameter("production_count");

	sql = "SELECT NAME, PRODUCT_NAME\n"+
		    "FROM USERS\n"+ 
		    "JOIN PRODUCT\n"+ 
		    "ON USER_ID = UIDN\n"+
		    "WHERE quantity > '"+production_count+"'";
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
		out.println("<td>" + rs.getString(1) + "</td>");
		out.println("<td>" + rs.getString(2) + "</td>");
		out.println("</tr>");
	}
	out.println("</table><br>");

	
	//Query 7
		String beneficiary_2 = request.getParameter("beneficiary_2");

	sql = "SELECT NAME, PHONE\n"+
			"FROM USERS, DONATION_PREFERENCE\n"+
			"WHERE USER_ID = U_ID\n"+
			"AND BENEFICIARY = '"+beneficiary_2+"'";
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
			out.println("<td>" + rs.getString(1) + "</td>");
			out.println("<td>" + rs.getString(2) + "</td>");
			out.println("</tr>");
		}
		out.println("</table><br>");
		
		
		
		
		//Query 9
				String production_count_2 = request.getParameter("production_count_2");

			sql = "SELECT BENEFICIARY, SUM( PRODUCT_NUM )"+
				     "FROM OUTSOURCING_COMPANY , DONATION_ORGANIZATION\n"+ 
				     "WHERE ORGAN_ID = ORG_ID\n"+
				     "AND PRODUCT_NUM >= "+production_count_2+"\n"+
				     "GROUP BY BENEFICIARY";
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
					out.println("<td>" + rs.getString(1) + "</td>");
					out.println("<td>" + rs.getString(2) + "</td>");
					out.println("</tr>");
				}
				out.println("</table><br>");
				
				//Query 11
				String production_type_2 = request.getParameter("production_type_2");

			sql = "SELECT NAME, PHONE\n"+
					"FROM USERS\n"+
					"WHERE NAME IN(\n"+
					"SELECT NAME\n"+
					"FROM USERS, PREFERENCE\n"+
					"WHERE USER_ID = US_ID\n"+
					"AND PRODUCT_NAME = '"+production_type_2+"')";
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
					out.println("<td>" + rs.getString(1) + "</td>");
					out.println("<td>" + rs.getString(2) + "</td>");
					out.println("</tr>");
				}
				out.println("</table><br>");
				
				//Query 12

			sql = "SELECT DISTINCT NAME\n"+
					"FROM USERS\n"+
					"WHERE EXISTS (SELECT *\n"+
					              "FROM GIVES_A_PRESENT_TO\n"+
					              "WHERE USER_ID = Use_id)";
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
					out.println("<td>" + rs.getString(1) + "</td>");
					out.println("</tr>");
				}
				out.println("</table><br>");
				
				


	conn.close();
	%>
	<a href='Main.jsp'>메인 페이지</a>
</body>
</html>