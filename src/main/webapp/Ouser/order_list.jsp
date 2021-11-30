<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@include file ="../static/header_for_D.jsp" %> 
<link rel="stylesheet" href="main.css">
<div id = "body-wrapper">
   	<div id ="body-content">
<% 
	int pageNum = 15;
	
	String PageNum = request.getParameter("pageNum");
	if(PageNum  == null){
		PageNum  = "1";
	}
	
	int current = Integer.parseInt(PageNum);
	
	int start = (current -1) * pageNum +1;
	int end = current * pageNum ;
	
	String userid = (String)session.getAttribute("userID");
	String userpw = (String)session.getAttribute("userPassword");
	
	DAO manager = DAO.getInstance();
	
	List<OrderDTO> list = null;
	
	int count = 0;
	
	list = manager.getList_orderlist(userid, userpw);
	
	if(list != null){
		count = list.size();		// 총 데이터 갯수
	}
		
	if(end>count){
		end = count;
	}
	
	if(list == null){
			out.println("받은 주문 요청이 없습니다.");
	}
	else{
%>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%

		if (session.getAttribute("userID") == null) {
			out.println("<a href='login.jsp'>로그인</a>");
		}else
		{
			String usert = (String)session.getAttribute("userType");
			out.println(usert + " 회원 | " + userid+" 님 반갑습니다! <br>");
			out.println("<a href='../logout.jsp'>로그아웃</a>");
	
	
%>
			<table>
			<tr>
				<td width = "10%">번호</td>
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
				OrderDTO board  = null;
				for(int i = start-1; i < end ; i++){
					board = list.get(i);
			%>
					<tr>
						<td><%=board.getn() %></td>	
						<td><%=board.getDO_NAME() %></td>
						<td><%=board.getORGAN_ID() %></td>
						<td><%=board.getPRODUCTION_TYPE() %></td>
						<td><%=board.getPRODUCT_NUM() %></td>
						<td><%=board.getPRODUCTION_PRICE() %></td>
						<td><%=board.getDELIVERY_CHARGE() %></td>
						<td><%=board.getESTIMATED_DATE() %></td>
						<form action = "order_confirm.jsp" method="post">
			<%
					if(board.getPRODUCTION_PRICE().equals("$none")){
			%>
						<input type = "hidden" name = "userid" value = <%=userid %>>
						<input type = "hidden" name = "userpw" value = <%=userpw %>>
						<input type = "hidden" name = "getDO_NAME" value = <%=board.getDO_NAME() %>>
						<input type = "hidden" name = "getORGAN_ID" value = <%=board.getORGAN_ID() %>>
						<input type = "hidden" name = "getPRODUCTION_TYPE" value = <%=board.getPRODUCTION_TYPE() %>>
						<input type = "hidden" name = "getPRODUCT_NUM" value = <%=board.getPRODUCT_NUM() %>>
						<input type = "hidden" name = "getPRODUCTION_PRICE" value = <%=board.getPRODUCTION_PRICE() %>>
						<input type = "hidden" name = "getDELIVERY_CHARGE" value = <%=board.getDELIVERY_CHARGE() %>>
						<input type = "hidden" name = "getESTIMATED_DATE" value = <%=board.getESTIMATED_DATE() %>>
	
						<td><input type="submit" value="주문받기"></td>
			<%
					}
					else{
						out.println("<td>주문 승인</td>");	
					}
					
			%>						
						</form>
						
					</tr>
				
			<% 
				}
			%>
					</table>
			<%
				
				int pageCount = count / pageNum + (count%pageNum ==  0 ? 0 : 1);
						
				int Block = 10;
						
						int startPagenum = ((current-1)/Block)*Block+1;
						int endPagenum = startPagenum + Block - 1;
						
						if(endPagenum > pageCount){
							endPagenum = pageCount;
						}
						
						if(startPagenum > Block){
			%>
						<a href="order_list.jsp?pageNum=<%=startPagenum - 10%>">[이전]</a>
			<%
						}
						
						
						for( int i = startPagenum ; i <= endPagenum ; i++){
							if(i==current){
			%>
							[<%=i %>]
			
			<% 			
							}else{
								 
			%>
							<a href="order_list.jsp?pageNum=<%=i %>">[<%=i %>]</a>		
			<%					
								
							}
						}
						
						if(endPagenum < pageCount){
								
			%>
							<a href="order_list.jsp?pageNum=<%=startPagenum + 10 %>">[다음]</a>	
							
			<%
						}	
					}
			}
	
%>

	<br/>
	<a href = "../Main.jsp">메인 페이지로</a>
</div>
	
	<%@include file ="../static/footer_for_D.jsp" %>
</div> 