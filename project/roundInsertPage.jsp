<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <script src="../assets/bootstrap-5.1.1/js/bootstrap.bundle.min.js"></script>
        <link href="../assets/bootstrap-5.1.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="../assets/fontawesome-free-5.15.4-web/css/all.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/style.css">
    </head>
<body>
    <%
        String r_info=request.getParameter("r_info");
    %>
    <form method="get" action="roundInsertPagePro.jsp">
        <table class="table table-striped table-hover table-bordered">
            <tbody>
                <tr>
                    <td class="dlabel">다음 회차</td>
                    <td>
                        <div class="input-group mb-3"  style="width: 500px;">
                            <input type="text" class="form-control" name="r_info" value="<%=Integer.parseInt(r_info)+1%>" aria-label="r_info" aria-describedby="basic-addon1" readonly>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>시작날짜<span style="color:red">(필수)</span></td>
                    <td>
                        <div class="input-group mb-3" style="width: 200px;">
                            <input type="date" class="form-control" name="start_date" aria-label="start_date" aria-describedby="basic-addon1" required>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>종료날짜<span style="color:red">(필수)</span></td>
                    <td>
                        <div class="input-group mb-3" style="width: 200px;">
                            <input type="date" class="form-control" name="end_date" aria-label="end_date" aria-describedby="basic-addon1" required>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>
        <div class="btn-submit">
            <button type="submit">작성하기</button>
        </div>
    </form>
</body>
</html>