<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language = "java" import="java.text.*, java.sql.*" %>
<%@page import="java.util.*" %>
<%@ page import="user.Gift"%> 
<!-- import JDBC package -->
<link rel="stylesheet" href="static/main.css">
<link rel="stylesheet" href="static/button.css">
<%@include file ="static/header.jsp" %>
<div id = "body-wrapper">
   	<div id ="body-content">
	<%
	String userid = ""; 
	if (session.getAttribute("userID") == null) {
	}else
	{
		userid = (String)session.getAttribute("userID");
		String usert = (String)session.getAttribute("userType");
	}

	out.println("<br><br>");		
	%>
	
		<%
		String serverIP = "localhost";
		String strSID = "xe";
		String portNum = "1600";
		String User = "ta";
		String pass = "ta";
		String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
		
		Connection conn = null;
		Statement stmt = null;
		
		PreparedStatement ps;
		ResultSet rs;
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, User, pass);
		stmt = conn.createStatement();

	%>
		
		<h2>회원님이 주문하신 선물 내역입니다.</h2>
		<%
			//product 출력하기
				String pid = "";
				String proname = "";
				int quantity;
				String price = "";
				out.println("<hr>");
				out.println("<br/>");
			
				out.println(userid + "님이 주문하신 선물 내역입니다.");
				out.println("<br/>");
				
				
				String SQL = "SELECT Product_ID,  Product_name, quantity,Price FROM product WHERE UIDN = '"+ userid + "'";
			
				rs = stmt.executeQuery(SQL);
				out.print("<table border =" + "2 " + "width =" + "1000" + "align ="
		                + "center " + "bordercolor =" + "darkblue " + "cellspacing ="
		                + "2 " + " bordercolor =" + "blue >");
				out.print("<tr>");
		        out.print("<th>" + "상품번호" + "</th>");		        
		        out.print("<th>" + "상품 이름" + "</th>");
		        out.print("<th>" + "주문 개수" + "</th>");
		        out.print("<th>" + "가격" + "</th>");
		        out.print("<th>" + "주문 취소" + "</th>");
		        out.print("</tr>");
		        
				while(rs.next()) {
		        	pid = rs.getString(1);
					proname = rs.getString(2);
					quantity = rs.getInt(3);
					price = rs.getString(4);
					out.print("<tr>");
			        out.println("<td>" + pid + "</td>");
			        out.println("<td>" + proname + "</td>");
			        out.println("<td>" + quantity + "</td>");
			        out.println("<td>" + price + "</td>");
			        out.println("<td> <button type=\"button\" onclick=\"location.href='gift_cancel.jsp?pid=" + pid + "'\"> 주문 취소하기 </button>");
			        out.print("</tr>");
		       	}
				out.println("</table>");
		%>
		
</div>
	
	<%@include file ="static/footer.jsp" %>
</div> 