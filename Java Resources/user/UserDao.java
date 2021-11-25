package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public UserDao() {
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
	}

	public int login(String USER_ID, String USER_PWD) {
		String query = "select USER_PWD from USERS where USER_ID = '" + USER_ID + "'";
		
		try {
			pstmt = conn.prepareStatement(query);

			System.out.println(query);
			
			rs = pstmt.executeQuery();
			// 아이디가 있는 경우
			if (rs.next()) {
				// 비밀번호 검사
				if (rs.getString(1).equals(USER_PWD)) {
					return 1; // 로그인 성공
				} else
					return 0; // 잘못된 비밀번호
			}
			return -1; // 아이디가 없는 경우

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // 데이터베이스 자체 오류
	}

	public int join(User user) {

		String SQL = "INSERT INTO USERS VALUES (?,?,?,?,?) commit";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserAddress());
			pstmt.setString(5, user.getUserPhone());
			
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;// DB오류
	}

}
