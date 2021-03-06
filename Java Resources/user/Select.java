package user;

import java.sql.*;


public class Select {

	private Connection conn;
	private Statement pstmt;
	private ResultSet rs;
	
	private static Select instance = new Select();
	private Select() {}
	public static Select getInstance() {
		return instance;
	}

	public Connection connect() {
		try {
		
			String serverIP = "localhost";
			String strSID = "orcl";
			String portNum = "1521";
			String user = "team";
			String pass = "1234";
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
	
	public String my_donation (String userid) {
		
		conn = connect();
		
		String query = "SELECT donation_type, beneficiary "
				 + "FROM donation_preference WHERE u_id = '"+ userid +"'";
		
		String result = "";

		try {
			System.out.println(query);
			
			pstmt = conn.createStatement();
			rs = pstmt.executeQuery(query);
			
			if(rs.next()){
				System.out.println(rs.getString(1));
				System.out.println(rs.getString(2));
			}
			
				result = "<p>"+ userid+ "님의 기부 취향은 " +
						rs.getString(1) + " " + rs.getString(2) + "</p>";

		} catch (Exception e) {
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
		
		return result; // 데이터베이스 자체 오류
	}
	
	public ExBoardDTO donation_content (String userid) {
			
			conn = connect();
			
			String query = "SELECT * FROM DONATION_ORGANIZATION WHERE ORG_ID = '"+ userid +"'";
			
			ExBoardDTO result = new ExBoardDTO();
	
			try {
				System.out.println(query);

				pstmt = conn.createStatement();
				rs = pstmt.executeQuery(query);
				
				if(rs.next()){
					result.setid(rs.getString(6));
					result.setip(rs.getString(1));
					result.settitle(rs.getString(4));
					result.setcontent(rs.getString(3));
					result.setpw(rs.getString(2));
				}
	
			} catch (Exception e) {
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
			
			return result; // 데이터베이스 자체 오류
		}
	
	public String my_present (String userid) {
		
		conn = connect();
			
		String sql = "SELECT product_type, product_name "
				 + "FROM preference WHERE us_id = '"+ userid +"'";
		
		String result = "";
		try {
			System.out.println(sql);
		
			pstmt = conn.createStatement();
			rs = pstmt.executeQuery(sql);
			
			if(rs.next()){
				System.out.println(rs.getString(1));
				System.out.println(rs.getString(2));
				
				
			}
			
			result = "<p>"+ userid+ "님의 선물 취향은 " +
				rs.getString(1) + " " + rs.getString(2) + "</p>";
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
		
		return result; // 데이터베이스 자체 오류
	}
	
	
}
