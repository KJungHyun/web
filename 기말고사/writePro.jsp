<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "t_ch13.board.BoardDBBean" %>
<%@ page import = "java.sql.Timestamp" %>
<%@ page import = "java.net.*" %>
<%@ page import="java.sql.*"%>

<% request.setCharacterEncoding("utf-8");%>

<jsp:useBean id="article" scope="page" class="t_ch13.board.BoardDataBean">
   <jsp:setProperty name="article" property="*"/>
</jsp:useBean>
 
<%
    article.setReg_date(new Timestamp(System.currentTimeMillis()) );
	article.setIp(InetAddress.getLocalHost().getHostAddress());

    String nCk = request.getParameter("notice");
    
    
    if (nCk!=null){
        article.setNotice("T");
    }else{
        article.setNotice("F");
    }

    BoardDBBean dbPro = BoardDBBean.getInstance();
    dbPro.insertArticle(article);

    response.sendRedirect("list.jsp");
%>