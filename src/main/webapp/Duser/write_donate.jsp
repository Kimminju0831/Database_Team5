<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "user.UserDao" %>
<!DOCTYPE html>
<html>
<head>
<%
	
	int year = Integer.parseInt(request.getParameter("DperiodY"));
	int month = Integer.parseInt(request.getParameter("DperiodM"));
	int day = Integer.parseInt(request.getParameter("DperiodD"));
	
	String benefit = (String)request.getParameter("Dbenefit");
	String name = (String)request.getParameter("name");
	String type = "";
	
	String period =  year +"Y-"+ month +"M-"+ day +"D";
	
	if(year>=1){
		type = "LONG";
	}else if(year == 0  && month != 0){
		type = "SHORT";
	}else if(year == 0  && month == 0 && day != 1){
		type = "SHORT";
	}else if(year == 0 && month == 0 && day == 1){
		type = "TEMPORARY";
	}else{
%>		
		<script>
			alert('기간은 0으로 둘 수 없습니다')
			location.href="write.jsp";
		</script>
<% 		
	}
	
	String org_id = (String)request.getParameter("org_id");
	String org_pw = (String)request.getParameter("org_pw");
	
	UserDao manager = new UserDao();
	
	
	int res = 0;
	res = manager.makedonate(period, type, benefit, name, org_pw, org_id);
	
	if(res == -1){
%>		
		<script>
			alert('Error : 등록 실패')
			location.href="write.jsp";
		</script>
<% 	
	}
	
	
	
%>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
			<!-- org_id , org_pw , Dbenefit , DperiodY , DperiodM , DperiodD -->
			<script>
			alert('새로운 베풀기를 등록했습니다!')
			location.href="../Donation_list.jsp";
			</script>
			
</body>
</html>