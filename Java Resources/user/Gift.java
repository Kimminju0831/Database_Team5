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
	
	public String productID() {
		
		String ProductID = "";
		int proid;
		Random random = new Random(); //���� ��ü ����(����Ʈ �õ尪 : ����ð�)
        random.setSeed(System.currentTimeMillis()); //�õ尪 ������ ���� �Ҽ��� ����
        
        proid = random.nextInt(8998) + 1001; // 1001���� 9999
        String p = Integer.toString(proid);
        ProductID = p.substring(0,3) + "-" + p.substring(3);
        
		
		return ProductID;
	}
	
	public int refer_to_insert(String nlink, String blink, String UID)
	{
		conn = connect();
		
		int result = 0;
		
		
		String query = "insert into REFER_TO (N_LINK, B_LINK, USR_ID) values ('"+blink + "', '" + nlink + "', '" + UID + "')";
			
		try {
			conn.setAutoCommit(false);
			System.out.println(query);
			
			stmt = conn.createStatement();
			int cnt = stmt.executeUpdate(query);
			if (cnt == 1)
			{
				System.out.println("refer_to insert�� ����");
				conn.commit();
				result = 1;
			}
			else
			{
				System.out.println("refer_to insert�� ����");
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
		
		return result; // �����ͺ��̽� ��ü ����
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
				System.out.println("product insert�� ����");
				conn.commit();
				result = 1;
			}
			else
			{
				System.out.println("product insert�� ����");
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
		
		return result; // �����ͺ��̽� ��ü ����
	}
	
public int make_insert(String nlink, String blink, String check, String userid)
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
				System.out.println("make insert�� ����");
				conn.commit();
				result = refer_to_insert(nlink, blink, userid);
			}
			else
			{
				System.out.println("make insert�� ����");
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

public String[] select_links(String PID, String userid)
{
	conn = connect();
	String[] links = new String[2];
	
	String sql = "SELECT NO_LINK, BE_LINK"
			 + "FROM MAKE WHERE P_I = '"+ PID +"'";
	
	String result = "";
	try {
		System.out.println(sql);
	
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		
		if(rs.next()){
			links[0] = rs.getString(1);
			links[1] = rs.getString(2);
		}
		
		if(links[0].equals("")||links[1].equals(""))
		{
			System.out.println("��ũ ã�� ����");
		}
		else {
			System.out.println("��ũ ã�� ����");
		}
	}
	catch (Exception e) {
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
	
	return links;
	
}

public int delete_refer_to(String PID, String userid)
{
	conn = connect();
	int result = 0;
	
	String[] links = new String[2];//1���� normal link, 2���� better link
	
	
	String query = "delete from refer_to where nlink = '" + links[0] + "' and blink = '" + links[1] + "' and USR_ID = '" + userid + "'";
	
	try {
		conn.setAutoCommit(false);
		System.out.println(query);
		
		stmt = conn.createStatement();
		int cnt = stmt.executeUpdate(query);
		if (cnt == 0)
		{
			System.out.println("refer_to ��� ����");
			
		}
		else if(cnt ==1)
		{
			conn.commit();
			System.out.println("refer_to ��� ����");
			result = delete_order(PID, userid);
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
	
public int delete_product(String PID, String userid)
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
				System.out.println("�ֹ� ��� ����");
				
			}
			else if(cnt ==1)
			{
				conn.commit();
				System.out.println("�ֹ� ��� ����");
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
	
	public int delete_order(String PID, String userid) {
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
				System.out.println("make���� ����");
				
			}
			else if(cnt ==1)
			{
				System.out.println("make ���� �Ϸ�");
				conn.commit();
				result = delete_product(PID, userid);
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