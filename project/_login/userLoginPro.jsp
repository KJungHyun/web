<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
</head>
<body>
<%	request.setCharacterEncoding("utf-8");

    String id = request.getParameter("id");
	String passwd  = request.getParameter("passwd");
	
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;

%>
	
<%

	try{
	String jdbcUrl="jdbc:mysql://localhost:3306/ysu_project";
	String dbId="ysu";
	String dbPass="1234";
	
	Class.forName("com.mysql.jdbc.Driver");
	conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );

	String sql= "select s_id, pwd from student where s_id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,id);

	rs=pstmt.executeQuery();
%>
<h1><%=id%></h1>
<h1><%=passwd%></h1>
<%
    
	if(rs.next()){
		String rId=rs.getString("s_id");
		String rPasswd=rs.getString("pwd");


		if(id.equals(rId) && passwd.equals(rPasswd)){
%>

<%
			session.setAttribute("id", id);
			response.sendRedirect("../main.jsp");
      }else
		out.println("<script>alert('아이디 또는 비밀번호가 맞지 않습니다.'); history.back();</script>");
	}else
		out.println("<script>alert('해당 아이디가 존재하지 않습니다.'); history.back();</script>");
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

</body>
</html>