<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="project.java.book.donationDataBean"%>
<%@ page import="project.java.book.donationDBBean"%>
<%
    String id = (String)session.getAttribute("id");
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
    donationDBBean donaPro = donationDBBean.getInstance();

    String book_name = request.getParameter("book_name");
    int book_num = Integer.parseInt(request.getParameter("book_num"));
    String writer = request.getParameter("writer");
    String publisher = request.getParameter("publisher");
    int dept = Integer.parseInt(request.getParameter("dept"));
    String date = df.format(df.parse(request.getParameter("date")));
    String p_date =  df.format(df.parse(request.getParameter("p_date")));
    String status = "F";


    System.out.println(id);
    System.out.println(book_name);
    System.out.println(book_num);
    System.out.println(writer);
    System.out.println(publisher);
    System.out.println(dept);
    System.out.println(date);
    System.out.println(p_date);
    System.out.println(status);
    donaPro.donationInsert(id, book_name, book_num, writer, publisher, dept, date, p_date, status);
    response.sendRedirect("donationPage.jsp");
%>