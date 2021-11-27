<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "user.UserDao" %>
<!DOCTYPE html>
<html>
<head>
<%

	if (session.getAttribute("userID") == null) {
		out.println("<a href='../login.jsp'>로그인</a>");
	}else
	{
		String userid = (String)session.getAttribute("userID");
		String usert = (String)session.getAttribute("userType");
		String userpw = (String)session.getAttribute("userPassword");
		out.println(usert + " 회원 | " + userid+" 님 반갑습니다! <br>");
		out.println("<a href='../logout.jsp'>로그아웃</a>");

%>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
		
		기부 콘텐츠를 업로드하는 사이트입니다.
		
<%

	//insert into DONATION_ORGANIZATION 
	//(Donation_period, Donation_type, Beneficiary, Donation_organization_name, org_pwd, org_id) 
	// values ('1Y-1M-12D', 'LONG', 'ENVIRONMENT', 'HEEJUNGCOMPANY', 'Indigo', '442-05-1994');
	// 기간 / 기간 유형 / 수헤자 / 이름 / 기관 비밀번호 / 기관 아이디
	
	// 기간 선택하게
	
	// 기간을 일자로 변경 : year >= 1 이면 long , year < 1 이면 short , day = 1 이면 temporary
	
	// 수혜자를 체크 박스로 선택
	
	// 기관 아이디 입력

%>
	
		<form action = "./write_donate.jsp" method = "POST">
				<br>
				<br/>
				<b>기부 기간을 선택해주세요.</b>
				<br><br>기부 기간 : 
				<select name="DperiodY">
			    <option value="0" selected>0</option>
<%
				
				for (int i = 1 ; i < 11 ; i++){
					String sentence = "<option value=\"" + i + "\">" + i + "</option>";
					out.println(sentence);
				}

%>		
				</select> YEAR
				
				<select name="DperiodM">
			    <option value="0" selected>0</option>
<%
				
				for (int i = 1 ; i < 12 ; i++){
					String sentence = "<option value=\"" + i + "\">" + i + "</option>";
					out.println(sentence);
				}

%>				 
				</select> MONTH
				
				<select name="DperiodD">
			    <option value="0" selected>0</option>
<%
				
				for (int i = 1 ; i < 31 ; i++){
					String sentence = "<option value=\"" + i + "\">" + i + "</option>";
					out.println(sentence);
				}

%>			    
				</select> DAY
				<br>
				<br/>
				<b>수혜자 유형을 선택해주세요.</b>
				
				<br><br>수혜자 유형 : 
				<select name="Dbenefit">
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
				<br/>
				<b>기부 단체명을 입력해주세요.</b>
				<input type="text" name="name" maxlength="50"> <br> 
				
				<input type = "hidden" name = "org_id" value = <%=userid %>>
				<input type = "hidden" name = "org_pw" value = <%=userpw %>>
				
				<!-- org_id , org_pw , Dbenefit , DperiodY , DperiodM , DperiodD -->
				<input type="submit" value="완료"> <button type="button" onclick="location='../Main.jsp'">취소</button>
				
		</form>
		
<%

	}

%>				
</body>
</html>