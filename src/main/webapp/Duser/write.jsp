<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "user.UserDao" %>
<!DOCTYPE html>
<html>
<head>
<%

	if (session.getAttribute("userID") == null) {
		out.println("<a href='../login.jsp'>�α���</a>");
	}else
	{
		String userid = (String)session.getAttribute("userID");
		String usert = (String)session.getAttribute("userType");
		String userpw = (String)session.getAttribute("userPassword");
		out.println(usert + " ȸ�� | " + userid+" �� �ݰ����ϴ�! <br>");
		out.println("<a href='../logout.jsp'>�α׾ƿ�</a>");

%>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
		
		��� �������� ���ε��ϴ� ����Ʈ�Դϴ�.
		
<%

	//insert into DONATION_ORGANIZATION 
	//(Donation_period, Donation_type, Beneficiary, Donation_organization_name, org_pwd, org_id) 
	// values ('1Y-1M-12D', 'LONG', 'ENVIRONMENT', 'HEEJUNGCOMPANY', 'Indigo', '442-05-1994');
	// �Ⱓ / �Ⱓ ���� / ������ / �̸� / ��� ��й�ȣ / ��� ���̵�
	
	// �Ⱓ �����ϰ�
	
	// �Ⱓ�� ���ڷ� ���� : year >= 1 �̸� long , year < 1 �̸� short , day = 1 �̸� temporary
	
	// �����ڸ� üũ �ڽ��� ����
	
	// ��� ���̵� �Է�

%>
	
		<form action = "./write_donate.jsp" method = "POST">
				<br>
				<br/>
				<b>��� �Ⱓ�� �������ּ���.</b>
				<br><br>��� �Ⱓ : 
				<select name="DperiodY">
			    <option value="0" selected>0</option>
<%
				
				for (int i = 1 ; i < 11 ; i++){
					String sentence = "<option value=\"" + i + "\">" + i + "</option>";
					out.println(sentence);
				}

%>		
				</select> YEAR
				
				<select name="DperiodM">
			    <option value="0" selected>0</option>
<%
				
				for (int i = 1 ; i < 12 ; i++){
					String sentence = "<option value=\"" + i + "\">" + i + "</option>";
					out.println(sentence);
				}

%>				 
				</select> MONTH
				
				<select name="DperiodD">
			    <option value="0" selected>0</option>
<%
				
				for (int i = 1 ; i < 31 ; i++){
					String sentence = "<option value=\"" + i + "\">" + i + "</option>";
					out.println(sentence);
				}

%>			    
				</select> DAY
				<br>
				<br/>
				<b>������ ������ �������ּ���.</b>
				
				<br><br>������ ���� : 
				<select name="Dbenefit">
			    <option value="ABANDONED PETS" selected>ABANDONED PETS</option>
			    <option value="ENDANGERED SPECIES">ENDANGERED SPECIES</option>
			    <option value="SEXUAL SLAVE VICTIMS">SEXUAL SLAVE VICTIMS</option>
			    <option value="CHILDREN-IN-NEED">CHILDREN-IN-NEED</option>
			    <option value="DISABLED PEOPLE">DISABLED PEOPLE</option>
			    <option value="ENVIRONMENT">ENVIRONMENT</option>
			    <option value="FIREFIGHTERS">FIREFIGHTERS</option>
			    <option value="WAR SUFFERERS">WAR SUFFERERS</option>
			    <option value="ELDERLY">ELDERLY</option>
				</select>
				
				<br>
				<br/>
				<b>��� ��ü���� �Է����ּ���.</b>
				<input type="text" name="name" maxlength="50"> <br> 
				
				<input type = "hidden" name = "org_id" value = <%=userid %>>
				<input type = "hidden" name = "org_pw" value = <%=userpw %>>
				
				<!-- org_id , org_pw , Dbenefit , DperiodY , DperiodM , DperiodD -->
				<input type="submit" value="�Ϸ�"> <button type="button" onclick="location='../Main.jsp'">���</button>
				
		</form>
		
<%

	}

%>				
</body>
</html>