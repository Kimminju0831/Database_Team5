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
						out.println("ȸ�� ������ �����߽��ϴ�!");
					}else{
						out.println("ȸ�� ������ �����߽��ϴ�.");
						conn.commit();
					}
								
				}catch (Exception e){
						e.printStackTrace();
				}	
			}else{
				out.println("�������� �ʴ� �����Դϴ�!");
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
						out.println("��й�ȣ�� ��ġ�մϴ�.");
						sql = "DELETE FROM USERS WHERE USER_ID = '"+userid+"'";
						
						try{
							System.out.println(sql);
							stmt = conn.createStatement();
							int res = stmt.executeUpdate(sql);
							if(res == 0){
								System.out.println("ȸ�� Ż�� �����߽��ϴ�!");
							}else{
								System.out.println("ȸ�� Ż�� �����߽��ϴ�. ������ �� ������!");
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
<a href = 'Main.jsp'>���� ��������</a>
</body>
</html>