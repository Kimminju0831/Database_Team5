<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@include file ="static/header.jsp" %> 
<link rel="stylesheet" href="static/main.css">
<div id = "body-wrapper">
      <div id ="body-content">
	<form action="info_do_user.jsp" method=post>
	나의 아이디 : <input type="text" name="id">
	<br /> <br />
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
	
	비밀번호 확인 : <input type="text" name="pw">
	<br /> <br />
	<input type="reset" value="Reset"> 
	<input type="submit"value="Submit">
	
	<br /> <br />
	<a href = 'Main.jsp'>메인 페이지</a>
	<a href = 'Mypage.jsp'>정보 수정 페이지</a>
   </div>
   
   <%@include file ="static/footer.jsp" %>
</div>