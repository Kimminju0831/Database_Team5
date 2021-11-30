<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="./style.css" rel="stylesheet">
<title>Main page</title>
</head>
<body>
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

	<a href="Main.jsp"><p2>메인 페이지로 이동하기</p2></a>
	<a href='select_query_menu.jsp'><p2>질의 메뉴 페이지로 이동하기</p2></a>
	<br>
</body>
</html>