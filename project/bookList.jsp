<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="project.java.book.bookDataBean"%>
<%@ page import="project.java.book.bookDBBean"%>
<%@ page import="project.java.book.boardDataBean"%>
<%@ page import="project.java.book.boardDBBean"%>

<%
    String dept = request.getParameter("dept");
    
    if (dept==null){
        dept="";
    }
    if (select==null){
        select="1";
    }

    int pageSize = 10;
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

    List<bookDataBean> articleList = null; 

    bookDBBean bkPro = bookDBBean.getInstance();
    count = bkPro.getArticleCount(select, name);
    articleList = bkPro.getSearchList(startRow, endRow, select, name);
    
    
    if(dept!=""){
        if (count > 0) {
            articleList = bkPro.getDeptList(startRow,pageSize,dept);
            count = bkPro.getArticleCount(dept);
        }
    }else if(select!=""){
        if (count > 0) {
            articleList = bkPro.getSearchList(startRow, pageSize, select, name);
        }
    }
%>
<div class="row row-cols-1 row-cols-md-3 g-4" style="margin-left: 30px;">
<%  
if(count!=0){
   for (int i = 0 ; i < articleList.size() ; i++) {
       bookDataBean article = articleList.get(i);
%>
<div class="card mb-3" style="width: 500px; margin-left: 20px;">
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
                <p class="card-text">
                <form method="get" action="bookBoardUpdatePro.jsp">
                <%
                    boardDBBean board = boardDBBean.getInstance();
                    boolean check = board.getBookCheck(article.getBook_name());
                    if(check==false){
                %>
                    
                        <input name="book_name" type="hidden" value="<%=article.getBook_name()%>">
                        <input name="select" type="hidden" value="추가">
                        <button type="submit" id="radius" style="float: right; margin-bottom: 10px;">추가</button>
                    
                <%}else{%>
                        <input name="book_name" type="hidden" value="<%=article.getBook_name()%>">
                        <input name="select" type="hidden" value="삭제">
                        <button type="submit" id="radius" style="background-color: red; float: right; margin-bottom: 10px;">삭제</button>
                <%}%>
                <p class="card-text" style="float: left;">책의 재고: </p>
                </form>
                </p>
            </div>
          </div>
    </div>
</div>
<%}
%>
</div>
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
                <a href="bookBoardUpdate.jsp?pageNum=<%= startPage - 10 %>" class="page-link">&laquo;</a>
            </li>
<%      }
        
        for (int i = startPage ; i <= endPage ; i++) {  %>
            <li class="page-item active">
        <%  if(!dept.equals("")){%>
                <a class="page-link" href="bookBoardUpdate.jsp?pageNum=<%= i %>&dept=<%=dept%>"><%= i %></a>
        <%}else{%>
                <a class="page-link" href="bookBoardUpdate.jsp?pageNum=<%= i %>&select=<%=select%>&name=<%=name%>"><%= i %></a>
        <%}%>
            </li>
<%      }
        
        if (endPage < pageCount) {  %>
            <li class="page-item">
                <a href="bookBoardUpdate.jsp?pageNum=<%= startPage + 10 %>" class="page-link" href="#">&raquo;</a>
            </li>
<%
        }
    }
}else{%>
<h1 style="margin-top: 130px; margin-left: 50px;">검색 내용이 없습니다.</h1>
<%}%>
    </ul>
</nav>
