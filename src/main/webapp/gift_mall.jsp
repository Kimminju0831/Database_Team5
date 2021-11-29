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
		String recvid = request.getParameter("recvid");
	%>
	<h1><%=recvid%>님이 좋아하실만한 상품을 판매하는 쇼핑몰 링크들입니다!</h1>
	<h3><%=protype%>의 <%=product%>상품들의 링크를 알려드립니다.</h3>
	<%
		//mall 출력하기
		String blink = "";
		String nlink = "";
		out.println("<hr>");
		out.println("<br/>");
	
		out.println("공익 링크에서 상품을 구매하시면 구매금의 일부가 공익에 도움이 될 수 있습니다!");
		out.println("<br/>");
		
		
		String SQL = "SELECT BETTER_LINK, NORMAL_LINK FROM MALL WHERE PRODUCT_TYPE = '"+product + "'";
	
		rs = stmt.executeQuery(SQL);
		out.print("<table border =" + "2 " + "width =" + "800" + "align ="
                + "center " + "bordercolor =" + "darkblue " + "cellspacing ="
                + "2 " + " bordercolor =" + "blue >");
		out.print("<tr>");
        out.print("<th>" + "공익링크" + "</th>");
        out.print("<th>" + "선물하기" + "</th>");
        out.print("<th>" + "일반링크" + "</th>");
        out.print("<th>" + "선물하기" + "</th>");
        out.print("</tr>");
        
		while(rs.next()) {
        	blink = rs.getString(1);
			nlink = rs.getString(2);
			out.print("<tr>");
			//out.println("<td>" + blink + "</td>");
	        out.println("<td> <a href = \"" + blink + "\">" + blink + "</td>");
	        //out.println("<td>" + nlink + "</td>");
	        out.println("<td> <button type=\"button\" onclick=\"location.href='gift_complete.jsp?blink=" + blink + "&nlink=" + nlink+ "&check=B'\"> 선물하기 </button>");
	        out.println("<td> <a href = \"" + nlink + "\">" + nlink + "</td>");
	       	//out.println("<input type=\"hidden\"value='"+ blink +"'>");
	       	//out.println("<input type=\"hidden\"value='" + nlink +"'>");
	       	out.println("<td> <button type=\"button\" onclick=\"location.href='gift_complete.jsp?blink=" + blink + "&nlink=" + nlink+ "&check=N'\"> 선물하기 </button>");
	        //out.println("<td> <input type=\"submit\"value=\"선물하기\">");
	        out.print("</tr>");
	        
       	}
		out.println("</table>");
	
	%>
</body>
</html>