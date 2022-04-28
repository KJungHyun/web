<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
  int num = Integer.parseInt(request.getParameter("num"));
  String pageNum = request.getParameter("pageNum");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판</title>
    <link href="style.css" rel="stylesheet" type="text/css">
    <link href="../assets/bootstrap-5.1.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="../assets/fontawesome-free-5.15.4-web/css/all.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
  <div class="alert alert-danger" role="alert">
    <h1><i class="fas fa-trash-alt"></i> 글삭제</h1>
</div>

<form method="post" action="deletePro.jsp?pageNum=<%=pageNum%>" onsubmit="return deleteSave(this)"> 
   <input type="hidden" name="num" value="<%=num%>">
<table class="table table-striped table-hover table-bordered">
  <tbody>
    <tr>
      <td><strong>비밀번호를 입력해 주세요.</strong></td>
    </tr>
    <tr height="30">
      <td>비밀번호 :  
        <input type="password" name="passwd" size="8" maxlength="12" class="form-control" required>
      </td>
    </tr>
    <tr>
      <td class="text-center">
        <input type="submit" class="btn btn-danger" value="글삭제" >
        <a href="list.jsp?pageNum=<%=pageNum%>" class="btn btn-primary">글목록</a>
      </td>
    </tr>
  </tbody>
</table>
</form>
<script>
  function deleteSave(obj){	
	if(!obj.passwd.value){
      alert("비밀번호를 입력하십시요.");
      obj.passwd.focus();
      return false;
    }
  }    
</script>
</body>
</html>