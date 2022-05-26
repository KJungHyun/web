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



public class when_useDBBean {
	
	private static when_useDBBean instance = new when_useDBBean();
	
	public static when_useDBBean getInstance() {
		return instance;
	}
	
	private when_useDBBean() {}
	
	private Connection getConnection() throws Exception {
        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource)envCtx.lookup("jdbc/ysu_project");
        return ds.getConnection();
    }

    public List<when_useDataBean>getArticle() throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<when_useDataBean> articleList=null;

        try{
            conn = getConnection();
            pstmt = conn.prepareStatement("select * from when_use");
            rs=pstmt.executeQuery();

            if (rs.next()) {
               articleList = new ArrayList<when_useDataBean>();
               do{
                  when_useDataBean article= new when_useDataBean();
				  article.setId(rs.getInt("id"));
                  article.setBookname(rs.getString("bookname"));
                  article.setUse_date(rs.getShort("use_date"));
			      article.setGrade(rs.getString("grade"));
				  article.setSemester(rs.getString("semester"));
                  article.setProf_name(rs.getString("prof_name"));
                  article.setClass_name(rs.getString("class_name"));
                  
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
    //검색기능
    public List<when_useDataBean>getSearchList(int choice, String searchWord) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<when_useDataBean> articleList=null;

        String sql = "SELECT * FROM when_use";
        String sqlWord = "";

        
        switch(choice){
            case 1://책제목 검색
                sqlWord=" WHERE bookname LIKE '%"+searchWord+"%'";
                break;
            case 2://사용년도검색
                sqlWord=" WHERE use_date LIKE '%"+searchWord+"%'";
                break;
            case 3://학년검색
                sqlWord=" WHERE grade LIKE '%"+searchWord+"%'";
                break;    
            case 4://학년1학기검색
                sqlWord=" WHERE semester = 1 && grade LIKE '%"+searchWord+"%'";
                break;
            case 5://학년2학기검색
                sqlWord=" WHERE semester = 2 && grade LIKE '%"+searchWord+"%'";
                break;
            case 6://교수명검색
                sqlWord=" WHERE prof_name LIKE '%"+searchWord+"%'";
                break;
            case 7://수업명검색
                sqlWord=" WHERE class_name LIKE '%"+searchWord+"%'";
                break;    
        }
        sql = sql + sqlWord;
        try{
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            rs=pstmt.executeQuery();

            if (rs.next()) {
               articleList = new ArrayList<when_useDataBean>();
               do{
                  when_useDataBean article= new when_useDataBean();
				  article.setId(rs.getInt("id"));
                  article.setBookname(rs.getString("bookname"));
                  article.setUse_date(rs.getShort("use_date"));
			      article.setGrade(rs.getString("grade"));
				  article.setSemester(rs.getString("semester"));
                  article.setProf_name(rs.getString("prof_name"));
                  article.setClass_name(rs.getString("class_name"));
                  
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
