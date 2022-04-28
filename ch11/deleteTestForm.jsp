<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");

  String id = request.getParameter("id"); 
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>레코드 삭제</title>
<link rel="stylesheet" href="../assets/bootstrap-5.1.1/css/bootstrap.min.css">
</head>
<body>
<div class="container-fluid">
  <div class="row">
    <div class="col-3">
      <div class="alert alert-danger" role="alert">
        member테이블의 레코드 삭제
      </div>
    </div>
    <div class="col-9">
      <form method="post" action="deleteTestPro.jsp">
        <div class="mb-3">
          <label for="id" class="form-label">아이디</label>
          <input type="text" class="form-control" name="id" id="id" value="<%=id%>" maxlength="50" readonly>
        </div>
        <div class="mb-3">
          <label for="passwd" class="form-label">비밀번호</label>
          <input type="password" class="form-control" name="passwd" id="passwd" placeholder="비밀번호 입력" maxlength="16" required>
        </div>
        <div class="mb-3">
          <input type="submit" class="btn btn-primary" value="입력완료">
        </div>
      </form>
    </div>
  </div>
</div>  
</body>
</html>