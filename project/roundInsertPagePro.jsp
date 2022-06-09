<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="project.java.book.roundDataBean"%>
<%@ page import="project.java.book.roundDBBean"%>

<%
    String r_info = request.getParameter("r_info");
    String start_date = request.getParameter("start_date");
    String end_date = request.getParameter("end_date");

    roundDBBean roundPro = roundDBBean.getInstance();
    roundPro.roundInsert(r_info, start_date, end_date);
%>
<script>
    window.close();
</script>