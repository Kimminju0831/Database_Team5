<%@page import="user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@ page language = "java" import = "java.text.*, java.sql.*" %>    
<%@ page import="user.UserDao"%>
<%@ page import="user.DAO"%>
<%@ page import="user.Select"%>
<%@ page import="user.DonateDTO"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import = "user.ExBoardDTO" %>
<!DOCTYPE html5>
<%

	String best = "best";
	String bene = "bene";
	String period = "period";
	String all = "all";
	
	int pageNum = 15;
	
	String PageNum = request.getParameter("pageNum");
	if(PageNum  == null){
		PageNum  = "1";
	}
	
	String mode = request.getParameter("mode");
	if(mode == null){
		mode = "all";
	}
	
	int current = Integer.parseInt(PageNum);
	
	int start = (current -1) * pageNum +1;
	int end = current * pageNum ;
	
	
	String userid = (String)session.getAttribute("userID");
	
	DAO manager = DAO.getInstance();
	
	List<ExBoardDTO> list = null;
	
	if(mode.compareTo("all")==0){
		list = manager.getList();
	}else if(mode.compareTo("best")==0){
		list = manager.getList_best(userid);
	}else if(mode.compareTo("bene")==0){
		list = manager.getList_bene(userid);
	}else if(mode.compareTo("period")==0){
		list = manager.getList_period(userid);
	}else{
		list = manager.getList();
	}

	int count = 0;
	
	count = list.size();		// 총 데이터 갯수
	
	if(end>count){
		end = count;
	}

%>
<%
	
	DAO manager2 = DAO.getInstance();
	
	List<DonateDTO> donate_list = null;
	
	donate_list = manager2.contain_donate(userid);
	
	int donate_count = 0;
	
	if(donate_list != null){
		donate_count = donate_list.size();		// 총 데이터 갯수
	}
	
%>
<html>

<head>
<meta charset="EUC-KR">
<title>Donate page</title>
</head>

<body>
		<a href="Donation_list.jsp?pageNum=<%=1%>&&mode=<%=all%>">전체 보기</a>
		<a href="Donation_list.jsp?pageNum=<%=1%>&&mode=<%=best%>">베스트</a>
		<a href="Donation_list.jsp?pageNum=<%=1%>&&mode=<%=period%>">기간 맞춤</a>
		<a href="Donation_list.jsp?pageNum=<%=1%>&&mode=<%=bene%>">수혜자 맞춤</a>
		<h3>게시판 목록</h3>
		<table width="900">
			<tr>
				<td width = "10%">번호</td>
				<td width = "20%">기간</td>
				<td width = "30%">수혜자</td>
				<td width = "20%">단체명</td>
				<td width = "10%">신청</td>
			</tr>
			
			<%
				ExBoardDTO board  = null;
				if(list != null){
					for(int i = start-1; i < end ; i++){
						board = list.get(i);
			%>
			
			<tr>
			<form method="post" action = "Donation_Content.jsp">
				<td><%=board.getn() %></td>	
				<td><%=board.getip() %></td>
				<td><%=board.getcontent() %></td>
				<td><%=board.gettitle() %></td>
				<input type = "hidden" name = "org_id" value = <%=board.getid() %>>
				<input type = "hidden" name = "no" value = <%=board.getn() %>>
				<input type = "hidden" name = "period" value = <%=board.getip() %>>
				<input type = "hidden" name = "benefit" value = <%=board.getcontent() %>>
				<input type = "hidden" name = "name" value = <%=board.gettitle() %>>
				
			<% 
				Boolean Contain = false;
				DonateDTO dboard  = null;
				if(donate_list != null){
					for(int a = 0; a < donate_count ; a++){
						dboard = donate_list.get(a);
						if(board.gettitle().equals(dboard.getorgname())){
							Contain = true;
						}
					} 
				}
				
				if(Contain == true){
				%>	
					<td>참여 중</td>
				<% 
				}else{
				%>	
					<td><input type="submit" value="참여하기"></td>
				<% 
				}
			
			%>	
				
			</form>
			</tr>
			
			<tr>
			<td>
			<%
					}
				}else{
				
					out.println("게시글이 없습니다.");
			
				}
			%>
			
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
						<a href="Donation_list.jsp?pageNum=<%=startPagenum - 10%>&&mode=<%=mode%>">[이전]</a>
			<%
						}
						
						
						for( int i = startPagenum ; i <= endPagenum ; i++){
							if(i==current){
			%>
							[<%=i %>]
			
			<% 			
							}else{
								 
			%>
							<a href="Donation_list.jsp?pageNum=<%=i %>&&mode=<%=mode%>">[<%=i %>]</a>		
			<%					
								
							}
						}
						
						if(endPagenum < pageCount){
								
			%>
							<a href="Donation_list.jsp?pageNum=<%=startPagenum + 10 %>&&mode=<%=mode%>">[다음]</a>	
							
			<%
						}
						
						String utype = (String)session.getAttribute("userType");
						if (utype.equals("donate")){
							String command = "<button onclick = \"location='Duser/write.jsp'\">글쓰기</button>";
							out.println(command);
						}
			%>
			</td>
			</tr>
		</table>
		<a href = "Main.jsp">메인 페이지로</a>
</body>
</html>