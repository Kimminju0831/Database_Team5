<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@include file ="static/header.jsp" %> 
<link rel="stylesheet" href="static/main.css">
<div id = "body-wrapper">
   	<div id ="body-content">
	
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
	<br>
    <a href = 'prefer.jsp'>취향 페이지</a>		<!-- 입력한 취향 없을 경우 버튼 뜨도록 변경 -->	
			
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

out.println("<a href = 'Delete_path.jsp'>회원 탈퇴 페이지</a>");
out.println("<br>");
%>
	</table>
	
	<a href = 'Main.jsp'>메인 페이지</a>
	<br>

	</div>
	
	<%@include file ="static/footer.jsp" %>
</div> 