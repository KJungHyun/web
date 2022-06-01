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
        width: 50px;
        border-bottom: 1px solid #504f4f;
        border-left: 1px solid #504f4f;
        padding: 10px;
        
    }
    th:first-child, td:first-child{
        border-left: none;
    }
</style>
<table>
    <%
        if(id==null) {
    %>
        <table>
            <th>로그인이 필요합니다!</th>
        </table>
        
    <%
        }else{
    %>
<thead>
        <tr>
            <th>아이디</th>
            <td style="text-align: right;"><%=id%></td>
        </tr>
        <tr>
            <th>예약 가능</th>
            <td style="text-align: right;"><%=bkPro.getDonationCount(id)%></td>         
        </tr>
        <tr>
            <th colspan="2">예약한 책 목록</th>
        </tr>
    </thead>
    <tbody>
        <td colspan="2">
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