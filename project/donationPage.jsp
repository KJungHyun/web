<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="project.java.book.donationDataBean"%>
<%@ page import="project.java.book.donationDBBean"%>
<%
    String id = (String)session.getAttribute("id");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String name = request.getParameter("name");
    String select = request.getParameter("select");

    int pageSize = 15;
    String pageNum = request.getParameter("pageNum");

    if (pageNum == null) {
        pageNum = "1";
    }

    int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage - 1) * pageSize + 1;
    int endRow = currentPage * pageSize;

    int count = 0;
    int number = 0;

    if (name==null || id.equals("")){
        name = "";
    }
    if(select==null || select.equals("")){
        select="1";
    }

    if (id==null || id.equals("")){
%>
    <script>
        alert("로그인을 하셔야 이용가능합니다.");
        history.back();
    </script>
<%
    }else{
        List<donationDataBean> articleList = null;
        donationDBBean donationPro = donationDBBean.getInstance();
        count = donationPro.getArticleCount(id, select, name);
        articleList = donationPro.getArticle(startRow, endRow, id, select, name);
    
        if (count > 0) {
            articleList = donationPro.getArticle(startRow, pageSize, id, select, name);
        }
%>
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
<body onload="selectBtn();">
    <jsp:include page="topNav.jsp"></jsp:include>

    <div id="wrap">
        <jsp:include page="topHeader.jsp"></jsp:include>

        <div>
            <form method="get" action="donationPage.jsp" style="float: right;">
                <select id="select" name="select" >
                    <optiom value="all">전체보기</optiom>
                    <option value="1">책 제목</option>
                    <option value="2">출판사</option>
                    <option value="3">학과명</option>
                </select>   
                <input name="name" value="<%=name%>">
                <button type="submit" id = "radius">검색</button>
            </form>
        </div>

        <div id="y_container">
            <table class="table table-striped table-hover">
                <thead>
                    <tr style="text-align:center">
                        <td>이미지</td>
                        <td style="width:270px;">책 제목</td>
                        <td>저자</td>
                        <td>출판사</td>
                        <td>출시년도</td>
                        <td>학과번호</td>
                        <td>전달날짜</td>
                        <td>현재상태</td>
                        <td>취소</td>
                <% if(id.equals("root")){%>
                        <td>완료</td>
                <%}%>
                    </tr>
                </thead>
                <% if(count!=0){ %>
                    <%@ include file="donationList.jsp"%>
                <%}else{%>
                    <td colspan="11" style="margin-top: 130px; margin-left: 50px; text-align: center;">검색 내용이 없습니다.</td>
                <%}%>
                
        </div>
    </div>

</body>
</html>

<%}%>

<script>
    function selectBtn(){
        var select = document.getElementById("select");
        var selectNum = '<%=select%>';
        select.options[selectNum-1].selected=true;
    }
</script>
