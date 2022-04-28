<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.Timestamp" %>

<%
   String managerId ="";
   try{
	   managerId = (String)session.getAttribute("managerId");
	   if(managerId==null || managerId.equals("")){
           response.sendRedirect("../logon/managerLoginForm.jsp");
	   }else{
%>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link href="../../etc/style.css" rel="stylesheet">
   <link href="/book/assets/bootstrap-5.1.1/css/bootstrap.min.css" rel="stylesheet"></link>
   <title>상품등록</title>
</head>
<body>
<div class="container">
   <div class="row justify-content-center">
      <div class="col-8">
         <div class="alert alert-primary" role="alert">책 등록</div>

         <form method="post" name="writeform" action="bookRegisterPro.jsp" enctype="multipart/form-data" 
         onsubmit="return checkForm(this)">
         <table class="table table-striped table-bordered table-hover">
            <tbody>
               <tr>
               <td colspan="2">
                  <a href="../managerMain.jsp" class="btn btn-primary btn-sm">관리자 메인으로</a> 
               </td>
               </tr>
               <tr>
               <td class="table-info">분류 선택</td>
               <td>
                  <select name="book_kind" class="form-select">
                     <option value="100">문학</option>
                     <option value="200">외국어</option>
                     <option value="300">컴퓨터</option>
                  </select>
               </td>
            </tr>
            <tr>
               <td>제 목</td>
               <td><input type="text" class="form-control" size="50" maxlength="50" name="book_title"></td>
            </tr>
            <tr>
               <td>가 격</td>
               <td>
                  <div class="input-group mb-3">
                     <input type="text" class="form-control" size="10" maxlength="9" name="book_price">
                     <span class="input-group-text" id="basic-addon2">원</span>
                  </div>
               </td>
            </tr>
            <tr>
               <td>수량</td>
               <td>
                  <div class="input-group mb-3">
                     <input type="text" class="form-control" size="10" maxlength="5" name="book_count">
                     <span class="input-group-text" id="basic-addon2">권</span>
                  </div>
               </td>
            </tr>
            <tr>
               <td>저자</td>
               <td><input type="text" class="form-control" size="20" maxlength="30" name="author"></td>
            </tr>
            <tr>
               <td>출판사</td>
               <td><input type="text" class="form-control" size="20" maxlength="30" name="publishing_com"></td>
            </tr>
            <tr>
               <td>출판일</td>
               <td>
                  <div class="input-group">
                     <select  name="publishing_year" class="form-select">
               <%
                  Timestamp nowTime  = new Timestamp(System.currentTimeMillis());
                  int lastYear = Integer.parseInt(nowTime.toString().substring(0,4));
                     for(int i=lastYear;i>=2000;i--){
               %>
                        <option value="<%=i %>"><%=i %></option>
               <%} %>
                  </select>
                  <label class="input-group-text">년</label>
                  
                  <select  name="publishing_month" class="form-select">
               <%
                  for(int i=1;i<=12;i++){
               %>
                     <option value="<%=i %>"><%=i %></option>
               <%} %>
                  </select>
                  <label class="input-group-text">월</label>
                  <select  name="publishing_day" class="form-select">      
               <%
                  for(int i=1;i<=31;i++){
               %>
                     <option value="<%=i %>"><%=i %></option>
                  <%} %>
                  </select>
                  <label class="input-group-text">일</label>
               </div>
               </td>
            </tr>
            <tr>
               <td>이미지</td>
               <td><input type="file" class="form-control" name="book_image"></td>
            </tr>
            <tr>
               <td>내 용</td>
               <td><textarea name="book_content" class="form-control" rows="13" cols="40"></textarea> </td>
            </tr>
            <tr>
               <td>할인율</td>
               <td>
                  <div class="input-group mb-3">
                     <input type="text" class="form-control" size="5" maxlength="2" name="discount_rate">
                     <span class="input-group-text" id="basic-addon2">%</span>
                  </div>   
            </tr>
            <tr>      
            <td colspan="2"> 
            <input type="submit" class="btn btn-success" value="책등록">  
            <input type="reset" class="btn btn-warning" value="다시작성"></td>
            </tr>
         </tbody>
         </table>
         </form>
      </div>
   </div>
</div>
<script src="../../etc/script.js"></script>
</body>
</html>
<% 
	}
}catch(Exception e){
	e.printStackTrace();
}
%>