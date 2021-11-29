<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Main page</title>
</head>
<body>
	<p>query_product</p>

	<form action="./query_product_result.jsp" method="post">
		<a> <b> 2. 몇 개 이상의 제품일 때, 제품의 유형과 배송 요금이 궁금하신가요? </b> <br> <br>개수
			: <input type="text" name="production_count"> <br> <br>

			
				
				<b>10. 상품의 종류별로 실제 참고된 공익링크가 몇 개 인가요? 
			 </b> <br> <br>
			 
			 
			 
			 	  <b>19. 상품의 유형에 따른 가장 저렴한 상품의 가격을 알고싶은 상품의 양의 최소값은 얼마인가요? </b> 
			 <br> <br>개수
			: <input type="text" name="quantity_2"> <br> <br>
			 
			 
			 
			 
			
				
		</a> <a><input type="reset" value="Reset"><input type="submit"
			value="Submit"></a>
	</form>

	<a href="Main.jsp">메인 페이지로 이동하기</a>
	<a href='select_query_menu.jsp'>질의 메뉴 페이지로 이동하기</a>
	<br>
</body>
</html>