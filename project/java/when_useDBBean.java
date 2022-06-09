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

    public List<when_useDataBean>getUsedList(String year, String dept_no, String grade, String semester) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<when_useDataBean> articleList=null;
        try{
        conn = getConnection();
        String sql = "SELECT * FROM when_use WHERE use_date = ? and department_id LIKE ? and grade = ? and semester = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, year);
        pstmt.setString(2, "%"+dept_no+"%");
        pstmt.setString(3, grade);
        pstmt.setString(4, semester);

        rs = pstmt.executeQuery();

        if (rs.next()) {
               articleList = new ArrayList<when_useDataBean>();
               do{
                  when_useDataBean article= new when_useDataBean();
				  article.setId(rs.getInt("id"));
                  article.setBook_name(rs.getString("book_name"));
                  article.setDepartment_id(rs.getInt("department_id"));
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