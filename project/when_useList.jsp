<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="project.java.book.when_useDataBean"%>
<%@ page import="project.java.book.when_useDBBean"%>
<%

    String useyear =  request.getParameter("year");
    String grade =  request.getParameter("grade");
    String semester =  request.getParameter("semester");
 
List<when_useDataBean> articleList = null; 

    when_useDBBean bkPro = when_useDBBean.getInstance();
    articleList = bkPro.getUsedList(useyear, grade, semester);

%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="../assets/bootstrap-5.1.1/js/bootstrap.bundle.min.js"></script>
        <link href="../assets/bootstrap-5.1.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="../assets/fontawesome-free-5.15.4-web/css/all.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <div>
            <form method="get" action="when_useList.jsp">
            <span>년도</span>
            <input type="radio" name="year" value="2020">2020
            <input type="radio" name="year" value="2021">2021
            <input type="radio" name="year" value="2022">2022
            <br>
            <span>학년</span>
            <input type="radio" name="grade" value="1">1
            <input type="radio" name="grade" value="2">2
            <input type="radio" name="grade" value="3">3
            <br>
            <span>학기</span>
            <input type="radio" name="semester" value="1">1
            <input type="radio" name="semester" value="2">2
            <br>
            <input type="submit" value="보기">
        </div>

<%
    if(articleList !=null){
%>
<div>
    <table class="table table-striped">
        <th></th>
        <th scope="col">책제목</th>
        <th scope="col">사용년도</th>
        <th scope="col">학년</th>
        <th scope="col">학기</th>
        <th scope="col">수업명</th>
        <th scope="col">교수명</th>
    
<%    
    for(int i=0 ; i < articleList.size() ; i++) {
        when_useDataBean article = articleList.get(i);
%>
        <tr>
            <td><%=i+1%></td>
            <td><%=article.getBookname()%></td>
            <td><%=article.getUse_date()%></td>
            <td><%=article.getGrade()%></td>
            <td><%=article.getSemester()%></td>
            <td><%=article.getClass_name()%></td>
            <td><%=article.getProf_name()%></td>
        </tr>            
<%}%>
    </table>
</div>
<%}else{%>
    <h1>내용이 없습니다</h1>
<%}%>
    </body>
</html>
</script>