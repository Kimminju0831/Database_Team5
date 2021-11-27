package user;

public class DonateDTO {
	private int n;
	private String uid;
	private String orgname;
	private String orgid;
	
	public int getn() {
		return n;
	}
	
	public void setn(int n) {
		this.n = n;
	}
	
	public String getuid() {
		return uid;
	}
	
	public void setuid(String uid) {
		this.uid = uid;
	}
	
	public String getorgname() {
		return orgname;
	}
	
	public void setorgname(String orgname) {
		this.orgname = orgname;
	}
	
	public String getorgid() {
		return orgid;
	}
	
	public void setorgid(String orgid) {
		this.orgid = orgid;
	}
	
}
