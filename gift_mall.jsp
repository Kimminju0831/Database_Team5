<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language = "java" import="java.text.*, java.sql.*" %>
<%@page import="java.util.*" %>
<%@ page import = "user.ExBoardDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사이트 추천</title>
</head>
<body>
	
	<h1></h1>
	<%
		String serverIP = "localhost";
		String strSID = "xe";
		String portNum = "1600";
		String user = "ta";
		String pass = "ta";
		String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
		
		Connection conn = null;
		Statement stmt = null;
		
		PreparedStatement ps;
		ResultSet rs;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pass);
		stmt = conn.createStatement();

	%>
	
	<%
		
		request.setCharacterEncoding("UTF-8");
		String protype = request.getParameter("protype");//상품종류
		String product = request.getParameter("product");//상품
		int pageNum = 15;
		
		String PageNum = request.getParameter("pageNum");
		if(PageNum  == null){
		PageNum  = "1";
		}
	
		String mode = request.getParameter("mode");
		if(mode == null){
			mode = "all";
		}
		int current = Integer.parseInt(PageNum);
		
		int start = (current -1) * pageNum +1;
		int end = current * pageNum ;
		
		
	%>
	
	<%
		//mall 출력하기
		String SQL = "SELECT BETTER_LINK, NORMAL_LINK FROM MALL WHERE PRODUCT_TYPE = '"+protype + "'";
		List<ExBoardDTO> list = null;
	
		rs = stmt.executeQuery(SQL);
			
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
	
	%>
</body>
</html>