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
	
<%
	if(userid.equals("000-00-0000"))
	{
		out.println("<a href = 'support.html'>���� ������</a>");
		out.println("<br>");
		out.println("<a href = 'info_add_admin.html'>[������ ����]����� ���� ������</a>");
		out.println("<br>");
		out.println("<a href = 'info_delete_admin.html'>[������ ����]����� Ż�� ������</a>");
		out.println("<br>");
		out.println("<a href = 'info_modi_admin.html'>[������ ����]����� �⺻ ���� ���� ������</a>");
		out.println("<br>");
		out.println("<a href = 'info_modi_id_admin.html'>[������ ����]����� ���̵� ���� ������</a>");
		out.println("<br>");
		out.println("<a href = 'info_modi_pw_admin.html'>[������ ����]����� ���̵� ���� ������</a>");
		out.println("<br>");
		out.println("<a href = 'info_modi_do_admin.html'>[������ ����]����� ��� ���� ���� ������</a>");
		out.println("<br>");
		out.println("<a href = 'info_modi_gi_admin.html'>[������ ����]����� ���� ���� ���� ������</a>");
		out.println("<br>");
		
		
	}
	
	else{
		out.println("<a href = 'Delete_path.jsp'>ȸ�� Ż�� ������</a>");
		out.println("<br>");
		out.println("<a href = 'Mypage.jsp'>���� ������</a>");
		out.println("<br>");
		out.println("<a href = 'support.html'>���� ������</a>");
		out.println("<br>");
		out.println("<a href = 'select_query_menu.jsp'>���� �޴� ������</a>");
		out.println("<br>");
		
	}
 
	if(usert.equals("donate")){
%>
	<br>
	<a href = 'Donation_list.jsp'>��� ��� ������</a>
	<br>
	<a href = 'Duser/Donate_order.jsp'>��� ���� �ֹ� ������</a>
	<br>
	<a href = 'Duser/people.jsp'>��� ������ ��ȸ ������</a>
<%		
	}else if(usert.equals("outsourcing")){
%>
	<br>
	<a href = 'Ouser/order_list.jsp'>�ֹ� ������</a>
	<br>
	<a href = 'Duser/out_list.jsp'>���־�ü ������</a>
<%		
	}else if(usert.equals("basic")){
%>
		<br>
		<a href = 'prefer.jsp'>���� ������</a>
		<br>
		<a href = 'Donation_list.jsp'>��� ��� ������</a>
		<br>
		<a href = 'gift_Gives_presents_to.jsp'>�����ϱ� ������</a>
		<br>
		<a href = 'gift_list.jsp'>���� �ֹ� ���� ������</a>
<%			
	}
}
%>
</body>
</html>