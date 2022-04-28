<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
   String id ="";
   try{
	   id = (String)session.getAttribute("id");
	   
	   if(id==null || id.equals("")){
        response.sendRedirect("list.jsp");
	   }else{
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판</title>
    <link href="style.css" rel="stylesheet" type="text/css">
    <link href="../assets/bootstrap-5.1.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="../assets/fontawesome-free-5.15.4-web/css/all.min.css" rel="stylesheet">
</head>
<body>
<% 
  int num = 0, ref = 1, re_step = 0, re_level = 0;
  id="";
  String strV = "";
  try{
    id = (String)session.getAttribute("id");
    if(request.getParameter("num")!=null){
	   num=Integer.parseInt(request.getParameter("num"));
	   ref=Integer.parseInt(request.getParameter("ref"));
	   re_step=Integer.parseInt(request.getParameter("re_step"));
	   re_level=Integer.parseInt(request.getParameter("re_level"));
    }
%>
<div class="container">
  <div class="alert alert-primary" role="alert">
    <h1><i class="fas fa-pencil-alt"></i> 글쓰기</h1>
</div>

<form method="post" action="writePro.jsp" onsubmit="return writeSave(this)">
  <input type="hidden" name="num" value="<%=num%>">
  <input type="hidden" name="id" value="<%=id%>">
  <input type="hidden" name="ref" value="<%=ref%>">
  <input type="hidden" name="re_step" value="<%=re_step%>">
  <input type="hidden" name="re_level" value="<%=re_level%>">

<table class="table table-striped table-hover table-bordered">
  <tbody>
  <tr>
    <td>제목</td>
    <td>
    <%
      if(request.getParameter("num")==null) 
    	  strV = "";
      else
    	  strV = "[답변]";
    %>
    <div class="input-group mb-3">
      <input type="text" size="40" maxlength="50" name="subject" class="form-control" aria-label="Text input with checkbox" value="<%=strV%>" style="ime-mode:active;">
    <% 
      Connection conn=null;
      PreparedStatement pstmt=null;
      ResultSet rs=null;

      try{
        String jdbcUrl="jdbc:mysql://localhost:3306/ysu";
        String dbId="ysu";
        String dbPass="1234";

        Class.forName("com.mysql.jdbc.Driver");
        conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
        String sql = "select * from t_cafe_member where id=?";

        pstmt=conn.prepareStatement(sql);
        pstmt.setString(1, id);
        rs=pstmt.executeQuery();

        if (rs.next()){
          String grade=rs.getString("grade");
          if(grade.equals("Admin") || grade.equals("Manager") ){
            if (strV.equals("")){
      %>
        <div class="input-group-text">
          <input class="form-check-input mt-0" type="checkbox" name="notice" aria-label="Checkbox for following text input">
        </div>
      <%}
          }
        }
      }catch(Exception e){}
      %>
    </div>
    </td>
  </tr>
  <tr>
    <td>내 용</td>
    <td><textarea name="content" rows="13" cols="40" class="form-control" 
      style="ime-mode:active;"></textarea> </td>
  </tr>
  <tr>      
    <td colspan=2>
      <div class="d-grid gap-2 col-6 d-md-block mx-auto">
        <input type="submit" class="btn btn-success" value="작성" >  
        <input type="reset" class="btn btn-danger" value="리셋">
        <a href="list.jsp" class="btn btn-primary btn-block">목록보기</a>
      </div>
    </td>
  </tr>
</tbody>
</table>
 <%
    }catch(Exception e){}
  }
    }catch(Exception e){
		e.printStackTrace();
	}
%>     
</form>
<script src="script.js"></script>
</body>
</html>