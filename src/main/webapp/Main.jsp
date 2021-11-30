<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@include file ="static/header.jsp" %> 
	
<div id = "body-wrapper">
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
      out.println("<a href = 'support.html'>지원 페이지</a>");
      out.println("<br>");
      out.println("<a href = 'info_add_admin.html'>[관리자 권한]사용자 가입 페이지</a>");
      out.println("<br>");
      out.println("<a href = 'info_delete_admin.html'>[관리자 권한]사용자 탈퇴 페이지</a>");
      out.println("<br>");
      out.println("<a href = 'info_modi_admin.html'>[관리자 권한]사용자 기본 정보 수정 페이지</a>");
      out.println("<br>");
      out.println("<a href = 'info_modi_id_admin.html'>[관리자 권한]사용자 아이디 수정 페이지</a>");
      out.println("<br>");
      out.println("<a href = 'info_modi_pw_admin.html'>[관리자 권한]사용자 아이디 수정 페이지</a>");
      out.println("<br>");
      out.println("<a href = 'info_modi_do_admin.html'>[관리자 권한]사용자 기부 취향 수정 페이지</a>");
      out.println("<br>");
      out.println("<a href = 'info_modi_gi_admin.html'>[관리자 권한]사용자 선물 취향 수정 페이지</a>");
      out.println("<br>");
      
      
   }
   
   if(usert.equals("donate")){
%>
   <br>
   <a href = 'Duser/Donate_order.jsp'>기부 혜택 주문 페이지</a>
   <br>
   <a href = 'Duser/people.jsp'>기부 참여자 조회 페이지</a>
<%      
   }else if(usert.equals("outsourcing")){
%>
   <br>
   <a href = 'Ouser/order_list.jsp'>주문 페이지</a>
   <br>
   <a href = 'Duser/out_list.jsp'>주문 페이지</a>
<%      
   }else if(usert.equals("basic")){
%>		
 
      
<%         
   }

}

%>
	</div>

<%@include file ="static/footer.jsp" %>
