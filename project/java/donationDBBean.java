package project.java.book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class donationDBBean {
    private static donationDBBean instance = new donationDBBean();
	
	public static donationDBBean getInstance() {
		return instance;
	}
	
	private donationDBBean() {}
	
	private Connection getConnection() throws Exception {
        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource)envCtx.lookup("jdbc/ysu_project");
        return ds.getConnection();
    }

    public List<donationDataBean>getArticle(String s_id){ //검색기능
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<donationDataBean> articleList=null;
 
        String sql = "SELECT * from donation where s_id=?";
 
      try {
            conn = getConnection();
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, s_id);
            rs = pstmt.executeQuery();
 
            if (rs.next()) {
                articleList = new ArrayList<donationDataBean>();
                do{
                    donationDataBean article= new donationDataBean();
                    article.setD_number(rs.getInt("d_number"));
                    article.setS_id(rs.getString("s_id"));
                    article.setBook_name(rs.getString("book_name"));
                    article.setBook_num(rs.getInt("book_num"));
                    article.setWriter(rs.getString("writer"));
                    article.setPublisher(rs.getString("publisher"));
                    article.setDate(rs.getTimestamp("date"));
                    article.setDepartment_id(rs.getInt("department_id"));
                    article.setP_date(rs.getTimestamp("p_date"));
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
}
