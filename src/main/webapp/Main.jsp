<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- import JDBC package -->
<%@ page import="user.UserDao"%>
<%@ page language = "java" import = "java.text.*, java.sql.*" %>   

<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<%
if (session.getAttribute("userID") == null) {
	out.println("<a href='login.jsp'>�α���</a>");
}else
{
	String userid = (String)session.getAttribute("userID");
	out.println(userid+" �� �ݰ����ϴ�! <br>");
	out.println("<a href='logout.jsp'>�α׾ƿ�</a>");
	
%>

	<a href = 'Delete.html'>ȸ�� Ż�� ������</a>
	<a href = 'Mypage.jsp'>���� ������</a>
	<a href = 'prefer.jsp'>���� ������</a>
	<a href = 'support.html'>���� ������</a>
	
<% 
}
%>
</body>
</html>