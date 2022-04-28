<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>
<table class="table table-striped">
    <thead>
        <tr>
            <td style="text-align:center">공지</td>
            <td>제목</td>
            <td>작성자</td>
            <td>작성일</td>
            <td>조회</td>
        </tr>
    </thead>
    <tbody>
        <%
        try{
        Class.forName("com.mysql.jdbc.Driver");
        conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
        sql = "select * from t_board_notice where notice=? order by num desc limit 5";
    
        pstmt=conn.prepareStatement(sql);
        pstmt.setString(1, "T");
        rs=pstmt.executeQuery();
    
        while(rs.next()){
            int cNum = rs.getInt("num");
    
            sql = "select * from t_board where num=?";
            pstmt=conn.prepareStatement(sql);
            pstmt.setInt(1, cNum);
            ResultSet cRs = pstmt.executeQuery();
            if(cRs.next()){
        %>
        <tr>
            <td style="text-align:center">[공지]</td>
            <td><a href="content.jsp?num=<%=cNum%>&pageNum=<%=currentPage%>&id=<%=id%>" 
                style="text-decoration: none;" onClick="return sessionCheck()"><%=cRs.getString("subject")%></a></td>
            <td><%=cRs.getString("id")%></td>
            <td><%=sdf.format(cRs.getTimestamp("reg_date"))%></td>
            <td><%=cRs.getInt("readcount")%></td>
        </tr>
        <%}
            }
        }catch(Exception e){}
        %>
    </tbody>
</table>

