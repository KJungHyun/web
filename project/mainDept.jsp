<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
</head>
<body>
    <%
    String dept = request.getParameter("dept");

    response.sendRedirect("main.jsp?dept="+"1안");
%>
</body>
</html>