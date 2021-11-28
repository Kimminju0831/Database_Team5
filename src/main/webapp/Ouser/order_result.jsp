<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="user.UserDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%

		String userid = (String)session.getAttribute("userID");

		String getDO_NAME = request.getParameter("getDO_NAME");
		String getORGAN_ID = request.getParameter("getORGAN_ID");
		String getPRODUCTION_TYPE = request.getParameter("getPRODUCTION_TYPE");
		String getPRODUCT_NUM = request.getParameter("getPRODUCT_NUM");
		String getPRODUCTION_PRICE = request.getParameter("getPRODUCTION_PRICE");
		String getDELIVERY_CHARGE = request.getParameter("getDELIVERY_CHARGE");
		String getESTIMATED_DATE = request.getParameter("getESTIMATED_DATE");
		
		UserDao manager = new UserDao();
		
		int res = 0;
		res = manager.confirmdorder(getDELIVERY_CHARGE, getPRODUCTION_PRICE, getESTIMATED_DATE, userid, getORGAN_ID);
		
		if(res == -1){
		%>
			<script type="text/javascript">
				alert('접수를 완료할 수 없습니다.')
				location.href="../Main.jsp";
			</script>
		<% 
			
		}else{
		%>
			<script type="text/javascript">
				alert('접수 했습니다.')
				location.href="order_list.jsp";
			</script>
		<%
		}
%>
</body>
</html>