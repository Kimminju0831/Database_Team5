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

	DAO manager = DAO.getInstance();

	List<DonateDTO> list = null;
	
	list = manager.getList_donate(userid);
	
	int count = 0;
	if(list != null){
		count = list.size();
	}
	
	if(end>count){
		end = count;
	}
	
	String det = "";
	det = manager.get_donate_org(userid);
	
	
%>
<meta charset="EUC-KR">
<title>기부 참여자 목록</title>
</head>
<body>
<h3>
<%
	if(det != null){

	
%>
	<%=det %> 기부 참여자 목록</h3>
	
<%
	}else{
		
%>
		<script>
			alert('운영 중인 기부 콘텐츠가 없습니다.')
			location.href="../Main.jsp";
		</script>
<% 		
		
	}

%>
		<table>
			<tr>
				<td width = "5%">번호</td>
				<td width = "10%">기부자 이름</td>
				<td width = "15%">기부자 전화번호</td>
				<td width = "20%">기부자 주소</td>
				<td width = "10%">상태</td>
			</tr>
			
			<%
				DonateDTO board  = null;
				if(list != null){
					for(int i = start-1; i < end ; i++){
						board = list.get(i);
						
						String uid = board.getuid();
						System.out.println(uid);
						
						User user1 = new User();
						user1 = manager.getList_user(uid);
						if(user1 != null){
						
				%>
				<tr>
						<td><%=i %></td>	
						<td><%=user1.getUserName() %></td>
						<td><%=user1.getUserPhone() %></td>
						<td><%=user1.getUserAddress() %></td>
						<td> 참여중 </td>
				</tr>
				<% 	
						}
					}
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
						<a href="people_list.jsp?pageNum=<%=startPagenum - 10%>">[이전]</a>
			<%
						}
						
						
						for( int i = startPagenum ; i <= endPagenum ; i++){
							if(i==current){
			%>
							[<%=i %>]
			
			<% 			
							}else{
								 
			%>
							<a href="people_list.jsp?pageNum=<%=i %>">[<%=i %>]</a>		
			<%					
								
							}
						}
						
						if(endPagenum < pageCount){
								
			%>
							<a href="people_list.jsp?pageNum=<%=startPagenum + 10 %>">[다음]</a>	
							
			<%
						}
						
						
			%>
			
			
		</table>
		<br>
		<button type="button" onclick="location='out_list.jsp'">기부 혜택 주문 페이지</button>
		<a href = "../Main.jsp">메인 페이지로</a>
</div>
	
	<%@include file ="../static/footer_for_D.jsp" %>
</div> 