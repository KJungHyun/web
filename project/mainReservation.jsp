<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
    table {
        width:100%;
        border-top: 1px solid #504f4f;
        border-collapse: collapse;
    }
    th{
        border-bottom: 1px solid #504f4f;
        border-left: 1px solid #504f4f;
        padding: 10px;
        background: #dfdbdb;
    }
    td{
        width: 140px;
        border-bottom: 1px solid #504f4f;
        border-left: 1px solid #504f4f;
        padding: 10px;
        text-align: right;
        
    }
    th:first-child, td:first-child{
        border-left: none;
    }
</style>
<table style="width:320px;">
    <thead>
        <tr>
            <th colspan="2" style="text-align: center;">회차정보</th>
        </tr>
        <tr>
            <th>현재 회차</th>
            <td><%=r_info%></td>
        </tr>
        <tr>
            <th>시작 일</th>
            <td><%=start_date%></td>
        </tr>
        <tr>
            <th>종료 일</th>
            <td><%=end_date%></td>
        </tr>
        <tr></tr>
    </thead>
</table>
<br>
<table style="width:320px;">
    <%
        if(id==null) {
    %>
        <thead>
            <th>로그인이 필요합니다!</th>
        </thead>
        
    <%
        }else{
    %>
<thead>
        <tr>
            <th>아이디</th>
            <td><%=id%></td>
        </tr>
        <tr>
            <th>이름</th>
            <td><%=bkPro.getUserName(id)%></td>
        </tr>
        <tr>
            <th>연속 기부 횟수</th>
            <td><%=bkPro.getDonationCount(id)%></td>      
        </tr>
        <tr>
            <th>예약 가능 횟수</th>
            <td><%=bkPro.getReservationCount(id)%></td>         
        </tr>
        <tr>
            <th colspan="2">예약한 책 목록</th>
        </tr>
    </thead>
    <tbody>
        <td colspan="4">
        <%
            ArrayList bookList = bkPro.getReservationList(id, r_info);
            for(int i=0; i < bookList.size(); i++){
        %>
            <%=bookList.get(i)%>
        <%}%>
        </td>
    </tbody>
    <tfoot>

    </tfoot>
    <%
        }
    %>
</table>