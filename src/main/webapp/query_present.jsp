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
	<p2>query_present</p2>

	<form action="./query_present_result.jsp" method="post">
		<a>
 <p2>20. 링크들 중에서 실제로 사용자들이 선물할 때 참고한 링크들은 무엇인가요?</p2>
		 <br> <br>

			   <input type="checkbox" value="yes" name="query_radio"> <p2>실행할래요!</p2>
            <br>
            
			
				
		</a> <a><input type="reset" value="Reset"><input type="submit"
			value="Submit"></a>
	</form>

		<div class="container2">
<a class ="btn btn" href='Main.jsp'><p4>메인 페이지</p4></a>
<a class ="btn btn" href='select_query_menu.jsp'><p4>질의 메뉴 페이지로 이동하기</p4></a>
			</div>
			<br>
	<%@include file ="static/footer.jsp" %> 
	
	</div></div>
</body>
</html>