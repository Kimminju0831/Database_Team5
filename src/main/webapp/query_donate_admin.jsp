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
<link rel="stylesheet" href="static/button.css">


<head>
<meta charset="UTF-8">
<link href="./style.css" rel="stylesheet">
</head>

<body>
<div id = "body-wrapper">
   	<div id ="body-content">
<div class="tab_content">

	<input type="radio" name="menu" id="tab1" checked> 
	<label for="tab1">기부 관련 조회_1</label> 
	<input type="radio" name="menu" id="tab2">
	<label for="tab2">기부 관련 조회_2</label> 
	<input type="radio" name="menu"id="tab3"> 
	<label for="tab3">기부 관련 조회_3</label> 
	<input type="radio" name="menu" id="tab4"> 
	<label for="tab4">기부 관련 조회_4</label> 
	<input type="radio" name="menu" id="tab5"> 
	
<!--  <p2>기부관련 조회</p2>-->
	<div class="content_box con1">
	<form action="./query_donate_result_admin.jsp" method="post">


			
		<p2>  1. 어떤 기부 기간을 가진 기부 단체를 보고 싶으신가요? </p2> 
		<br> <br><p2>기부 타입:</p2>
			
			 <select name="donation_type">
             <option value="SHORT" selected>SHORT</option>
             <option value="LONG">LONG</option>
            <option value="TEMPORARY">TEMPORARY</option>
            </select>
           		<br> <br>
           		
           		<input type="reset" value="Reset"> <input type="submit" value="Submit">

			<br>
			<div class="container2">
<a class ="btn btn" href='Main.jsp'><p4>메인 페이지</p4></a>
<a class ="btn btn" href='select_query_menu.jsp'><p4>질의 메뉴 페이지로 이동하기</p4></a>

</div>
			
		</form>


	</div>
	<div class="content_box con2">
	<form action="./query_donate_result_admin.jsp" method="post">
	
	
	<p2> 13. _______는 모든 단체에 기부하는 유저의 아이디와 이름은? </p2> 
		<br> <br>
		<p2>기부 기관 이름:</p2>
		<input type="text" name="donation_organization_name"> <br> <br>
		
		<input type="reset" value="Reset"> <input type="submit" value="Submit">

			<br>
				<div class="container2">
<a class ="btn btn" href='Main.jsp'><p4>메인 페이지</p4></a>
<a class ="btn btn" href='select_query_menu.jsp'><p4>질의 메뉴 페이지로 이동하기</p4></a>

	
	</form>
	
	
	</div>
	<div class="content_box con3">
	<form action="./query_donate_result_admin.jsp" method="post">
	
	    <p2>14. 어떤 기부 기관의 아이디를 알고싶으신가요?  </p2> 
		<br> <br>
		<p2>기부 기관 이름:</p2>
		<input type="text" name="do_org_name"> <br> <br>
		
			<input type="reset" value="Reset"> <input type="submit" value="Submit">
<br>
				<div class="container2">
<a class ="btn btn" href='Main.jsp'><p4>메인 페이지</p4></a>
<a class ="btn btn" href='select_query_menu.jsp'><p4>질의 메뉴 페이지로 이동하기</p4></a>
</form>
	</div>
	
	
	<div class="content_box con4">
	<form action="./query_donate_result_admin.jsp" method="post">
	
	 <p2>18. 기부 타입과 기부한 사람들의 수를 알고싶은 기부 수혜자 타입은 무엇인가요? </p2> 
		
		  <br><br><p2>수혜자 :</p2> 
            <select name="beneficiary">
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
            
            <br>
            <br>
	
		<input type="reset" value="Reset"> <input type="submit" value="Submit">

			<br>
			
				<div class="container2">
<a class ="btn btn" href='Main.jsp'><p4>메인 페이지</p4></a>
<a class ="btn btn" href='select_query_menu.jsp'><p4>질의 메뉴 페이지로 이동하기</p4></a>
</form>
	
	</div>
	
<%@include file ="static/footer.jsp" %> 
</div></div>
</div>
</body>