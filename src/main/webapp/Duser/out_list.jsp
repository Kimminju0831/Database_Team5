<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "user.DAO" %>
<%@ page import = "user.User" %>
<%@ page import = "user.DonateDTO" %>
<%@ page import = "user.OrderDTO" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
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
	
	DAO manager = DAO.getInstance();
	
	List<OrderDTO> list = null;
	
	list = manager.getList_outSourcing();
	
	int count = 0;
	if(list != null){
		count = list.size();
	}
	
	if(end>count){
		end = count;
	}
	
%>	
<meta charset="EUC-KR">
<title>아웃 소싱 기업 페이지</title>
</head>
<body>
<%
	
	String usert = "";
	if (session.getAttribute("userID") == null) {
		out.println("<a href='login.jsp'>로그인</a>");
	}else
	{
		usert = (String)session.getAttribute("userType");
		out.println(usert + " 회원 | " + userid+" 님 반갑습니다! <br>");
		out.println("<a href='../logout.jsp'>로그아웃</a>");
		
	}
		
	


%>

<h3>외주 업체 목록</h3>
		<table>
			<tr>
				<td width = "10%">번호</td>
				<td width = "20%">업체명</td>
				<td width = "20%"></td>
			</tr>
			
			<%
				OrderDTO board  = null;
				if(list != null){
					for(int i = start-1; i < end ; i++){
						board = list.get(i);
			%>
			<tr>
				<td><%=board.getn() %></td>	
				<td><%=board.getCOMPANY_ID() %></td>
				<form action = "Donate_order.jsp" method="post">
				<input type = "hidden" name = "company_id" value = <%=board.getCOMPANY_ID() %>>
			<%
				if(usert.equals("donate")){
			%>
					<td><input type="submit" value="참여하기"></td>
			<%
				}
			%></form>
			</tr>
			<%
					}
				}
				else{
					out.println("외주 기업이 존재하지 않습니다.");
				}
			
						
				int pageCount = count / pageNum + (count%pageNum ==  0 ? 0 : 1);
						
				int Block = 10;
						
						int startPagenum = ((current-1)/Block)*Block+1;
						int endPagenum = startPagenum + Block - 1;
						
						if(endPagenum > pageCount){
							endPagenum = pageCount;
						}
						
						if(startPagenum > Block){
				%>
							<a href="out_list.jsp?pageNum=<%=startPagenum - 10%>">[이전]</a>
				<%			
						}
						
						
						for( int i = startPagenum ; i <= endPagenum ; i++){
							if(i==current){
				%>
								[<%=i %>]
				
				<% 	
							}else{
				%>
								<a href="out_list.jsp?pageNum=<%=i %>">[<%=i %>]</a>		
				<%					 				
								
							}
						}
						
						if(endPagenum < pageCount){
				%>
							<a href="out_list.jsp?pageNum=<%=startPagenum + 10 %>">[다음]</a>	
							
				<%								
						}
					
			%>
		</table>


</body>
</html>