<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% response.setStatus(HttpServletResponse.SC_OK);%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>500에러 페이지</title>
<link rel="stylesheet" href="/book/assets/bootstrap-5.1.1/css/bootstrap.min.css">
<link rel="stylesheet" href="../assets/fontawesome-free-5.15.4-web/css/all.min.css">
</head>
<body>
<div class="container">
    <div class="alert alert-success" role="alert">
        <h4 class="alert-heading">500에러 페이지</h4>
        <p><i class="fas fa-exclamation-triangle"></i> 서비스 사용에 불편을 끼쳐드려서 대단히 죄송합니다. 빠른시간내에 문제를 처리하겠습니다.</p>
    </div>
</div>
</body>
</html>