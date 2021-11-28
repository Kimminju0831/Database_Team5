<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language = "java" import="java.text.*, java.sql.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선물 확정</title>
</head>
<body>
	<script>
			alert('DㅓBㅔ풀기를 통해 마음을 전달해주셔서 감사합니다!');
			//location.href="gift_Gives_presents_to.jsp";
		</script>
		
		<%
		String serverIP = "localhost";
		String strSID = "xe";
		String portNum = "1600";
		String user = "ta";
		String pass = "ta";
		String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
		
		Connection conn = null;
		Statement stmt = null;
		
		PreparedStatement ps;
		ResultSet rs;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pass);
		stmt = conn.createStatement();

		%>
		
		<%
		request.setCharacterEncoding("UTF-8");
		String blink = request.getParameter("blink");//선물 줄 사람 아이디
		String nlink = request.getParameter("nlink");
		String check = request.getParameter("check");
		%>
		
		<%
			
		%>
	
</body>
</html>