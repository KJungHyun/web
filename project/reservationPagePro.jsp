<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="project.java.book.boardDataBean"%>
<%@ page import="project.java.book.boardDBBean"%>
<% 
    String id = (String)session.getAttribute("id");
    int b_id = Integer.parseInt(request.getParameter("b_id"));
    int r_info = 1;

    boardDBBean boardPro = boardDBBean.getInstance();
    boardPro.reservationInsert(id, b_id, r_info);

    response.sendRedirect("main.jsp");
%>