<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>웹서버구축 중간고사</title>
	<link rel="stylesheet" href="../assets/bootstrap-5.1.1/css/bootstrap.min.css">
</head>
<body>
	<div class="container"></div>
		<div class="alert alert-success" role="alert">
			관리자 페이지
		</div>
		<table class="table table-bordered table-striped table-hover">
			<thead>
				<tr class="table-dark">
					<th>아이디</th>
					<th>패스워드</th>
					<th>이름</th>
					<th>우편번호</th>
					<th>주소</th>
					<th>상세주소</th>
					<th>가입일자</th>
					<th>최근 변경일자</th>
					<th>조작</th>
				</tr>
			</thead>
			<tbody>
				<%
				Connection conn=null;
				PreparedStatement pstmt=null;
				PreparedStatement pstmt2=null;
				ResultSet rs=null;
				ResultSet rs2=null;

				try{
				String jdbcUrl="jdbc:mysql://localhost:3306/ysu";
				String dbId="ysu";
				String dbPass="1234";

				Class.forName("com.mysql.jdbc.Driver");
				conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );

				String sql= "select * from t_member order by reg_date desc";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();

				while(rs.next()){
				String id= rs.getString("id");
				String passwd= rs.getString("passwd");
				String name= rs.getString("name");
				String postcode="";
				String address="";
				String detail="";
				Timestamp reg_date=rs.getTimestamp("reg_date");
				Timestamp up_date=rs.getTimestamp("up_date");
				
				String sql2= "select postcode, address, detail from t_member_add where id=?";
				pstmt2=conn.prepareStatement(sql2);
				pstmt2.setString(1, id);
				rs2=pstmt2.executeQuery();
				
				if(rs2.next()){
					postcode = rs2.getString("postcode");
					address= rs2.getString("address");
					detail= rs2.getString("detail");
				}

				%>
				
				<tr>
					<td><%=id%></td>
					<td><%=passwd%></td>
					<td><%=name%></td>
					<td><%=postcode%></td>
					<td><%=address%></td>
					<td><%=detail%></td>
					<td><%=reg_date.toString()%></td>
					<td><%=up_date.toString()%></td>
					<td>
						<a href="adminUpdateForm.jsp?id=<%=id%>&name=<%=name%>&postcode=<%=postcode%>&address=<%=address%>&detail=<%=detail%>" class="btn btn-warning btn-sm">정보수정</a>
						<a href="adminDeletePro.jsp?id=<%=id%>" class="btn btn-danger btn-sm" onclick="return userDelete()">삭제</a>
						<script>
							function userDelete(){
								if(confirm("해당 아이디를 정말 삭제하시겠습니까?")){
									alert("삭제하였습니다.");
									return true;
								}else {
									alert("취소하셨습니다.");
									return false;
								}
							}
						</script>
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
		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<a href="adminInsertForm.jsp" class="btn btn-primary btn-sm">데이터추가</a>
		</div>
	</div>

</body>
</html>