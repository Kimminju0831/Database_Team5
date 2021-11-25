<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Users.UserDao"%>
<%@ page import="java.io.PrintWriter"%>
<%
request.setCharacterEncoding("UTF-8");
%>


<jsp:useBean id="user" class="Users.User" scope="page"></jsp:useBean>
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userAddress" />
<jsp:setProperty name="user" property="userPhone" />
  

<!DOCTYPE html>
<html>
<head>      
<meta charset="UTF-8">
<title>joinAction</title>
</head>
<body>
	<%
	
	 //로그아웃 코드 넣기
    //session.invalidate();

	String userID = null;
	if (session.getAttribute("userID") != null) {
		//for test
		System.out.println("0");
		userID = (String) session.getAttribute("userID");

	}
	if (userID != null) {

		//for test
		System.out.println("1");
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인 되어있습니다.')");
		script.println("location.href='Main.html'");
		script.println("</script>");
	}
	//for test
	System.out.println(user.getUserID() + " " + user.getUserPassword() +" "+ user.getUserName()
	+" "+ user.getUserAddress()+" "+ user.getUserPhone());
	
	if (user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null
			|| user.getUserAddress() == null || user.getUserPhone() == null) {

		//for test
		System.out.println("2");

		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안 된 사항이 있습니다.')");
		script.println("history.back()");
		script.println("<script>");
	} else {
		//for test
		System.out.println("3");

		UserDao userDAO = new UserDao(); //인스턴스 생성
		int result = userDAO.join(user);

		if (result == -1) { // 아이디가 기본키 중복되면 오류
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디 입니다.')");
			script.println("history.back()");
			script.println("</script>");
		} //가입 성공
		else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'Main.html'");
			script.println("</script>");
		}
	}
	%>
</body>
</html>