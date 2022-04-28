<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%!
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>

<%@ page import="project.book.BookDataBean"%>
<%@ page import="project.book.BookDBBean"%>
<%
int department_id = Integer.parseInt(request.getParameter("department_id"));
List<BookDataBean> articleList = null; 
    
    BookDBBean bkPro = BookDBBean.getInstance();
    articleList = bkPro.getArticles(department_id);
    %>

<div class="container">
    <table class="table table-striped table-hover table-bordered">
        <thead>
            <tr>
                <th scope="col">책제목</th>
                <th scope="col">저자</th>
                <th scope="col">출판사</th>
                <th scope="col">책 출판년도</th>
            </tr>
        </thead>
        <tbody>
<%  
   for (int i = 0 ; i < articleList.size() ; i++) {
       BookDataBean article = articleList.get(i);
%>
<tr>
    <td>     
        <a href="">
        <%=article.getBook_name()%></a> 
    </td>
    <td> 
        <%=article.getWriter()%>
    </td>
    <td><%=article.getPublisher()%></td>
    <td><%=sdf.format(article.getDate())%></td>
</tr>
<%}%>
</tbody>
</table>
</div>