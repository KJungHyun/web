<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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

    <a href="http://daum.net" class="btn btn-danger" onclick="return false">다음으로 이동</a>

    <form name="myform" method="post" action="requestTestPro1.jsp" onsubmit="return checkForms(this)">
        <div class="row mb-3">
            <label for="num" class="col-sm-2 col-form-label">학번</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="num" name="num" placeholder="20211234">
            </div>
        </div>
        <div class="row mb-3">
            <label for="name" class="col-sm-2 col-form-label">이름</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="name" name="name" placeholder="홍길동" required>
            </div>
        </div>
        <fieldset class="row mb-3">
            <legend class="col-form-label col-sm-2 pt-0">학년</legend>
            <div class="col-sm-10">
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="grade" id="grade1" value="1" checked="checked">
                    <label class="form-check-label" for="grade1">1학년</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="grade" id="grade2" value="2">
                    <label class="form-check-label" for="grade2">2학년</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="grade" id="grade3" value="3">
                    <label class="form-check-label" for="grade3">3학년</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="grade" id="grade4" value="4">
                    <label class="form-check-label" for="grade4">4학년</label>
                </div>
            </div>
        </fieldset>    
        <div class="row mb-3">
            <label for="subject" class="col-sm-2 col-form-label">선택과목</label>
            <div class="col-sm-10">
                <select class="form-select" name="subject">
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
<script>
// form validation (폼의 유효성 체크)    
function checkForms(obj){
    // $('#num').val()
    // $('input[type="num"]').val();

    // alert(document.forms[0].num.value);
    // alert(document.forms['myform'].num.value);
    // alert(obj.num.value);
    
    if(obj.num.value.length < 8){
        alert('학번은 8자리 이상을 넣어주세요');
        obj.num.focus();
        return false;
    }
    return true;
}    
</script>  
</body>
</html>