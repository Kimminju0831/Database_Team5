<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language = "java" import="java.text.*, java.sql.*" %>
<%@page import="java.util.*" %>
<%@ page import="user.Gift"%> 
<!-- import JDBC package -->
<link rel="stylesheet" href="static/main.css">
<link rel="stylesheet" href="static/button.css">
<%@include file ="static/header.jsp" %>
<div id = "body-wrapper">
   	<div id ="body-content">
	<!-- <script>
			alert('DㅓBㅔ풀기를 통해 마음을 전달해주셔서 감사합니다!');
			//location.href="gift_Gives_presents_to.jsp";
		</script> -->
		
	<%
	
	String userid = ""; 
	if (session.getAttribute("userID") == null) {
	}else
	{
		userid = (String)session.getAttribute("userID");
		String usert = (String)session.getAttribute("userType");
	}

	out.println("<br><br>");	
	%>
	
		<%
			Gift manage = Gift.getInstance();

		%>
		
		<%
		request.setCharacterEncoding("UTF-8");
		String blink = request.getParameter("blink");//선물 줄 사람 아이디
		String nlink = request.getParameter("nlink");
		String check = request.getParameter("check");
		String product = request.getParameter("product");
		%>
		
		<%
			//해야할 것 PID 랜덤함수로 생성하기
			//수량, 가격 입력 받기
			//product에 insert하기
			//make에 insert하기
			
			
			if(check.equals("B")){
				out.println("<h3>" + blink + "에서 구매할 상품의 정보를 입력해주세요.</h3>");
				out.println("<br/>");
			}
			else if(check.equals("N"))
			{
				out.println("<h3>" + nlink + "에서 구매할 상품의 정보를 입력해주세요.</h3>");
				out.println("<br/>");
			}
			
		%>
		<form action="gift_complete.jsp" method=post>
		상품 개수 :
			<select name="quantity">
	    	<option value="1" selected>1</option>
	    	<option value="2">2</option>
	    	<option value="3">3</option>
	    	<option value="4">4</option>
	    	<option value="5">5</option>
	    	<option value="6">6</option>
	    	<option value="7">7</option>
	    	<option value="8">8</option>
	    	<option value="9">9</option>
	    	<option value="10">10</option>
			</select>
		
		가격을 입력해주세요. (Ex. ##.##) $<input type = "text" name = "price">
		<input type="hidden" name="blink" value="<%=blink%>">
		<input type="hidden" name="nlink" value="<%=nlink%>">
		<input type="hidden" name="check" value="<%=check%>">
		<input type="hidden" name="product" value="<%=product%>">
		<input type = "submit" value ="선물확정하기">
		<br/>
		<br/>
		<br/>
		<div class="container2">
			<a class ="btn btn" href='gift_list.jsp'><p4>선물 주문내역 페이지</p4></a>

		</div>
</div>
	
	<%@include file ="static/footer.jsp" %>
</div> 