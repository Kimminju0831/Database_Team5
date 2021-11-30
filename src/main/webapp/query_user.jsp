
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@include file ="static/header.jsp" %> 
   
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="./style.css" rel="stylesheet">
<link rel="stylesheet" href="static/button.css">

<title>Main page</title>
</head>
<body>

<div id = "body-wrapper">
   	<div id ="body-content">
<p>query_user</p>
   
           <p2>
              
           사용자 관련 처리할 질의가 존재하지 않습니다.
            
         </p2>
         <br><br>
   
   	<div class="container2">
<a class ="btn btn" href='Main.jsp'><p4>메인 페이지</p4></a>
<a class ="btn btn" href='select_query_menu.jsp'><p4>질의 메뉴 페이지로 이동하기</p4></a>
			</div>
			
   <br>
   	<%@include file ="static/footer.jsp" %>
   
   </div>
   </div>
</body>
</html>