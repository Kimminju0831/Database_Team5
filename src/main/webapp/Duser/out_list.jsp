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
<title>�ƿ� �ҽ� ��� ������</title>
</head>
<body>
<%
	
	String usert = "";
	if (session.getAttribute("userID") == null) {
		out.println("<a href='login.jsp'>�α���</a>");
	}else
	{
		usert = (String)session.getAttribute("userType");
		out.println(usert + " ȸ�� | " + userid+" �� �ݰ����ϴ�! <br>");
		out.println("<a href='../logout.jsp'>�α׾ƿ�</a>");
		
	}
		
	


%>

<h3>���� ��ü ���</h3>
		<table>
			<tr>
				<td width = "10%">��ȣ</td>
				<td width = "20%">��ü��</td>
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
					<td><input type="submit" value="�����ϱ�"></td>
			<%
				}
			%></form>
			</tr>
			<%
					}
				}
				else{
					out.println("���� ����� �������� �ʽ��ϴ�.");
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
							<a href="out_list.jsp?pageNum=<%=startPagenum - 10%>">[����]</a>
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
							<a href="out_list.jsp?pageNum=<%=startPagenum + 10 %>">[����]</a>	
							
				<%								
						}
					
			%>
		</table>


</body>
</html>