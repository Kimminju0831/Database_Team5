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
<title>query_donate_result</title>
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
	<a href='Main.jsp'>���� ������</a>
</body>
</html>