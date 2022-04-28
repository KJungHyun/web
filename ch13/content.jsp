<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "ch13.board.BoardDBBean" %>
<%@ page import = "ch13.board.BoardDataBean" %>
<%@ page import = "java.text.SimpleDateFormat" %>
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

  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

  try{
    BoardDBBean dbPro = BoardDBBean.getInstance(); 
    BoardDataBean article =  dbPro.getArticle(num);
  
	  int ref=article.getRef();
	  int re_step=article.getRe_step();
	  int re_level=article.getRe_level();
%>
<div class="container">
  <div class="alert alert-primary" role="alert">
    <h1><i class="fas fa-eye"></i> 글내용 보기</h1>
</div>

<table class="table table-striped table-hover table-bordered">
  <tbody>
    <tr></tr>
      <td>글번호</td>
      <td><%=article.getNum()%></td>
      <td>조회수</td>
      <td><%=article.getReadcount()%></td>
    </tr>
    <tr>
      <td>작성자</td>
      <td><%=article.getWriter()%></td>
      <td>작성일</td>
      <td><%= sdf.format(article.getReg_date())%></td>
    </tr>
    <tr>
      <td>글제목</td>
      <td colspan="3"><%=article.getSubject()%></td>
    </tr>
    <tr>
      <td>글내용</td>
      <td colspan="3"><pre><%=article.getContent()%></pre></td>
    </tr>
    <tr>     
      <td colspan="4" class="text-center">
        <a href="updateForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>" class="btn btn-warning">글수정</a>
        <a href="deleteForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>" class="btn btn-danger">글삭제</a>
        <a href="writeForm.jsp?num=<%=num%>&ref=<%=ref%>&re_step=<%=re_step%>&re_level=<%=re_level%>" class="btn btn-success">글쓰기</a>
        <a href="list.jsp?pageNum=<%=pageNum%>" class="btn btn-primary">글내용</a>
      </td>
    </tr>
  </tbody>
</table>    
<%
 }catch(Exception e){} 
 %>  
</body>
</html>