<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="project.java.book.donationDataBean"%>
<%@ page import="project.java.book.donationDBBean"%>

        <tbody>
<%  
    for(int i=0; i < articleList.size(); i++){
        donationDataBean article = articleList.get(i);
%>              
            <tr style="text-align:center">
                <td><img src="./images/<%=article.getBook_name()%>.jpg" class="img-fluid rounded-start" alt="..." style="width:160px; height:200px"></td>
                <td><%=article.getBook_name()%></td>
                <td><%=article.getBook_num()%></td>
                <td><%=article.getWriter()%></td>
                <td><%=article.getPublisher()%></td>
                <td><%=sdf.format(article.getDate())%></td>
                <td><%=donationPro.getDeptName(article.getDepartment_id())%></td>
                <td><%=sdf.format(article.getP_date())%></td>
                <td>
                    <%=article.getStatus()%>
                </td>
            <% if(article.getStatus().equals("F")){%>
                <td>
                    <form method="get" action="donationPagePro.jsp">
                        <input type="hidden" name="d_number" value="<%=article.getD_number()%>">
                        <input type="hidden" name="select" value="취소">
                        <button type="submit">취소</button>
                    </form>
                </td>
            <% if(id.equals("root")){%>
                <td>
                    <form method="get" action="donationPagePro.jsp">
                        <input type="hidden" name="d_number" value="<%=article.getD_number()%>">
                        <input type="hidden" name="select" value="수령">
                        <button type="submit">수령</button>
                    </form>
                </td>
                <%}else{%>
                    <td></td>
                <%}%>
            <% }else if(article.getStatus().equals("T") && id.equals("root")){ %>
                <td></td>
                <td></td>
            <%}%>
            </tr>
    <%}%>
        </tbody>
            </table>
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
                            <a href="donationPage.jsp?pageNum=<%= startPage - 10 %>" class="page-link">&laquo;</a>
                        </li>
            <%      }
                    
                    for (int i = startPage ; i <= endPage ; i++) {  %>
                        <li class="page-item active">
                            <a class="page-link" href="donationPage.jsp?pageNum=<%= i %>&select=<%=select%>&name=<%=name%>"><%= i %></a>
                        </li>
            <%      }
                    if (endPage < pageCount) {  %>
                        <li class="page-item">
                            <a href="donationPage.jsp?pageNum=<%= startPage + 10 %>" class="page-link" href="#">&raquo;</a>
                        </li>
            <%
                    }
                }
            %>
                </ul>
            </nav>