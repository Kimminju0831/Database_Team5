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
      out.println("<a href = 'info_add_admin0.jsp'>[관리자 권한]사용자 가입 페이지</a>");
      out.println("<br>");
      out.println("<a href = 'info_delete_admin0.jsp'>[관리자 권한]사용자 탈퇴 페이지</a>");
      out.println("<br>");
      out.println("<a href = 'info_modi_admin0.jsp'>[관리자 권한]사용자 기본 정보 수정 페이지</a>");
      out.println("<br>");
      out.println("<a href = 'info_modi_id_admin0.jsp'>[관리자 권한]사용자 아이디 수정 페이지</a>");
      out.println("<br>");
      out.println("<a href = 'info_modi_pw_admin0.jsp'>[관리자 권한]사용자 아이디 수정 페이지</a>");
      out.println("<br>");
      out.println("<a href = 'info_modi_do_admin0.jsp'>[관리자 권한]사용자 기부 취향 수정 페이지</a>");
      out.println("<br>");
      out.println("<a href = 'info_modi_gi_admin0.jsp'>[관리자 권한]사용자 선물 취향 수정 페이지</a>");
      out.println("<br>");
      
      out.println("<a href = 'select_query_menu.jsp'>질의 메뉴 페이지</a>");
      out.println("<br>");
      
   }
   
   else{
      out.println("<a href = 'Delete_path.jsp'>회원 탈퇴 페이지</a>");
      out.println("<br>");
      out.println("<a href = 'Mypage.jsp'>마이 페이지</a>");
      out.println("<br>");
      out.println("<a href = 'support.jsp'>지원 페이지</a>");
      out.println("<br>");
      out.println("<a href = 'select_query_menu.jsp'>질의 메뉴 페이지</a>");
      out.println("<br>");
      
   }
 
   if(usert.equals("donate")){
%>
   <br>
   <a href = 'Donation_list.jsp'>기부 목록 페이지</a>
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
      <br>
      <a href = 'prefer.jsp'>취향 페이지</a>
      <br>
      <a href = 'Donation_list.jsp'>기부 목록 페이지</a>
      <br>
      <a href = 'gift_Gives_presents_to.jsp'>선물하기 페이지</a>
      <br>
      <a href = 'gift_list.jsp'>선물 주문 내역 페이지</a>
      
<%         
   }
}
%>
	</div>

<%@include file ="static/footer.jsp" %>