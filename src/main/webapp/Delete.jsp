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
	
	
	// 반환값 1 : 관리자 삭제 성공 2 : 유저 삭제 성공 0 : 실패 -1 : 패스워드 틀림
	if(result == 0){
%>		<script>alert('해당 요청을 처리하지 못했습니다!');</script>
		<script type="text/javascript"> location.href="Delete_path.jsp"; </script><br/>
<%
		
	}else if(result == 1){
%>		<script>alert('유저를 삭제 했습니다.');</script>
		<script type="text/javascript"> location.href="Main.jsp"; </script><br/>
<% 		
	}else if(result == 2){
		
		session.setAttribute("userID", null);
		session.setAttribute("userPW", null);
		session.setAttribute("userType", null);
		
%>		<script>alert('탈퇴했습니다.');</script>
		<script type="text/javascript"> location.href="Main.jsp"; </script><br/>
<% 
		
	}else{
		//-1
%>		<script>alert('패스워드가 옳지 않습니다!');</script>
		<script type="text/javascript"> location.href="Delete_path.jsp"; </script><br/>
<%
	}
	

%>
<a href = 'Main.jsp'>메인 페이지로</a>
</body>
</html>