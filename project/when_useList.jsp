<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="project.java.book.when_useDataBean"%>
<%@ page import="project.java.book.when_useDBBean"%>
<%@ page import="project.java.book.bookDataBean"%>
<%@ page import="project.java.book.bookDBBean"%>

<%
    bookDBBean bk = bookDBBean.getInstance();
    HashMap<Integer,String> map = bk.getDept();
    TreeMap<Integer,String> tMap = new TreeMap<Integer,String>(map);
    String[] deptname = {"스마트ICT", "라이프디자인", "문화콘텐츠", "사회경영", "보건복지교육",
                            "관광조리", "학사석사과정"};
    int deptSelectNum=1;
%>
<%
    String dept ="";
    String useyear =  request.getParameter("year");
    String grade =  request.getParameter("grade");
    String semester =  request.getParameter("semester");
    dept = request.getParameter("dept");

List<when_useDataBean> articleList = null; 

    when_useDBBean bkPro = when_useDBBean.getInstance();
    articleList = bkPro.getUsedList(useyear,dept, grade, semester);

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
       
        <div id="used-container">
            
            <div class="rd">
                <form method="get" action="when_useList.jsp">

                <input type="radio" id="rd" name="year" value="2020"><label for="rd">2020년도</label>
                <input type="radio" id="rd2" name="year" value="2021"><label for="rd2">2021년도</label>
                <input type="radio" id="rd3"name="year" value="2022"><label for="rd3">2022년도</label>
                <br>
                
                <input type="radio" id="rd4" name="grade" value="1"><label for="rd4">1학년</label>
                <input type="radio" id="rd5"name="grade" value="2"><label for="rd5">2학년</label>
                <input type="radio" id="rd6" name="grade" value="3"><label for="rd6">3학년</label>
                <br>
                
                <input type="radio" id="rd7" name="semester" value="1"><label for="rd7">1학기</label>
                <input type="radio" id="rd8" name="semester" value="2"><label for="rd8">2학기</label>

                <br>
            </div>  
            <div id="dt">
                <nav class="nav flex-column">
                    <ul class="nav flex-column">
                <%
                    for(int n=0; n < 7; n++){
                        Iterator<Integer> mapiterator = tMap.keySet().iterator();
                %>
                        <li class="nav-item dropdown" id="nav-border">
                            <a id="test_a" class="nav-link active" aria-current="page" href="#" onclick="ulClick();"><%=deptname[n]%></a>
                            <ul class="test_b" style="display: none;">
                <%
                            while(mapiterator.hasNext()){
                                int k = mapiterator.next();
                                if(k/100==n+1){
                                    if(deptSelectNum==1){
                %>
                                <li class="nav-item">
                                    <!--<a class="nav-link active" href="when_useList.jsp?dept=<%=k%>"><%=map.get(k)%></a>-->
                                    <input type="radio" name="dept" value=<%=k%>><%=map.get(k)%>
                                </li>           
                <%}else if(deptSelectNum==2){%>
                                <li class="nav-item">
                                    <a class="nav-link active" href="bookBoardUpdate.jsp?dept=<%=map.get(k)%>"><%=map.get(k)%></a>
                                </li>  
                <%}}}%>
                            </ul>
                        </li>
                <%}%>
                
                    </ul>
                </nav>
            </div>
            

            <input type="submit" id="btn_sb" value="보기">

<%
    if(articleList !=null){
%>
    <div id="used-table">
        <table class="table table-striped">
            <th></th>
            <th scope="col">책제목</th>
            <th scope="col">사용년도</th>
            <th scope="col">학년</th>
            <th scope="col">학기</th>
            <th scope="col">수업명</th>
            <th scope="col">교수명</th>
    
<%    
    for(int i=0 ; i < articleList.size() ; i++) {
        when_useDataBean article = articleList.get(i);
%>
        <tr>
            <td><%=i+1%></td>
            <td><%=article.getBook_name()%></td>
            <td><%=article.getUse_date()%></td>
            <td><%=article.getGrade()%></td>
            <td><%=article.getSemester()%></td>
            <td><%=article.getClass_name()%></td>
            <td><%=article.getProf_name()%></td>
        </tr>            
<%}%>
        </table>
    </div>
<%}else{%>
    <div>
        <h1 style="margin :auto; text-align: center;">내용이 없습니다</h1>
    </div>
<%}%>
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