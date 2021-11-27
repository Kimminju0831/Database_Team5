<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title></title>
</head>
<body>
<%
		session.setAttribute("userID", null);
		session.setAttribute("userPW", null);
		session.setAttribute("userType", null);

%>

		<script>alert('로그아웃했습니다.');</script>
		<script type="text/javascript"> location.href="Main.jsp"; </script><br/>
</body>
</html>