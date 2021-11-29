<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import ="user.UserDao" %>
<%@ page import ="user.DAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%

	String userid = (String)session.getAttribute("userID");
	String userpw = (String)session.getAttribute("userPassword");
	String usert = (String)session.getAttribute("userType");
	
	UserDao manager = new UserDao();
	DAO manager2 = DAO.getInstance();
	
	int res = 0;
	int yn = 0;
	
	yn = manager2.out_contain(userid);
	if(yn==1){
		
		%>		
		<script type="text/javascript">
		alert('이미 등록한 기업입니다.')
		location.href="../Duser/out_list.jsp";
		</script>
<%	
		
	}
	
	String ESTIMATED_DATE = "2000-01-01";
	

	res = manager.makeout(ESTIMATED_DATE, userpw, userid);
	
	if(res != -1){
%>		
		<script type="text/javascript">
		alert('등록을 완료했습니다.')
		location.href="../Duser/out_list.jsp";
		</script>
<%	
	}else{
%>		
		<script type="text/javascript">
		alert('등록을 실패했습니다.')
		location.href="../Duser/out_list.jsp";
		</script>
<%	
	}




%>
</body>
</html>