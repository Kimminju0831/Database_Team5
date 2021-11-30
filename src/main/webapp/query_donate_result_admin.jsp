<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@include file ="static/header.jsp" %> 
<link rel="stylesheet" href="static/main.css">
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
		out.println("<a href='logout.jsp'>  <p2>로그아웃</p2></a>");
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
		out.println("<td><p2>" + rs.getString(1) + "</p2></td>");
		out.println("</tr>");
	}
	out.println("</table><br>");
	}
	//Query 13
	String donation_organization_name = request.getParameter("donation_organization_name");
	
	if (donation_organization_name != null){
	sql = "SELECT USER_ID, NAME\n" + "FROM USERS\n" + "WHERE NOT EXISTS ( (SELECT org_id\n" + "FROM Donation_organization\n"
			+ "WHERE Donation_organization_name = '" + donation_organization_name + "')\n" + "MINUS\n" + "(SELECT D.O_id\n"
			+ "FROM   DONATE D\n" + "WHERE D.UD = USER_ID))";
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
		out.println("<td><p2>" + rs.getString(1) + "</p2></td>");
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

</div>
</div>
	
	<%@include file ="static/footer.jsp" %>
</div> 