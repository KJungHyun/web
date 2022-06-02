<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="project.java.book.roundDataBean"%>
<%@ page import="project.java.book.roundDBBean"%>
<%
    String id = (String)session.getAttribute("id");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String r_info = request.getParameter("r_info");
    Date start_date = sdf.parse(request.getParameter("start_date"));
    Date end_date = sdf.parse(request.getParameter("end_date"));
    String status = request.getParameter("status");

    Date now = new Date();

    roundDBBean roundPro = roundDBBean.getInstance();
    roundPro.reservationDraw(r_info);

    response.sendRedirect("roundPage.jsp");
%>