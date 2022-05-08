<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String id=(String)session.getAttribute("id");
%>

<div id="header">
    <div id="header_logo_area">
        <a href="main.jsp">
            <h1 id="header_logo">
                <img id="header_logo" src="images/logo.png" alt="안잡힘">
            </h1>
        </a>
    </div>
    <div id="page_title">
        <h1 id="title_text">
            연성북나눔
        </h1>
    </div>
    <div id="user_profile">
<%
        if(id==null){
%>
        <button class="btn btn-outline-success me-2" type="button" onclick="location='./_login/main.jsp'">로그인</button>
<%
        }else{
%>
        <button class="btn btn-outline-success me-2" type="button" onclick="location='./_login/sessionLogout.jsp'">로그아웃</button>
<%
        }

%>
<%=id%>
    </div>
</div>