<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<% 
	request.setCharacterEncoding("utf-8");

   String id = request.getParameter("id");
   String passwd= request.getParameter("passwd");
   String name = request.getParameter("name");    
   //Timestamp register=new Timestamp(System.currentTimeMillis());

   Connection conn = null;
   PreparedStatement pstmt = null;
   String str = "";

   try {
		String jdbcUrl = "jdbc:mysql://localhost:3306/ysu";
		String dbId = "ysu";
		String dbPass = "1234";

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

		//String sql = "insert into member values (?,?,?,?)";
		String sql = "insert into member (id, passwd, name) values (?,?,?)";
		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1,id);
		pstmt.setString(2,passwd);
		pstmt.setString(3,name);
		//pstmt.setTimestamp(4,register);

		pstmt.executeUpdate();

		// str = "member 테이블에 새로운 레코드를 추가했습니다.";

		response.sendRedirect("selectTest.jsp");

 	} catch(Exception e) { 
 		e.printStackTrace();
 		str = "member 테이블에 새로운 레코드를 추가에 실패했습니다";
 	} finally {
 		if(pstmt != null) 
 			try{pstmt.close();}catch(SQLException sqle){}
 		if(conn != null) 
 			try{conn.close();}catch(SQLException sqle){}
 	}

 %>

<!--
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="../assets/bootstrap-5.1.1/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<div class="alert alert-primary" role="alert">
			<%=str %>
		</div>
	</div>
</body>
</html>
-->