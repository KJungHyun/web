<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Timestamp" %>

  <%
    Timestamp now = new Timestamp(System.currentTimeMillis());
  %>
  
  top.jsp입니다.<p>
  <%=now.toString()%>
  <hr>
  
