package user;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

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
		
		return conn;
	}
	
	
	//��� ������ / ��� ������ userid �� ���� ��������
	public void set_user_D_Pre(String userid) {
		
		conn = connect();
		
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
	
	// ��ü ��ϵ� ��� ��� ��������
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
	
	// ��ϵ� ��� ����� ������ / Ÿ�� �´� �͸� ��������
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
	
	// ��ϵ� ��� ����� ������ �������� ��������
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
	
	// ��ϵ� ��� ����� �Ⱓ �������� ��������
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
	
	// ��� ��ü�� ��� �Ǿ��ִ��� Ȯ�� �� �ִٸ� ��δ�ü���� ��ȯ
		public String get_donate_org(String userid) {
			
			conn = connect();
			
			String SQL = "SELECT DONATION_ORGANIZATION_NAME FROM DONATION_ORGANIZATION WHERE ORG_ID = '"
					+ userid + "'";
			
			System.out.println(SQL);
			
			try {
				pstmt = conn.createStatement();
				
				rs = pstmt.executeQuery(SQL);
				
				if(rs.next()) {
					
					do {
						
						return rs.getString(1);
						
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
			
			return null;
		}
	
	public  List<DonateDTO> contain_donate (String userid) {
	// �ش� ����ڰ� ��θ� ������ ��ü ����Ʈ�� ��ȯ��.
		
		conn = connect();
		
		String SQL = "SELECT * FROM DONATE WHERE UD = '" + userid + "'";
		 
		System.out.println(SQL);
		
		List<DonateDTO> list = null;
		
		try {
			pstmt = conn.createStatement();
			
			rs = pstmt.executeQuery(SQL);
			
			int num = 1;
			
			if(rs.next()) {
				list = new ArrayList<>();
				do {
					DonateDTO paper = new DonateDTO();
					paper.setn(num);
					paper.setorgid(rs.getString(1));
					paper.setorgname(rs.getString(2));
					paper.setuid(rs.getString(3));
					num++;
					
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
	
	public List<DonateDTO> getList_donate(String userid) {
		// �ش� ��� ��ü (userid) �� ����ϱ�� �� ����� ����Ʈ�� ��ȯ��
			conn = connect();
			
			String SQL = "SELECT * FROM DONATE WHERE O_ID = '"
					+ userid + "'";
			
			System.out.println(SQL);
			
			List<DonateDTO> list = null;
			
			try {
				pstmt = conn.createStatement();
				
				rs = pstmt.executeQuery(SQL);
				
				int num = 1;
				
				if(rs.next()) {
					list = new ArrayList<>();
					do {
						DonateDTO paper = new DonateDTO();
						paper.setn(num);
						paper.setorgid(userid);
						paper.setorgname(rs.getString(2));
						paper.setuid(rs.getString(3));
						num++;
						
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
	
	public List<OrderDTO> getList_orderlist(String companyid, String companypw) {
		// �ƿ��ҽ� ����� ���� �ֹ� ����� ������
			conn = connect();
			
			String SQL = "SELECT * "
					+ "FROM OUTSOURCING_COMPANY WHERE COMPANY_ID = '"+ companyid +"'";
			
			System.out.println(SQL);
			
			List<OrderDTO> list = null;
			
			try {
				pstmt = conn.createStatement();
				
				rs = pstmt.executeQuery(SQL);
				
				int num = 1;
				
				if(rs.next()) {
					list = new ArrayList<>();
					do {
						OrderDTO paper = new OrderDTO();
						paper.setn(num);
						paper.setCOMPANY_ID(companyid);
						paper.setCOMPANY_PWD(companypw);
						//
						paper.setDELIVERY_CHARGE(rs.getString(1));
						paper.setDESIGN(rs.getString(2));
						paper.setDO_NAME(rs.getString(10));
						String date = rs.getString(5).substring(0, 10);
						paper.setESTIMATED_DATE(date);
						paper.setPRODUCT_NUM(rs.getString(6));
						paper.setPRODUCTION_PRICE(rs.getString(4));
						paper.setPRODUCTION_TYPE(rs.getString(3));
						paper.setORGAN_ID(rs.getString(9));
						
						num++;
						
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
	
	public List<OrderDTO> getList_orderuser(String userid, String companypw) {
		// �ƿ��ҽ� ����� ���� �ֹ� ����� ������
			conn = connect();
			
			String SQL = "SELECT * "
					+ "FROM OUTSOURCING_COMPANY WHERE ORGAN_ID = '"+ userid +"'";
			
			System.out.println(SQL);
			
			List<OrderDTO> list = null;
			
			try {
				pstmt = conn.createStatement();
				
				rs = pstmt.executeQuery(SQL);
				
				int num = 1;
				
				if(rs.next()) {
					list = new ArrayList<>();
					do {
						OrderDTO paper = new OrderDTO();
						paper.setn(num);
						paper.setCOMPANY_ID(rs.getString(8));
						paper.setCOMPANY_PWD(companypw);
						//
						paper.setDELIVERY_CHARGE(rs.getString(1));
						paper.setDESIGN(rs.getString(2));
						paper.setDO_NAME(rs.getString(10));
						String date = rs.getString(5).substring(0, 10);
						paper.setESTIMATED_DATE(date);
						paper.setPRODUCT_NUM(rs.getString(6));
						paper.setPRODUCTION_PRICE(rs.getString(4));
						paper.setPRODUCTION_TYPE(rs.getString(3));
						paper.setORGAN_ID(rs.getString(9));
						
						num++;
						
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
	
	public int out_contain(String userid) {
		// �ƿ��ҽ� ���̺� ��ϵǾ��ִ��� �˻�
			conn = connect();
			
			String SQL = "SELECT * "
					+ "FROM OUTSOURCING_COMPANY WHERE COMPANY_ID = '"+ userid +"'";
			
			System.out.println(SQL);
			
			try {
				pstmt = conn.createStatement();
				
				rs = pstmt.executeQuery(SQL);

				while (rs.next()) {
					
					return 1;
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
			
			return 0;
		}
	
	public List<OrderDTO> getList_outSourcing() {
		// �����ϴ� ��� �ƿ��ҽ� ����� �̸��� ��ȯ��
			conn = connect();
			
			String SQL = "SELECT DISTINCT COMPANY_ID FROM OUTSOURCING_COMPANY";
			
			System.out.println(SQL);
			
			List<OrderDTO> list = null;
			
			try {
				pstmt = conn.createStatement();
				
				rs = pstmt.executeQuery(SQL);
				
				int num = 1;
				
				if(rs.next()) {
					list = new ArrayList<>();
					do {
						OrderDTO paper = new OrderDTO();
						paper.setn(num);
						paper.setCOMPANY_ID(rs.getString(1));
						num++;
						
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
	
	public User getList_user(String userid) {
	// ���� ��ȭ��ȣ / �ּ� / �̸� / ���̵� ��ȯ��
		
		conn = connect();
		
		String SQL = "SELECT * FROM USERS WHERE USER_ID = '"
				+ userid + "'";
		
		System.out.println(SQL);
		
		
		User user = new User();
		try {
			pstmt = conn.createStatement();
			
			rs = pstmt.executeQuery(SQL);
			
			if(rs.next()) {
				
				do {

					user.setUserID(rs.getString(5));
					user.setUserName(rs.getString(3));
					user.setUserPhone(rs.getString(2));
					user.setUserAddress(rs.getString(1));

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
		
		return user;
	}
	
	public int get_data_num() {
	// ��ϵ� ��� ��� ������ ��ȯ��
		
		int num = 1;
		
		conn = connect();
		
		String SQL = "SELECT COUNT(*) FROM DONATION_ORGANIZATION ORDER BY ORG_ID DESC";
	
		
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
	
	public int get_order_donate(String userid) {
	// ���־�ü�� �ش� ��� (userid) �� �ֹ��� �־����� ���θ� ��ȯ��
		
		String yn = "";
		conn = connect();
		
		String SQL = "SELECT DELIVERY_CHARGE FROM OUTSOURCING_COMPANY WHERE ORGAN_ID = '"+ userid + "'";
	
		
		try {
			pstmt = conn.createStatement();
			
			rs = pstmt.executeQuery(SQL);
			
			if(rs.next()) {
				yn = rs.getString(1);
				if(yn.contains("none")) {
					return 1;	// �ֹ� ���� ��
				}else {
					return 2;	// �ֹ� ���� ��
				}
				
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
		
		return 0;
	}

}
