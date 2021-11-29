<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "user.DAO" %>
<%@ page import = "user.User" %>
<%@ page import = "user.DonateDTO" %>
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
<title>��� ������ ���</title>
</head>
<body>
<h3>
<%
	if(det != null){

	
%>
	<%=det %> ��� ������ ���</h3>
	
<%
	}else{
		
%>
		<script>
			alert('� ���� ��� �������� �����ϴ�.')
			location.href="../Main.jsp";
		</script>
<% 		
		
	}

%>
		<table>
			<tr>
				<td width = "5%">��ȣ</td>
				<td width = "10%">����� �̸�</td>
				<td width = "15%">����� ��ȭ��ȣ</td>
				<td width = "20%">����� �ּ�</td>
				<td width = "10%">����</td>
			</tr>
			
			<%
				DonateDTO board  = null;
				if(list != null){
					for(int i = start-1; i < end ; i++){
						board = list.get(i);
						
						String uid = board.getuid();
						System.out.println(uid);
						
						User user = new User();
						user = manager.getList_user(uid);
						if(user != null){
						
				%>
				<tr>
						<td><%=i %></td>	
						<td><%=user.getUserName() %></td>
						<td><%=user.getUserPhone() %></td>
						<td><%=user.getUserAddress() %></td>
						<td> ������ </td>
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
						<a href="people_list.jsp?pageNum=<%=startPagenum - 10%>">[����]</a>
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
							<a href="people_list.jsp?pageNum=<%=startPagenum + 10 %>">[����]</a>	
							
			<%
						}
						
						
			%>
			
			
		</table>
		<br>
		<button type="button" onclick="location='out_list.jsp'">��� ���� �ֹ� ������</button>
		<a href = "../Main.jsp">���� ��������</a>
</body>
</html>