<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language = "java" import="java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 변경</title>
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
		String oldid = request.getParameter("oldid");
		String pw = request.getParameter("pw");
		String newid = request.getParameter("newid");
	%>
	
	<%
		int repeat = 0;
		out.println("------ 아이디 변경 결과 ------ <br/><br/>");
	 	String check_sql = "select user_id from users WHERE user_id='"+ oldid + "'";
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
       		String check_pw_sql = "select user_pwd from users WHERE user_id= '"+ oldid +"'";
			String check_pwd = "";
        	rs = stmt.executeQuery(check_pw_sql);
        	while(rs.next()) {
     	   	check_pwd = rs.getString(1);
        	}
        
        
        	if(check_id.equals(oldid))
        	{
        		if(check_pwd.equals(pw))
        		{
        			//아이디 중복체크
        			String check = "select user_id from users";
        			ps = conn.prepareStatement(check);
        			rs = ps.executeQuery();
        			while(rs.next()){
        				if(rs.getString(1).equals(newid)){
        					repeat = 1;
        				}
        			}
        			if(repeat == 1)
        			{
        				out.println("동일한 아이디가 존재합니다. 다른 아이디로 변경해주세요.");
        				out.println("<br/>");
        			}
        			else if(repeat == 0)
        			{
        				out.println("변경이 가능한 아이디입니다.");
        				out.println("<br/>");
            			out.println("아이디를 변경하겠습니다. ");
            			out.println("<br/>");
            			String sql = "update users set user_id=? WHERE user_id=?";
                    	ps = conn.prepareStatement(sql);
                    	ps.setString(1, newid);
                    	ps.setString(2, oldid);
                    
                    	int cnt = ps.executeUpdate();
                    
                    	if (cnt == 1)
                    	{
                  	  		out.println("아이디가 성공적으로 바뀌었습니다.");
                  	  		out.println("<br/>");
                    	}
                    	else
                    	{
                  	  		out.println("아이디를 바꾸는데 실패했습니다.");
                  	  		out.println("<br/>");
                    	}
        			}
        		}
        		else
        		{
        			out.println("비밀번호가 올바르지 않습니다.");
        		}
       	 	}
        	else{
        		out.println("기존 아이디가 일치하지 않습니다.");
        	}
        }
		out.println("<br/>");
	%>
</body>
</html>