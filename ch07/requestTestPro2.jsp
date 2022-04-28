<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% 
     request.setCharacterEncoding("utf-8");

     String num = request.getParameter("num");
     String name = request.getParameter("name");
     String grade = request.getParameter("grade"); // 1,2,3,4
     String subject = request.getParameter("subject");
    /*
    if(grade.equals("1")){
        out.print(" checked=\"checked\"");
    }

    if(subject.equals("JAVA")){
        out.print(" selected=\"selected\"");
    }
    */
%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="/book/assets/bootstrap-5.1.1/css/bootstrap.min.css" rel="stylesheet">
<title>Request 내장객체 예제</title>
</head>
<body>
<div class="container">
    <div class="alert alert-primary" role="alert">
        학번, 이름, 학년, 선택과목을 입력하는 폼
    </div>
    <form method="post" action="requestTestPro2.jsp">
        <div class="row mb-3">
            <label for="num" class="col-sm-2 col-form-label">학번</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="num" name="num" value="<%=num%>" readonly="readonly">
            </div>
        </div>
        <div class="row mb-3">
            <label for="name" class="col-sm-2 col-form-label">이름</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="name" name="name" value="<%=name%>">
            </div>
        </div>
        <fieldset class="row mb-3">
            <legend class="col-form-label col-sm-2 pt-0">학년</legend>
            <div class="col-sm-10">
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="grade" id="grade1" value="1"<% if(grade.equals("1")){out.print(" checked=\"checked\"");} %>>
                    <label class="form-check-label" for="grade1">1학년</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="grade" id="grade2" value="2"<% if(grade.equals("2")){out.print(" checked=\"checked\"");} %>>
                    <label class="form-check-label" for="grade2">2학년</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="grade" id="grade3" value="3"<% if(grade.equals("3")){out.print(" checked=\"checked\"");} %>>
                    <label class="form-check-label" for="grade3">3학년</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="grade" id="grade4" value="4"<% if(grade.equals("4")){out.print(" checked=\"checked\"");} %>>
                    <label class="form-check-label" for="grade4">4학년</label>
                </div>
            </div>
        </fieldset>    
        <div class="row mb-3">
            <label for="subject" class="col-sm-2 col-form-label">선택과목</label>
            <div class="col-sm-10">
                <select class="form-select" name="subject">
                    <option value="JAVA"<% if(subject.equals("JAVA")){out.print(" selected=\"selected\"");} %>>JAVA</option>
                    <option value="JSP"<% if(subject.equals("JSP")){out.print(" selected=\"selected\"");} %>>JSP</option>
                    <option value="XML"<% if(subject.equals("XML")){out.print(" selected=\"selected\"");} %>>XML</option>
                </select>
            </div>
        </div>
        <input type="submit" class="btn btn-primary" disabled="disabled" value="입력완료">
   </form>
</div>    

<script src="/book/assets/js/jquery-3.6.0.min.js"></script>
<script src="/book/assets/bootstrap-5.1.1/js/bootstrap.min.js"></script>  
</body>
</html>

