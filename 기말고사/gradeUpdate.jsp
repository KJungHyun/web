<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>

<%
    String id = request.getParameter("id");
    String grade = request.getParameter("grade");
    
    Connection conn=null;
    PreparedStatement pstmt=null;
    ResultSet rs=null;

    String jdbcUrl="jdbc:mysql://localhost:3306/ysu";
    String dbId="ysu";
    String dbPass="1234";

    Class.forName("com.mysql.jdbc.Driver");
    conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );

    String sql = "update t_cafe_member set grade=? where id=?";
    pstmt=conn.prepareStatement(sql);
    pstmt.setString(1, grade);
    pstmt.setString(2, id);
    pstmt.executeUpdate();

    response.sendRedirect("adminCafe.jsp");
%>