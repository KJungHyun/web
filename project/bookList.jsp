<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="project.book.BookDataBean"%>
<%@ page import="project.book.BookDBBean"%>
<%
    int pageSize = 5;
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    String pageNum = request.getParameter("pageNum");
    String id=(String)session.getAttribute("id");

    if (pageNum == null) {
        pageNum = "1";
    }

    int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage - 1) * pageSize;
    int endRow = currentPage * pageSize;

    int count = 0;
    int number = 0;

    int department_id = Integer.parseInt(request.getParameter("department_id"));
    List<BookDataBean> articleList = null; 

    BookDBBean bkPro = BookDBBean.getInstance();
    count = bkPro.getArticleCount();

    if (count > 0) {
        articleList = bkPro.getArticles(startRow, pageSize);
    }
    
    articleList = bkPro.getArticles(startRow, endRow);
%>


<%  
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
              <p class="card-text">예약 0/10</p>
            </div>
          </div>
    </div>
</div>
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
                <a href="main.jsp?pageNum=<%= startPage - 10 %>" class="page-link">&laquo;</a>
            </li>
<%      }
        
        for (int i = startPage ; i <= endPage ; i++) {  %>
            <li class="page-item active">
                <a class="page-link" href="main.jsp?pageNum=<%= i %>"><%= i %></a>
            </li>
<%      }
        
        if (endPage < pageCount) {  %>
            <li class="page-item">
                <a href="main.jsp?pageNum=<%= startPage + 10 %>" class="page-link" href="#">&raquo;</a>
            </li>
<%
        }
    }
%>
    </ul>
</nav>
