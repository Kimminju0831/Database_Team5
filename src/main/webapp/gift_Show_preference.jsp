<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language = "java" import="java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선물 취향 공개</title>
</head>
<body>
	<h1>조회하신 아이디의 선물 취향을 알려드립니다.</h1>
	
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
		String recvid = request.getParameter("recvid");//선물 줄 사람 아이디
	%>
	
	<%
		String result[] = new String[3];
		
		String gift_search = "SELECT product_type, product_name, R_DATE FROM preference WHERE us_id = '"+ recvid +"'";
		rs = stmt.executeQuery(gift_search);
		
        while(rs.next()) {
        	result[0] = rs.getString(1);
			result[1] = rs.getString(2);
			result[2] = rs.getString(3).substring(0,10);
       	}
		
		out.println("검색하신 " + recvid +"님의 선물 취향을 알려드립니다.");
		out.println("<hr>");
		out.println("<br/>");
		out.print("<table border =" + "2 " + "width =" + "800" + "align ="
                + "center " + "bordercolor =" + "darkblue " + "cellspacing ="
                + "2 " + " bordercolor =" + "blue >");
        out.print("<tr>");
        out.print("<th>" + "ID" + "</th>");
        out.print("<th>" + "상품 종류" + "</th>");
        out.print("<th>" + "상품" + "</th>");
        out.print("<th>" + "등록일자" + "</th>");
        out.print("</tr>");
 
        out.println("<td>" + recvid + "</td>");
        out.println("<td>" + result[0] + "</td>");
        out.println("<td>" + result[1] + "</td>");
        out.println("<td>" + result[2] + "</td>");
        out.println("</table>");
        
	%>

	<br/>
	<a href = "gift_mall.jsp?protype=<%=result[0]%>&product=<%=result[1]%>&recvid=<%=recvid%>&user=">
		<div style="text-align:center">
		<%=recvid%>님의 선물 취향과 관련된 사이트가 궁금하신가요?
		</div>
	</a>
	
	
	<br/><br/>
	<a href = 'Main.jsp'>메인 페이지</a>
	<a href = 'gift_list.jsp'>선물 주문내역 페이지</a>
</body>
</html>