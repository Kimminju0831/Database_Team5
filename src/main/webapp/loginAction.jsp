<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="user.UserDao"%>

<%@ page import="java.io.PrintWriter"%>
<%
request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="user" class="user.User" scope="page"></jsp:useBean>
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userAddress" />
<jsp:setProperty name="user" property="userPhone" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>loginAction.jsp</title>
</head>
<body>
	<%
	UserDao userDAO = new UserDao();

	int result = userDAO.login(user.getUserID(), user.getUserPassword());

	//로그인 성공
	if (result == 1) {
		session.setAttribute("userID", user.getUserID());
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'Main.jsp'");
		script.println("</script>");
		
	} else if (result == 0) { // 로그인 실패
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 틀립니다.')");
		script.println("history.back()");
		script.println("<script>");

	} else if (result == -1) { // 아이디 없음
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디 입니다.');");
		script.println("history.back()");
		script.println("</script>");
		
	} else if (result == -2) { // DB오류
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터베이스 오류가 발생했습니다.');");
		script.println("history.back()");
		script.println("</script>");
	}
	
	%>

</body>
</html>