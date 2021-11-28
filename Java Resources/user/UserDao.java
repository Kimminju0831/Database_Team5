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

	public int login(String USER_ID, String USER_PWD, String type) {
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

		String SQL = "INSERT INTO USERS VALUES (?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
	         pstmt.setString(1, user.getUserAddress());
	         pstmt.setString(2, user.getUserPhone());
	         pstmt.setString(3, user.getUserName());
	         pstmt.setString(4, user.getUserPassword());
	         pstmt.setString(5, user.getUserID());


			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;// DB오류
	}

	public int donate(String org_id, String userid , String name) {

		String SQL = "insert into DONATE (O_id, Don_org_name, UD) values ('"
				+ org_id + "' , '" + name  + "' , '" + userid + "')";
		
		System.out.println(SQL);
		
		try {
			pstmt = conn.prepareStatement(SQL);

			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;// DB오류
	}
	
	public int makedonate(String period, String ptype, String btype, String name, String pwd, String userid) {
		
		
		String SQL = "insert into DONATION_ORGANIZATION " +
					"(Donation_period, Donation_type, Beneficiary, Donation_organization_name, org_pwd, org_id) " +
					"values ('"+ period + "', '" + ptype + "', '" + btype +"', '" + name +"', '" + pwd + "', '" + userid + "')";
		
		System.out.println(SQL);
		
		try {
			pstmt = conn.prepareStatement(SQL);

			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;// DB오류
		
	}
	
	public int makedorder(String DELIVERY_CHARGE, String DESIGN, String PRODUCTION_TYPE, String PRODUCTION_PRICE, String ESTIMATED_DATE, String PRODUCT_NUM, 
			String userid, String userpw, String ORGAN_ID, String DO_NAME) {
		
		
		String SQL = "insert into OUTSOURCING_COMPANY" +
				" (Delivery_charge, Design, Production_type, Production_Price, " +
				"Estimated_date, Product_num, Company_pwd, Company_id, Ur_id, " +
				" organ_id, Do_name) values ('$" + DELIVERY_CHARGE + "', '"+ DESIGN +"', '"+ PRODUCTION_TYPE +"', " +
				" '$"+ PRODUCTION_PRICE +"', TO_DATE('"+ ESTIMATED_DATE +"', 'yyyy-mm-dd'), "+ PRODUCT_NUM +", '"+ userpw +"', " +
				"'"+ userid +"', '"+ userid +"', '"+ ORGAN_ID +"', '"+ DO_NAME +"')";
		
		System.out.println(SQL);
		
		try {
			pstmt = conn.prepareStatement(SQL);

			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;// DB오류
		
	}
}
