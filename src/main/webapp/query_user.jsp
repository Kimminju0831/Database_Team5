
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Main page</title>
</head>
<body>
<p>query_user</p>
   
   <form action="./query_user_result.jsp" method="post">
           <a>
              
              <b>3. 어떤 수혜자를 선호하는 유저의 ID가 궁금하신가요?</b>
            
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
            
             <b>5. 선택한 유저의 이름, 전화번호, 주소를 알려드립니다. 어떤 디자인의 어떤 유형의 상품을 선택한 유저의 정보를 알고싶으신가요?</b>
           
          
              <br><br>디자인 : 
           <input type="text" name="production_design">
            <br><br>상품 유형 : 
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
            
            
             <b>6. 몇 개 이상의 상품을 구매한 유저의 이름과 상품명이 궁금하신가요? </b>
           
             
              <br><br>개수 : 
           <input type="text" name="production_count">
           
            <br>
            <br>
            
            
             
             <b>7. 어떤 기부 취향을 가진 유저의 이름과 전화번호를 알고 싶으신가요? </b>
         
             <br><br>수혜자 : 
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
                  
             <b>9. 제품을 ___ 이상 주문받은 기부물품별로 주문받은 총 상품 개수는 무엇인가요? </b>
         <br><br>개수 : 
           <input type="text" name="production_count_2">
           
            <br>
            <br>
            
            
              <b> 11. _______의 선물을 받고 싶어하는 유저의 이름과 전화번호는 무엇인가요? </b>
           
          
             <br><br>상품 유형 : 
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
            
             <b>  12. 선물을 받은 적이 있는 유저의 이름은? </b>
           <!-- 이건 어떻게 해야하징.. -->
            <br>
            <br>
            
            
            
         </a>
         <a><input type="reset" value="Reset"><input type="submit" value="Submit"></a>
   </form>
   
   <a href="Main.jsp">메인 페이지로 이동하기</a>
   <br>
</body>
</html>