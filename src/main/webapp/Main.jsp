<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- import JDBC package -->
<%@ page import="user.UserDao"%>
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
<title>Insert title here</title>
</head>
<body>
<%

if (session.getAttribute("userID") == null) {
	out.println("<a href='login.jsp'>�α���</a>");
}else
{
	String userid = (String)session.getAttribute("userID");
	String usert = (String)session.getAttribute("userType");
	out.println(usert + " ȸ�� | " + userid+" �� �ݰ����ϴ�! <br>");
	out.println("<a href='logout.jsp'>�α׾ƿ�</a>");
	
	
%>

	<a href = 'Delete_path.jsp'>ȸ�� Ż�� ������</a>
	<br>
	<a href = 'Mypage.jsp'>���� ������</a>
	<br>
	<a href = 'prefer.jsp'>���� ������</a>
	<br>
	<a href = 'support.html'>���� ������</a>
	<br>
	<a href = 'Donation_list.jsp'>��� ��� ������</a>
	<br>
	<a href = 'select_query_menu.jsp'>���� �޴� ������</a>

<% 
	if(usert.equals("donate")){
%>
	<br>
	<a href = 'Duser/Donate_order.jsp'>��� ���� �ֹ� ������</a>
	<br>
	<a href = 'Duser/people.jsp'>��� ������ ��ȸ ������</a>
	<br>
	<a href = 'Duser/write.jsp'>��� �߰� ������</a>
	<br>
	<a href = 'Duser/out_list.jsp'>���� ��ü ��ȸ ������</a>
<%		
	}else if(usert.equals("outsourcing")){
%>
	<br>
	<a href = 'Ouser/order_list.jsp'>�ֹ� ������</a>
	<br>
	<a href = 'Duser/out_list.jsp'>���� ��ü ��ȸ ������</a>
<%		
	}
}


%>
</body>
</html>