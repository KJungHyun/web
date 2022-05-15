<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="project.java.book.donationDataBean"%>
<%@ page import="project.java.book.donationDBBean"%>

<%  
    String d_number = request.getParameter("d_number");
    String select = request.getParameter("select");
    donationDBBean donaPro = donationDBBean.getInstance();

    if(select.equals("수령")){
        donaPro.donationStatusUpdate(d_number);
    }else if(select.equals("취소")){
        donaPro.donationDelete(d_number);
    }


%>