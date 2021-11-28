package user;

public class User {
	private int n;
	private String userID;
	private String userPassword;
	private String userName;
	private String userAddress;
	private String userPhone;
	private String userType;

	public int getn() {
		return n;
	}

	public void setn(int n) {
		this.n = n;
	}
	
	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	
	public String getUsertype() {
		return userType;
	}

	public void setUsertype(String userType) {
		this.userType = userType;
	}
	
	public void setUserinfo_clear() {
		this.userAddress = "";
		this.userID = "";
		this.userName = "";
		this.userPassword = "";
		this.userPhone = "";
	}

}