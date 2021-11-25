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
	String dbuser = "university";
	String pass = "aaaa";
	String url = "jdbc:oracle:thin:@"+serverIP + ":"+portNum+":"+strSID;
	
	Connection conn = null;
	PreparedStatement pstmt;
	ResultSet rs;
	Class.forName("oracle.jdbc.driver.OracleDriver");
	conn = DriverManager.getConnection(url, dbuser, pass);
	
	System.out.println("Connect Success!");
	conn.close();

	//======================================================================================//
	
	if (session.getAttribute("userID") == null) {
	   out.println("<a href='login.jsp'>로그인</a>");
	}else
	{
	   String userid = (String)session.getAttribute("userID");
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
			"values ('"+ D_period + "', '" + D_preference + "', '" + "" + " ', '" + "" + "') ";
	
	System.out.println(sql);

%>

<p>Preference Insert Site - 취향 등록 사이트</p>
	
	<form action="./preference.jsp" method="post">
	  		<a>
	  			
	  			<b>기부 취향을 선택해주세요.</b>
				
				<br><br>기부 취향 : 
				<select name="D_preference">
			    <option value="ABANDONED PETS" selected>ABANDONED PETS</option>
			    <option value="ENDANGERED SPECIES">ENDANGERED SPECIES</option>
			    <option value="SEXUAL SLAVE VICTIMS">SEXUAL SLAVE VICTIMS</option>
			    <option value="CHILDREN-IN-NEED">CHILDREN-IN-NEED</option>
			    <option value="DISABLED PEOPLE">DISABLED PEOPLE</option>
			    <option value="ENVIRONMENT">ENVIRONMENT</option>
			    <option value="FIREFIGHTERS">FIREFIGHTERS</option>
			    <option value="WAR SUFFERERS">WAR SUFFERERS</option>
			    <option value="ELDERLY">ELDERLY</option>
				</select>
				
				<br>
				<br>
				
				<b> 기부 기간을 선택해주세요.</b>
				
				<br><br>기부 기간 취향 : 
				<select name="D_period">
			    <option value="SHORTS" selected>SHORTS</option>
			    <option value="LONG">LONG</option>
			    <option value="TEMPORARY">TEMPORARY</option>
				</select>
				
				<br>
				<br>
				
				<b> 선물 취향을 선택해주세요.</b>
				
				<br><br>선물 취향 : 
				<select name="P_preference">
			    <option value="ACCESSORY" selected>ACCESSORY</option>
			    <option value="GROCERIES">GROCERIES</option>
			    <option value="COSMETICS">COSMETICS</option>
			    <option value="DAILY_NECESSITIES">DAILY_NECESSITIES</option>
			    <option value="BOOKS">BOOKS</option>
			    <option value="DIGITAL">DIGITAL</option>
			    <option value="SUNDRIES">SUNDRIES</option>
			    <option value="AIR_FRESHENER">AIR_FRESHENER</option>
			    <option value="BATH_SUPPLIES">BATH_SUPPLIES</option>
			    <option value="DOLL">DOLL</option>
				</select>
				
				<br>
				<br>

			</a>
			<a><input type="reset" value="Reset"><input type="submit" value="Submit"></a>
	</form>
	
	<a href="Main.html">메인 페이지로 이동하기</a>
	<br>
</body>
</html>