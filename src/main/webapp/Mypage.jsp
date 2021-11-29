<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- import JDBC package -->
<%@ page import="user.UserDao"%>
<%@ page import="user.DAO"%>
<%@ page import="user.Select"%>
<%@ page import="user.DonateDTO"%>
<%@ page import="user.ExBoardDTO"%>
<%@ page import="user.OrderDTO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>

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
<title>My page</title>
</head>
<body>
	
<%
	
	String userid = ""; 
	String usert ="";
	String userpw = "";
	if (session.getAttribute("userID") == null) {
		out.println("<a href='login.jsp'>�α���</a>");
	}else
	{
		userid = (String)session.getAttribute("userID");
		usert = (String)session.getAttribute("userType");
		userpw = (String)session.getAttribute("userPassword");
		out.println(usert + " ȸ�� | " + userid+" �� �ݰ����ϴ�! <br>");
		out.println("<a href='logout.jsp'>�α׾ƿ�</a>");
	}
	
	out.println("<br><br>");	
	out.println("<br><br>");
	
	


if(usert.equals("basic")){
	Select manager = Select.getInstance();

	String donation =  manager.my_donation(userid);
	String present = manager.my_present(userid);
	
	out.println(donation);
	out.println("<br>");
	out.println(present);
%>
		
			
	<h3>��� ���� ���</h3>
			<table width="900">
				<tr>
				<td width = "10%">��ȣ</td>
				<td width = "10%">��ü��</td>
				<td width = "10%">��ü���̵�</td>
				<td width = "10%"></td>
			</tr>
<% 	
	DAO manager2 = DAO.getInstance();
	
	List<DonateDTO> list = null;
	
	list = manager2.contain_donate(userid);
	
	int count = 0;
	
	if(list != null){
		count = list.size();		// �� ������ ����
	}
	
	DonateDTO board  = null;
	if(list != null){
		for(int i = 0; i < count ; i++){
			board = list.get(i);
%>
		<tr>
			<td><%=board.getn() %></td>
			<td><%=board.getorgname() %></td>
			<td><%=board.getorgid() %></td>
			<form method="post" action = "Donation_cancle.jsp">	
			<input type = "hidden" name = "orgid" value = <%=board.getorgid() %>>
			<td><input type="submit" value="��� ����"></td>
			</form>
		</tr>
<%
		}
		
	}
}else if(usert.equals("donate")){
	
	Select manager = Select.getInstance();
	
	List<OrderDTO> order_user = null;
	
	DAO managerDAO = DAO.getInstance();
	
	order_user = managerDAO.getList_orderuser(userid, userpw);
	
	int count = 0;
	if(order_user != null){
		count = order_user.size();
	}
	
%>
	<h3>��� ���� ���</h3>
		<table width="900">
			<tr>
			<td width = "10%">��� ���α׷���</td>
			<td width = "10%">������</td>
			<td width = "10%">�Ⱓ ����</td>
			<td width = "10%">���� �Ⱓ</td>
			</tr>
			
			<tr>
<% 		
			ExBoardDTO hi = new ExBoardDTO();

			hi = manager.donation_content(userid);
%>
			<td><%=hi.gettitle() %></td>
			<td><%=hi.getcontent() %></td>
			<td><%=hi.getpw() %></td>
			<td><%=hi.getip() %></td>
			</tr>
		</table>
		
		
	<h3>��� ���� �ֹ� ��Ȳ</h3>
		<table>
			<tr>
				<td width = "10%">���� ��ü</td>
				<td width = "10%">��� ���α׷�</td>
				<td width = "10%">��� ��ü</td>
				<td width = "10%">��ǰ ����</td>
				<td width = "10%">��ǰ ����</td>
				<td width = "10%">��ǰ ����</td>
				<td width = "10%">��ۺ�</td>
				<td width = "20%">���� ������</td>
				<td width = "10%">����</td>
			</tr>
<%
			OrderDTO userorder = new OrderDTO();
			for(int i = 0; i < count ; i++){
				userorder = order_user.get(i);
%>			
				<tr>
					<td><%=userorder.getCOMPANY_ID() %></td>
					<td><%=userorder.getDO_NAME() %></td>
					<td><%=userorder.getORGAN_ID() %></td>
					<td><%=userorder.getPRODUCTION_TYPE() %></td>
					<td><%=userorder.getPRODUCT_NUM() %></td>
					<td><%=userorder.getPRODUCTION_PRICE() %></td>
					<td><%=userorder.getDELIVERY_CHARGE() %></td>
					<td><%=userorder.getESTIMATED_DATE() %></td>
<%
					if(userorder.getPRODUCTION_PRICE().equals("$none")){
						out.println("<td>���� ��� ��</td>");
					}else{
						out.println("<td>���� �Ϸ�</td>");
					}
%>					
				<tr>
<%
			}
%>						
			</tr>
		</table>

<% 	
	
	
}else{
	
	//�ƿ��ҽ��϶� ������ ����
	
	//ȸ������ ����
	
	//�ֹ� ��û Ȯ�� ��ũ
	
	
}

%>
	</table>
	
	<a href = 'Main.jsp'>���� ������</a>
	<br>
</body>
</html>