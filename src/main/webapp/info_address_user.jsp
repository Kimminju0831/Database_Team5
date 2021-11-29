<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language = "java" import="java.text.*, java.sql.*" %>
<%@ page import="user.mac"%> 
<%@ page import="user.window"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 사용자 주소 변경</title>
</head>
<body>
	
	<%
	PreparedStatement ps;
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs;
	
	window con = window.getInstance();
	
	conn = con.connect();
	
	stmt = conn.createStatement();
	
	request.setCharacterEncoding("UTF-8");
	String newaddr = request.getParameter("newaddr");
	String pw = request.getParameter("pw");
	String myid = request.getParameter("myid");
	
	
		int repeat = 0;
		out.println("------ 주소 변경 결과 ------ <br/><br/>");
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
            		String sql = "update users set address=? WHERE user_id=?";
                    	ps = conn.prepareStatement(sql);
                    	ps.setString(1, newaddr);
                    	ps.setString(2, myid);
                    
                    	int cnt = ps.executeUpdate();
                    
                    	if (cnt == 1)
                    	{
                  	  		out.println("주소가 성공적으로 바뀌었습니다.");
                  	  		out.println("<br/>");
                    	}
                    	else
                    	{
                  	  		out.println("주소를 바꾸는데 실패했습니다.");
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