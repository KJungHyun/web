<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="project.java.book.donationDataBean"%>
<%@ page import="project.java.book.donationDBBean"%>

<%  
    String id = (String)session.getAttribute("id");
    String d_number = request.getParameter("d_number");
    String status = request.getParameter("status");
    String select = request.getParameter("select");
    donationDBBean donaPro = donationDBBean.getInstance();
    
    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
    String book_name="";
    String writer="";
    String publisher="";
    int dept=0;
    String date="";
    System.out.println(status);
    

    if(select.equals("수령")){
        if(status.equals("P")){
%>
            <script>
                alert("이미 수령된 책입니다.");
            </script>
<%
        }else if(status.equals("T")){
%>
            <script>
                alert("이미 전달된 책입니다.");
            </script>
<%      }else{%>
    <script>
        alert("수령을 완료했습니다.");
    </script>
<%          book_name = request.getParameter("book_name");
            writer = request.getParameter("writer");
            publisher = request.getParameter("publisher");
            dept = Integer.parseInt(request.getParameter("dept"));
            date = df.format(df.parse(request.getParameter("date")));
            donaPro.donationStatusUpdate(d_number, "P", status);
            donaPro.insertBook(book_name, writer, publisher, dept, date);
        }
    }else if(select.equals("취소")){
        if(id.equals("root") || id=="root"){
            if(status.equals("F")){
%>
        <script>
            alert("이미 거절된 책입니다.");
        </script>
<% 
            }else if(status.equals("T")){
%>
        <script>
            alert("이미 전달된 책입니다.");
        </script>
<%
            }else{
                donaPro.donationStatusUpdate(d_number, "F", status);
%>
            <script>
                alert("취소되었습니다.");
            </script>
<%          }
        }else{
            if(status.equals("C")){
                donaPro.donationStatusUpdate(d_number, "F", status);
%>
<script>
    alert("취소되었습니다.");
</script>
<%          }else{
%>
<script>
    alert("취소가 불가능합니다.");
</script>
<%
        }
    }    
}
%>
<script>
    location.href="donationPage.jsp";
</script>
