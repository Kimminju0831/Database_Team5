<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- import JDBC package -->
<%@ page language = "java" import = "java.text.*, java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Lab 9</title>
</head>
<body>
<%
	
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
String user = "team";
String pass = "1234";
String url = "jdbc:oracle:thin:@" + serverIP + ":" + portNum + ":" + strSID;

	Connection conn = null;
	PreparedStatement pstmt;
	ResultSet rs;
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, user, pass);
	
	System.out.println("Connect Success!");
	conn.close();
	
	
%>
</body>
</html>