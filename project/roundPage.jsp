<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="project.java.book.roundDataBean"%>
<%@ page import="project.java.book.roundDBBean"%>
<%
    String id = (String)session.getAttribute("id");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String r_info = request.getParameter("r_info");

    List<roundDataBean> articleList = null;
        roundDBBean roundPro = roundDBBean.getInstance();

    if(r_info==null || r_info.equals("")){
        r_info="all";
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
        count = Integer.parseInt(roundPro.getRoundNum());
        articleList = roundPro.getSearchList(startRow, endRow, r_info);
    
        if (count > 0) {
            articleList = roundPro.getSearchList(startRow, pageSize, r_info);
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
    <style>
        table {
            margin-left: auto; 
            margin-right: auto; 
            text-align: center;
        }
    </style>
</head>
<body onload="selectBtn();">
    <jsp:include page="topNav.jsp"></jsp:include>
    <div id="wrap">
        <jsp:include page="topHeader.jsp"></jsp:include>

        <div id="y_container">
            <div style="float: left;">
                <a href="javascript:openNewWindow('roundInsertPage.jsp?r_info=<%=roundPro.getRoundNum()%>')">
                    <button type="button" id="radius">새로운 회차추가</button>
                </a>
            </div>
            <div>
                <form method="get" action="roundPage.jsp" style="float: right;">
                    회차정보
                    <select id="select" name="r_info" >
                        <option value="all">전체보기</option>
                        <%
                            for(int cnt=Integer.parseInt(roundPro.getRoundNum()); cnt >= 1; cnt--){
                        %>
                        <option value="<%=cnt%>"><%=cnt%></option>
                        <%}%>
                    </select>   
                    <button type="submit" id = "radius">조회</button>
                </form>
            </div>

            <table class="table table-striped">
                <thead>
                    <tr style="text-align:center">
                        <td>회차</td>
                        <td>시작날짜</td>
                        <td>종료날짜</td>
                        <td>현재상황</td>
                        <% if (id.equals("root")){%>
                            <td>추첨하기</td>
                        <%}%>
                    </tr>
                </thead>
                <% if(count!=0){ %>
                <tbody>
                    <%  
                        for(int i=0; i < articleList.size(); i++){
                            roundDataBean article = articleList.get(i);
                    %>
                    <tr style="text-align: center;">
                        <td><%=article.getR_info()%></td>
                        <td><%=sdf.format(article.getStart_date())%></td>
                        <td><%=sdf.format(article.getEnd_date())%></td>
                        <td>
                            <% if(article.getStatus().equals("T")){%>
                                진행중
                            <%}else{%>
                                종료
                            <%}%>
                        </td>
                        <% if (id.equals("root")){%>
                        <td>
                            <form method="post" action="roundPagePro.jsp">
                                <input name="r_info" type="hidden" value="<%=article.getR_info()%>">
                                <input name="start_date" type="hidden" value="<%=article.getStart_date()%>">
                                <input name="end_date" type="hidden" value="<%=article.getEnd_date()%>">
                                <input name="status" type="hidden" value="<%=article.getStatus()%>">
                                <button type="submit" onclick="return drawBtn();" id="radius">추첨하기</button>
                            </form>
                        </td>
                        <%}%>
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
        var selectValue = "<%=r_info%>";
        var num=0;
        if(selectValue=="all"){
            num=0;
        }else{
            num=selectValue-1;
        }
        select.options[num].selected=true;
    }

    function drawBtn(){
        var statusCheck = false;
        if(confirm("정말 추첨하시겠습니까?")){
             statusCheck = true;
        }
        return statusCheck;
    }

    function openNewWindow(window) { 
		open (window,"Mail","toolbar=no, location=no, directories=no, status=no, menubar=no, \
        scrollbars=no, resizable=no, width=550, height=500"); 
	}
</script>
