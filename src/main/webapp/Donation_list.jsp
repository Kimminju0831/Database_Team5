<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@include file ="static/header.jsp" %> 
<div id = "body-wrapper">
   	<div id ="body-content">

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
	String usert = (String)session.getAttribute("userType");
	
	String mydonate = "";
	
		Select man = Select.getInstance();
		
		ExBoardDTO result = new ExBoardDTO();
		
		result = man.donation_content(userid);
		
		mydonate = result.gettitle();
		
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
	}else if(mode.compareTo("my")==0){
	
	}else{
		list = manager.getList();
	}

	int count = 0;
	
	if(list != null){
		count = list.size();		// 총 데이터 갯수
	}
	
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
<%
		if (session.getAttribute("userID") == null) {
			
		}else
		{
			userid = (String)session.getAttribute("userID");
			usert = (String)session.getAttribute("userType");
		}
	
		if(usert.equals("basic")){
%>
		<br>
		</br>
		<div id = "mode_set">
			<a id="list_mode" href="Donation_list.jsp?pageNum=<%=1%>&&mode=<%=all%>">전체 보기</a>
			<a id="list_mode" href="Donation_list.jsp?pageNum=<%=1%>&&mode=<%=best%>">베스트</a>
			<a id="list_mode" href="Donation_list.jsp?pageNum=<%=1%>&&mode=<%=period%>">기간 맞춤</a>
			<a id="list_mode" href="Donation_list.jsp?pageNum=<%=1%>&&mode=<%=bene%>">수혜자 맞춤</a>
		</div>

<%
		}
		else if(usert.equals("donate") ){
			
			if(mode.compareTo("my")!=0){
%>				<br>
				</br>
				<a id="list_mode" style="margin-top: 40px; float:right" 
					href="Donation_list.jsp?pageNum=<%=1%>&&mode=my" >내 기부 프로그램 보기</a>
				
<% 			
			}else{
%>
			<a id="list_mode" style="margin-top: 60px; float:right"
					 href="Donation_list.jsp?pageNum=<%=1%>&&mode=<%=all%>">전체 보기</a>
<%				
			}
			
		}
		
		
		if(mode.equals("my")){
%>
		<br>
<%			
			
		}
%>		

		<h3 style="margin-left:30px;">게시판 목록</h3>
	
		<hr>
		<table id = "donation_table" style="margin-left:30px; border-spacing: 0 10px;">
			<tr>
			<%
				if(usert.equals("basic")){
			%>
				<td width = "100px" style="font-size:20px; font-weight:bold;">번호</td>
				<td width = "150px" style="font-size:20px; font-weight:bold;">기간</td>
				<td width = "300px" style="font-size:20px; font-weight:bold;">수혜자</td>
				<td width = "300px" style="font-size:20px; font-weight:bold;">단체명</td>
			<%
				}else{
			%>
				<td width = "200px" style="font-size:20px; font-weight:bold;">번호</td>
				<td width = "400px" style="font-size:20px; font-weight:bold;">기간</td>
				<td width = "500px" style="font-size:20px; font-weight:bold;">수혜자</td>
				<td width = "50px"  style="font-size:20px; font-weight:bold;">단체명</td>
			<%		
					
				}
			
				if(usert.equals("basic")){
				
					out.println("<td style=\"font-size:20px; font-weight:bold;\" >신청</td></tr>");
				
				}else{
					out.println("</tr>");
				}
			
				if(mode.compareTo("my")==0){
			%>
					</tr>
					<tr>
					<td><%=result.getn() %></td>
					<td><%=result.getip() %></td>
					<td><%=result.getcontent() %></td>
					<td><%=mydonate %></td>
					</tr>
					<tr>
			<% 		
					
				}
			
				ExBoardDTO board  = null;
				if(list != null){
					for(int i = start-1; i < end ; i++){
						board = list.get(i);
						if(board.getip().compareTo("$")!=0){
							%>
								
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
						}
			
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
				
				if(usert.equals("basic") && Contain == true){
				%>	
					<td><a style="font-size:20px; margin-left: 30%;">참여 중</a></td>
				<% 
				}else if(usert.equals("basic") && Contain != true){
				%>	
					<td>
					<div class="container2" style="width:200px; heigth:30px;">
					<input type="submit"  value="참여하기" style="border:0; outline:0;" class ="btn btn-1"><p4></p4></a>
					</td>
				<% 
				}
			
			%>	
				
					</form>
				</tr>
			
			
			
			
			<%
					}
				}else if(usert.equals("basic")){
				
					out.println("게시글이 없습니다.");
			
				}
			%>
			</table>
			
			<div id="page_num_block">
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
						<a id="page_num" href="Donation_list.jsp?pageNum=<%=startPagenum - 10%>&&mode=<%=mode%>">[이전]</a>
			<%
						}
						
						
						for( int i = startPagenum ; i <= endPagenum ; i++){
							if(i==current){
			%>
							<a id="page_num">[<%=i %>]</a>
			
			<% 			
							}else{
								 
			%>
							<a id="page_num" href="Donation_list.jsp?pageNum=<%=i %>&&mode=<%=mode%>">[<%=i %>]</a>		
			<%					
								
							}
						}
						
						if(endPagenum < pageCount){
								
			%>
							<a id="page_num" href="Donation_list.jsp?pageNum=<%=startPagenum + 10 %>&&mode=<%=mode%>">[다음]</a>	
							
			<%
						}
						
						if (usert.equals("donate")){
							if(mydonate == null){
			%>
									<a href="Duser/write.jsp">등록하기</a>
			<% 					
							}
							
						}
			%>
			</div>
	</div>
	<br><br><br><br><br><br>
	<br><br><br><br><br><br>
	<br><br><br><br><br><br>
	<%@include file ="static/footer.jsp" %>
</div> 