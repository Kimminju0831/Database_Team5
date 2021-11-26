<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- import JDBC package -->
<%@ page language = "java" import = "java.text.*, java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Delete page</title>
</head>
<body>
<% 
	String sql = "";
	String serverIP = "localhost";
	String strSID = "orcl";
	String portNum = "1521";
	String user = "university";
	String pass = "aaaa";
	String url = "jdbc:oracle:thin:@"+serverIP + ":"+portNum+":"+strSID;
	
	Connection conn = null;
	PreparedStatement pstmt;
	ResultSet rs;
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, user, pass);
	
	System.out.println("Connect Success!");
	conn.close();
	//======================================================================================//
	
	request.setCharacterEncoding("UTF-8");
	
	String Password = request.getParameter("D_password");
	
	
	// insert into DONATION_PREFERENCE (DONATION_TYPE, BENEFICIARY, U_ID, DUSER_ID) 
	//	values ('LONG', 'ABANDONED PETS', '661-05-9723', '661-05-9723');
	
	
	System.out.println(sql);
%>
</body>
</html>