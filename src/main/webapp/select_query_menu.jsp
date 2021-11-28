<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- import JDBC package -->
<%@ page import="user.UserDao"%>
<%@ page language="java" import="java.text.*, java.sql.*"%>

<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userAddress" />
<jsp:setProperty name="user" property="userPhone" />

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<%
	if (session.getAttribute("userID") == null) {
		out.println("<a href='login.jsp'>로그인</a>");
	} else {
		String userid = (String) session.getAttribute("userID");
		String usert = (String) session.getAttribute("userType");
		out.println(usert + " 회원 | " + userid + " 님 반갑습니다! <br>");
		out.println("<a href='logout.jsp'>로그아웃</a><br><br>");
	%>
	<%
	   /*
	   String serverIP = "localhost";
	   String strSID = "xe";
	   String portNum = "1600";
	   String user = "ta";
	   String pass = "ta";
	   String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
	   */
	   /*
	   String serverIP = "localhost";
	   String strSID = "orcl";
	   String portNum = "1521";
	   String user = "Team";
	   String pass = "aaaa";
	   String url = "jdbc:oracle:thin:@" + serverIP + ":" + portNum + ":" + strSID;
	*/
	   String serverIP = "localhost";
	   String strSID = "orcl";
	   String portNum = "1521";
	   String username = "team";
	   String pass = "1234";
	   String url = "jdbc:oracle:thin:@" + serverIP + ":" + portNum + ":" + strSID;

    Connection conn = null;
    Statement stmt = null;
    
    PreparedStatement ps;
    ResultSet rs;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    conn = DriverManager.getConnection(url, username, pass);
    stmt = conn.createStatement();


	%>
	<%
      request.setCharacterEncoding("UTF-8");
     
      String D_preference = request.getParameter("D_preference");
      String D_period = request.getParameter("D_period");
      
   %>

	<%
      int repeat = 0;
      out.println("------ 관리자 권한 사용자 정보 수정  ------ <br/><br/>");
       String check_sql = "select user_id from users WHERE user_id='"+ userid + "'";
        String check_id = "";
        rs = stmt.executeQuery(check_sql);
        while(rs.next()) {
           check_id = rs.getString(1);
          }
        
        //for test
        System.out.println("check_id: "+ check_id);
        //은주 - '000-00-000'
        if(check_id.equals("000-00-0000"))//관리자 아이디 검사
        {
           String check_pw_sql = "select user_pwd from users WHERE user_id= '"+ check_id +"'";
         String check_pwd = "";
           rs = stmt.executeQuery(check_pw_sql);
           while(rs.next()) {
              check_pwd = rs.getString(1);
            //for test
              System.out.println("check_pwd: "+ check_pwd);
           }
        
        
           if(check_pwd.equals("admin"))//관리자 비밀번호 검사
           {
            //비밀번호 동일 -> 관리자 
            %>
	<a href='query_user_admin.html'>사용자 관련 질의 페이지(관리자)</a>
	<br>
	<a href='query_product_admin.html'>상품 자체 관련 질의 페이지(관리자)</a>
	<br>
	<a href='query_donate_admin.html'>기부 관련 질의 페이지(관리자)</a>
	<br>
	<a href='query_present_admin.html'>선물 관련 질의 페이지(관리자)</a>
	<br>
	<% 
           }
           else
           {
           out.println("관리자 비밀번호가 올바르지 않습니다.");
           }
          }
        else{
            // out.println("관리자 계정이 아닙니다.");
             %>
	<a href='query_user.jsp'>사용자 관련 질의 페이지</a>
	<br>
	<a href='query_product.html'>상품 자체 관련 질의 페이지</a>
	<br>
	<a href='query_donate.html'>기부 관련 질의 페이지</a>
	<br>
	<a href='query_present.jsp'>선물 관련 질의 페이지</a>
	<br>
	<%
        }
      out.println("<br/>");
   %>

	<br>
	<br>



	<%
	}
	%>
</body>
</html>