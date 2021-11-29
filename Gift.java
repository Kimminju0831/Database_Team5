package user;

import java.sql.*;
import java.util.Random;
import java.text.DecimalFormat;


public class Gift {

	private Connection conn;
	private Statement stmt;
	private ResultSet rs;
	private String PID = "";
	
	private static Gift instance = new Gift();
	private Gift() {}
	public static Gift getInstance() {
		return instance;
	}

	public Connection connect() {
		try {
			String serverIP = "localhost";
			String strSID = "xe";
			String portNum = "1600";
			String user = "ta";
			String pass = "ta";
			String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;

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
	
	public String productID() {
		
		String ProductID = "";
		int proid;
		Random random = new Random(); //랜덤 객체 생성(디폴트 시드값 : 현재시간)
        random.setSeed(System.currentTimeMillis()); //시드값 설정을 따로 할수도 있음
        
        proid = random.nextInt(8998) + 1001; // 1001부터 9999
        String p = Integer.toString(proid);
        ProductID = p.substring(0,3) + "-" + p.substring(3);
        
		
		return ProductID;
	}
	
	public int product_insert(String quantity, String protype, String price, String userid) throws SQLException {
		
		conn = connect();
		
		PID = productID();
		int result = 0;
		
		conn.setAutoCommit(false);
		String query = "insert into Product (Product_ID, quantity, Product_name, Price, UIDN) values ('" + PID +"', " + quantity +", '" + protype + "', '$" + Double.parseDouble(price) + "', '" + userid + "')";
		

		try {
			System.out.println(query);
			
			stmt = conn.createStatement();
			int cnt = stmt.executeUpdate(query);
			if (cnt == 1)
			{
				System.out.println("product insert문 성공");
				conn.commit();
				result = 1;
			}
			else
			{
				System.out.println("product insert문 실패");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.getStackTrace();
			}
		}
		
		return result; // 데이터베이스 자체 오류
	}
	
	public int make_insert(String nlink, String blink, String check)
	{
		conn = connect();
		int result = 0;
		
		String query = "insert into MAKE (NO_LINK, BE_LINK, P_I, CHECKC) values ('" + blink +"', '" + nlink + "', '" +PID+ "', '" + check + "')";
		
		try {
			conn.setAutoCommit(false);
			System.out.println(query);
			
			stmt = conn.createStatement();
			int cnt = stmt.executeUpdate(query);
			if (cnt == 1)
			{
				System.out.println("make insert문 성공");
				conn.commit();
				result = 1;
			}
			else
			{
				System.out.println("make insert문 실패");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.getStackTrace();
			}
		}
		
		
		return result;
	}
	
	public int delete_product(String PID)
	{
		conn = connect();
		int result = 0;
		
		
		String query = "delete from Product where Product_id = '" + PID + "'";
		try {
			conn.setAutoCommit(false);
			System.out.println(query);
			
			stmt = conn.createStatement();
			int cnt = stmt.executeUpdate(query);
			if (cnt == 0)
			{
				System.out.println("주문 취소 실패");
				
			}
			else if(cnt ==1)
			{
				conn.commit();
				System.out.println("주문 취소 성공");
				result = 1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.getStackTrace();
			}
		}
		return result;
	}
	
	public int delete_order(String PID) {
		conn = connect();
		int result = 0;
		
		
		String query = "delete from make where p_i = '"+PID + "'";
		try {
			conn.setAutoCommit(false);
			System.out.println(query);
			
			stmt = conn.createStatement();
			int cnt = stmt.executeUpdate(query);
			if (cnt == 0)
			{
				System.out.println("make삭제 실패");
				
			}
			else if(cnt ==1)
			{
				System.out.println("make 삭제 완료");
				conn.commit();
				result = delete_product(PID);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.getStackTrace();
			}
		}
		return result;
	}
}