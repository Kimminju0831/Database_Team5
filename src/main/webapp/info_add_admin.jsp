<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language = "java" import="java.text.*, java.sql.*" %>
<%@	page import="java.time.LocalDate" %>
<%@ page import="user.mac"%> 
<%@ page import="user.window"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 권한 사용자 추가</title>
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


	%>
	
	<%
		request.setCharacterEncoding("UTF-8");
		String adminid = request.getParameter("adminid");
		String adminpw = request.getParameter("adminpw");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String addr = request.getParameter("addr");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String D_preference = request.getParameter("D_preference");
		String D_period = request.getParameter("D_period");
		String gift = request.getParameter("gift");
		
		String gift_type = request.getParameter("gift_type");
		
		LocalDate now = LocalDate.now();
		
		
	%>
	
	<%
		int repeat = 0;
		out.println("------ 관리자 권한 사용자 가입 결과 ------ <br/><br/>");
	 	String check_sql = "select user_id from users WHERE user_id='"+ adminid + "'";
     	String check_id = "";
        rs = stmt.executeQuery(check_sql);
        while(rs.next()) {
      	  check_id = rs.getString(1);
       	}
        
        if(check_id.equals("000-00-0000"))
        {
        	String check_pw_sql = "select user_pwd from users WHERE user_id= '"+ check_id +"'";
			String check_pwd = "";
        	rs = stmt.executeQuery(check_pw_sql);
        	while(rs.next()) {
     	   	check_pwd = rs.getString(1);
        	}
        
        
        	if(check_pwd.equals("admin"))
        	{
        		//아이디 중복체크
        		String check = "select user_id from users";
        		ps = conn.prepareStatement(check);
        		rs = ps.executeQuery();
        		while(rs.next()){
        			if(rs.getString(1).equals(id)){
        				repeat = 1;
        			}
        		}
        		if(repeat == 1)
        		{
        			out.println("동일한 아이디가 존재합니다. 다른 아이디로 가입을 도와주세요.");
        			out.println("<br/>");
        		}
        		else if(repeat == 0)
        		{	
        			conn.setAutoCommit(false);
        			String add = "insert into USERS (ADDRESS, PHONE, NAME, USER_PWD, USER_ID) values " + "('" + addr + "', '" + phone
                            + "', '" + name + "', '" + pw + "', '" + id + "')";
        			int cnt = stmt.executeUpdate(add);
        			if (cnt == 1)
                	{
              	  		out.println("성공적으로 가입되었습니다.");
              	  		out.println("<br/>");
              	  		
              	  		String sql = "insert into DONATION_PREFERENCE (DONATION_TYPE, BENEFICIARY, U_ID, DUSER_ID) "+
              				"values ('"+ D_period + "', '" + D_preference + "', '" + id + "', '" + id + "') ";
              	  		int result = stmt.executeUpdate(sql);
              	  		if(result == 1)
              	  		{
              	  			sql = "insert into PREFERENCE (Product_name, R_Date, Product_type, Us_id) values ('" + gift_type + "', TO_DATE('" + now + "', 'yyyy-mm-dd'), '" + gift + "', '" + id + "')";
              	  			int pre = stmt.executeUpdate(sql);
              	  			if(pre == 1)
              	  			{
              	  				out.println("기부취향, 선물 취향이 성공적으로 등록되었습니다. ");
              	  				out.println("<br/>");
              	  				conn.commit();
              	  			}
              	  			else{
              	  				out.println("취향 등록에 실패했습니다. ");
              	  			}
              	  		}
              	  		else{
              	  			out.println("취향 등록에 실패했습니다. ");
              	  		}
                	}
                	else
                	{
              	  		out.println("가입에 실패하였습니다. ");
              	  		out.println("<br/>");
                	}
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