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
<meta charset="UTF-8">
<title>���� ���� ����</title>
</head>
<body>
<%
	
	String userid = ""; 
	if (session.getAttribute("userID") == null) {
		out.println("<a href='login.jsp'>�α���</a>");
	}else
	{
		userid = (String)session.getAttribute("userID");
		String usert = (String)session.getAttribute("userType");
		out.println(usert + " ȸ�� | " + userid+" �� �ݰ����ϴ�! <br>");
		out.println("<a href='logout.jsp'>�α׾ƿ�</a>");
		out.println("<br>");
		out.println("<a href='info_id_user0.jsp'>���̵� ����</a>");
		out.println("<br>");
		out.println("<a href='info_pw_user0.jsp'>��й�ȣ ����</a>");
		out.println("<br>");
		out.println("<a href='info_name_user0.jsp'>�̸� ����</a>");
		out.println("<br>");
		out.println("<a href='info_phone_user0.jsp'>��ȭ��ȣ ����</a>");
		out.println("<br>");
		out.println("<a href='info_address_user0.jsp'>�ּ� ����</a>");
		
		out.println("<br>");out.println("<br>");
		out.println("<a href='info_gi_user0.jsp'>���� ���� ����</a>");
		out.println("<br>");
		out.println("<a href='info_do_user0.jsp'>��� ���� ����</a>");
		
	}
	
	
%>
	<a href = 'Main.jsp'>���� ������</a>
	<br>

</body>
</html>