<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "ch14.bookshop.master.ShopBookDBBean" %>
<%@ page import = "ch14.bookshop.master.ShopBookDataBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%
String managerId ="";
try{
	managerId = (String)session.getAttribute("managerId");
	if(managerId==null || managerId.equals("")){
       response.sendRedirect("../logon/managerLoginForm.jsp");
	}else{
%> 

<%!
    SimpleDateFormat sdf = 
        new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

<%
    List<ShopBookDataBean> bookList = null; 
    int number =0;
    String book_kind="";
    
    book_kind = request.getParameter("book_kind");
 
    ShopBookDBBean bookProcess = ShopBookDBBean.getInstance();
    int count = bookProcess.getBookCount();
    
    if (count > 0) {
    	bookList = bookProcess.getBooks(book_kind);
    }
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
<div class="container-fluid">
<%
   String book_kindName="";
   if(book_kind.equals("100")){
	   book_kindName="문학";
   }else if(book_kind.equals("200")){
	   book_kindName="외국어";  
   }else if(book_kind.equals("300")){
	   book_kindName="컴퓨터";
   }else if(book_kind.equals("all")){
	   book_kindName="전체";
   }
%>
   <div class="alert alert-primary text-center" role="alert">책 등록
<%=book_kindName%> 분류의 목록: 
<%if(book_kind.equals("all")){%> 
    <%=count%>개
<%}else{%>
    <%=bookList.size() %>개
<%} %>
      <a href="../managerMain.jsp" class="btn btn-primary btn-sm" >관리자 메인으로</a>
      <a href="bookRegisterForm.jsp" class="btn btn-success btn-sm">책 등록</a>
   </div>

<%
  if (count == 0) {
%>
   <div class="alert alert-danger" role="alert">
      등록된 책이 없습니다.
   </div>

<%} else {%>
<table class="table table-striped table-bordered table-hover">
   <thead>
      <tr class="table-dark"> 
         <th>번호</th> 
         <th>책분류</th> 
         <th>제목</th>
         <th>가격</th> 
         <th>수량</th> 
         <th>저자</th>
         <th>출판사</th>
         <th>출판일</th>
         <th>책이미지</th>
         <th>할인율</th>
         <th>등록일</th>
         <th>수정</th>
         <th>삭제</th>         
      </tr>
   </thead>
   <tbody>
<%  
    for (int i = 0; i<bookList.size(); i++) {
      ShopBookDataBean book = (ShopBookDataBean)bookList.get(i);
      if(book == null ) return;
%>
   <tr>
      <td class="text-center"><%=++number%></td> 
      <td class="text-center"><%=book.getBook_kind()%></td> 
      <td ><%=book.getBook_title()%></td>
      <td><%=book.getBook_price()%></td> 
      <td>
      <% if(book.getBook_count()==0) {%>
         <span class="text-danger"><%="일시품절"%></span>
      <% }else{ %>
         <%=book.getBook_count()%>
      <%} %>
      </td> 
      <td><%=book.getAuthor()%></td>
      <td><%=book.getPublishing_com()%></td>
      <td><%=book.getPublishing_date()%></td>
      <td class="text-center"><%=book.getBook_image()%></td>
      <td class="text-center"><%=book.getDiscount_rate()%></td>
      <td class="text-center"><%=sdf.format(book.getReg_date())%></td>
      <td class="text-center"><a href="bookUpdateForm.jsp?book_id=<%=book.getBook_id()%>&book_kind=<%=book.getBook_kind()%>" class="btn btn-primary btn-sm">수정</a></td>
      <td><a href="bookDeleteForm.jsp?book_id=<%=book.getBook_id()%>&book_kind=<%=book.getBook_kind()%>" class="btn btn-danger btn-sm">삭제</a></td>    
   </tr>
<%}%>
</tbody>
</table>
<%}%>
   <div class="d-grid gap-2">
      <a href="../managerMain.jsp" class="btn btn-primary btn-sm"> 관리자 메인으로</a>
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