<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language = "java" import="java.text.*, java.sql.*" %>
<%@	page import="java.time.LocalDate" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 권한 사용자 정보 수정</title>
</head>
<body>
	
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
		String adminid = request.getParameter("adminid");
		String adminpw = request.getParameter("adminpw");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String infotype = request.getParameter("infotype");
		String newinfo = request.getParameter("newinfo");
		
	%>
	
	<%
		int repeat = 0;
		out.println("------ 관리자 권한 사용자 정보 수정  ------ <br/><br/>");
	 	String check_sql = "select user_id from users WHERE user_id='"+ adminid + "'";
     	String check_id = "";
        rs = stmt.executeQuery(check_sql);
        while(rs.next()) {
      	  check_id = rs.getString(1);
       	}
        
        if(check_id.equals("000-00-0000"))//관리자 아이디 검사
        {
        	String check_pw_sql = "select user_pwd from users WHERE user_id= '"+ check_id +"'";
			String check_pwd = "";
        	rs = stmt.executeQuery(check_pw_sql);
        	while(rs.next()) {
     	   	check_pwd = rs.getString(1);
        	}
        
        
        	if(check_pwd.equals("admin"))//관리자 비밀번호 검사
        	{
        		conn.setAutoCommit(false);
        		String sql = "update users set "+ infotype + "=? WHERE user_id=? and user_pwd = ?";
            	ps = conn.prepareStatement(sql);
            	ps.setString(1, newinfo);
            	ps.setString(2, id);
            	ps.setString(3, pw);
            
            	int cnt = ps.executeUpdate();
            
            	if (cnt == 1)
            	{
          	  		out.println("정보가 성공적으로 수정되었습니다.");
          	  		out.println("<br/>");
          	  		conn.commit();
            	}
            	else
            	{
          	  		out.println("정보 수정에 실패했습니다.");
          	  		out.println("<br/>");
            	}
        	}
        	else
        	{
        	out.println("관리자 비밀번호가 올바르지 않습니다.");
        	}
       	}
        else{
       		out.println("관리자 계정이 아닙니다.");
        }
		out.println("<br/>");
	%>
	
	<a href = 'Main.jsp'>메인 페이지</a>
</body>
</html>