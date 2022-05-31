package project.java.book;

import java.sql.*;
import java.util.*;
import javax.naming.*;
import javax.sql.DataSource;

public class roundDBBean {
    private static roundDBBean instance = new roundDBBean();
	
	public static roundDBBean getInstance() {
		return instance;
	}
	
	private roundDBBean() {}

    private Connection getConnection() throws Exception {
        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource)envCtx.lookup("jdbc/ysu_project");
        return ds.getConnection();
    }

    public int getArticleCount(String r_info)
             throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql ="";
        int x=0;
 
      try {
            conn = getConnection();
            if(r_info.equals("all")){
                sql = "select count(*) from round";
                pstmt = conn.prepareStatement(sql);
            }else{
                sql = "select count(*) from round where r_info=?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, r_info);
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

    public List<roundDataBean>getSearchList(String r_info){ //검색기능
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<roundDataBean> articleList=null;
 
        String sql = "";
 
      try {
            conn = getConnection();
            if(r_info.equals("all")){
                sql = "select * from round";
                pstmt = conn.prepareStatement(sql);
            }else{
                sql = "select * from round where r_info=?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, r_info);
            }
            
            rs = pstmt.executeQuery();
 
            if (rs.next()) {
                articleList = new ArrayList<roundDataBean>();
                do{
                    roundDataBean article= new roundDataBean();
                    article.setR_info(rs.getInt("r_info"));
                    article.setStart_date("start_date");
                    article.setEnd_date("end_date");
                    article.setStatus(rs.getString("status"));
                   
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
}
