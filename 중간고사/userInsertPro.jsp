<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<% request.setCharacterEncoding("utf-8");

   String id = request.getParameter("id");
   String passwd= request.getParameter("passwd");
   String name = request.getParameter("name");
   String postcode = request.getParameter("postcode");
   String address = request.getParameter("address");
   String detail = request.getParameter("detail");

   Connection conn=null;
   PreparedStatement pstmt=null;
   PreparedStatement pstmt2=null;
   PreparedStatement checkPstmt=null;
   ResultSet rs=null;
   String str="";

   try{
	String jdbcUrl="jdbc:mysql://localhost:3306/ysu";
	String dbId="ysu";
	String dbPass="1234";

	Class.forName("com.mysql.jdbc.Driver");
	conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );

	String idCheckSql = "select id from t_member where id=?";
	checkPstmt=conn.prepareStatement(idCheckSql);
	checkPstmt.setString(1, id);
	rs=checkPstmt.executeQuery();
	
	if(rs.next()){
		out.println("<script>alert('해당 아이디가 이미 존재합니다.'); history.back();</script>");
	}

	String sql= "insert into t_member (id, passwd, name) values (?,?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,id);
	pstmt.setString(2,passwd);
	pstmt.setString(3,name);
	pstmt.executeUpdate();

	String sql2 = "insert into t_member_add (id, postcode, address, detail) values (?,?,?,?)";
	pstmt2=conn.prepareStatement(sql2);
	pstmt2.setString(1,id);
	pstmt2.setString(2,postcode);
	pstmt2.setString(3,address);
	pstmt2.setString(4,detail);
	pstmt2.executeUpdate();

	//str= "t_member 테이블에 새로운 레코드를 추가했습니다.";
 	}catch(Exception e){ 
 		e.printStackTrace();
 		//str="t_member 테이블에 새로운 레코드를 추가에 실패했습니다";
 	}finally{
 		if(pstmt != null) 
 			try{pstmt.close();}catch(SQLException sqle){}
 		if(conn != null) 
 			try{conn.close();}catch(SQLException sqle){}
 	}
 %>
 <script>
    alert("추가하였습니다.");
    history.go(-2);
 </script>