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
<title>query_donate_result</title>
<meta charset="utf-8">
<link href="./style.css" rel="stylesheet">
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
		out.println("<a href='login.jsp'>로그인</a>");
	} else {
		userid = (String) session.getAttribute("userID");
		out.println(userid + " 님 안녕하세요, 반갑습니다! <br>");
		out.println("<a href='logout.jsp'>  로그아웃</a>");
	}

	request.setCharacterEncoding("UTF-8");

	//Query 1
	String donation_type = request.getParameter("donation_type");
	if (donation_type != null){
	sql = "SELECT DONATION_ORGANIZATION_NAME\n" + "FROM DONATION_ORGANIZATION\n" + "WHERE DONATION_TYPE = '" + donation_type
			+ "'";
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
	}

	
	
	//Query 14
	String do_org_name = request.getParameter("do_org_name");

	if (do_org_name != null){
	sql = "SELECT DISTINCT D_id\n"+
			"FROM RECOMMEND\n"+
			"WHERE Do_org_name in ('"+do_org_name+"')";

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
	}
	
	
	
	//Query 18
	String beneficiary = request.getParameter("beneficiary");

	if (beneficiary != null){
	sql = "SELECT DONATION_TYPE, COUNT(USER_ID)\n"+
			"FROM USERS, DONATION_PREFERENCE\n"+
			"WHERE USER_ID = U_ID\n"+
			"AND BENEFICIARY = '"+beneficiary+"'\n"+
			"GROUP BY DONATION_TYPE\n"+
			"ORDER BY DONATION_TYPE DESC";
	
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