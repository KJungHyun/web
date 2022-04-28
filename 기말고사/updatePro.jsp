<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "t_ch13.board.BoardDBBean" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("utf-8");%>

<jsp:useBean id="article" scope="page" class="t_ch13.board.BoardDataBean">
   <jsp:setProperty name="article" property="*"/>
</jsp:useBean>
<%
 
    String pageNum = request.getParameter("pageNum");
    String nCk = request.getParameter("notice");
    
    
    if (nCk!=null){
        article.setNotice("T");
    }else{
        article.setNotice("F");
    }

	  BoardDBBean dbPro = BoardDBBean.getInstance();
    int check = dbPro.updateArticle(article); 

    response.sendRedirect("list.jsp");
%>