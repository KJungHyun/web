<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="project.java.book.donationDataBean"%>
<%@ page import="project.java.book.donationDBBean"%>
<%@ page import="project.java.book.bookDataBean"%>
<%@ page import="project.java.book.bookDBBean"%>

<%
    String id = (String)session.getAttribute("id");
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    bookDBBean bk = bookDBBean.getInstance();
    HashMap<Integer,String> map = bk.getDept();
    TreeMap<Integer,String> tMap = new TreeMap<Integer,String>(map);

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
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <jsp:include page="topNav.jsp"></jsp:include>

    <div id="wrap">
        <jsp:include page="topHeader.jsp"></jsp:include>

        <div id="y_container">
            <form method="get" action="donationWriterPro.jsp">
                <table class="table table-striped table-hover table-bordered">
                    <tbody>
                        <tr>
                            <td class="dlabel">제목<span style="color:red">(필수)</span></td>
                            <td>
                                <div class="input-group mb-3"  style="width: 500px;">
                                    
                                    <input type="text" class="form-control" name="book_name" placeholder="제목" aria-label="Book_name" aria-describedby="basic-addon1" required>
                                    <button class="btn btn-outline-secondary" type="button" id="button-addon1">책찾기</button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>개정판(번호)</td>
                            <td>
                                <div class="input-group mb-3" style="width: 430px;">
                                    <input type="text" class="form-control" value="0" name="book_num" placeholder="개정판(번호) 없으면 0" aria-label="Book_num" aria-describedby="basic-addon1">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>저자<span style="color:red">(필수)</span></td>
                            <td>
                                <div class="input-group mb-3" style="width: 200px;">
                                    <input type="text" class="form-control" name="writer" placeholder="예)홍길동,허균" aria-label="Writer" aria-describedby="basic-addon1" required>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>출판사<span style="color:red">(필수)</span></td>
                            <td>
                                <div class="input-group mb-3" style="width: 200px;">
                                    <input type="text" class="form-control" name="publisher" placeholder="예)한빛아카데미" aria-label="Publisher" aria-describedby="basic-addon1" required>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>학과<span style="color:red">(필수)</span></td>
                            <td>
                                <div class="input-group mb-3" style="width: 370px;">
                                    <select name="dept" class="form-select" aria-label="Default select example">
                                        <option selected="selected">학과를 선택하세요</option>
                                    <%
                                        for(int n=0; n < 7; n++){
                                            Iterator<Integer> mapiterator = tMap.keySet().iterator();
                                
                                                while(mapiterator.hasNext()){
                                                    int k = mapiterator.next();
                                                    if(k/100==n+1){
                                    %>
                                        <option value="<%=k%>"><%=map.get(k)%></option>
                                    <%}}
                                    }
                                    %>
                                    </select>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>출판년도<span style="color:red">(필수)</span></td>
                            <td>
                                <div class="input-group mb-3" style="width: 200px;">
                                    <input type="date" class="form-control" name="date" placeholder="예)한빛아카데미" aria-label="date" aria-describedby="basic-addon1" required>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>전달 날짜<span style="color:red">(필수)</span></td>
                            <td>
                                <div class="input-group mb-3" style="width: 200px;">
                                    <input type="date" class="form-control" name="p_date" placeholder="예)한빛아카데미" aria-label="p_date" aria-describedby="basic-addon1" required>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="btn-submit">
                    <button type="submit">작성하기</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
<%}%>