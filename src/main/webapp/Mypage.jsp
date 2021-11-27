<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- import JDBC package -->
<%@ page import="user.UserDao"%>
<%@ page import="user.DAO"%>
<%@ page import="user.Select"%>
<%@ page import="user.DonateDTO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>

<%@ page language = "java" import = "java.text.*, java.sql.*" %>   

<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userAddress" />
<jsp:setProperty name="user" property="userPhone" />

<!DOCTYPE html>
<html>
<head>
<title>My page</title>
</head>
<body>
	
<%
	
	String userid = ""; 
	if (session.getAttribute("userID") == null) {
		out.println("<a href='login.jsp'>로그인</a>");
	}else
	{
		userid = (String)session.getAttribute("userID");
		String usert = (String)session.getAttribute("userType");
		out.println(usert + " 회원 | " + userid+" 님 반갑습니다! <br>");
		out.println("<a href='logout.jsp'>로그아웃</a>");
	}
	
	out.println("<br><br>");	
	out.println("<br><br>");
	
	Select manager = Select.getInstance();

	String donation =  manager.my_donation(userid);
	String present = manager.my_present(userid);
	
	out.println(donation);
	out.println("<br>");
	out.println(present);
%>
		<h3>기부 참여 목록</h3>
			<table width="900">
				<tr>
				<td width = "10%">번호</td>
				<td width = "20%">단체명</td>
			</tr>
<% 	
	DAO manager2 = DAO.getInstance();
	
	List<DonateDTO> list = null;
	
	list = manager2.contain_donate(userid);
	
	int count = list.size();		// 총 데이터 갯수
	
	DonateDTO board  = null;
	if(list != null){
		for(int i = 0; i < count ; i++){
			board = list.get(i);
%>
		<tr>
			<td><%=board.getn() %></td>
			<td><%=board.getorgname() %></td>
		</tr>
<%
		}
		
	}

%>
	</table>
</body>
</html>