<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@include file ="static/header.jsp" %> 
<link rel="stylesheet" href="static/main.css">
<div id = "body-wrapper">
      <div id ="body-content">
	<h2>관리자</h2>
	<form action="info_modi_admin.jsp" method=post>
	관리자 계정입니다. 
	<br />
	관리자 아이디 : <input type="text" name="adminid">
	관리자 비밀번호 : <input type="text" name="adminpw">
	<br /><br /> <br />
	사용자 정보 수정을 도와드립니다.
	<br />
	정보 수정을 도와드릴 사용자의 로그인 정보와 수정할 정보를 기입해주시기 바랍니다. 
	<br /><br />
	사용자 아이디 : (ex : 000-00-000) <input type="text" name="id">
	<br /> <br />
	사용자 비밀번호 : <input type="text" name="pw">
	<br /> <br />
	변경할 정보 <select name="infotype">
			    <option value="address">주소 변경</option>
			    <option value="phone"> 전화번호 변경</option>
			    <option value="name"> 이름 변경</option>
			</select>
	<br />
	선택한 정보의 수정 정보를 입력해주세요. <input type="text" name="newinfo">
    <br />
	<input type="reset" value="Reset"> 
	<input type="submit"value="Submit">
   </div>
   
   <%@include file ="static/footer.jsp" %>
</div>