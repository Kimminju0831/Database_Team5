<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "user.UserDao" %>
<!DOCTYPE html>
<html>
<head>
<%

	String userid = "";
	String userpw = "";
	
	if (session.getAttribute("userID") == null) {
		out.println("<a href='login.jsp'>로그인</a>");
	}else
	{
		userid = (String)session.getAttribute("userID");
		String usert = (String)session.getAttribute("userType");
		out.println(usert + " 회원 | " + userid+" 님 반갑습니다! <br>");
	out.println("<a href='logout.jsp'>로그아웃</a>");
	}
	
	String PRODUCT_NUM = (String)request.getParameter("product_num");
	String PRODUCTION_TYPE = (String)request.getParameter("production_type");
	String DESIGN = (String)request.getParameter("design");
	String DO_NAME = (String)request.getParameter("org_name");
	String ORGAN_ID = (String)request.getParameter("org_id");	
	
	UserDao manager = new UserDao();
	
	String input = PRODUCT_NUM + " " + PRODUCTION_TYPE + " " + DESIGN + " "
			+ DO_NAME + " " + ORGAN_ID;
	System.out.println(input);
	
	String DELIVERY_CHARGE = "none";
	String PRODUCTION_PRICE = "none";
	String ESTIMATED_DATE = "01/01/01";
	String unknown = "none";
	String companyid = request.getParameter("companyid");
	
	int res = manager.makedorder(DELIVERY_CHARGE, DESIGN, PRODUCTION_TYPE, PRODUCTION_PRICE, 
				ESTIMATED_DATE, PRODUCT_NUM, unknown, companyid, ORGAN_ID, DO_NAME);
	
	if(res!=-1){
%>
		<script type="text/javascript">
			alert('주문을 완료 했습니다.')
			location.href="../Main.jsp";
		</script>
<% 		
	}else{
%>
		<script type="text/javascript">
			alert('주문할 수 없습니다.')
			location.href="../Main.jsp";
		</script>
<%
		
	}
	
%>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>