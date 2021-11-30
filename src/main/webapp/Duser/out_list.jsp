<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@include file ="../static/header_for_D.jsp" %> 
<link rel="stylesheet" href="static/main.css">
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
	
	List<OrderDTO> list = null;
	
	list = manager.getList_outSourcing();
	
	int count = 0;
	if(list != null){
		count = list.size();
	}
	
	if(end>count){
		end = count;
	}
	
	int mine = 0;
%>	
<meta charset="EUC-KR">
<title>아웃 소싱 기업 페이지</title>
</head>
<body>
<%
	
	String usert = "";
	if (session.getAttribute("userID") == null) {

	}else
	{
		usert = (String)session.getAttribute("userType");
		
	}
		
	int menu = manager.get_order_donate(userid);
	if(menu != 0)	//주문을 이미 넣었음 == OUTSOURCING COMPANY 에 ORGAN_ID 가 있음.
	{
			// 주문을 넣고 외주업체 측에서 승인 했음 ==  배달비가 산정됨
			if(menu == 2){
			%>
			<script type="text/javascript">
			alert('주문이 승인되었습니다.')
			location.href="../Mypage.jsp";
			</script>
			<%			
			}
			// 주문을 넣었지만 외주 업체 측에서 승인을 안했음
			else{
			%>
			<script type="text/javascript">
			alert('주문 승인 대기 중 입니다.')
			location.href="../Mypage.jsp";
			</script>
			<%
			}
			
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
			<%
				if(board.getCOMPANY_ID().compareTo(userid)==0){
					mine = 1;
				}
			%>
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
								if(endPagenum != 1){
				%>
								[<%=i %>]
				
				<% 				}		
								
				
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
<%
		if(usert.equals("donate")){
%>
<%			
		}else if(usert.equals("outsourcing")){
			if(mine == 0){
%>		
				<button onclick="location='../Ouser/reg.jsp'">등록하기</button>
<%					
			}
		
		}
	
%>
		
</div>
	
	<%@include file ="../static/footer_for_D.jsp" %>
</div> 