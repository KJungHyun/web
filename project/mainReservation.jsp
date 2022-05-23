<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<table class="table table-bordered">
    <thead>
        <tr>
            <td>아이디</td>
            <td><%=id%></td>
        </tr>
        <tr>
            <td>예약 가능</td>
            <td><%=bkPro.getDonationCount(id)%></td>
        </tr>
        <tr>
            <td colspan="2">예약한 책 목록</td>
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
</table>