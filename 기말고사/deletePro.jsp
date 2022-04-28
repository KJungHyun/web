<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "t_ch13.board.BoardDBBean" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("utf-8");%>

<%
  int num = Integer.parseInt(request.getParameter("num"));
  String pageNum = request.getParameter("pageNum");
  String id = request.getParameter("id");

  BoardDBBean dbPro = BoardDBBean.getInstance(); 
  int check = dbPro.deleteArticle(num, id);

  if (check==1){
    response.sendRedirect("list.jsp");
  }else{%>
    <script>
      alert("로그인된 세션의 값이 아닙니다.");
      history.go(-1);
    </script>
<%}%>
