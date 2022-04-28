<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*, javax.sql.*, javax.naming.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>레코드 표시</title>
<link rel="stylesheet" href="../assets/bootstrap-5.1.1/css/bootstrap.min.css">
</head>
<body>
<div class="container">
	<div class="alert alert-info" role="alert">
		usePool을 이용한 DB 연결
	</div>
	<div class="d-grid gap-2 d-md-flex justify-content-md-end">
		<a href="insertTestForm.jsp" class="btn btn-primary btn-sm">데이터 추가</a>
	</div>
	<table class="table table-bordered table-striped table-hover">
		<thead>
			<tr class="table-dark">
				<th>아이디</th>
				<th>패스워드</th>
				<th>이름</th>
				<th>가입일자</th>
				<th>조작</th>
			</tr>
		</thead>
		<tbody>
<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try{
  Context initCtx = new InitialContext();
  Context envCtx = (Context) initCtx.lookup("java:comp/env");
  DataSource ds = (DataSource)envCtx.lookup("jdbc/ysu");
  conn = ds.getConnection();

  String sql= "select * from member";
  pstmt = conn.prepareStatement(sql);
  rs = pstmt.executeQuery();

  while(rs.next()){
    String id= rs.getString("id");
    String passwd= rs.getString("passwd");
    String name= rs.getString("name");
    Timestamp register=rs.getTimestamp("reg_date");
	
	%>
			<tr>
				<td><%=id%></td>
				<td><%=passwd%></td>
				<td><%=name%></td>
				<td><%=register.toString()%></td>
				<td>
					<a href="updateTestForm.jsp?id=<%=id%>&name=<%=name%>" class="btn btn-warning btn-sm">업데이트</a>
					<a href="deleteTestForm.jsp?id=<%=id%>" class="btn btn-danger btn-sm">삭제</a>
				</td>
			</tr>
<%  } 
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
		</tbody>
	</table>
</div>	
</body>
</html>