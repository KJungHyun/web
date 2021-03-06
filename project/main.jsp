<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="project.java.book.boardDataBean"%>
<%@ page import="project.java.book.boardDBBean"%>
<%@ page import="project.java.book.bookDataBean"%>
<%@ page import="project.java.book.bookDBBean"%>
<%@ page import="project.java.book.roundDataBean"%>
<%@ page import="project.java.book.roundDBBean"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="../assets/bootstrap-5.1.1/js/bootstrap.bundle.min.js"></script>
        <link href="../assets/bootstrap-5.1.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="../assets/fontawesome-free-5.15.4-web/css/all.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/style.css">
    </head>
<body onload="selectBtn();">
    <%
        String select = request.getParameter("select");
        String name=request.getParameter("name");
        if (name==null){
            name="";
        }
        int deptSelectNum=1;

        roundDBBean roundPro = roundDBBean.getInstance();
        String r_info = roundPro.getRoundNum();
        String start_date=roundPro.getRoundStartDate(r_info);
        String end_date = roundPro.getRoundEndDate(r_info);
        String status = roundPro.getRoundStatus(r_info);
    %>

    <jsp:include page="topNav.jsp"></jsp:include>
    <div id="wrap">
        <jsp:include page="topHeader.jsp"></jsp:include>

        <div id="y_container">
            <div id="dept_menu">
                <%@ include file="mainDept.jsp"%>
            </div>
            
            <div id="book_list" >
                <div>
                    <form method="get" action="main.jsp" style="float: right;">
                        <select id="select" name="select" >
                            <option value="1">??? ??????</option>
                            <option value="2">?????????</option>
                        </select>   
                        <input name="name" value="<%=name%>">
                        <button type="submit" id = "radius">??????</button>
                    </form>
                </div>
                <%@ include file="bookBoardList.jsp"%>           
            </div>

            <div id="reservation">
                <%@ include file="mainReservation.jsp"%>
            </div>
            
    </div>
    
    
</body>
</html>

<script>
    function ulClick(){
        let dv = event.currentTarget
        dvm = dv.parentNode.querySelector('ul');
        if(dvm.style.display=='none'){
            dvm.style.display='block';
        }else{
            dvm.style.display='none';
        }
    }

    function selectBtn(){
        var select = document.getElementById("select");
        var selectNum = '<%=select%>';
        select.options[selectNum-1].selected=true;
    }
    
</script>