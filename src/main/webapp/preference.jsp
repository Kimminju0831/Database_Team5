<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- import JDBC package -->
<%@ page language = "java" import = "java.text.*, java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Preference insert page</title>
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
	String D_preference = request.getParameter("D_preference");
	
	String P_preference = request.getParameter("P_preference");
	
	String D_period = request.getParameter("D_period");
	
	// insert into DONATION_PREFERENCE (DONATION_TYPE, BENEFICIARY, U_ID, DUSER_ID) 
	//	values ('LONG', 'ABANDONED PETS', '661-05-9723', '661-05-9723');
	
	sql = "insert into DONATION_PREFERENCE (DONATION_TYPE, BENEFICIARY, U_ID, DUSER_ID) "+
			"values ('"+ D_period + "', '" + D_preference + "', '" + "" + " ', '" + "" + "') ";
	
	System.out.println(sql);

%>
</body>
</html>