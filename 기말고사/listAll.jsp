<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% if (count == 0) { %>

    <div class="alert alert-danger" role="alert">
        게시판에 저장된 글이 없습니다.
    </div>
    <% } else {%>
    <%@ include file="notice.jsp"%>
    
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
           String ip=article.getIp();
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
          <a href="content.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>&id=<%=id%>" style="text-decoration: none;" onClick="return sessionCheck()">
               <%=article.getSubject()%></a> 
    <% if(article.getReadcount()>=20){%>
            <i class="fas fa-pepper-hot"></i><%}%> </td>
        <td><%=article.getId()%></a></td>
        <td><%= sdf.format(article.getReg_date())%></td>
        <td><%=article.getReadcount()%></td>
        <td><%=ip%></td>
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