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
	background: #f8a4bf;
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
</head>
<div id = "body-wrapper">
   	<div id ="body-content">
<div class="tab_content">
	<input type="radio" name="menu" id="tab1" checked> 
	<label for="tab1">상품 관련 조회_1</label> 
	<input type="radio" name="menu" id="tab2">
	<label for="tab2">상품 관련 조회_2</label> 
	<input type="radio" name="menu"id="tab3"> 
	<label for="tab3">상품 관련 조회_3</label> 
	<input type="radio" name="menu" id="tab4"> 

	

	<div class="content_box con1">
	<form action="./query_product_result.jsp" method="post">


			<p2> 2. 몇 개 미만의 제품일 때, 제품의 유형과 배송 요금이 궁금하신가요? </p2> <br> <br><p2>개수
			: </p2><input type="text" name="production_count"> <br> <br>

			

			<input type="reset" value="Reset"> <input type="submit" value="Submit">

			<br>
			<a href="Main.jsp"><p2>메인 페이지로 이동하기</p2></a>
			<a href='select_query_menu.jsp'><p2>질의 메뉴 페이지로 이동하기</p2></a>
			
		</form>


	</div>
	<div class="content_box con2">
	<form action="./query_product_result.jsp" method="post">
	
		
				<p2>10. 상품의 종류별로 실제 참고된 공익링크가 몇 개 인가요? 
			 </p2> <br> <br>
			   <input type="checkbox" value="yes" name="query_radio"> QUERY EXECUTE
            <br>
           	<input type="reset" value="Reset"> <input type="submit" value="Submit">

			<br>
			<a href="Main.jsp"><p2>메인 페이지로 이동하기</p2></a>
			<a href='select_query_menu.jsp'><p2>질의 메뉴 페이지로 이동하기</p2></a>

	
	</form>
	
	
	</div>
	<div class="content_box con3">
	<form action="./query_product_result.jsp" method="post">
	
	  
			 	  <p2>19. 상품의 유형에 따른 가장 저렴한 상품의 가격을 알고싶은 상품의 양의 최소값은 얼마인가요? </p2> 
			 <br> <br><p2>개수
			: <p2><input type="text" name="quantity_2"> <br> <br>
			 
			 
			<input type="reset" value="Reset"> <input type="submit" value="Submit">
<br>
			<a href="Main.jsp"><p2>메인 페이지로 이동하기</p2></a>
			<a href='select_query_menu.jsp'><p2>질의 메뉴 페이지로 이동하기</p2></a>

	</form>
	
	<%@include file ="static/footer.jsp" %> 
	
	</div>
	</div>
	</div>
	
	

</div>