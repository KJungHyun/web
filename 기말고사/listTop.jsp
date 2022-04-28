<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
      <a class="navbar-brand" href="list.jsp">전체게시판</a>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="listNotice.jsp">공지사항</a>
          </li>
        </ul>
      </div>
      <nav class="navbar navbar-light bg-light">
            (전체 글:<%=count%>)
            <% 
                id = (String)session.getAttribute("id");
                
                Connection conn=null;
                PreparedStatement pstmt=null;
                ResultSet rs=null;

                String jdbcUrl="jdbc:mysql://localhost:3306/ysu";
                String dbId="ysu";
                String dbPass="1234";
            
                Class.forName("com.mysql.jdbc.Driver");
                conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
                String sql = "select * from t_cafe_member where id=?";

                pstmt=conn.prepareStatement(sql);
                pstmt.setString(1, id);
                rs=pstmt.executeQuery();
            try{
                
                
                if(id == null || id.equals("")){

            %>
            <button class="btn btn-outline-success me-2" type="button" onclick="location='./_login/main.jsp'">로그인</button>

            <%} else {%>
            <%=id%>
            <% if(rs.next()){}else{%>
                <button class="btn btn-outline-success me-2" type="button" onclick="cafeInsert()">가입하기</button>
            <%}%>
            <select class="form-select form-select-sm" aria-label=".form-select-sm example" style="width: 0px; border-style:none" onchange="location.href=this.value">
                <option selected style="display:none"></option>
                <option value="sessionLogout.jsp">로그아웃</option>
            <%
                if(id.equals("root")){
            %>
                <option value="./_login/adminSelect.jsp?id=<%=id%>">전체회원정보</option>
                <option value="adminCafe.jsp?id=<%=id%>">카페회원정보</option>
            <%} else {%>
                <option value="./_login/userUpdateForm.jsp?id=<%=id%>">회원정보</option>
            <%}%>
                <option value="userBoardForm.jsp?id=<%=id%>">내가 쓴 글</option>
            <%}
                }catch(Exception e){
                    e.printStackTrace();
                }%>
            </select>
        </nav>
    </div>
</nav>
<% sql="select * from t_cafe_member where id=?";
    pstmt=conn.prepareStatement(sql);
    pstmt.setString(1, id);
    rs=pstmt.executeQuery();
    String cid="F";
    if(rs.next()){
        cid="T";
    }
%>
<div class="d-grid gap-2">
    <a href="writeForm.jsp" class="btn btn-primary btn-lg" onclick="return sessionCheck()">글쓰기</a>
</div>

<script>
    function cafeInsert(){
        if(confirm("정말 가입하시겠습니까?"))
            location.href="cafeInsertPro.jsp";
    }

    function sessionCheck(){
        var idc = "<%=id%>";
        var cafe = "<%=cid%>";
        var check = false;
        if(idc=='null'){
            alert("로그인을 하셔야 이용 가능합니다.")
        }else {
            if(cafe=="T"){
                check=true;
            }else{
                alert("가입을 하셔야 이용 가능합니다.")
            }
        }
        return check
    }
</script>
