package user;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class mac {

	private Connection conn;
	private Statement stmt;
	private ResultSet rs;
	
	private static mac instance = new mac();
	private mac() {}
	public static mac getInstance() {
		return instance;
	}
	
	private String d_type;
	private String b_type;
	
	public Connection connect() {
		try {
		
			
			String serverIP = "localhost";
			String strSID = "xe";
			String portNum = "1600";
			String User = "ta";
			String pass = "ta";
			String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
			
			Connection conn = null;
			Statement stmt = null;
			
			PreparedStatement ps;
			ResultSet rs;
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, User, pass);

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
	
}
	
	