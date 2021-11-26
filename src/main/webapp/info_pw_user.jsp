<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language = "java" import="java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
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
		String myid = request.getParameter("myid");
		String oldpw = request.getParameter("oldpw");
		String newpw = request.getParameter("newpw");
		String renewpw = request.getParameter("renewpw");
	%>
	
	<%
		out.println("------ 비밀번호 변경 결과 ------ <br/><br/>");
		String check_sql = "select user_pwd from users WHERE user_id= '"+ myid +"'";
		String check_pwd = "";
        rs = stmt.executeQuery(check_sql);
        while(rs.next()) {
     	   check_pwd = rs.getString(1);
        }
        
        if(check_pwd.equals(""))
        {
        	out.println("존재하지 않는 아이디입니다.");
        }
        
        else{
        	if(check_pwd.equals(oldpw))
        	{
        		if(newpw.equals(renewpw))
        		{
        			out.println("기존 비밀번호가 일치합니다.");
        			out.println("<br/>");
        			out.println("비밀번호를 변경하겠습니다. ");
        			out.println("<br/>");
        			String sql = "update users set user_pwd=? WHERE user_id=?";
                	ps = conn.prepareStatement(sql);
               		ps.setString(1, newpw);
                	ps.setString(2, myid);
                	int cnt = ps.executeUpdate();
                	if (cnt == 1)
                   		out.println("비밀번호가 성공적으로 바뀌었습니다.");
                	else
                   		out.println("비밀번호를 바꾸는데 실패했습니다.");
        		}
        		else
        		{
        			out.println("새로운 비밀번호를 다시 확인해주세요.");
        		}
        	}
        	else{
        		out.println("기존 비밀번호가 일치하지 않습니다.");
        	}
        }
       
		out.println("<br/>");
	%>
</body>
</html>