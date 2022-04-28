<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link href="../../etc/style.css" rel="stylesheet">
   <link href="/book/assets/bootstrap-5.1.1/css/bootstrap.min.css" rel="stylesheet"></link>
   <title>Book Shopping Mall</title>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col header">
            <jsp:include page="../module/top.jsp" flush="false" /> 
        </div>
        <div class="col-3 menu">
            <jsp:include page="../module/left.jsp" flush="false" />
        </div>
        <div class="col-9 main">
            <jsp:include page="introList.jsp" flush="false"/>
        </div>
        <div class="col footer">
            <img src="../module/logo.png" border="0" width="90" height="60">
            <jsp:include page="../module/bottom.jsp" flush="false" />
        </div>
    </div>
</div>
</body>
</html>