<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "user.DAO" %>
<!DOCTYPE html>
<html>
<head>
<% 

	DAO manager = DAO.getInstance();
	String userid = (String)session.getAttribute("userID");
	
	// �ֹ��� �̹� �־��� == OUTSOURCING COMPANY �� ORGAN_ID �� ����.
	if(manager.get_order_donate(userid)==1)	
	{
			// �ֹ��� �ְ� ���־�ü ������ ���� ����
	
			// �ֹ��� �־����� ���� ��ü ������ ������ ������
			
	}
	else{	// �ֹ��� ���� �ʾ���.
		
		//��۰���
		//��δ�ü��
		//��δ�üID
		//��ǰ����
		//������
		
	}



%>
<meta charset="EUC-KR">
<title>��� ���� �ֹ� ������</title>
</head>
<body>

	

</body>
</html>