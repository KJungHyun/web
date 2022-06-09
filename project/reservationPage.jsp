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
<%
    String id = (String)session.getAttribute("id");
    String book_name = request.getParameter("book_name");
    int b_id = Integer.parseInt(request.getParameter("b_id"));

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    roundDBBean roundPro = roundDBBean.getInstance();
    String r_info = roundPro.getRoundNum();
    String start_date=roundPro.getRoundStartDate(r_info);
    String end_date = roundPro.getRoundEndDate(r_info);
    String status = roundPro.getRoundStatus(r_info);

    boardDBBean boardPro = boardDBBean.getInstance();
    int bookCount = boardPro.getBookCount(book_name);
    int resCount = boardPro.getResCount(b_id, r_info);

    bookDataBean article = boardPro.getBoardDetail(book_name);
    boardDBBean bkPro = boardDBBean.getInstance();

    
%>
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
<body>
    <jsp:include page="topNav.jsp"></jsp:include>
    
    <div id="wrap">
        <jsp:include page="topHeader.jsp"></jsp:include>

        <div id="y_container">
            <div id="res_container">
                <div id="res_img">
                    <img src="./images/<%=book_name%>.jpg" class="img-fluid rounded-start" alt="...">
                </div>
                <div id="res_table">
                    <table class="table table-bordered" style="height:450px">
                        <thead>
                            <td colspan="4">예약(<%=resCount%>/<%=bookCount%>)</td>
                        </thead>
                        <tbody>
                            <tr>
                                <td>책 이름</td>
                                <td><%=book_name%></td>
                            </tr>
                            <tr>
                                <td>출판사</td>
                                <td><%=article.getPublisher()%></td>
                            </tr>
                            <tr>
                                <td>저자</td>
                                <td><%=article.getWriter()%></td>
                            </tr>
                            <tr>
                                <td>출판날짜</td>
                                <td><%=sdf.format(article.getDate())%></td>
                            </tr>
                        </tbody>
                        <tfoot>
                            <td colspan="2">
                                <a href="reservationPagePro.jsp?b_id=<%=b_id%>" style="float:right" onclick="return resCountCheck();"><button style="border-radius: 5px;">예약하기</button></a>
                                <select style="float:right">
                                    <option>1회</option>
                                </select>
                            </td>
                        </tfoot>
                    </table>
                </div>

                <div id="reservation">
                    <%@ include file="mainReservation.jsp"%>
                </div>

            </div>
        </div>
    </div>
</body>
</html>

<script>
    function resCountCheck(){
        var check = false;
        var bookCnt = "<%=bookCount%>";
        var resCnt = "<%=bkPro.getReservationCount(id)%>";
        if(bookCnt==0){
            alert("책의 재고가 없어 신청이 불가능합니다");
        }else{
            if(resCnt>=1){
                alert("예약하셨습니다.");
                check=true;
            }else{
                alert("예약 가능 횟수가 부족합니다.");
            }
        }
        
        return check;
    }
</script>