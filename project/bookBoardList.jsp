<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="project.java.book.boardDataBean"%>
<%@ page import="project.java.book.boardDBBean"%>
<%@ page import="project.java.book.bookDataBean"%>
<%@ page import="project.java.book.bookDBBean"%>
<%
    String dept = request.getParameter("dept");
    
    if (dept==null){
        dept="";
    }
    if (select==null){
        select="1";
    }

    int pageSize = 5;
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    String pageNum = request.getParameter("pageNum");
    String id=(String)session.getAttribute("id");

    if (pageNum == null) {
        pageNum = "1";
    }

    int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage - 1) * pageSize + 1;
    int endRow = currentPage * pageSize;

    int count = 0;
    int number = 0;

    List<boardDataBean> articleList = null; 

    boardDBBean bkPro = boardDBBean.getInstance();
    count = bkPro.getBoardCount(select, name);
    articleList = bkPro.getBoardSearch(startRow, endRow, select, name);

    if(dept!=""){
        if (count > 0) {
            int deptNum = Integer.parseInt(dept);
            count = bkPro.getBoardDeptCount(deptNum);
            articleList = bkPro.getBoardDeptSearch(startRow, pageSize, deptNum);
        }
    }else if(select!=""){
        if (count > 0) {
            articleList = bkPro.getBoardSearch(startRow, pageSize, select, name);
        }
    }
%>
<% 
if(count!=0){
   for (int i = 0 ; i < articleList.size() ; i++) {
       boardDataBean article = articleList.get(i);
       bookDataBean article_detail = bkPro.getBoardDetail(article.getBook_name());
%>
<div class="card mb-3" style="width: 540px;">
    <div class="row g-0">
        <div class="col-md-4">
            <img src="./images/<%=article.getBook_name()%>.jpg" class="img-fluid rounded-start" alt="...">
        </div>
        <div class="col-md-8">
            <div class="card-body">
                <h5 class="card-title"><%=article.getBook_name()%></h5>
                <p class="card-text"><%=article_detail.getPublisher()%></p>
                <p class="card-text"><%=article_detail.getWriter()%></p>
                <p class="card-text"><%=sdf.format(article_detail.getDate())%></p>
                <p class="card-text">
                  <a href="reservationPage.jsp?book_name=<%=article.getBook_name()%>&b_id=<%=article.getB_id()%>"><button style="float:right">예약하기</button></a>
                </p>
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
            <li class="page-item">
                <a href="main.jsp?pageNum=<%= startPage - 10 %>" class="page-link">&laquo;</a>
            </li>
<%      }
        
        for (int i = startPage ; i <= endPage ; i++) {  %>
            <li class="page-item active">
        <%  if(!dept.equals("")){%>
                <a class="page-link" href="main.jsp?pageNum=<%= i %>&dept=<%=dept%>"><%= i %></a>
        <%}else{%>
                <a class="page-link" href="main.jsp?pageNum=<%= i %>&select=<%=select%>&name=<%=name%>"><%= i %></a>
        <%}%>
            </li>
<%      }
        
        if (endPage < pageCount) {  %>
            <li class="page-item">
                <a href="main.jsp?pageNum=<%= startPage + 10 %>" class="page-link" href="#">&raquo;</a>
            </li>
<%
        }
    }
}else{
%>
    <h1 style="margin-top: 130px; margin-left: 50px;">검색 내용이 없습니다.</h1>
<%}%>
    </ul>
</nav>

