<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@include file ="static/header.jsp" %> 
<link rel="stylesheet" href="static/main.css">
<div id = "body-wrapper">
      <div id ="body-content">
	<h2>관리자</h2>
	<form action="info_modi_do_admin.jsp" method=post>
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
	수정할 기부 취향 <select name="D_preference">
			    <option value="ABANDONED PETS" selected>ABANDONED PETS</option>
			    <option value="ENDANGERED SPECIES">ENDANGERED SPECIES</option>
			    <option value="SEXUAL SLAVE VICTIMS">SEXUAL SLAVE VICTIMS</option>
			    <option value="CHILDREN-IN-NEED">CHILDREN-IN-NEED</option>
			    <option value="DISABLED PEOPLE">DISABLED PEOPLE</option>
			    <option value="ENVIRONMENT">ENVIRONMENT</option>
			    <option value="FIREFIGHTERS">FIREFIGHTERS</option>
			    <option value="WAR SUFFERERS">WAR SUFFERERS</option>
			    <option value="ELDERLY">ELDERLY</option>
			</select>
			
	수정할 기부 기간 취향 <select name="D_period">
			    <option value="SHORTS" selected>SHORTS</option>
			    <option value="LONG">LONG</option>
			    <option value="TEMPORARY">TEMPORARY</option>
				</select>
	<br /> <br />
	<input type="reset" value="Reset"> 
	<input type="submit"value="Submit">
   </div>
   
   <%@include file ="static/footer.jsp" %>
</div>