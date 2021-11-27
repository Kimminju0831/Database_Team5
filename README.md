# Database_Team5
Database 팀 프로젝트 [ 디비디비딥 ] 팀의 Repo 입니다.

# 1. 페이지 구성 #

### 공통 ###
 
0) ✔ 회원가입 - 삽입, 조회
- 아이디, 비밀번호, 이름, 주소, 전화번호를 입력하여 회원가입이 가능하다.  
- 5개의 항목 중 한 가지라도 입력되지 않은 항목이 있으면 회원가입을 할 수 없다.  
- 기존의 아이디와 중복되는 아이디로 회원가입을 할 수 없다.  
  
#
     
1) ✔ 로그인 - 조회
- DB에 입력된 USER_ID가 존재하는 경우, 해당 아이디의 비밀번호를 쿼리문으로 찾아 입력된 USER_PWD와 동일한지를 판단하여 로그인을 할 수 있다.   


- DB에 저장된 USER_PWD와 다른 비밀번호가 입력될 경우, 로그인 할 수 없다.
  
#
  
### 일반 사용자 ###
  
#
  
2) ✔ 취향 등록 - 삽입
  
#
  
3) ❔ 회원 정보 수정 
- 수정  
 - 일반 사용자
  - 아이디 변경(없어도 될 것 같은데 일단 있긴 하다!)  
  - 비밀번호 변경   
 - 관리자  
  - 메뉴 페이지
   - 회원 추가  
   - 회원 수정  
   - 회원 삭제   
   - 선택에 따라 각 페이지로 이동 - 삽입, 수정, 삭제  
  
#
  
4) ✔ 회원 탈퇴  - 삭제
- 일반 사용자에만 존재
  
#
  
5) ❔ 선물 목록
- 선물 하기 
 - 조회
  ❔ 선물할 대상 아이디 조회  
  ❔ 선물할 대상 기부 취향 조회  
  ❔ 그에 맞는 MALL 추천  
  ❔ 사용자가 링크 방문 후 선물하기   
  
#
  
6) ❔ 기부 목록
 ✔ 전체 보기  
 ✔ 베스트  
 ✔ 기간 기준  
 ✔ 수혜자 기준  
 ❔ 기부하기 버튼  
 ❔ 이미 기부한 단체에는 버튼 대신 '참여 중' 문구 표시    
  
#
    
### 아웃소싱 사용자 ###
- 주문 (의뢰) 내역 조회 - 조회
* 관리자
* 이용자 조회 / 수정 / 삭제 가능 - 조회 수정 삭제
  
#
  
### 기부 단체 사용자 ###
- 기부 내용 등록  - 삽입
- 기부 목록 
- 기부 참여자 목록

support 페이지 / credit 페이지 (둘 중 하나 : 이건 형식 상 .. )
  
#
  
# 2. 역할 분담 #

페이지 별로 분담

일의 순서
1. 형식상 있는 페이지는 간단하게만 구현
2. 실제로 정보를 삽입 / 수정 / 조회 할 페이지 신경써서 구현
 2-1 ) 추천 시스템 (삽입 단계) 구현 
3. 디자인 손보기
  3-1) 사이드바 , 하단 info , 상단 버튼 등등

1. 로그인 & 회원가입
2. 메인 페이지 (내용만)
3. header & footer, 사이드바
4. 개인정보 수정 페이지 (일반 회원)  + 탈퇴 버튼 추가 + 탈퇴 페이지로 이동하게끔! 
5. 개인정보 수정 페이지 (관리자)
6. 쿼리
1) 사용자 관련 - 3, 5, 6, 7, 9, 11, 12
2) 상품 자체 관련 - 2, 4, 10, 15, 16, 17, 19
3) 기부 관련 - 1, 13, 14, 18
4) 선물 관련 - 8, 20



