<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- import JDBC package -->
<%@include file ="static/header.jsp" %> 
<link rel="stylesheet" href="static/main.css">
<div id = "body-wrapper">
   	<div id ="body-content">

	<h2 style="margin-top:20%; margin-left:30%;"> 선물하고자 하는 분의 아이디를 입력해주세요.</h2>
	<br/>
	<form method="post" action = "gift_Show_preference.jsp">
	 <a style="margin-top:5%; margin-left:30%;"> 선물 취향 조회 : <input type="text" name="recvid"></a>
	
	<input type="reset" value="Reset"> 
	<input type="submit"value="Submit">
	</form>
</div>
	
	<%@include file ="static/footer.jsp" %>
</div> 