<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "t_ch13.board.BoardDBBean" %>
<%@ page import = "t_ch13.board.BoardDataBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "java.sql.*"%>


<%!
    int pageSize = 10;
    SimpleDateFormat sdf = 
        new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

<%
    String pageNum = request.getParameter("pageNum");
    String id;

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
    <%@ include file="listTop.jsp"%>
    
    <%@ include file="listAll.jsp"%>
    
</body>
</html>