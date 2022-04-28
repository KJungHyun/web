<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
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
    <form method="get" action="requestTestPro3.jsp">
        <div class="row mb-3">
            <label for="num" class="col-sm-2 col-form-label">학번</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="num" name="num" placeholder="20211234">
            </div>
        </div>
        <div class="row mb-3">
            <label for="name" class="col-sm-2 col-form-label">이름</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="name" name="name" placeholder="홍길동">
            </div>
        </div>
        <fieldset class="row mb-3">
            <legend class="col-form-label col-sm-2 pt-0">취미</legend>
            <div class="col-sm-10">
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" name="hobby" id="hobby1" value="walking" checked="checked">
                    <label class="form-check-label" for="hobby1">걷기</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" name="hobby" id="hobby2" value="swimming">
                    <label class="form-check-label" for="hobby2">수영</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" name="hobby" id="hobby3" value="running">
                    <label class="form-check-label" for="hobby3">달리기</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" name="hobby" id="hobby4" value="climbing">
                    <label class="form-check-label" for="hobby4">등반</label>
                </div>
            </div>
        </fieldset>    
        <div class="row mb-3">
            <label for="subject" class="col-sm-2 col-form-label">선택과목</label>
            <div class="col-sm-10">
                <select class="form-select" name="subject" multiple size="4">
                    <option selected>::선택하세요::</option>
                    <option value="JAVA">JAVA</option>
                    <option value="JSP">JSP</option>
                    <option value="XML">XML</option>
                </select>
            </div>
        </div>
        <input type="submit" class="btn btn-primary" value="입력완료">
   </form>
</div>    

<script src="/book/assets/js/jquery-3.6.0.min.js"></script>
<script src="/book/assets/bootstrap-5.1.1/js/bootstrap.min.js"></script>  
</body>
</html>