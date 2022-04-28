package project.book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BookDBBean {
	
	private static BookDBBean instance = new BookDBBean();
	
	public static BookDBBean getInstance() {
		return instance;
	}
	
	private BookDBBean() {}
	
	private Connection getConnection() throws Exception {
        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource)envCtx.lookup("jdbc/ysu_project");
        return ds.getConnection();
    }
	
	public List<BookDataBean> getArticles(int department_id)
            throws Exception {
       Connection conn = null;
       PreparedStatement pstmt = null;
       ResultSet rs = null;
       List<BookDataBean> articleList=null;
       try {
           conn = getConnection();
           
           pstmt = conn.prepareStatement(
           	"select * from book where department_id = ?");
           pstmt.setInt(1, department_id);
           rs = pstmt.executeQuery();

           if (rs.next()) {
               articleList = new ArrayList<BookDataBean>();
               do{
                 BookDataBean article= new BookDataBean();
				  article.setBook_name(rs.getString("book_name"));
                 article.setWriter(rs.getString("writer"));
                 article.setPublisher(rs.getString("publisher"));
			      article.setDate(rs.getTimestamp("date"));
				  article.setDepartment_id(rs.getInt("department_id"));
                 
				  
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