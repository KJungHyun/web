package project.java.book;

import java.sql.*;
import java.util.*;
import javax.naming.*;
import javax.sql.DataSource;

public class reservationDBBean {

    private static reservationDBBean instance = new reservationDBBean();
	
	public static reservationDBBean getInstance() {
		return instance;
	}
	
	private reservationDBBean() {}

    private Connection getConnection() throws Exception {
        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource)envCtx.lookup("jdbc/ysu_project");
        return ds.getConnection();
    }

    public int getArticleCount(String s_id, String r_info)
             throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql ="";
        int x=0;
        
 
      try {
            conn = getConnection();

            if(s_id.equals("root")){
                sql = "SELECT count(*) FROM reservation where r_info=?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, r_info);
            }else{ 
                sql = "SELECT count(*) FROM reservation where s_id=? and r_info=?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, s_id);
                pstmt.setString(2, r_info);
            }
            
            rs = pstmt.executeQuery();

            if (rs.next()) {
               x= rs.getInt(1);
			}
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
		return x;
    }

    public List<reservationDataBean>getSearchList(int start, int end, String s_id, String r_info ){ //검색기능
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<reservationDataBean> articleList=null;
 
        String sql = "";
 
      try {
            conn = getConnection();

            if(s_id.equals("root")){
                sql = "SELECT * FROM reservation where r_info=? limit ?,?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, r_info);
                pstmt.setInt(2, start-1);
                pstmt.setInt(3, end);
            }else{ 
                sql = "SELECT * FROM reservation where s_id=? and r_info=? limit ?,?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, s_id);
                pstmt.setString(2, r_info);
                pstmt.setInt(3, start-1);
                pstmt.setInt(4, end);
            }
            
            rs = pstmt.executeQuery();
 
            if (rs.next()) {
                articleList = new ArrayList<reservationDataBean>();
                do{
                    reservationDataBean article= new reservationDataBean();
                    article.setNumber(rs.getInt("number"));
                    article.setS_id(rs.getString("s_id"));
                    article.setB_id(rs.getInt("b_id"));
                    article.setStatus(rs.getString("status"));
                    article.setR_info(rs.getInt("r_info"));
                   
                    articleList.add(article);
                 }while(rs.next());
             }
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
         return articleList;
    }

    public int getRoundNum(){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int count = 0;

        String sql = "select max(r_info) from round";

        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            if(rs.next()){
                count=rs.getInt(1);
            }
 
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
        return count;
    }

    public String getBookName(int b_id){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String book_name = "";

        String sql = "select * from board where b_id=?";

        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, b_id);
            rs = pstmt.executeQuery();

            if(rs.next()){
                book_name=rs.getString("book_name");
            }
 
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
        return book_name;
    }

    public String getStartDate(String r_info){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String start_date = "";

        String sql = "select * from round where r_info=?";

        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, r_info);
            rs = pstmt.executeQuery();

            if(rs.next()){
                start_date=rs.getString("start_date");
            }
 
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
        return start_date;
    }

    public String getEndDate(String r_info){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String end_date = "";

        String sql = "select * from round where r_info=?";

        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, r_info);
            rs = pstmt.executeQuery();

            if(rs.next()){
                end_date=rs.getString("end_date");
            }
 
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
        return end_date;
    }

    public String getStatus(String r_info){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String status = "";

        String sql = "select * from round where r_info=?";

        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, r_info);
            rs = pstmt.executeQuery();

            if(rs.next()){
                status=rs.getString("status");
            }
 
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
        return status;
    }
}
