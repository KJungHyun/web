<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "ch13.board.BoardDBBean" %>
<%@ page import = "ch13.board.BoardDataBean" %>
<%@ include file="color.jspf"%>
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
<body bgcolor="<%=bodyback_c%>">
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
        <input type="text" size="10" maxlength="10" name="writer" value="<%=article.getWriter()%>"
        class="form-control" style="ime-mode:active;">
        <input type="hidden" name="num" value="<%=article.getNum()%>"></td>
      </tr>
      <tr>
        <td>제 목</td>
        <td>
        <input type="text" size="40" maxlength="50" name="subject" value="<%=article.getSubject()%>"  class="form-control" style="ime-mode:active;"></td>
      </tr>
      <tr>
        <td>Email</td>
        <td><input type="text" size="40" maxlength="30" name="email"  class="form-control"
            value="<%=article.getEmail()%>" style="ime-mode:inactive;"></td>
      </tr>
      <tr>
        <td>내 용</td>
        <td><textarea name="content" rows="13" cols="40"  class="form-control"
          style="ime-mode:active;"><%=article.getContent()%></textarea></td>
      </tr>
      <tr>
        <td>비밀번호</td>
        <td><input type="password" size="8" maxlength="12" name="passwd"  class="form-control" style="ime-mode:inactive;"></td>
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
}catch(Exception e){}%>
</form>
</body>
</html>