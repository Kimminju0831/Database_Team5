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
			String user = "team";
			String pass = "1234";
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
	}

	public int login(String USER_ID, String USER_PWD) {
		String query = "select USER_PWD from USERS where USER_ID = ?";

		// for test
		System.out.println(query);

		try {
			pstmt = conn.prepareStatement(query);

			pstmt.setString(1, USER_ID);
			rs = pstmt.executeQuery();
			// ���̵� �ִ� ���
			if (rs.next()) {
				// ��й�ȣ �˻�
				if (rs.getString(1).equals(USER_PWD)) {
					return 1; // �α��� ����
				} else
					return 0; // �߸��� ��й�ȣ
			}
			return -1; // ���̵� ���� ���

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // �����ͺ��̽� ��ü ����
	}

	public int join(User user) {

		String SQL = "INSERT INTO USERS VALUES (?,?,?,?,?)";
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
		return -1;// DB����
	}

}
