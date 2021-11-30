<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		out.println("<a href='login.jsp'>로그인</a>");
	}else
	{
		userid = (String)session.getAttribute("userID");
		usert = (String)session.getAttribute("userType");
		userpw = (String)session.getAttribute("userPassword");
		out.println(usert + " 회원 | " + userid+" 님 반갑습니다! <br>");
		out.println("<a href='logout.jsp'>로그아웃</a>");
		out.println("<a href='info_modification.jsp'>내 정보 수정</a>");
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
		
			
	<h3>기부 참여 목록</h3>
			<table width="900">
				<tr>
				<td width = "10%">번호</td>
				<td width = "10%">단체명</td>
				<td width = "10%">단체아이디</td>
				<td width = "10%"></td>
			</tr>
<% 	
	DAO manager2 = DAO.getInstance();
	
	List<DonateDTO> list = null;
	
	list = manager2.contain_donate(userid);
	
	int count = 0;
	
	if(list != null){
		count = list.size();		// 총 데이터 갯수
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
			<td><input type="submit" value="기부 해지"></td>
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
	<h3>기부 참여 목록</h3>
		<table width="900">
			<tr>
			<td width = "10%">기부 프로그램명</td>
			<td width = "10%">수혜자</td>
			<td width = "10%">기간 유형</td>
			<td width = "10%">실제 기간</td>
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
		
		
	<h3>기부 혜택 주문 현황</h3>
		<table>
			<tr>
				<td width = "10%">외주 업체</td>
				<td width = "10%">기부 프로그램</td>
				<td width = "10%">기부 단체</td>
				<td width = "10%">물품 유형</td>
				<td width = "10%">물품 갯수</td>
				<td width = "10%">물품 가격</td>
				<td width = "10%">배송비</td>
				<td width = "20%">예상 도착일</td>
				<td width = "10%">상태</td>
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
						out.println("<td>승인 대기 중</td>");
					}else{
						out.println("<td>승인 완료</td>");
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
	
	//아웃소싱일때 보여줄 내용
	
	//회원정보 수정
	
	//주문 신청 확인 링크
	
	
}
%>
	</table>
	
	<a href = 'Main.jsp'>메인 페이지</a>
	<br>
</body>
</html>