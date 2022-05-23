<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="project.java.book.when_useDataBean"%>
<%@ page import="project.java.book.when_useDBBean"%>
<%
    List<when_useDataBean> articleList = null;
    when_useDBBean whPro = when_useDBBean.getInstance();
    String search = "3";
    articleList = whPro.getSearchList(3,search);
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
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>학년</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th>1</th>
                        <td>Core C Programming 2nd ED</td>
                        <td>두근두근 파이썬</td>
                    </tr>
                    <tr>
                        <th>2</th>
                        <td>SQL Server로 배우는 데이터베이스 개론과 실습</td>
                        <td>C로 배우는 쉬운 자료구조</td>
                    </tr>
                    <tr>
                        <th>3</th>
                        <td>C Warming up Programming</td>
                        <td>손에 잡히는 데이터 통신</td>
                    </tr>
                </tbody>
            </table>
        </div>
<div>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th scope="col">id</th>
                <th scope="col">책제목</th>
                <th scope="col">사용년도</th>
                <th scope="col">학년</th>
                <th scope="col">학기</th>
                <th scope="col">교수명</th>
                <th scope="col">수업명</th>
              </tr>
        </thead>
        <tbody>
        
<%
    for(int i=0 ; i < articleList.size() ; i++) {
        when_useDataBean article = articleList.get(i);
%> 
<tr>
            <th><%=article.getId()%></th>
            <td><%=article.getBookname()%></td>
            <td><%=article.getUse_date()%></td>
            <td><%=article.getGrade()%></td>
            <td><%=article.getSemester()%></td>
            <td><%=article.getProf_name()%></td>
            <td><%=article.getClass_name()%></td>
</tr>            
<%}%>
    
        </tbody>
    </table>
</div>        
</body>
</html>