<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="project.book.BookDataBean"%>
<%@ page import="project.book.BookDBBean"%>
<% int department_id =0; %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="../assets/bootstrap-5.1.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="../assets/fontawesome-free-5.15.4-web/css/all.min.css" rel="stylesheet">
        <link rel="stylesheet" href="style.css">
    </head>
<body>
    <% request.setCharacterEncoding("UTF-8");
    %>
    <%
        String dept="";

        if (dept.equals("")){
            dept=request.getParameter("dept");
        }
    %>

    <jsp:include page="topNav.jsp"></jsp:include>

    <div id="wrap">
        <jsp:include page="topHeader.jsp"></jsp:include>

        <div id="y_container">
            <div id="dept_menu">
                <nav class="nav flex-column">
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a id="test_a" class="nav-link active" aria-current="page" href="#" onclick="ulClick();">스마트ICT</a>
                            <ul class="test_b" style="display: none;">
                                <li class="nav-item">
                                    <a class="nav-link active" href="main.jsp?dept=디지털전자과">디지털전자과</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link">정보통신과</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link">전기과</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="list.jsp?department_id=104">컴퓨터소프트웨어과</a>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" onclick="ulClick()">라이프디자인</a>
                            <ul class="test_b" style="display: none;">
                                <li class="nav-item">
                                    <a class="nav-link active" aria-current="page" href="#">건축과</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">실내건축과</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
            
            <div id="book_list" >
                <div style="margin-bottom: 15px;">
                    <form method="get" action="test.jsp">
                        <select name="select">
                            <option value="1">책 제목</option>
                            <option value="2">출판사</option>
                        </select>   
                        <input name="name">
                        <button type="submit" style="float: right;">버튼</button>
                    </form>
                    
                </div>
                  
                <jsp:include page="bookList.jsp?department_id=104"></jsp:include>
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
    
</script>