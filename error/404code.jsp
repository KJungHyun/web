<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%  response.setStatus(HttpServletResponse.SC_OK); %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>404에러 페이지</title>
<link rel="stylesheet" href="/book/assets/bootstrap-5.1.1/css/bootstrap.min.css">
<link rel="stylesheet" href="../assets/fontawesome-free-5.15.4-web/css/all.min.css">
</head>
<body>
  <div class="alert alert-danger" role="alert">
    <i class="fas fa-bell"></i> 요청하신 페이지는 존재하지 않습니다.
  </div>
</body>
</html>