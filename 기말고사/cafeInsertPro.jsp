<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*"%>

<%
    String id = (String)session.getAttribute("id");
                    
    Connection conn=null;
    PreparedStatement pstmt=null;
    ResultSet rs=null;

    String jdbcUrl="jdbc:mysql://localhost:3306/ysu";
    String dbId="ysu";
    String dbPass="1234";

    Class.forName("com.mysql.jdbc.Driver");
    conn=DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
    String sql = "insert into t_cafe_member (id) value(?)";

    pstmt=conn.prepareStatement(sql);
    pstmt.setString(1, id);
    pstmt.executeUpdate();

    response.sendRedirect("list.jsp");
%>