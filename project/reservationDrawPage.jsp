<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="project.java.book.donationDataBean"%>
<%@ page import="project.java.book.donationDBBean"%>
<%@ page import="project.java.book.reservationDataBean"%>
<%@ page import="project.java.book.reservationDBBean"%>
<%
    String id = (String)session.getAttribute("id");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String r_info = request.getParameter("r_info");

    List<reservationDataBean> articleList = null;
    reservationDBBean reservationPro = reservationDBBean.getInstance();

    if(r_info==null || r_info.equals("")){
        r_info=Integer.toString(reservationPro.getRoundNum());
    }
    

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

    if (id==null || id.equals("")){
%>
    <script>
        alert("로그인을 하셔야 이용가능합니다.");
        history.back();
    </script>
<%
    }else{
        count = reservationPro.getArticleCount(id, r_info);
        articleList = reservationPro.getSearchList(startRow, endRow, id, r_info);
        
    
        if (count > 0) {
            articleList = reservationPro.getSearchList(startRow, pageSize, id, r_info);
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
            <form method="get" action="reservationDrawPage.jsp" style="float: right;">
                회차정보
                <select id="select" name="r_info" >
                    <%
                        for(int cnt=reservationPro.getRoundNum(); cnt >= 1; cnt--){
                    %>
                    <option value="<%=cnt%>"><%=cnt%></option>
                    <%}%>
                </select>   
                <button type="submit" id = "radius">조회</button>
            </form>
        </div>
        <div id="y_container">
            <table class="table table-striped" style="width: 700px; margin-left: auto; margin-right: auto; text-align: center;" >
                <thead>
                    <tr style="text-align:center">
                        <td>회차</td>
                        <td>시작날짜</td>
                        <td>종료날짜</td>
                        <td>현재상황</td>
                        <td>추첨하기</td>
                    </tr>
                </thead>
                    <tbody>
                        <td><%=r_info%></td>
                        <td><%=reservationPro.getStartDate(r_info)%></td>
                        <td><%=reservationPro.getEndDate(r_info)%></td>
                        <td>
                            <% if(reservationPro.getStatus(r_info).equals("T")){%>
                                진행중
                            <%}else{%>
                                종료
                            <%}%>
                        </td>
                        <td><button>추첨하기</button></td>
                    </tbody>
            </table>
            <table class="table table-striped">
                <thead>
                    <tr style="text-align:center">
                        <td>이미지</td>
                        <td>책 제목</td>
                        <td>현재상황</td>
                        <td>회차정보</td>
                    </tr>
                </thead>
                <% if(count!=0){ %>
                <tbody>
                    <%  
                        for(int i=0; i < articleList.size(); i++){
                            reservationDataBean article = articleList.get(i);
                    %>    
                    <tr style="text-align: center;">
                        <td>
                            <div class="col-md-4">
                                <img src="" class="img-fluid rounded-start" alt="...">
                            </div>
                        </td>
                        <td><%=reservationPro.getBookName(article.getB_id())%></td>
                        <td>
                            <% if(article.getStatus().equals("T")){%>
                                당첨
                            <%}else if(article.getStatus().equals("F")){%>
                                낙첨
                            <%}else{%>
                                진행중
                            <%}%>
                        </td>
                        <td><%=article.getR_info()%></td>
                    </tr>
                    <%}%>
                </tbody>
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
        var selectNum = '<%=r_info%>';
        select.options[selectNum].selected=true;
    }
</script>
