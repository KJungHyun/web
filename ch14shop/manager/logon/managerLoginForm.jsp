<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="/book/assets/bootstrap-5.1.1/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <div class="alert alert-primary" role="alert">
            <h1>로그인폼</h1>
        </div>
        <form method="post" action="managerLoginPro.jsp">
            <div class="mb-3 row">
                <label for="id" class="col-sm-2 col-form-label">아이디</label>
                <div class="col-sm-10">
                    <input type="text" name="id" id="id" maxlength="50" class="form-control" style="ime-mode:inactive;">
                </div>
            </div>

            <div class="mb-3 row">
                <label for="password" class="col-sm-2 col-form-label">비밀번호</label>
                <div class="col-sm-10">
                    <input type="password" name="passwd" id="passwd" maxlength="16" class="form-control" style="ime-mode:inactive;">
                </div>
            </div>
            <div class="mb-3 row">
                <input type="submit" class="btn btn-success" value="로그인">
            </div>
        </form>
    </div>
</body>
</html>