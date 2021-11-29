<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language = "java" import="java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 사용자 이름 변경</title>
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
		String newphone = request.getParameter("newphone");
		String pw = request.getParameter("pw");
		String myid = request.getParameter("myid");
	%>
	
	<%
		int repeat = 0;
		out.println("------ 전화번호 변경 결과 ------ <br/><br/>");
	 	String check_sql = "select user_id from users WHERE user_id='"+ myid + "'";
     	String check_id = "";
        rs = stmt.executeQuery(check_sql);
        while(rs.next()) {
      	  check_id = rs.getString(1);
       	}
        
        if(check_id.equals(""))
        {
        	out.println("존재하지 않는 아이디입니다.");
        }
        
        else{
       		String check_pw_sql = "select user_pwd from users WHERE user_id= '"+ myid +"'";
			String check_pwd = "";
        	rs = stmt.executeQuery(check_pw_sql);
        	while(rs.next()) {
     	   	check_pwd = rs.getString(1);
        	}
        
        
        	if(check_pwd.equals(pw))//비밀번호 같다
        	{
            		String sql = "update users set phone=? WHERE user_id=?";
                    	ps = conn.prepareStatement(sql);
                    	ps.setString(1, newphone);
                    	ps.setString(2, myid);
                    
                    	int cnt = ps.executeUpdate();
                    
                    	if (cnt == 1)
                    	{
                  	  		out.println("전화번호가 성공적으로 바뀌었습니다.");
                  	  		out.println("<br/>");
                    	}
                    	else
                    	{
                  	  		out.println("전화번호를 바꾸는데 실패했습니다.");
                  	  		out.println("<br/>");
                    	}
       	 	}
        	else{
        		out.println("비밀번호가 일치하지 않습니다.");
        	}
        }
		out.println("<br/>");
	%>
	<br /> <br />
	<a href = 'Main.jsp'>메인 페이지</a>
	<a href = 'Mypage.jsp'>정보 수정 페이지</a>
</body>
</html>