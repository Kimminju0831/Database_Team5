<%@page import="user.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- import JDBC package -->
<%@ page language = "java" import = "java.text.*, java.sql.*" %>   
<%@ page import="user.Delete"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Delete page</title>
</head>
<body>
<% 
	request.setCharacterEncoding("UTF-8");

	Delete manager = Delete.getInstance();	
	String requestU_id = request.getParameter("request_user");
	String password = request.getParameter("D_password");
	String userid = (String)session.getAttribute("userID");
	int result = manager.user_delete(userid, requestU_id, password);
	
	
	// ��ȯ�� 1 : ������ ���� ���� 2 : ���� ���� ���� 0 : ���� -1 : �н����� Ʋ��
	if(result == 0){
%>		<script>alert('�ش� ��û�� ó������ ���߽��ϴ�!');</script>
		<script type="text/javascript"> location.href="Delete_path.jsp"; </script><br/>
<%
		
	}else if(result == 1){
%>		<script>alert('������ ���� �߽��ϴ�.');</script>
		<script type="text/javascript"> location.href="Main.jsp"; </script><br/>
<% 		
	}else if(result == 2){
		
		session.setAttribute("userID", null);
		session.setAttribute("userPW", null);
		session.setAttribute("userType", null);
		
%>		<script>alert('Ż���߽��ϴ�.');</script>
		<script type="text/javascript"> location.href="Main.jsp"; </script><br/>
<% 
		
	}else{
		//-1
%>		<script>alert('�н����尡 ���� �ʽ��ϴ�!');</script>
		<script type="text/javascript"> location.href="Delete_path.jsp"; </script><br/>
<%
	}
	

%>
<a href = 'Main.jsp'>���� ��������</a>
</body>
</html>