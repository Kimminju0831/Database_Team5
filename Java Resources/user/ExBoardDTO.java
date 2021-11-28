package user;

public class ExBoardDTO {

		private int n;
		private String id;
		private String pw;
		private String title;
		private String content;
		private int readCount;
		private String ip;
		
		public int getn() {
			return n;
		}
		
		public void setn(int n) {
			this.n = n;
		}
		
		public String getid() {
			return id;
		}
		
		public void setid(String id) {
			this.id = id;
		}
		
		public String getpw() {
			return pw;
		}
		
		public void setpw(String pw) {
			this.pw = pw;
		}
		
		public String gettitle() {
			return title;
		}
		
		public void settitle(String title) {
			this.title = title;
		}
		
		public String getcontent() {
			return content;
		}
		
		public void setcontent(String content) {
			this.content = content;
		}
		
		public int getreadCount() {
			return readCount;
		}
		
		public void setreadCount(int readCount) {
			this.readCount = readCount;
		}
		
		public String getip() {
			return ip;
		}
		
		public void setip(String ip) {
			this.ip = ip;
		}
	
}
