<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@include file ="static/header.jsp" %> 
<link rel="stylesheet" href="static/main.css">
<link rel="stylesheet" href="static/button.css">
<link href="./style.css" rel="stylesheet"><div id = "body-wrapper">
   	<div id ="body-content">
<%
if (session.getAttribute("userID") == null) {

}else
{
	String userid = (String)session.getAttribute("userID");
	String usert = (String)session.getAttribute("userType");	

%>
  
<%

   if(userid.equals("000-00-0000"))
   {
     
      %>
  	<div class="container2">
  	<a class ="btn btn" href='support.jsp'><p4>지원 페이지</p4></a>
  	<a class ="btn btn" href='info_add_admin0.jsp'><p4>[관리자 권한]사용자 가입 페이지</p4></a>
  	<a class ="btn btn" href='info_delete_admin0.jsp'><p4>[관리자 권한]사용자 탈퇴 페이지</p4></a>
  	<a class ="btn btn" href='info_modi_admin0.jsp'><p4>[관리자 권한]사용자 기본 정보 수정 페이지</p4></a>
  	<a class ="btn btn" href='info_modi_id_admin0.jsp'><p4>[관리자 권한]사용자 아이디 수정 페이지</p4></a>
  	<a class ="btn btn" href='info_modi_pw_admin0.jsp'><p4>[관리자 권한]사용자 비밀번호 수정 페이지</p4></a>
  	<a class ="btn btn" href='info_modi_do_admin0.jsp'><p4>[관리자 권한]사용자 기부 취향 수정 페이지</p4></a>
  	<a class ="btn btn" href='info_modi_gi_admin0.jsp'><p4>[관리자 권한]사용자 선물 취향 수정 페이지</p4></a>
  				</div>
      <%
   }
   
   if(usert.equals("donate")){
%>

<%      
   }else if(usert.equals("outsourcing")){
%>

<%      
   }else if(usert.equals("basic")){
%>		
 
      
<%         
   }

}

%>
		<a href="Main.jsp"><img id="img" src="static/media/donate2.png"></a>
	</div>
	
	<%@include file ="static/footer.jsp" %>
</div>

