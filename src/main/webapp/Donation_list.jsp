<%@page import="user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@ page language = "java" import = "java.text.*, java.sql.*" %>    
<%@ page import = "java.util.List" %>
<%@ page import = "user.DAO" %>
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
	
	int count = list.size();		// 총 데이터 갯수
	
	if(end>count){
		end = count;
	}

%>
<html>

<head>
<meta charset="EUC-KR">
<title>Delete page</title>
</head>

<body>
		<a href="Donation_list.jsp?pageNum=<%=1%>&&mode=<%=all%>">전체 보기</a>
		<a href="Donation_list.jsp?pageNum=<%=1%>&&mode=<%=best%>">베스트</a>
		<a href="Donation_list.jsp?pageNum=<%=1%>&&mode=<%=period%>">기간 맞춤</a>
		<a href="Donation_list.jsp?pageNum=<%=1%>&&mode=<%=bene%>">수혜자 맞춤</a>
		<h3>게시판 목록</h3>
		<table width="900">
			<tr>
				<td width = "20%">번호</td>
				<td width = "20%">기간</td>
				<td width = "20%">수혜자</td>
				<td width = "20%">단체명</td>
			</tr>
			
			<%
				ExBoardDTO board  = null;
				if(list != null){
					for(int i = start-1; i < end ; i++){
						board = list.get(i);
			%>
			
			<tr>
				<td><%=board.getn() %></td>	
				<td><%=board.getip() %></td>
				<td><%=board.getid() %></td>
				<td><%=board.gettitle() %></td>
				
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
			%>
			</td>
			</tr>
			<a href = "Main.jsp">메인 페이지로</a>
</body>
</html>