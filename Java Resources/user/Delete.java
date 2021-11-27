package user;

import java.sql.*;
import java.text.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Delete {

	private Connection conn;
	private Statement pstmt;
	private ResultSet rs;
	
	private static  Delete instance = new  Delete();
	private  Delete() {}
	public static  Delete getInstance() {
		return instance;
	}

	public Connection connect() {
		try {
			String serverIP = "localhost";
			String strSID = "orcl";
			String portNum = "1521";
			String user = "Team";
			String pass = "aaaa";
			String url = "jdbc:oracle:thin:@" + serverIP + ":" + portNum + ":" + strSID;

			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pass);

			System.out.println("Database ���� ����!");
		} catch (ClassNotFoundException e) {
			System.out.println("DB ����̹� �ε� ���� :" + e.toString());
		} catch (SQLException sql) {
			System.out.println("DB ���ӽ��� :" + sql.toString());
		} catch (Exception e) {
			System.out.println("Unkonwn error");
			e.printStackTrace();
		}
		
		return conn;
	}
	
	public int user_delete(String userid, String requestU_id, String password) {
		
		conn = connect();
		
		
		// ��ȯ�� 1 : ������ ���� ���� 2 : ���� ���� ���� 0 : ���� -1 : �н����� Ʋ��
		if(userid.compareTo("admin")==0){ 
			
			// SELECT USER_PWD FROM USERS WHERE USER_ID = 'admin2';
			String sql = "SELECT USER_ID FROM USERS WHERE USER_ID = '"+ requestU_id +"'";
			
			try {
				System.out.println(sql);
				conn.setAutoCommit(false);
				pstmt = conn.createStatement();
				rs = pstmt.executeQuery(sql);
				
				if(rs.next()){
					System.out.println(rs.getString(1));
					System.out.println(password);
					
					sql = "DELETE FROM USERS WHERE USER_ID = '"+ requestU_id +"'";
					try{
						System.out.println(sql);
						pstmt = conn.createStatement();
						int res = pstmt.executeUpdate(sql);
						
						return 1;
					}catch (Exception e){
							e.printStackTrace();
					}	
				}else{
					System.out.println("�������� �ʴ� �����Դϴ�!");
					return 0;
				}
			}
			catch (Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if (rs != null)
						rs.close();
					if (pstmt != null)
						pstmt.close();
					if (conn != null)
						conn.close();
				} catch (Exception e) {
					e.getStackTrace();
				}
			}
		}else{
				// SELECT USER_PWD FROM USERS WHERE USER_ID = 'admin2';
			String sql = "SELECT USER_PWD FROM USERS WHERE USER_ID = '"+ userid+"'";
				
				
				try {
					System.out.println(sql);
					conn.setAutoCommit(false);
					pstmt = conn.createStatement();
					rs = pstmt.executeQuery(sql);
					
					if(rs.next()){
						System.out.println(rs.getString(1));
						System.out.println(password);
						if(rs.getString(1).compareTo(password)==0){
							
							sql = "DELETE FROM USERS WHERE USER_ID = '"+userid+"'";
							
							try{
								System.out.println(sql);
								pstmt = conn.createStatement();
								int res = pstmt.executeUpdate(sql);
								if(res == 0){
									System.out.println("ȸ�� Ż�� �����߽��ϴ�!");
								}else{
									System.out.println("ȸ�� Ż�� �����߽��ϴ�. ������ �� ������!");
									conn.commit();
									
									return 2; // ���� ����
								}
											
							}catch (Exception e){
								e.printStackTrace();
							}
						}else {
							return -1;
						}
						
					}
					
					}
					catch (Exception e) {
						e.printStackTrace();
					}finally {
						try {
							if (rs != null)
								rs.close();
							if (pstmt != null)
								pstmt.close();
							if (conn != null)
								conn.close();
						} catch (Exception e) {
							e.getStackTrace();
						}
					}
			}
		

		return 0;
		
	}
	
	public int donate_delete(String orgid, String userid) {
		
		conn = connect();
		
		
		// ��ȯ�� 1 : ������ ���� ���� 2 : ���� ���� ���� 0 : ���� -1 : �н����� Ʋ��
		
			// DELETE FROM DONATE WHERE UD = 'admin' AND O_ID = '251-87-6136';
			String sql = "DELETE FROM DONATE WHERE UD = '" + userid + "' AND O_ID = '" 
					+ orgid + "'";
				
				
				try {
					System.out.println(sql);
					conn.setAutoCommit(false);
					pstmt = conn.createStatement();
					int res = pstmt.executeUpdate(sql);
					
					return 1; // ����
					}
				catch (Exception e) {
					e.printStackTrace();
				}finally {
					try {
						if (rs != null)
							rs.close();
						if (pstmt != null)
							pstmt.close();
						if (conn != null)
							conn.close();
						} catch (Exception e) {
							e.getStackTrace();
						}
					}
				return 0;
		
	}
}
