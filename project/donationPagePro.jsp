<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="project.java.book.donationDataBean"%>
<%@ page import="project.java.book.donationDBBean"%>

<%  
    String id = (String)session.getAttribute("id");
    String d_number = request.getParameter("d_number");
    String select = request.getParameter("select");
    donationDBBean donaPro = donationDBBean.getInstance();

    if(select.equals("수령")){
%>
    <script>
        alert("수령을 완료했습니다.");
    </script>
<%
        donaPro.donationStatusUpdate(d_number, "P");
    }else if(select.equals("취소")){
%>
    <script>
        alert("취소되었습니다.");
    </script>
<%
        donaPro.donationStatusUpdate(d_number, "F");
    }
%>
<script>
    location.href="donationPage.jsp";
</script>
