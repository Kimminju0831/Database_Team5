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

String userid = (String)session.getAttribute("userID");

DAO manager = DAO.getInstance();

List<DonateDTO> list = null;

list = manager.getList_donate(userid);

String org_name = null;

org_name = manager.get_donate_org(userid);

if(org_name!=null){
	
	out.println(org_name + " ��ü�� ��� ���� �ֹ�");
	
}else{
%>
		<script>
			alert('� ���� ��� �������� �����ϴ�.')
			location.href="../Main.jsp";
		</script>
<%		
}
%>
<meta charset="EUC-KR">
<title>��� ���� �ֹ� ������</title>
</head>
<body>

<%

	if (session.getAttribute("userID") == null) {
		out.println("<a href='login.jsp'>�α���</a>");
	}else
	{
		String usert = (String)session.getAttribute("userType");
		out.println(usert + " ȸ�� | " + userid+" �� �ݰ����ϴ�! <br>");
		out.println("<a href='../logout.jsp'>�α׾ƿ�</a>");
		
	}
		int menu = manager.get_order_donate(userid);
		if(menu != 0)	//�ֹ��� �̹� �־��� == OUTSOURCING COMPANY �� ORGAN_ID �� ����.
		{
				// �ֹ��� �ְ� ���־�ü ������ ���� ���� ==  ��޺� ������
				if(menu == 2){
				%>
				<script type="text/javascript">
				alert('�ֹ��� ���εǾ����ϴ�.')
				location.href="../Mypage.jsp";
				</script>
				<%			
				}
				// �ֹ��� �־����� ���� ��ü ������ ������ ������
				else{
				%>
				<script type="text/javascript">
				alert('�ֹ� ���� ��� �� �Դϴ�.')
				location.href="../Mypage.jsp";
				</script>
				<%
				}
				
		}
		else{	// �ֹ��� ���� �ʾ���.
			String companyid = request.getParameter("company_id");
			//��۰��� ��δ�ü�� ��δ�üID ��ǰ���� ������
		%>
			<form action = "./order.jsp" method="POST">
			��� ���� : <input type ="text" name ="product_num">
			��ǰ ���� : <select name="production_type">
			    <option value="BADGE" selected>BADGE</option>
			    <option value="BAG">BAG</option>
			    <option value="BRACLET">BRACLET</option>
			    <option value="CUP">CUP</option>
			    <option value="KEYRING">KEYRING</option>
			    <option value="NECKLACE">NECKLACE</option>
			    <option value="POSTER">POSTER</option>
			    <option value="RING">RING</option>
			    <option value="STICKER">STICKER</option>
			    <option value="TUMBLER">TUMBLER</option>
			    
				</select>
			������ : <input type ="text" name ="design">
				<input type = "hidden" name = "org_name" value = <%=org_name %>>
				<input type = "hidden" name = "org_id" value = <%=userid %>>
				<input type = "hidden" name = "companyid" value = <%=companyid %>>
			<input type="submit" value="�Ϸ�"> <button type="button" onclick="location='../Main.jsp'">���</button>
			</form>
		
		
		<% 	
			
		}


%>
</body>
</html>