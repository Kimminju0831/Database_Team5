<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@ page import="user.UserDao"%>
<%@	page import="java.time.LocalDate" %>
<%@ page import="java.time.ZoneId" %>
<%@ page import="user.mac"%> 
<%@ page import="user.window"%> 
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
<title>Preference insert page</title>
</head>
<body>

<% 

	String sql = "";
	PreparedStatement ps;
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs;
	
	window con = window.getInstance();
	
	conn = con.connect();
	

	//======================================================================================//
	
	String userid = "";
	if (session.getAttribute("userID") == null) {
	}else
	{
	   userid = (String)session.getAttribute("userID");
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
		stmt = conn.prepareStatement(sql);

		System.out.println(sql);
		
		rs = stmt.executeQuery();
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
		stmt = conn.prepareStatement(sql);

		System.out.println(sql);
		
		rs = stmt.executeQuery();
		}
	catch (Exception e) {
		e.printStackTrace();
	}
	
	conn.close();

%>


<script type="text/javascript">
		alert('<%=userid%> 님의 취향을 성공적으로 등록했습니다.')
		location.href="./Mypage.jsp";
</script>

</body>
</html>