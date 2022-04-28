<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "t_ch13.board.BoardDBBean" %>
<%@ page import = "t_ch13.board.BoardDataBean" %>
<%@ page import = "java.sql.*" %>

<%
   String id ="";
   String notice="F";
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
<body onload="check()">
<%
  int num = Integer.parseInt(request.getParameter("num"));
  String pageNum = request.getParameter("pageNum");
  try{
      BoardDBBean dbPro = BoardDBBean.getInstance(); 
      BoardDataBean article =  dbPro.updateGetArticle(num);

%>
<div class="container">
  <div class="alert alert-primary" role="alert">
    <h1><i class="fas fa-eye"></i> 글수정</h1>
</div>

<br>
<form method="post" name="writeform" action="updatePro.jsp?pageNum=<%=pageNum%>" onsubmit="return writeSave()">
  <table class="table table-striped table-hover table-bordered">
    <tbody>
      <tr>
        <td>이 름</td>
        <td>
        <input type="text" size="10" maxlength="10" name="writer" value="<%=article.getId()%>"
        class="form-control" style="ime-mode:active;" readonly>
        <input type="hidden" name="num" value="<%=article.getNum()%>">
        <input type="hidden" name="id" value="<%=article.getId()%>"></td>
      </tr>
      <tr>
        <td>제 목</td>
        <td>
          <div class="input-group mb-3">
            <input type="text" size="40" maxlength="50" name="subject" class="form-control" aria-label="Text input with checkbox" value="<%=article.getSubject()%>" style="ime-mode:active;">
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
                  sql="select * from t_board_notice where num=?";

                  pstmt=conn.prepareStatement(sql);
                  pstmt.setInt(1, num);
                  ResultSet cRs = pstmt.executeQuery();

                  if(cRs.next()){
                    if(cRs.getString("notice").equals("T")){
                      notice = "T";
                    }
                  }
            %>
              <div class="input-group-text">
                <input class="form-check-input mt-0" type="checkbox" id="selectCheck" name="notice" aria-label="Checkbox for following text input">
              </div>
            <%
                }
              }
            }catch(Exception e){}
            %>
          </div>
      </td>
      </tr>
      <tr>
        <td>내 용</td>
        <td><textarea name="content" rows="13" cols="40"  class="form-control"
          style="ime-mode:active;"><%=article.getContent()%></textarea></td>
      </tr>
      <tr>      
        <td colspan="2"> 
          <input type="submit" class="btn btn-warning" value="글수정" >  
          <input type="reset" class="btn btn-danger" value="다시작성">
          <a href="list.jsp?pageNum=<%=pageNum%>" class="btn btn-primary">목록보기</a>
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
<script>
  function check(){
    if("<%=notice%>"=="T"){
      document.getElementById("selectCheck").checked=true;
    }
  }
</script>
</form>
</body>
</html>