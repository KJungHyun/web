<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="project.java.book.boardDataBean"%>
<%@ page import="project.java.book.boardDBBean"%>

<%
    String book_name = request.getParameter("book_name");
    String select = request.getParameter("select");

    boardDBBean board = boardDBBean.getInstance();

    if(select.equals("추가")){
        board.insertBoard(book_name);
    }else{
        board.deleteBoard(book_name);
    }

    response.sendRedirect("bookBoardUpdate.jsp");
%>