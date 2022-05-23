<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<% String id=(String)session.getAttribute("id"); %>

<nav class="navbar navbar-expand-lg navbar-light bg-light" >
    <div class="container-fluid" style="background-color: darkgrey;">
      <a class="navbar-brand" href="main.jsp">메인</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav">
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              기부
            </a>
            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
              <li><a class="dropdown-item" aria-current="page" href="donationWriterPage.jsp">기부신청</a></li>
              <li><a class="dropdown-item" aria-current="page" href="donationPage.jsp">기부내역</a></li>
            </ul>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              예약
            </a>
            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
              <li><a class="dropdown-item" href="#">예약 내역</a></li>
            </ul>
          </li>
    <%
    try{
          if(id.equals("root") || id=="root"){
    %>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              관리자 페이지
            </a>
            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
              <li><a class="dropdown-item" href="bookBoardUpdate.jsp">책 게시판</a></li>
              <li><a class="dropdown-item" href="#">예약 당첨자 추첨</a></li>
              <li><hr class="dropdown-divider"></li>
              <li><a class="dropdown-item" href="#">Something else here</a></li>
            </ul>
          </li>
      <%}
    }catch(Exception e){ 
      e.printStackTrace();
    }%>
        </ul>
      </div>
    </div>
  </nav>