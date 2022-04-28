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
        <link href="../book/assets/bootstrap-5.1.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="../book/assets/fontawesome-free-5.15.4-web/css/all.min.css" rel="stylesheet">
        <style type="text/css">
            #wrap{
                width: 1200px;
                height: 1500px;
                margin: 0px auto; /*가운데 정렬*/
            }
            div #header{
                width:100%;
                height:160px;
                background-color: red;
                float:left;
            }
            div #header_logo_area{
                margin-left: 30px;
                margin-top: 20px;
                width: 15%;
                height: 10px;
                float: left;
            }
            h1 #header_logo{
                margin-top: 15px;
                width: 100%;
                height: 100%;
            }
            img #header_logo{
                width: 100%;
                height: 100%;
            }
            div #page_title{
                margin-left: 300px;
                width: 700px;
                height: 100px;
                background-color: cyan;
                text-align: center;
                padding-top: 30px;
                float: left;
            }
            h1 #title_text{
                
            }
            div #user_profile{
                width: 100px;
                height: 100px;
                background-color: brown;
                float:left;
                margin-left: 50px;
            }

            
            div #y_container{
                background-color: wheat;
                width: 100%;
                height: 1200px;
                margin-top: 30px;
                float: left;
            }
            div #dept_menu{
                background-color: green;
                width: 215px;
                height: 700px;
                padding-left: 20px;
                margin-top: 100px;
                float: left;
            }

            a {
                text-decoration: none;
            }

            div #book_list{
                float: left;
                margin-left: 150px;
                margin-top: 0px;
            }

        </style>
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

    <div id="wrap">
        <div id="header">
            <div id="header_logo_area">
                <a href="main.jsp">
                    <h1 id="header_logo">
                        <img id="header_logo" src="images/logo.png" alt="안잡힘">
                    </h1>
                </a>
            </div>
            <div id="page_title">
                <h1 id="title_text">
                    홈페이지 이름
                </h1>
            </div>
            <div id="user_profile">
                프로필 위치
            </div>
        </div>

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
                                <a class="nav-link" href="list.jsp?department_id=104">컴퓨터소프트웨어과
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
                    <select>
                        <option>책 제목</option>
                        <option>출판사</option>
                    </select>
                    <input>
                    <button style="float: right;">버튼</button>
                </div>
                  
                <div class="card mb-3" style="width: 540px;">
                   
                    <div class="row g-0">
                        <div class="col-md-4">
                            <img src="..." class="img-fluid rounded-start" alt="...">
                        </div>
                        <div class="col-md-8">
                            <div class="card-body">
                                <jsp:include page ="list.jsp?department_id=104"/>
                                
                            </div>
                        </div>
                    </div>
                </div>

                
            </div>

            <nav aria-label="Page navigation example">
                <ul class="pagination justify-content-center">
            
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