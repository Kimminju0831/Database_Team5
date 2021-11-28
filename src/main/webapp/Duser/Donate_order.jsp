<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "user.DAO" %>
<!DOCTYPE html>
<html>
<head>
<% 

	DAO manager = DAO.getInstance();
	String userid = (String)session.getAttribute("userID");
	
	// 주문을 이미 넣었음 == OUTSOURCING COMPANY 에 ORGAN_ID 가 있음.
	if(manager.get_order_donate(userid)==1)	
	{
			// 주문을 넣고 외주업체 측에서 승인 했음
	
			// 주문을 넣었지만 외주 업체 측에서 승인을 안했음
			
	}
	else{	// 주문을 넣지 않았음.
		
		//배송갯수
		//기부단체명
		//기부단체ID
		//상품유형
		//디자인
		
	}



%>
<meta charset="EUC-KR">
<title>기부 혜택 주문 페이지</title>
</head>
<body>

	

</body>
</html>