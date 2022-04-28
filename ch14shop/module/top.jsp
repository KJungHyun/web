<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../etc/color.jspf"%> 
<%
try{
  if(session.getAttribute("id")==null){%>
  <div class="header-logon">
    <a href="../shopping/list.jsp?book_kind=all" class="btn btn-primary btn-sm">전체목록보기</a>

    <form name="inform" method="post" action="loginPro.jsp">
      <div class="row">
        <div class="col">
          <input type="text" class="form-control" name="id" size="15" maxlength="50" placeholder="아이디">
        </div>
        <div class="col">
          <input type="password" class="form-control" name="passwd" size="15" maxlength="16" placeholder="비밀번호">
        </div>
        <div class="col">
          <input type="submit" name="submit" class="btn btn-success btn-sm" value="로그인">
        </div>

    </form>
    <span class="text-danger">* 반드시 로그인을 하셔야 쇼핑을 하실 수 있습니다.*</span>    

  <%}else{%>
    <div class="header-logon">
      <a href="../shopping/list.jsp?book_kind=all" class="btn btn-primary">전체목록보기</a>
      <a href="../shopping/cartList.jsp?book_kind=all" class="btn btn-info">장바구니보기</a>
      <a href="../shopping/buyList.jsp" class="btn btn-success">구매목록보기</a>
      <div class="alert alert-success" role="alert">
        <strong><%=session.getAttribute("id")</strong>
      </div>
        
      <br><br> 
      <b><%=session.getAttribute("id")%></b> 님 , 즐거운 쇼핑시간이 되세요.
        
      <input type="button"  value="로그아웃" onclick="javascript:window.location='../shopping/logout.jsp'">
    </div>
  </div>
 <%}
 }catch(NullPointerException e){
	 e.printStackTrace();
 }
 %>
