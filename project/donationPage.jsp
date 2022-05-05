<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="../assets/bootstrap-5.1.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="../assets/fontawesome-free-5.15.4-web/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <jsp:include page="topNav.jsp"></jsp:include>

    <div id="wrap">
        <jsp:include page="topHeader.jsp"></jsp:include>

        <div id="y_container">
            <table class="table table-striped">
                <thead>
                    <tr style="text-align:center">
                        <td >책 제목</td>
                        <td>개정판(번호)</td>
                        <td>저자</td>
                        <td>출판사</td>
                        <td>출시년도</td>
                        <td>학과번호</td>
                        <td>전달날짜</td>
                        <td>현재상태</td>
                    </tr>
                </thead>
                <tbody>
                    <tr style="text-align:center">
                        <td>명품 JAVA Programming</td>
                        <td>0</td>
                        <td>황기태, 김효수</td>
                        <td>생능출판사</td>
                        <td>2020-08-20</td>
                        <td>104</td>
                        <td>F</td>
                        <td><button>취소</button></td>
                    </tr>
                </tbody>
        </div>
    </div>
</body>
</html>