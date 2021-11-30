<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
<title>query_present_result</title>
<meta charset="utf-8">
<link href="./style.css" rel="stylesheet">
<link rel="stylesheet" href="static/button.css">

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
	//Query 20
	String check = request.getParameter("query_radio");
	if (check != null) {
		if (check.equals("yes")) {
			sql = "(SELECT DISTINCT N_LINK as nor_link, B_LINK as bet_link \n" + "FROM REFER_TO)\n" + "INTERSECT\n"
			+ "(SELECT DISTINCT NO_LINK as nor_link, BE_LINK as bet_link\n" + "FROM MAKE, PRODUCT)";
			System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			System.out.println(sql);
			rs = pstmt.executeQuery();
			out.println("<table border=\"0\">");
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
	}
	conn.close();
	%>
	<div class="container2">
<a class ="btn btn" href='Main.jsp'><p4>메인 페이지</p4></a>
<a class ="btn btn" href='select_query_menu.jsp'><p4>질의 메뉴 페이지로 이동하기</p4></a>

</div>
</body>
</html>