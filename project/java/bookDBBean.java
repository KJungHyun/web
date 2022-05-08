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

public class bookDBBean {
	
	private static bookDBBean instance = new bookDBBean();
	
	public static bookDBBean getInstance() {
		return instance;
	}
	
	private bookDBBean() {}
	
	private Connection getConnection() throws Exception {
        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource)envCtx.lookup("jdbc/ysu_project");
        return ds.getConnection();
    }

    public int getArticleCount(String choice, String searchWord)
             throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        int x=0;
        String sql = "SELECT count(*) FROM book";
        String sqlWord = "";

        if(choice.equals("1")){  //제목검색
            sqlWord=" WHERE book_name LIKE '%"+searchWord.trim()+"%'";
        }else if(choice.equals("2")){    //출판사검색
            sqlWord=" WHERE writer LIKE '%"+searchWord.trim()+"%'";
        }
        sql = sql + sqlWord;
 
      try {
            conn = getConnection();
            
            pstmt = conn.prepareStatement(sql);
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

   public List<bookDataBean>getSearchList(int start, int end, String choice, String searchWord){ //검색기능
       Connection conn = null;
       PreparedStatement pstmt = null;
       ResultSet rs = null;
       List<bookDataBean> articleList=null;

       String sql = "SELECT * FROM book";
       String sqlWord = "";
       if(choice.equals("1")){  //제목검색
           sqlWord=" WHERE book_name LIKE '%"+searchWord.trim()+"%' limit ?,?";
       }else if(choice.equals("2")){    //출판사검색
           sqlWord=" WHERE writer LIKE '%"+searchWord.trim()+"%' limit ?,?";
       }
       sql = sql + sqlWord;

     try {
           conn = getConnection();
           
           pstmt = conn.prepareStatement(sql);
           pstmt.setInt(1, start-1);
           pstmt.setInt(2, end);
           rs = pstmt.executeQuery();

           if (rs.next()) {
               articleList = new ArrayList<bookDataBean>();
               do{
                 bookDataBean article= new bookDataBean();
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

   public HashMap<Integer,String> getDept(){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        HashMap<Integer,String> map = new HashMap<Integer, String>();

        String sql = "select * from department";

        try {
            conn = getConnection();
            
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            while(rs.next()){
                map.put(rs.getInt("department_id"), rs.getString("d_name"));
            }
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
       

        return map;
    }

    public int dept2(){
        return 2;
    }
   
}