<%@page import="user.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- import JDBC package -->
<%@ page language = "java" import = "java.text.*, java.sql.*" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� Ż�� ������</title>
</head>
<body>
	<p>Delete Site - Ż�� ������</p>
	<br>
	
<%
	String userid = "";
	String Password = request.getParameter("D_password");
	userid = (String)session.getAttribute("userID");

	if(userid.compareTo("admin")==0){
	
		%>
		<form action="./Delete.jsp" method="post">
	  		<b>������ ���� ID �� �Է����ּ���.</b>
	  		<input type="text" name = "request_user">
			<br><br> 
			<b>������ ���� ������ PW �� �Է����ּ���. </b>
			<input type="text" name="D_password"><br>
			<a><input type="reset" value="Reset"><input type="submit" value="Submit"></a>
		</form>
		<%
		
		
	}else{
		
		%>
		<form action="./Delete.jsp" method="post">
	  		<a><b>Ż�� ������ ���� ��й�ȣ�� �Է����ּ���.</b>
			<br><br> ���� ��й�ȣ | <input type="text" name="D_password"><br></a>
			<a><input type="reset" value="Reset"><input type="submit" value="Submit"></a>
		</form>
		<%
	}
%>
		
		
	
</body>
</html>