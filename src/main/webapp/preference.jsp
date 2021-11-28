<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- import JDBC package -->
<%@ page import="user.UserDao"%>
<%@	page import="java.time.LocalDate" %>
<%@ page import="java.time.ZoneId" %>
<%@ page language = "java" import = "java.text.*, java.sql.*" %>   

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
<title>Preference insert page</title>
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
	}else
	{
	   userid = (String)session.getAttribute("userID");
	   out.println(userid+" 님 안녕하세요, 반갑습니다! <br>");
	   out.println("<a href='logout.jsp'>  로그아웃</a>");
	}
		
	
	request.setCharacterEncoding("UTF-8");
	String D_preference = request.getParameter("D_preference");
	
	String P_preference = request.getParameter("P_preference");
	
	String D_period = request.getParameter("D_period");
	
	// insert into DONATION_PREFERENCE (DONATION_TYPE, BENEFICIARY, U_ID, DUSER_ID) 
	//	values ('LONG', 'ABANDONED PETS', '661-05-9723', '661-05-9723');
	
	sql = "insert into DONATION_PREFERENCE (DONATION_TYPE, BENEFICIARY, U_ID, DUSER_ID) "+
			"values ('"+ D_period + "', '" + D_preference + "', '" + userid + "', '" + userid + "') ";
	
	System.out.println(sql);
	
	try {
		pstmt = conn.prepareStatement(sql);

		System.out.println(sql);
		
		rs = pstmt.executeQuery();
		}
	catch (Exception e) {
		e.printStackTrace();
	}
	
	
	request.setCharacterEncoding("UTF-8");
	
	String gift = request.getParameter("gift");
	
	String gift_type = request.getParameter("gift_type");
	
	LocalDate now = LocalDate.now();
	
	//insert into PREFERENCE (Product_name, R_Date, Product_type, Us_id) values ('COMPACT CUSHION', TO_DATE('2021-04-17', 'yyyy-mm-dd'), 'COSMETICS', '354-64-4664');
	
	sql = "insert into PREFERENCE (Product_name, R_Date, Product_type, Us_id) values ('" + gift_type + "', TO_DATE('" + now + "', 'yyyy-mm-dd'), '" + gift + "', '" + userid + "')";
	
	System.out.println(sql);
	
	try {
		pstmt = conn.prepareStatement(sql);

		System.out.println(sql);
		
		rs = pstmt.executeQuery();
		}
	catch (Exception e) {
		e.printStackTrace();
	}
	
	conn.close();

%>
<a href = 'Main.jsp'>메인 페이지</a>
</body>
</html>