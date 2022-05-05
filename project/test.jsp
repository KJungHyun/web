<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="project.DeptSelect"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="project.book.BookDataBean"%>
<%@ page import="project.book.BookDBBean"%>
    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

    <%
        String select = request.getParameter("select");
        String name = request.getParameter("name");

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        
        List<BookDataBean> articleList = null;
            
        BookDBBean bkPro = BookDBBean.getInstance();
        articleList = bkPro.getSearchList(select, name); 
    %>
    <h1><%=select%></h1>
    <h1><%=name%></h1>
    
<% if(articleList==null){%>
    <div class="alert alert-danger" role="alert">
        저장된 글이 없습니다.
    </div>

    
<%}else{  
for (int i = 0 ; i < articleList.size() ; i++) {
    BookDataBean article = articleList.get(i);
%>
<div class="card mb-3" style="width: 540px;">
 <div class="row g-0">
     <div class="col-md-4">
         <img src="./images/<%=article.getBook_name()%>.jpg" class="img-fluid rounded-start" alt="...">
     </div>
     <div class="col-md-8">
         <div class="card-body">
           <h5 class="card-title"><%=article.getBook_name()%></h5>
           <p class="card-text"><%=article.getPublisher()%></p>
           <p class="card-text"><%=article.getWriter()%></p>
           <p class="card-text"><%=sdf.format(article.getDate())%></p>
         </div>
       </div>
 </div>
</div>
<%}}%>

</body>
</html>