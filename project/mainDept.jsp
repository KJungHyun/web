<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="project.java.book.bookDataBean"%>
<%@ page import="project.java.book.bookDBBean"%>

<%
    bookDBBean bk = bookDBBean.getInstance();
    HashMap<Integer,String> map = bk.getDept();
    TreeMap<Integer,String> tMap = new TreeMap<Integer,String>(map);
    String[] deptname = {"스마트ICT", "라이프디자인", "문화콘텐츠", "사회경영", "보건복지교육",
                            "관광조리", "학사석사과정"};
%>
<style>
    ul{
        list-style: circle;
    }
    li{
        margin-bottom: 1px;
    }
</style>
<nav class="nav flex-column">
    <ul class="nav flex-column">
<%
    for(int n=0; n < 7; n++){
        Iterator<Integer> mapiterator = tMap.keySet().iterator();
%>
        <li class="nav-item dropdown" id="nav-border">
            <a id="test_a" class="nav-link active" aria-current="page" href="#" onclick="ulClick();"><%=deptname[n]%></a>
            <ul class="test_b" style="display: none;">
<%
            while(mapiterator.hasNext()){
                int k = mapiterator.next();
                if(k/100==n+1){
                    if(deptSelectNum==1){
%>
                <li class="nav-item">
                    <a class="nav-link active" href="main.jsp?dept=<%=k%>"><%=map.get(k)%></a>
                </li>           
<%}else if(deptSelectNum==2){%>
    <li class="nav-item">
        <a class="nav-link active" href="bookBoardUpdate.jsp?dept=<%=map.get(k)%>"><%=map.get(k)%></a>
    </li>   
<%}else if(deptSelectNum==3){%>
    <li class="nav-item">
        <a class="nav-link active" href="reservationDept.jsp?dept=<%=k%>"><%=map.get(k)%></a>
    </li>   
<%}}}%>
            </ul>
        </li>
<%}%>

    </ul>
</nav>