<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 권한 : 사용자 정보 수정</title>
</head>
<body>
	<h2>관리자</h2>
	<form action="info_modi_gi_admin.jsp" method=post>
	관리자 계정입니다. 
	<br />
	관리자 아이디 : <input type="text" name="adminid">
	관리자 비밀번호 : <input type="text" name="adminpw">
	<br /><br /> <br />
	사용자 정보 수정을 도와드립니다.
	<br />
	정보 수정을 도와드릴 사용자의 로그인 정보와 수정할 정보를 기입해주시기 바랍니다. 
	<br /><br />
	사용자 아이디 : (ex : 000-00-000) <input type="text" name="id">
	<br /> <br />
	사용자 비밀번호 : <input type="text" name="pw">
	<br /> <br />
	<select name= "gift" onchange="categoryChange(this)">
               <option>선물 취향을 선택해주세요</option>
               <option value="ACCESSORY">ACCESSORY</option>
               <option value="GROCERIES">GROCERIES</option>
               <option value="COSMETICS">COSMETICS</option>
               <option value="DAILY_NECESSITIES">DAILY_NECESSITIES</option>
               <option value="BOOKS">BOOKS</option>
               <option value="DIGITAL">DIGITAL</option>
               <option value="SUNDRIES">SUNDRIES</option>
               <option value="AIR_FRESHENER">AIR_FRESHENER</option>
               <option value="BATH_SUPPLIES">BATH_SUPPLIES</option>
               <option value="DOLL">DOLL</option>
               </select>
               
      <select name= "gift_type" id="good">
            <option>좋아하는 선물 유형을 선택해주세요</option>
            </select>
            
            <script type="text/javascript">
                function categoryChange(y) {
                     var good_a = ["BRACELET", "RING", "NECKLACE", "EARRINGS"];
                     var good_b = ["MEAL","DESSERT","COFFEE"];
                     var good_c = ["LIPS","TOTAL","COMPACT CUSHION"];
                     var good_d = ["TUMBLER","ETC"];
                     var good_e = ["NOVEL", "SELF_HELP_BOOK", "COMPUTER/IT", "HISTORY/CULTURE", "HEALTH", "COMICS", "CHILDREN COMPLETE COLLECTION", "POETRY/ESSAY", "ECONOMY/BUSINESS", "LIBERAL ARTS"];
                     var good_f = ["PHONE CASE", "SMARTTALK", "EARPHONE CASE"];
                     var good_g = ["BAGS","BADGE/KEYRING","STATIONARY","MASK"];
                     var good_h = ["SCENT"];
                     var good_i = ["SHOWER","TOWEL","BRUSH","ITEM"];
                     var good_j = ["ANIMAL_SHAPE","FOOD_SHAPE"];
                     var target = document.getElementById("good");
                  
                     if(y.value == "ACCESSORY") var z = good_a;
                     else if(y.value == "GROCERIES") var z = good_b;
                     else if(y.value == "COSMETICS") var z = good_c;
                     else if(y.value == "DAILY_NECESSITIES") var z = good_d;
                     else if(y.value == "BOOKS") var z = good_e;
                     else if(y.value == "DIGITAL") var z = good_f;
                     else if(y.value == "SUNDRIES") var z = good_g;
                     else if(y.value == "AIR_FRESHENER") var z = good_h;
                     else if(y.value == "BATH_SUPPLIES") var z = good_i;
                     else if(y.value == "DOLL") var z = good_j;
                  
                     target.options.length = 0;
                  
                     for (x in z) {
                        var opt = document.createElement("option");
                        opt.value = z[x];
                        opt.innerHTML = z[x];
                        target.appendChild(opt);
                     }   
                     }
            </script>         
	<br /> <br />
	<input type="reset" value="Reset"> 
	<input type="submit"value="Submit">
</body>
</html>