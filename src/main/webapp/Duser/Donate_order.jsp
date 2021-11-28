<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "user.DAO" %>
<%@ page import = "user.User" %>
<%@ page import = "user.DonateDTO" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<% 

String userid = (String)session.getAttribute("userID");

DAO manager = DAO.getInstance();

List<DonateDTO> list = null;

list = manager.getList_donate(userid);

String org_name = null;

org_name = manager.get_donate_org(userid);

if(org_name!=null){
	
	out.println(org_name + " 단체의 기부 혜택 주문");
	
}else{
%>
		<script>
			alert('운영 중인 기부 콘텐츠가 없습니다.')
			location.href="../Main.jsp";
		</script>
<%		
}
%>
<meta charset="EUC-KR">
<title>기부 혜택 주문 페이지</title>
</head>
<body>

<%

	if (session.getAttribute("userID") == null) {
		out.println("<a href='login.jsp'>로그인</a>");
	}else
	{
		String usert = (String)session.getAttribute("userType");
		out.println(usert + " 회원 | " + userid+" 님 반갑습니다! <br>");
		out.println("<a href='../logout.jsp'>로그아웃</a>");
		
	}
		int menu = manager.get_order_donate(userid);
		if(menu != 0)	//주문을 이미 넣었음 == OUTSOURCING COMPANY 에 ORGAN_ID 가 있음.
		{
				// 주문을 넣고 외주업체 측에서 승인 했음 ==  배달비가 산정됨
				if(menu == 2){
				%>
				<script type="text/javascript">
				alert('주문이 승인되었습니다.')
				location.href="../Mypage.jsp";
				</script>
				<%			
				}
				// 주문을 넣었지만 외주 업체 측에서 승인을 안했음
				else{
				%>
				<script type="text/javascript">
				alert('주문 승인 대기 중 입니다.')
				location.href="../Mypage.jsp";
				</script>
				<%
				}
				
		}
		else{	// 주문을 넣지 않았음.
			String companyid = request.getParameter("company_id");
			//배송갯수 기부단체명 기부단체ID 상품유형 디자인
		%>
			<form action = "./order.jsp" method="POST">
			배송 갯수 : <input type ="text" name ="product_num">
			상품 유형 : <select name="production_type">
			    <option value="BADGE" selected>BADGE</option>
			    <option value="BAG">BAG</option>
			    <option value="BRACLET">BRACLET</option>
			    <option value="CUP">CUP</option>
			    <option value="KEYRING">KEYRING</option>
			    <option value="NECKLACE">NECKLACE</option>
			    <option value="POSTER">POSTER</option>
			    <option value="RING">RING</option>
			    <option value="STICKER">STICKER</option>
			    <option value="TUMBLER">TUMBLER</option>
			    
				</select>
			디자인 : <input type ="text" name ="design">
				<input type = "hidden" name = "org_name" value = <%=org_name %>>
				<input type = "hidden" name = "org_id" value = <%=userid %>>
				<input type = "hidden" name = "companyid" value = <%=companyid %>>
			<input type="submit" value="완료"> <button type="button" onclick="location='../Main.jsp'">취소</button>
			</form>
		
		
		<% 	
			
		}


%>
</body>
</html>