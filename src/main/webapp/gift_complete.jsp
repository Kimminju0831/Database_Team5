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
	<script>
			alert('DㅓBㅔ풀기를 통해 마음을 전달해주셔서 감사합니다!');
			//location.href="gift_Gives_presents_to.jsp";
	</script>
		
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
		String quantity = request.getParameter("quantity");
		String price = request.getParameter("price");
		
		%>
			
			
		<%
			int result;	
			int mresult;
			result = manage.product_insert(quantity, product, price, userid);
			
			if(result == 0)
			{
				out.println("선물하기에 실패했습니다.");
			}
			
			else if(result == 1)
			{
				out.println("선물하기에 성공하였습니다. ");
				mresult = manage.make_insert(blink, nlink, check, userid);
				if(mresult == 0){
					out.println("주문에 실패했습니다.");
				}
				else if(mresult == 1){
					out.println("주문에 성공했습니다.");
				}
			}
			
			
		%>
		
		<script>
			if(result == 1)
				{
				alert('DㅓBㅔ풀기를 통해 마음을 전달해주셔서 감사합니다!');
				//location.href="gift_Gives_presents_to.jsp";
				}
		</script>
		<br/>
		<br/><br/><br/>
		<div class="container2">
<a class ="btn btn" href='gift_list.jsp'><p4>선물 주문내역 페이지</p4></a>

</div>
</div>
	
	<%@include file ="static/footer.jsp" %>
</div> 