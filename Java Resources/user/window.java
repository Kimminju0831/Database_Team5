package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class window {
	
	private Connection conn;
	private Statement stmt;
	private ResultSet rs;
	
	private static window instance = new window();
	private window() {}
	public static window getInstance() {
		return instance;
	}
	
	private String d_type;
	private String b_type;
	
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
}
