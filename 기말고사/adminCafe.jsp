<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "t_ch13.board.BoardDBBean" %>
<%@ page import = "t_ch13.board.BoardDataBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "java.sql.*"%>


<%!
    int pageSize = 10;
    SimpleDateFormat sdf = 
        new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

<%
    String pageNum = request.getParameter("pageNum");
    String id=(String)session.getAttribute("id");
    String idg="";
    

    if (pageNum == null) {
        pageNum = "1";
    }

    int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage - 1) * pageSize + 1;
    int endRow = currentPage * pageSize;
    int count = 0;
    int number = 0;
    List<BoardDataBean> articleList = null; 
    
    BoardDBBean dbPro = BoardDBBean.getInstance();
    count = dbPro.getArticleUserCount(id);
    
    if (count > 0) {
        articleList = dbPro.getArticles(startRow, pageSize);
    }

	number = count-(currentPage-1)*pageSize;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판</title>
    <link href="style.css" rel="stylesheet" type="text/css">
    <link href="../assets/bootstrap-5.1.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="../assets/fontawesome-free-5.15.4-web/css/all.min.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <%@ include file="listTop.jsp"%>
    <table class="table table-striped">
        <thead>
            <tr>
                <td style="text-align:center">아이디</td>
                <td>글 작성수</td>
                <td>등급</td>
                <td>등급변경</td>
            </tr>
        </thead>
        <tbody>
            <%
            try{
            sql = "select * from t_cafe_member where grade!=?";
            String sql2="select count(*) from t_board where id=?";

            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, "Admin");
            rs=pstmt.executeQuery();
        
            while(rs.next()){
                pstmt=conn.prepareStatement(sql2);
                pstmt.setString(1, rs.getString("id"));
                ResultSet cRs = pstmt.executeQuery();

                if(cRs.next()){
                    idg = rs.getString("id");
            %>
            <tr>
                <td style="text-align:center"><%=idg%></td>
                <td><%=cRs.getInt(1)%></td>
                <td><%=rs.getString("grade")%></td>
                <td>
                    <select class="form-select form-select-sm" aria-label=".form-select-sm example" style="border-style:none" onchange="gradeUpdate(this.value, '<%=idg%>')">
                        <option value="User">User</option>
                        <option value="Manager">Manager</option>
                    </select>
                </td>
            </tr>
            <%}
                }
            }catch(Exception e){}
            %>
        </tbody>
    </table>

<script>
    function gradeUpdate(grade, idg){
        if(confirm("정말 변경하시겠습니까?"))
            location.href="gradeUpdate.jsp?id="+idg+"&grade="+grade;
    }
</script>
</body>
</html>