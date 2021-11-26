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

	int pageNum = 15;
	
	String PageNum = request.getParameter("pageNum");
	
	if(PageNum  == null){
		PageNum  = "1";
	}
	
	int current = Integer.parseInt(PageNum);
	
	int start = (current -1) * pageNum +1;
	int end = current * pageNum ;
	
	

	DAO manager = DAO.getInstance();
	List<ExBoardDTO> list = manager.getList();
	
	int count = manager.get_data_num();		// 총 데이터 갯수
	
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

		<h3>게시판 목록</h3>
		<table width="900">
			<tr>
				<td width = "10%">번호</td>
				<td width = "10%">이름</td>
				<td width = "10%">제목</td>
			</tr>
			
			<%
				ExBoardDTO board  = null;
				if(list != null){
					for(int i = start-1; i < end ; i++){
						board = list.get(i);
			%>
			
			<tr>
				<td><%=board.getn() %></td>	
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
						<a href="Donation_list.jsp?pageNum=<%=startPagenum - 10%>">[이전]</a>
			<%
						}
						
						
						for( int i = startPagenum ; i <= endPagenum ; i++){
							if(i==current){
			%>
							[<%=i %>]
			
			<% 			
							}else{
								
			%>
							<a href="Donation_list.jsp?pageNum=<%=i %>">[<%=i %>]</a>		
			<%					
								
							}
						}
						
						if(endPagenum < pageCount){
								
			%>
							<a href="Donation_list.jsp?pageNum=<%=startPagenum + 10 %>">[다음]</a>	
			<%
						}
			%>
			</td>
			</tr>
			<a href = "Main.jsp">메인 페이지로</a>
</body>
</html>