<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%

		String userid=null;
		String userpw=null;
		if (session.getAttribute("userID") == null) {
			out.println("<a href='login.jsp'>�α���</a>");
		}else
		{	
			userid = (String)session.getAttribute("userID");
			userpw = (String)session.getAttribute("userPassword");
			String usert = (String)session.getAttribute("userType");
			out.println(usert + " ȸ�� | " + userid+" �� �ݰ����ϴ�! <br>");
			out.println("<a href='logout.jsp'>�α׾ƿ�</a>");
		}

	
		String getDO_NAME = request.getParameter("getDO_NAME");
		String getORGAN_ID = request.getParameter("getORGAN_ID");
		String getPRODUCTION_TYPE = request.getParameter("getPRODUCTION_TYPE");
		String getPRODUCT_NUM = request.getParameter("getPRODUCT_NUM");
		String getPRODUCTION_PRICE = request.getParameter("getPRODUCTION_PRICE");
		String getDELIVERY_CHARGE = request.getParameter("getDELIVERY_CHARGE");
		String getESTIMATED_DATE = request.getParameter("getESTIMATED_DATE");
%>

		<form action = "order_result.jsp" method ="post">
			<%=userid %>
			<%=userpw %>
			<%=getDO_NAME %>
			<%=getORGAN_ID %>
			<%=getPRODUCTION_TYPE %>
			<%=getPRODUCT_NUM %>
			<input type = "text" name = "getPRODUCTION_PRICE" value = <%=getPRODUCTION_PRICE %>>
			<input type = "text" name = "getDELIVERY_CHARGE" value = <%=getDELIVERY_CHARGE %>>
			<input type = "hidden" name = "getORGAN_ID" value = <%=getORGAN_ID %>>
			<input type = "date" name = "getESTIMATED_DATE" min="2021-11-29" max="2080-01-01" value ="2021-11-29">
		<td><input type="submit" value="�Ϸ�"></td>
		</form>
	</br>
	<a href = "../Main.jsp">���� ��������</a>
</body>
</html>