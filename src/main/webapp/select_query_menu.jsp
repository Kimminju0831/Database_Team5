<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- import JDBC package -->
<%@ page import="user.UserDao"%>
<%@ page language="java" import="java.text.*, java.sql.*"%>

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
</head>
<body>
	<%
	if (session.getAttribute("userID") == null) {
		out.println("<a href='login.jsp'>�α���</a>");
	} else {
		String userid = (String) session.getAttribute("userID");
		String usert = (String) session.getAttribute("userType");
		out.println(usert + " ȸ�� | " + userid + " �� �ݰ����ϴ�! <br>");
		out.println("<a href='logout.jsp'>�α׾ƿ�</a>");
	%>

	<br>
	<br>

	<a href='query_user.jsp'>����� ���� ���� ������</a>
	<br>
	<a href='query_product.jsp'>��ǰ ��ü ���� ���� ������</a>
	<br>
	<a href='query_user.jsp'>��� ���� ���� ������</a>
	<br>
	<a href='query_user.jsp'>���� ���� ���� ������</a>
	<br>

	<%
	}
	%>
</body>
</html>