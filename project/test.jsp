<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="project.java.book.bookDataBean"%>
<%@ page import="project.java.book.bookDBBean"%>
<%
        
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <%
        bookDBBean bk = bookDBBean.getInstance();
        HashMap<Integer,String> map = bk.getDept();
        TreeMap<Integer,String> tMap = new TreeMap<Integer,String>(map);

        
        for(int n=0; n < 8; n++){
            Iterator<Integer> mapiterator = tMap.keySet().iterator();
            while(mapiterator.hasNext()){
                int k = mapiterator.next();
%>
                
<%
                if(k/100==n+1){
    %>
    <%=k%>
            <%=map.get(k)%>
    <%}
            
        }
        %>
        <hr>
        <%
    }
    %>
    
    <h1><%=map.get(102)%></h1>
    <h1><%=100/1%></h1>
</body>
</html>