<쿼리 20개>  (일반 사용자 > 1, 2, 10, 14, 18, 19, 20 만 가능!)
      1. 어떤 기부 기간을 가진 기부 단체를 보고 싶으신가요?  (기부 관련 조회)
            2. 몇 개 이상의 제품일 때, 배송 요금이 궁금하신가요?  (상품 자체 관련 조회)
            3. 어떤 수혜자를 선호하는 유저의 ID가 궁금하신가요?  (사용자 관련)
            4. 특정 날짜 이전에 외주업체에 주문한 상품명과 상품 갯수가 궁금하신가요? ('yyyy-mm-dd' 양식으로 입력해주세요!)  (상품 자체 관련 조회)
            5. 선택한 유저의 이름, 전화번호, 주소를 알려드립니다. 유저가 선택한 디자인 이름이 무엇인가요?  (사용자 관련)
            6. 몇 개 이상의 상품을 구매한 유저의 이름과 상품명이 궁금하신가요? (사용자 관련)
            7. 어떤 기부 취향을 가진 유저의 이름과 전화번호를 알고 싶으신가요?  (사용자 관련)
            8. _______가 선물할 때 참고한 링크와 공익적 링크는 무엇인가요? (선물 관련 조회)
            9. 제품을 _______ 이상 주문받은 기부물품별로 주문받은 총 상품 개수는 무엇인가요?  (사용자 관련)
            10. 상품의 종류별로 실제 참고된 공익링크가 몇 개 인가요? (상품 관련 조회)
            11. _______의 선물을 받고 싶어하는 유저의 이름과 전화번호는 무엇인가요?   (사용자 관련)
            12. 선물을 받은 적이 있는 유저의 이름은? (사용자 관련)
            13. _______는 모든 단체에 기부하는 유저의 아이디와 이름은?(기부 관련 조회)
            14. 어떤 기부 기관의 아이디를 알고싶으신가요? (기부 관련 조회)
            15. 상품 이름과 상품 별 구매하고 싶은 상품의 개수를 구합니다. (상품 관련 조회)
            16. ____개 이상의 선물을 주려는 사람들의 아이디를 구합니다. (상품 관련 조회)
            17. ____개 이상의 상품들을 구매한 사람들의 이름, 상품의 유형 및 아이디를 구합니다. (상품 관련 조회)
            18. 기부 타입과 기부한 사람들의 수를 알고싶은 기부자 타입은 무엇인가요?  (기부 관련 조회)
            19. 상품의 유형에 따른 가장 저렴한 상품의 가격을 알고싶은 상품의 양의 최소값은 얼마인가요? (상품 관련 조회)  
            20. 링크들 중에서 실제로 사용자들이 선물할 때 참고한 링크들은 무엇인가요? (선물 관련 조회)




3. 트랜잭션 (다중사용자) 구현 여부

- 보류! 하루 날 잡아서 다 같이 매달려보고 답 없으면 포기 ,,

4. 추천 알고리즘 구현 방식

1. 기존 db를 훑어본 다음 각 항목별 빈도를 측정해서 제일 일치하는 거랑 매칭 시켜준다. (비슷하면 먼저 나온 걸 주는 식으로 우선 순위 결정) 
장 : 쉽다
단 : 추천이라고 할 수 잇나 ? 간이 추천 시스템 느낌.

2. 파이썬의 머신러닝 기능을 사용해서 간단하게나마 추천 시스템 구현을 해본다. (데과기 때 배웠던 대로 전처리 / 머신러닝 학습 >> 결과를 txt 파일에 출력해서 그걸 다시 jsp 파일에 전달하는 방식)  
장 : 간지가 난다. 실패해도 애로사항을 교수님께 말하면 좋아하려나 ? 싶은 생각도 듦.
단 : 너무어렵다 . . 내가 머신러닝을 배우고 잇는데도 ? 좀 어렵겠다 싶기도 함. 

대안책 : 기존 db 말고 kaggle 이나 이미 시중에 나온 화장품 순위 csv 파일 보고 추천해주는 머신러닝 정도는 구현 할 수 있을 듯. 이건 어떻게 만지냐에 따라 다를 것 같다!






