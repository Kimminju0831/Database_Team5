package user;

import java.sql.*;
import java.text.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DAO {

	private Connection conn;
	private Statement pstmt;
	private ResultSet rs;
	
	private static DAO instance = new DAO();
	private DAO() {}
	public static DAO getInstance() {
		return instance;
	}
	
	private String d_type;
	private String b_type;
	
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

			System.out.println("Database 연결 성공!");
		} catch (ClassNotFoundException e) {
			System.out.println("DB 드라이버 로딩 실패 :" + e.toString());
		} catch (SQLException sql) {
			System.out.println("DB 접속실패 :" + sql.toString());
		} catch (Exception e) {
			System.out.println("Unkonwn error");
			e.printStackTrace();
		}
		
		return conn;
	}
	
	public void set_user_D_Pre(String userid) {
		
		conn = connect();
		
		String result = "";
		
		String SQL = "SELECT DONATION_TYPE, BENEFICIARY FROM DONATION_PREFERENCE "
				+ "WHERE U_ID = '" + userid +  "'";
		
		try {
			
			pstmt = conn.createStatement();
			
			rs = pstmt.executeQuery(SQL);
			
			if(rs.next()) {
				this.d_type = rs.getString(1);
				this.b_type = rs.getString(2);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
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
	

	public List<ExBoardDTO> getList() {
		
		conn = connect();
		
		String SQL = "SELECT * FROM DONATION_ORGANIZATION ORDER BY ORG_ID DESC";
		List<ExBoardDTO> list = null;
		
		try {
			pstmt = conn.createStatement();
			
			rs = pstmt.executeQuery(SQL);
			
			int num = 1;
			
			if(rs.next()) {
				list = new ArrayList<>();
				do {
					ExBoardDTO paper = new ExBoardDTO();
					paper.setn(num);
					paper.setip(rs.getString(2));
					paper.setcontent(rs.getString(3));
					paper.settitle(rs.getString(4));
					paper.setid(rs.getString(6));
					num++;
					
					System.out.println("처리중");
					System.out.println(paper);
					list.add(paper);
				}while(rs.next());
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
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
		
		return list;
	}
	
	public List<ExBoardDTO> getList_best(String userid) {
		
		set_user_D_Pre(userid);
		
		
		conn = connect();
		
		String SQL = "SELECT * FROM DONATION_ORGANIZATION WHERE BENEFICIARY = '"
				+b_type + "' AND DONATION_TYPE = '"+ d_type + "'";
		
		System.out.println(SQL);
		
		List<ExBoardDTO> list = null;
		
		try {
			pstmt = conn.createStatement();
			
			rs = pstmt.executeQuery(SQL);
			
			int num = 1;
			
			if(rs.next()) {
				list = new ArrayList<>();
				do {
					ExBoardDTO paper = new ExBoardDTO();
					paper.setn(num);
					paper.setip(rs.getString(2));
					paper.setcontent(rs.getString(3));
					paper.settitle(rs.getString(4));
					paper.setid(rs.getString(6));
					num++;
					
					System.out.println("처리중");
					System.out.println(paper);
					list.add(paper);
				}while(rs.next());
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
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
		
		return list;
	}
	
	public List<ExBoardDTO> getList_bene(String userid) {
		
		set_user_D_Pre(userid);
		
		
		conn = connect();
		
		String SQL = "SELECT * FROM DONATION_ORGANIZATION WHERE BENEFICIARY = '"
				+b_type + "'";
		
		System.out.println(SQL);
		
		List<ExBoardDTO> list = null;
		
		try {
			pstmt = conn.createStatement();
			
			rs = pstmt.executeQuery(SQL);
			
			int num = 1;
			
			if(rs.next()) {
				list = new ArrayList<>();
				do {
					ExBoardDTO paper = new ExBoardDTO();
					paper.setn(num);
					paper.setip(rs.getString(2));
					paper.setcontent(rs.getString(3));
					paper.settitle(rs.getString(4));
					paper.setid(rs.getString(6));
					num++;
					
					System.out.println("처리중");
					System.out.println(paper);
					list.add(paper);
				}while(rs.next());
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
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
		
		return list;
	}
	
	public List<ExBoardDTO> getList_period(String userid) {
		
		set_user_D_Pre(userid);
		
		
		conn = connect();
		
		String SQL = "SELECT * FROM DONATION_ORGANIZATION WHERE DONATION_TYPE = '"
				+ d_type + "'";
		
		System.out.println(SQL);
		
		List<ExBoardDTO> list = null;
		
		try {
			pstmt = conn.createStatement();
			
			rs = pstmt.executeQuery(SQL);
			
			int num = 1;
			
			if(rs.next()) {
				list = new ArrayList<>();
				do {
					ExBoardDTO paper = new ExBoardDTO();
					paper.setn(num);
					paper.setip(rs.getString(2));
					paper.setcontent(rs.getString(3));
					paper.settitle(rs.getString(4));
					paper.setid(rs.getString(6));
					num++;
					
					System.out.println("처리중");
					System.out.println(paper);
					list.add(paper);
				}while(rs.next());
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
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
		
		return list;
	}
	
	public int get_data_num() {
		int num = 1;
		
		conn = connect();
		
		String SQL = "SELECT COUNT(*) FROM DONATION_ORGANIZATION ORDER BY ORG_ID DESC";
		List<ExBoardDTO> list = null;
		
		try {
			pstmt = conn.createStatement();
			
			rs = pstmt.executeQuery(SQL);
			
			if(rs.next()) {
				num = Integer.parseInt(rs.getString(1));
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
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
		
		return num;
	}
	

}
