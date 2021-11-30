<style>
* {
	margin: 0;
	padding: 0;
	border: 0;
}

.tab_content {
	text-align: center;
	font-size: 0;
}

input[type="radio"] {
	display: none;
}

input[type="radio"]+label {
	display: inline-block;
	padding: 25px;
	background: #fea4a4;
	color: #000000;
	font-size: 18px;
	cursor: pointer;
border-top-left-radius: 15px;
border-top-right-radius: 15px;
border-bottom-left-radius: 0px;
border-bottom-left-radius: 0px;
}

input[type="radio"]:checked+label {
	background: #dbdbdb;
	color: #000000;
}

.content_box {
	height: 200px;
	background:  #dbdbdb;
	margin: 0 20px;
	display: none;
	text-align: left;
	font-size: 14px;
	padding: 20px;
	box-sizing: border-box;
}

input[id="tab1"]:checked ~ .con1 {
	display: block;
}
input[id="tab2"]:checked ~ .con2 {
	display: block;
}
input[id="tab3"]:checked ~ .con3 {
	display: block;
}
input[id="tab4"]:checked ~ .con4 {
	display: block;
}
</style>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file ="static/header.jsp" %> 

<head>
<meta charset="UTF-8">
<link href="./style.css" rel="stylesheet">
<link rel="stylesheet" href="static/button.css">

</head>


<div id = "body-wrapper">
   	<div id ="body-content">

<div class="tab_content">
	<input type="radio" name="menu" id="tab1" checked> 
	<label for="tab1">선물 관련 조회_1</label> 
	<input type="radio" name="menu" id="tab2">
	<label for="tab2">선물 관련 조회_2</label> 
	
	

	<div class="content_box con1">
	<form action="./query_present_result_admin.jsp" method="post">


	<p2>8. _______가 선물할 때 참고한 링크와 공익적 링크는 무엇인가요?</p2>
		 <br> <br>
		 <p2>사용자 이름:</p2> <input type="text" name="user_name"> <br> <br>


			<input type="reset" value="Reset"> <input type="submit" value="Submit">

			<br>
			<div class="container2">
<a class ="btn btn" href='Main.jsp'><p4>메인 페이지</p4></a>
<a class ="btn btn" href='select_query_menu.jsp'><p4>질의 메뉴 페이지로 이동하기</p4></a>
			</div>
			
		</form>


	</div>
	<div class="content_box con2">
	<form action="./query_present_result_admin.jsp" method="post">
	
	
<p2>20. 링크들 중에서 실제로 사용자들이 선물할 때 참고한 링크들은 무엇인가요?</p2>
		 <br> <br>
		 
		    <input type="checkbox" value="yes" name="query_radio"> QUERY EXECUTE
            <br>
           	<input type="reset" value="Reset"> <input type="submit" value="Submit">

			<br>
				<div class="container2">
<a class ="btn btn" href='Main.jsp'><p4>메인 페이지</p4></a>
<a class ="btn btn" href='select_query_menu.jsp'><p4>질의 메뉴 페이지로 이동하기</p4></a>
			</div>
			</form>
		<%@include file ="static/footer.jsp" %> 
	
	
	</div>
	
	</div></div>
	
	

</div>