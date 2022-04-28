<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "ch13.board.BoardDBBean" %>
<%@ page import = "ch13.board.BoardDataBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<%!
    int pageSize = 10;
    SimpleDateFormat sdf = 
        new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

<%
    String pageNum = request.getParameter("pageNum");

    if (pageNum == null) {
        pageNum = "1";
    }

    int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage - 1) * pageSize + 1;
    int endRow = currentPage * pageSize;
    int count = 0;
    int number = 0;
    List<BoardDataBean> articleList = null; 
    
    BoardDBBean dbPro = BoardDBBean.getInstance();
    count = dbPro.getArticleCount();
    
    if (count > 0) {
        articleList = dbPro.getArticles(startRow, pageSize);
    }

	number = count-(currentPage-1)*pageSize;
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
<div class="container">
    <div class="alert alert-primary" role="alert">
        <h1><i class="fas fa-list"></i> 글목록(전체 글:<%=count%>)</h1>
    </div>

    <div class="d-grid gap-2">
        <a href="writeForm.jsp" class="btn btn-primary btn-lg">글쓰기</a>
    </div>

<% if (count == 0) { %>

<div class="alert alert-danger" role="alert">
    게시판에 저장된 글이 없습니다.
</div>

<% } else {%>
<table class="table table-striped table-hover table-bordered">
    <thead>
        <tr>
            <th scope="col">번 호</th>
            <th scope="col">제  목</th>
            <th scope="col">작성자</th>
            <th scope="col">작성일</th>
            <th scope="col">조회</th>
            <th scope="col">IP</th>
        </tr>
    </thead>
    <tbody>
<%  
   for (int i = 0 ; i < articleList.size() ; i++) {
       BoardDataBean article = articleList.get(i);
%>
   <tr>
    <td> <%=number--%></td>
    <td>
<%
	int wid=0; 
	if(article.getRe_level()>0){
	   wid=10*(article.getRe_level());
%>
    <i class="fab fa-replyd" style="margin-left:<%=wid%>px"></i>
<%  }%>
      <a href="content.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>">
           <%=article.getSubject()%></a> 
<% if(article.getReadcount()>=20){%>
        <i class="fas fa-pepper-hot"></i><%}%> </td>
    <td> <a href="mailto:<%=article.getEmail()%>"><%=article.getWriter()%></a></td>
    <td><%= sdf.format(article.getReg_date())%></td>
    <td><%=article.getReadcount()%></td>
    <td><%=article.getIp()%></td>
  </tr>
<%}%>
</tbody>
</table>
<%}%>
<nav aria-label="Page navigation example">
    <ul class="pagination justify-content-center">
<%
    if (count > 0) {
        int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage =1;
		
		if(currentPage % 10 != 0)
           startPage = (int)(currentPage/10)*10 + 1;
		else
           startPage = ((int)(currentPage/10)-1)*10 + 1;

		int pageBlock = 10;
        int endPage = startPage + pageBlock - 1;
        if (endPage > pageCount) endPage = pageCount;
        
        if (startPage > 10) { %>
            <li class="page-item disabled">
                <a href="list.jsp?pageNum=<%= startPage - 10 %>" class="page-link">&laquo;</a>
            </li>
<%      }
        
        for (int i = startPage ; i <= endPage ; i++) {  %>
            <li class="page-item active">
                <a class="page-link" href="list.jsp?pageNum=<%= i %>"><%= i %></a>
            </li>
<%      }
        
        if (endPage < pageCount) {  %>
            <li class="page-item">
                <a href="list.jsp?pageNum=<%= startPage + 10 %>" class="page-link" href="#">&raquo;</a>
            </li>
<%
        }
    }
%>
    </ul>
</nav>
</div>
</body>
</html>