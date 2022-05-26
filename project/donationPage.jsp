<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="project.java.book.donationDataBean"%>
<%@ page import="project.java.book.donationDBBean"%>
<%
    String id = (String)session.getAttribute("id");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    if (id==null || id.equals("")){
%>
    <script>
        alert("로그인을 하셔야 이용가능합니다.");
        history.back();
    </script>
<%
    }else{
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
<body>
    <jsp:include page="topNav.jsp"></jsp:include>

    <div id="wrap">
        <jsp:include page="topHeader.jsp"></jsp:include>

        <div id="y_container">
            <table class="table table-striped">
                <thead>
                    <tr style="text-align:center">
                        <td>이미지</td>
                        <td >책 제목</td>
                        <td>개정판(번호)</td>
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
                <tbody>
<%  List<donationDataBean> articleList = null;
    donationDBBean donaPro = donationDBBean.getInstance();

    articleList = donaPro.getArticle(id);
    
    for(int i=0; i < articleList.size(); i++){
        donationDataBean article = articleList.get(i);
%>              
                    <tr style="text-align:center">
                        <td><img src="./images/<%=article.getBook_name()%>.jpg" class="img-fluid rounded-start" alt="..."></td>
                        <td><%=article.getBook_name()%></td>
                        <td><%=article.getBook_num()%></td>
                        <td><%=article.getWriter()%></td>
                        <td><%=article.getPublisher()%></td>
                        <td><%=sdf.format(article.getDate())%></td>
                        <td><%=article.getDepartment_id()%></td>
                        <td><%=sdf.format(article.getP_date())%></td>
                        <td><%=article.getStatus()%></td>
            <% if(article.getStatus().equals("F")){%>
                        <td>
                            <form method="get" action="donationPagePro.jsp">
                                <input type="hidden" name="d_number" value="<%=article.getD_number()%>">
                                <input type="hidden" name="select" value="취소">
                                <button type="submit">취소</button>
                            </form>
                        </td>
                        <% if(id.equals("root")){%>
                            <td>
                                <form method="get" action="donationPagePro.jsp">
                                    <input type="hidden" name="d_number" value="<%=article.getD_number()%>">
                                    <input type="hidden" name="select" value="수령">
                                    <button type="submit">수령</button>
                                </form>
                            </td>
                        <%}%>
            <% } %> 
                    </tr>
<%
                }
%>
                </tbody>
        </div>
    </div>
</body>
</html>

<%}%>