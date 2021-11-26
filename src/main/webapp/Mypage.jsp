<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- import JDBC package -->
<%@ page import="user.UserDao"%>
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
	String serverIP = "localhost";
	String strSID = "orcl";
	String portNum = "1521";
	String dbuser = "Team";
	String pass = "aaaa";
	String url = "jdbc:oracle:thin:@"+serverIP + ":"+portNum+":"+strSID;
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, dbuser, pass);
	conn.setAutoCommit(false);
		
	//======================================================================================//
	
	String userid = "";
	if (session.getAttribute("userID") == null) {
	   out.println("<a href='login.jsp'>�α���</a>");
	}else
	{
	   userid = (String)session.getAttribute("userID");
	   out.println(userid+" �� �ȳ��ϼ���, �ݰ����ϴ�! <br>");
	   out.println("<a href='logout.jsp'>  �α׾ƿ�</a>");
	}
		
	
	request.setCharacterEncoding("UTF-8");
	out.println("<br><br>" + userid + " ���� ���������� �Դϴ�." + " <br><br>");
	
	// select donation_type, beneficiary from donation_preference where u_id = 'admin1';
	
	sql = "SELECT donation_type, beneficiary "
		 + "FROM donation_preference WHERE u_id = '"+ userid +"'";
	
	try {
		System.out.println(sql);
	
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		if(rs.next()){
			System.out.println(rs.getString(1));
			System.out.println(rs.getString(2));
			
			out.println("<p>"+ userid+ "���� ��� ������ " +
			rs.getString(1) + " " + rs.getString(2) + "</p>");
		}
		
		//out.println("<p>" + donation_t + " " + beneficiary+ "</p>")
		
	}
	catch (Exception e) {
		e.printStackTrace();
	}
	
	sql = "SELECT product_type, product_name "
			 + "FROM preference WHERE us_id = '"+ userid +"'";
	
	
	try {
		System.out.println(sql);
	
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		if(rs.next()){
			System.out.println(rs.getString(1));
			System.out.println(rs.getString(2));
			
			out.println("<p>"+ userid+ "���� ���� ������ " +
			rs.getString(1) + " " + rs.getString(2) + "</p>");
		}
		
		
	}
	catch (Exception e) {
		e.printStackTrace();
	}
	
	rs.close();
	conn.close();

%>
</body>
</html>