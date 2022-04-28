<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% 
     request.setCharacterEncoding("utf-8");

     String num = request.getParameter("num"); // 20211234
     String name = request.getParameter("name");
     String grade = request.getParameter("grade");
     String subject = request.getParameter("subject");
%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="/book/assets/bootstrap-5.1.1/css/bootstrap.min.css" rel="stylesheet">
<title>학생정보</title>
</head>
<body>
<div class="container">
     <table class="table table-striped table-dark table-hover table-bordered">
          <tr>
               <td>학번</td>
               <td><%=num %></td>
          </tr>
          <tr>
               <td>이름</td>
               <td><%=name %></td>
          </tr>
          <tr>
               <td>학년</td>
               <td><%=grade %>학년</td>
          </tr>
          <tr>
               <td>선택과목</td>
               <td><%=subject %></td>
          </tr>
     </table>
</div>
</body>
</html>