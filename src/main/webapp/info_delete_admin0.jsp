<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@include file ="static/header.jsp" %> 
<link rel="stylesheet" href="static/main.css">
<div id = "body-wrapper">
      <div id ="body-content">
	<h2>관리자</h2>
	<form action="info_delete_admin.jsp" method=post>
	관리자 계정입니다. 
	<br />
	관리자 아이디 : <input type="text" name="adminid">
	관리자 비밀번호 : <input type="text" name="adminpw">
	<br /><br /> <br />
	사용자 탈퇴을 도와드립니다.
	<br />
	탈퇴시킬 사용자의 정보를 기입해주시기 바랍니다. 
	<br /><br />
	사용자 아이디 : (ex : 000-00-000) <input type="text" name="id">
	<br /> <br />
	사용자 비밀번호 : <input type="text" name="pw">
	<br /> <br />
	탈퇴 사유 <select name="reason">
			    <option value="sleeperuser" selected>휴면 계정</option>
			    <option value="abusive">폭력적인 언행 사용</option>
			    <option value="userwant">사용자 희망</option>
			    <option value="etc">기타</option>
			    
			</select>
    <br />
	<input type="reset" value="Reset"> 
	<input type="submit"value="Submit">
   </div>
   
   <%@include file ="static/footer.jsp" %>
</div>