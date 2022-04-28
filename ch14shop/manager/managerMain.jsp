<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
   String managerId ="";
   try{
	   managerId = (String)session.getAttribute("managerId");
	   
	   if(managerId==null || managerId.equals("")){
        response.sendRedirect("logon/managerLoginForm.jsp");
	   }else{
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>책관리</title>
    <link rel="stylesheet" href="/book/assets/bootstrap-5.1.1/css/bootstrap.min.css">
</head>
<body>
  <div class="container">
    <nav class="navbar navbar-dark bg-dark">
      <div class="container-fluid">
        <a class="navbar-brand">관리자 화면</a>
        <div class="d-felx">
          <form method="post" action="logon/managerLogout.jsp">
            <input type="submit" class="btn btn-danger" value="로그아웃">	
          </form>
        </div>
      </div>
    </nav>

    <div class="row" style="margin-top:20px">
      <div class="col">
        <div class="card">
          <div class="card-header">상품관련 작업</div>
          <div class="card-body">
            <h5 class="card-title">상품등록과 상품수정/삭제</h5>
            <a href="productProcess/bookRegisterForm.jsp" class="btn btn-primary">상품등록</a>
            <a href="productProcess/bookList.jsp?book_kind=all" class="btn btn-warning">상품수정/삭제</a>
          </div>
        </div>
      </div>

      <div class="col">
        <div class="card">
          <div class="card-header">구매된 상품관련 작업</div>
          <div class="card-body">
            <h5 class="card-title">구매된 상품관련 작업</h5>
            <a href="orderedProduct/orderedList.jsp" class="btn btn-success">전체구매목록 확인</a>
          </div>
        </div>
      </div>
  </div>
</div>
</body>
</html>
<% 
	   }
    }catch(Exception e){
		e.printStackTrace();
	}
%>