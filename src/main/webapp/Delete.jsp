<%@page import="user.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- import JDBC package -->
<%@ page language = "java" import = "java.text.*, java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Delete page</title>
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
	
	request.setCharacterEncoding("UTF-8");
	
	String userid = "";
	String Password = request.getParameter("D_password");
	userid = (String)session.getAttribute("userID");
	
	if(userid.compareTo("admin")==0){
		
		String requestU_id = request.getParameter("request_user");
		
		// SELECT USER_PWD FROM USERS WHERE USER_ID = 'admin2';
		sql = "SELECT USER_ID FROM USERS WHERE USER_ID = '"+ requestU_id +"'";
		
		try {
			System.out.println(sql);
		
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()){
				System.out.println(rs.getString(1));
				System.out.println(Password);
				
				sql = "DELETE FROM USERS WHERE USER_ID = '"+ requestU_id +"'";
				try{
					System.out.println(sql);
					stmt = conn.createStatement();
					int res = stmt.executeUpdate(sql);
					if(res == 0){
						out.println("회원 삭제에 실패했습니다!");
					}else{
						out.println("회원 삭제에 성공했습니다.");
						conn.commit();
					}
								
				}catch (Exception e){
						e.printStackTrace();
				}	
			}else{
				out.println("존재하지 않는 유저입니다!");
			}
			
			//out.println("<p>" + donation_t + " " + beneficiary+ "</p>")
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
	}else{
			// SELECT USER_PWD FROM USERS WHERE USER_ID = 'admin2';
			sql = "SELECT USER_PWD FROM USERS WHERE USER_ID = '"+ userid+"'";
			
			
			try {
				System.out.println(sql);
			
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				
				if(rs.next()){
					System.out.println(rs.getString(1));
					System.out.println(Password);
					if(rs.getString(1).compareTo(Password)==0){
						out.println("비밀번호가 일치합니다.");
						sql = "DELETE FROM USERS WHERE USER_ID = '"+userid+"'";
						
						try{
							System.out.println(sql);
							stmt = conn.createStatement();
							int res = stmt.executeUpdate(sql);
							if(res == 0){
								System.out.println("회원 탈퇴에 실패했습니다!");
							}else{
								System.out.println("회원 탈퇴에 성공했습니다. 다음에 또 만나요!");
								conn.commit();
								
								session.setAttribute("userID", null);
								session.setAttribute("userPW", null);
							}
										
						}catch (Exception e){
							e.printStackTrace();
						}
					}
					
				}
				
				//out.println("<p>" + donation_t + " " + beneficiary+ "</p>")
				
			}
			catch (Exception e) {
				e.printStackTrace();
			}
	}
	
	
	
	rs.close();
	conn.close();
	

%>
<a href = 'Main.jsp'>메인 페이지로</a>
</body>
</html>