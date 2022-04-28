<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>

<%  request.setCharacterEncoding("utf-8");

	String id= request.getParameter("id");
	String name= request.getParameter("name");
	String postcode= request.getParameter("postcode");
	String address= request.getParameter("address");
	String detail= request.getParameter("detail");
	Timestamp up_date = new Timestamp(System.currentTimeMillis());
%>
<!DOCTYPE html>	
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=, initial-scale=1.0">
	<title>레코드수정</title>
	<link rel="stylesheet" href="/book/assets/bootstrap-5.1.1/css/bootstrap.min.css"/>
</head>
<body>
<div class="container">
<%
	Connection conn=null;
	PreparedStatement pstmt=null;
	PreparedStatement pstmt2=null;
	ResultSet rs=null;

	try{
	String jdbcUrl="jdbc:mysql://localhost:3306/ysu";
	String dbId="ysu";
	String dbPass="1234";
	
	Class.forName("com.mysql.jdbc.Driver");
	conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );

	String sql= "select id from t_member where id= ?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,id);
	rs=pstmt.executeQuery();
    
	if(rs.next()){ 
		String rId=rs.getString("id");

		if(id.equals(rId)){
			sql= "update t_member set name=?, up_date=? where id= ?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,name);
			pstmt.setTimestamp(2,up_date);
			pstmt.setString(3,id);
			pstmt.executeUpdate();

			String sql2="update t_member_add set postcode=?, address=?, detail=? where id= ?";
			pstmt2=conn.prepareStatement(sql2);
			pstmt2.setString(1,postcode);
			pstmt2.setString(2,address);
			pstmt2.setString(3,detail);
			pstmt2.setString(4,id);
			pstmt2.executeUpdate();
			
      }else
		out.println("<div class=\"alert alert-danger\" role=\"alert\">해당 아이디가 존재하지 않습니다.</div>");
	}else
		out.println("<div class=\"alert alert-danger\" role=\"alert\">해당 아이디가 존재하지 않습니다.</div>");
  }catch(Exception e){ 
	  e.printStackTrace();
  }finally{
	  if(rs != null) 
		 try{rs.close();}catch(SQLException sqle){}
	  if(pstmt != null) 
		 try{pstmt.close();}catch(SQLException sqle){}
	  if(conn != null) 
		 try{conn.close();}catch(SQLException sqle){}
  }
%>
</div>
<script>
	location.href = "adminSelect.jsp";
</script>
</body>
</html>
