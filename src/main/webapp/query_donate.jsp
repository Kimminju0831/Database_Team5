
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Main page</title>
</head>
<body>
	<p>query_donate</p>

	<form action="./query_donate_result.jsp" method="post">
		<a> <b>  1. 어떤 기부 기간을 가진 기부 단체를 보고 싶으신가요? </b> 
		<br> <br>기부 타입:
			
			 <select name="donation_type">
             <option value="SHORT" selected>SHORT</option>
             <option value="LONG">LONG</option>
            <option value="TEMPORARY">TEMPORARY</option>
            </select>
           		<br> <br>
            
            <b> 13. _______는 모든 단체에 기부하는 유저의 아이디와 이름은? </b> 
		<br> <br>
		기부 기관 이름:
		<input type="text" name="donation_organization_name"> <br> <br>
			 
			 
			      
            <b>14. 어떤 기부 기관의 아이디를 알고싶으신가요?  </b> 
		<br> <br>
		기부 기관 이름:
		<input type="text" name="do_org_name"> <br> <br>
			 
			 
		  <b>18. 기부 타입과 기부한 사람들의 수를 알고싶은 기부 수혜자 타입은 무엇인가요? </b> 
		
		  <br><br>수혜자 : 
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
		
		</a> <a><input type="reset" value="Reset"><input type="submit"
			value="Submit"></a>
	</form>

	<a href="Main.jsp">메인 페이지로 이동하기</a>
	<br>
</body>
</html>