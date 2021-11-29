<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- import JDBC package -->
<%@ page import="user.UserDao"%>
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
<title>Insert title here</title>
<meta charset="utf-8">
<link href="./style.css" rel="stylesheet">
</head>
<body>
<%

if (session.getAttribute("userID") == null) {
	out.println("<p1><a href='login.jsp'>�α���</a></p1>");
}else
{
	String userid = (String)session.getAttribute("userID");
	String usert = (String)session.getAttribute("userType");
	out.println("<p1>"+usert + " ȸ�� | " + userid+" �� �ݰ����ϴ�! <br></p1>");
	out.println("<p1><a href='logout.jsp'>�α׾ƿ�</a></p1>");
	
	
%>
<p>
	<a href = 'Delete_path.jsp'>ȸ�� Ż�� ������</a>
	<br>
	<a href = 'Mypage.jsp'>���� ������</a>
	<br>
	<a href = 'prefer.jsp'>���� ������</a>
	<br>
	<a href = 'support.html'>���� ������</a>
	<br>
	<a href = 'Donation_list.jsp'>��� ��� ������</a>

	<br>
	<a href = 'Duser/write.jsp'>��� �߰� ������</a>
	<br>
	<a href = 'select_query_menu.jsp'>���� �޴� ������</a>
</p>
<% 
	if(usert.equals("donate")){
%>
<b>
	<br>
	<a href = 'Duser/Donate_order.jsp'>��� ���� �ֹ� ������</a>
	<br>
	<a href = 'Duser/people.jsp'>��� ������ ��ȸ ������</a>
</b>
<%		
	}else if(usert.equals("outsourcing")){
%>
<b>
	<br>
	<a href = 'Ouser/order_list.jsp'>�ֹ� ������</a>
</b>
<%		
	}
}


%>
</body>
</html>