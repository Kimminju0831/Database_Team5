<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	if (session.getAttribute("userID") == null) {
		out.println("<a href='login.jsp'>로그인</a>");
	} else {
		String userid = (String) session.getAttribute("userID");
		out.println(userid + "하이<br>");
		out.println("<a href='logout.jsp'>로그아웃</a>");
	}
	%>
</body>
</html>