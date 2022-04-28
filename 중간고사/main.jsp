<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>로그인</title>
  <link rel="stylesheet" href="../assets/bootstrap-5.1.1/css/bootstrap.min.css"/>
  <link rel="stylesheet" href="../assets/fontawesome-free-5.15.4-web/css/all.min.css">
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

.form-signin input[type="email"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}
</style>
</head>
<body>
  <main class="form-signin">
    <form method="post" action="userLoginPro.jsp">
        <img src="https://www.yeonsung.ac.kr/img/kor/gemflix/ys_logo.png" alt="해당 파일이 없습니다">
  
      <div class="form-floating">
        <input type="text" class="form-control" name="id" id="id" placeholder="아이디 입력" 
        maxlength="50" required>
        <label for="id">아이디</label>
      </div>
      <div class="form-floating">
        <input type="password" class="form-control" name="passwd" id="passwd" placeholder="비밀번호 입력" maxlength="16" required>
        <label for="passwd">비밀번호</label>
      </div>
  
      <button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
      <a href="userInsertForm.jsp" class="w-100 btn btn-lg btn-warning">회원가입</a>
    </form>
  </main>
</body>
</html>