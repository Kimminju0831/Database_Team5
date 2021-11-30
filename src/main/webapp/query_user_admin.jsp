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
	<label for="tab1">사용자 관련 조회_1</label> 
	<input type="radio" name="menu" id="tab2">
	<label for="tab2">사용자 관련 조회_2</label> 
	<input type="radio" name="menu"id="tab3"> 
	<label for="tab3">사용자 관련 조회_3</label> 
	<input type="radio" name="menu" id="tab4"> 
	<label for="tab4">사용자 관련 조회_4</label> 
	<input type="radio" name="menu" id="tab5"> 
	<label for="tab5">사용자 관련 조회_5</label>
	<input type="radio" name="menu" id="tab6"> 
	<label for="tab6">사용자 관련 조회_6</label>
	<input type="radio" name="menu" id="tab7"> 
	<label for="tab7">사용자 관련 조회_7</label>
	

	<div class="content_box con1">
	<form action="./query_user_result_admin.jsp" method="post">


			<p2>3. 어떤 수혜자를 선호하는 유저의 ID가 궁금하신가요?</p2> <br>
			<br><p2>수혜자 :</p2> <select name="beneficiary">
				<option value="ABANDONED PETS" selected>ABANDONED PETS</option>
				<option value="ENDANGERED SPECIES">ENDANGERED SPECIES</option>
				<option value="SEXUAL SLAVE VICTIMS">SEXUAL SLAVE VICTIMS</option>
				<option value="CHILDREN-IN-NEED">CHILDREN-IN-NEED</option>
				<option value="DISABLED PEOPLE">DISABLED PEOPLE</option>
				<option value="ENVIRONMENT">ENVIRONMENT</option>
				<option value="FIREFIGHTERS">FIREFIGHTERS</option>
				<option value="WAR SUFFERERS">WAR SUFFERERS</option>
				<option value="ELDERLY">ELDERLY</option>
			</select> <br> <br> 

			<input type="reset" value="Reset"> <input type="submit" value="Submit">

			<br>
			<a href="Main.jsp"><p2>메인 페이지로 이동하기</p2></a>
			<a href='select_query_menu.jsp'><p2>질의 메뉴 페이지로 이동하기</p2></a>
			
		</form>


	</div>
	<div class="content_box con2">
	<form action="./query_user_result_admin.jsp" method="post">
	
	 <p2>5. 선택한 유저의 이름, 전화번호, 주소를 알려드립니다. 어떤 디자인의 어떤 유형의 상품을 선택한 유저의 정보를 알고싶으신가요?</p2>
           
          
              <br><br><p2>디자인 :</p2> 
           <input type="text" name="production_design">
            <br><br><p2>상품 유형 :</p2> 
            <select name="production_type">
             <option value="BADGE" selected>BADGE</option>
             <option value="BAG">BAG</option>
             <option value="BRACELET">BRACELET</option>
             <option value="CUP">CUP</option>
             <option value="KEYRING">KEYRING</option>
             <option value="NECKLACE">NECKLACE</option>
             <option value="POSTER">POSTER</option>
             <option value="RING">RING</option>
             <option value="STICKER">STICKER</option>
             <option value="TUMBLER">TUMBLER</option>
            </select>
            
            <br>
            <br>
           	<input type="reset" value="Reset"> <input type="submit" value="Submit">

			<br>
			<a href="Main.jsp"><p2>메인 페이지로 이동하기</p2></a>
			<a href='select_query_menu.jsp'><p2>질의 메뉴 페이지로 이동하기</p2></a>
			
	</form>
	
	
	</div>
	<div class="content_box con3">
	<form action="./query_user_result_admin.jsp" method="post">
	
	   <p2>6. 몇 개 이상의 상품을 구매한 유저의 이름과 상품명이 궁금하신가요? </p2>
           
             
              <br><br><p2>개수 :</p2> 
           <input type="text" name="production_count">
           
            <br>
            <br>
            
			<input type="reset" value="Reset"> <input type="submit" value="Submit">
<br>
			<a href="Main.jsp"><p2>메인 페이지로 이동하기</p2></a>
			<a href='select_query_menu.jsp'><p2>질의 메뉴 페이지로 이동하기</p2></a>
				</form>
	</div>
	
	
	<div class="content_box con4">
	<form action="./query_user_result_admin.jsp" method="post">
	
	<p2>7. 어떤 기부 취향을 가진 유저의 이름과 전화번호를 알고 싶으신가요? </p2>
         
             <br><br><p2>수혜자 :</p2> 
            <select name="beneficiary_2">
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
		<a href="Main.jsp"><p2>메인 페이지로 이동하기</p2></a>
			<a href='select_query_menu.jsp'><p2>질의 메뉴 페이지로 이동하기</p2></a>
				</form>
	
	</div>
	
	
	<div class="content_box con5">
	<form action="./query_user_result_admin.jsp" method="post">
	
	 <p2>9. 제품을 ___ 이상 주문받은 기부물품별로 주문받은 총 상품 개수는 무엇인가요? </p2>
         <br><br><p2>개수 :</p2> 
           <input type="text" name="production_count_2">
           
            <br>
            <br>
            
		<input type="reset" value="Reset"> <input type="submit" value="Submit">

			<br>
			<a href="Main.jsp"><p2>메인 페이지로 이동하기</p2></a>
			<a href='select_query_menu.jsp'><p2>질의 메뉴 페이지로 이동하기</p2></a>
			</form>
	
	</div>
	
	
	
		<div class="content_box con6">
	<form action="./query_user_result_admin.jsp" method="post">
	
	    <p2> 11. _______의 선물을 받고 싶어하는 유저의 이름과 전화번호는 무엇인가요? </p2>
           
          
             <br><br><p2>상품 유형 :</p2> 
            <select name="production_type_2">
             <option value="BADGE" selected>BADGE</option>
             <option value="BAG">BAG</option>
             <option value="BRACELET">BRACELET</option>
             <option value="CUP">CUP</option>
             <option value="KEYRING">KEYRING</option>
             <option value="NECKLACE">NECKLACE</option>
             <option value="POSTER">POSTER</option>
             <option value="RING">RING</option>
             <option value="STICKER">STICKER</option>
             <option value="TUMBLER">TUMBLER</option>
            </select>
            
            <br>
            <br>
		<input type="reset" value="Reset"> <input type="submit" value="Submit">

			<br>
			<a href="Main.jsp"><p2>메인 페이지로 이동하기</p2></a>
			<a href='select_query_menu.jsp'><p2>질의 메뉴 페이지로 이동하기</p2></a>
			</form>
	
	</div>
	
	<div class="content_box con7">
	<form action="./query_user_result_admin.jsp" method="post">
	
	   <p2>  12. 선물을 받은 적이 있는 유저의 이름은? </p2>
            <br>
            <br>
      <input type="checkbox" value="yes" name="query_radio"> <p2>알고싶어요!
            </p2><br>
            
	<input type="reset" value="Reset" name="reset"> <input type="submit" value="Submit">
			<br>
			<a href="Main.jsp"><p2>메인 페이지로 이동하기</p2></a>
			<a href='select_query_menu.jsp'><p2>질의 메뉴 페이지로 이동하기</p2></a>
			</form>
	
	<%@include file ="static/footer.jsp" %> 
	
	</div>
	</div>
	</div>
	

</div>