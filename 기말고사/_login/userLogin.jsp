<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%	request.setCharacterEncoding("utf-8");

    String id = request.getParameter("id");
    
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>로그인</title>
  <link rel="stylesheet" href="/book/assets/bootstrap-5.1.1/css/bootstrap.min.css"/>
  <link rel="stylesheet" href="/book/assets/fontawesome-free-5.15.4-web/css/all.min.css">
  <style>
    html,
body {
  height: 100%;
}

body {
  display: flex;
  align-items: center;
  padding-top: 40px;
  padding-bottom: 40px;
  background-color: #f5f5f5;
}

.form-signin {
  width: 100%;
  max-width: 500px;
  padding: 15px;
  margin: auto;
}

.form-signin .checkbox {
  font-weight: 400;
}

.form-signin .form-floating:focus-within {
  z-index: 2;
}
</style>
</head>
<body>
  <main class="form-signin">
        <img src="https://www.yeonsung.ac.kr/img/kor/gemflix/ys_logo.png" alt="해당 파일이 없습니다"><br/>
        <label for="id"><%=id%>님이 로그인하셨습니다.</label>

  
        <a href="main.jsp" class="w-100 btn btn-lg btn-primary">로그아웃</button>
        <a href="userUpdateForm.jsp?id=<%=id%>" class="w-100 btn btn-lg btn-warning">정보수정</a>
  </main>
</body>
</html>