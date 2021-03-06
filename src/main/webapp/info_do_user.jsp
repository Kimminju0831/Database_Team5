<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.Select"%>
<%@ page import="user.DonateDTO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>

<%@ page language = "java" import = "java.text.*, java.sql.*" %>   

<!-- import JDBC package -->
<%@include file ="static/header.jsp" %> 
<link rel="stylesheet" href="static/main.css">
<div id = "body-wrapper">
      <div id ="body-content">

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>관리자 권한 사용자 정보 수정</title>
</head>
<body>
	
<%
	
	String userid = "";
	if (session.getAttribute("userID") == null) {
		out.println("<a href='login.jsp'>로그인</a>");
	}else
	{
		userid = (String)session.getAttribute("userID");
		String usert = (String)session.getAttribute("userType");
		out.println(usert + " 회원 | " + userid+" 님 반갑습니다! <br>");
		out.println("<a href='logout.jsp'>로그아웃</a>");
	}
	
	out.println("<br><br>");	
	out.println("<br><br>");
	%>
	
	<%
		String serverIP = "localhost";
		String strSID = "xe";
		String portNum = "1600";
		String User = "ta";
		String pass = "ta";
		String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
		
		Connection conn = null;
		Statement stmt = null;
		
		PreparedStatement ps;
		ResultSet rs;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, User, pass);
		stmt = conn.createStatement();

	%>
	
	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String D_preference = request.getParameter("D_preference");
		String D_period = request.getParameter("D_period");
		
	%>
	
	<%
		int repeat = 0;
		out.println("------ 사용자 기부 취향 정보 수정  ------ <br/><br/>");
	 	String check_sql = "select user_id from users WHERE user_id='"+ id + "'";
     	String check_id = "";
        rs = stmt.executeQuery(check_sql);
        while(rs.next()) {
      	  check_id = rs.getString(1);
       	}
        
        if(check_id.equals(id))// 아이디 검사
        {
        	String check_pw_sql = "select user_pwd from users WHERE user_id= '"+ check_id +"'";
			String check_pwd = "";
        	rs = stmt.executeQuery(check_pw_sql);
        	while(rs.next()) {
     	   	check_pwd = rs.getString(1);
        	}
        
        
        	if(check_pwd.equals(pw))// 비밀번호 검사
        	{
        		conn.setAutoCommit(false);
        		String sql = "update DONATION_PREFERENCE set DONATION_TYPE='"+D_period +"', BENEFICIARY = '"+D_preference +"' WHERE U_ID='"+id +"'";
          	  	int result = stmt.executeUpdate(sql);
          	  	if(result == 1)
          	  	{
          	  		out.println("기부 취향 수정에 성공하였습니다.");
          	  		conn.commit();
          	  	}
          	  	else{
          	  		out.println("취향 등록에 실패했습니다. ");
          	  	}
        	}
        	else
        	{
        	out.println("비밀번호가 올바르지 않습니다.");
        	}
       	}
        else{
       		out.println("아이디가 올바르지 않습니다. 아닙니다.");
        }
		out.println("<br/>");
	%>
	<br /> <br />
	<a href = 'Main.jsp'>메인 페이지</a>
	<a href = 'Mypage.jsp'>정보 수정 페이지</a>
   </div>
   
   <%@include file ="static/footer.jsp" %>
</div>