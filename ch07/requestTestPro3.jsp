<%@ page language="java" import="java.util.Arrays,java.util.List" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% 
     request.setCharacterEncoding("utf-8");

     String num = request.getParameter("num");
     String name = request.getParameter("name");
     String[] hobby = request.getParameterValues("hobby");
     String subject = request.getParameter("subject");

     //List<String> hobbies = Arrays.asList(hobby);

    /*
    for(int i=0; i<hobby.length; i++){
        if(hobby[i].equals("climbing")){
            out.print("checked=\"checked\"");
        }
    }

    if(Arrays.asList(hobby).contains("walking")){
        out.print("checked");
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
                <input type="text" class="form-control" id="num" name="num" value="<%=num%>">
            </div>
        </div>
        <div class="row mb-3">
            <label for="name" class="col-sm-2 col-form-label">이름</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="name" name="name" value="<%=name%>">
            </div>
        </div>
        <fieldset class="row mb-3">
            <legend class="col-form-label col-sm-2 pt-0">취미</legend>
            <div class="col-sm-10">
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" name="hobby" id="hobby1" value="walking" <% if(Arrays.asList(hobby).contains("walking")){out.print("checked");} %>>
                    <label class="form-check-label" for="hobby1">걷기</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" name="hobby" id="hobby2" value="swimming" <% if(Arrays.asList(hobby).contains("swimming")){out.print("checked");} %>>
                    <label class="form-check-label" for="hobby2">수영</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" name="hobby" id="hobby3" value="running" <% if(Arrays.asList(hobby).contains("running")){out.print("checked");} %>>
                    <label class="form-check-label" for="hobby3">달리기</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" name="hobby" id="hobby4" value="climbing" <% for(int i=0; i<hobby.length; i++) {if(hobby[i].equals("climbing")){out.print("checked=\"checked\"");}} %>>
                    <label class="form-check-label" for="hobby4">등반</label>
                </div>
            </div>
        </fieldset>    
        <div class="row mb-3">
            <label for="subject" class="col-sm-2 col-form-label">선택과목</label>
            <div class="col-sm-10">
                <select class="form-select" name="subject">
                    <option value="JAVA" <% if(subject.equals("JAVA")){out.print("selected");} %>>JAVA</option>
                    <option value="JSP" <% if(subject.equals("JSP")){out.print("selected");} %>>JSP</option>
                    <option value="XML" <% if(subject.equals("XML")){out.print("selected");} %>>XML</option>
                </select>
            </div>
        </div>
        <input type="submit" class="btn btn-primary" value="입력완료">
   </form>
</div>    

<script src="/book/assets/js/jquery-3.6.0.min.js"></script>
<script src="/book/assets/bootstrap-5.0.0-beta3/js/bootstrap.min.js"></script>  
</body>
</html>

