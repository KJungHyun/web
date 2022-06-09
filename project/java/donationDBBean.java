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

    public List<donationDataBean>getArticle(int start, int end, String s_id, String choice, String searchWord){ //해당 사용자의 데이터가져오기
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String select=null;
        List<donationDataBean> articleList=null;
 
      try {
            conn = getConnection();

            if (choice.equals("1")){
                select = "book_name";
            }else if(choice.equals("2")){
                select = "publisher";
            }else if(choice.equals("3")){
                select = "department_id";
                searchWord=getDeptNum(searchWord);
            }
            System.out.println(searchWord);

            String sql="";
            if(s_id.equals("root")){
                sql = "SELECT * from donation where "+select+" like '%"+ searchWord.trim() +"%' order by d_number desc limit ?, ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, start-1);
                pstmt.setInt(2, end);
            }else{
                sql = "SELECT * from donation where s_id=? and "+select+" like '%"+ searchWord.trim() +"%' order by d_number desc limit ?, ?";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, s_id);
                pstmt.setInt(2, start-1);
                pstmt.setInt(3, end);
            }

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

    public int getArticleCount(String s_id, String choice, String searchWord)
             throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String select=null;

        int x=0;
        String sql = "";

      try {
            conn = getConnection();

            if(choice.equals("1")){  //제목검색
                select="book_name";
            }else if(choice.equals("2")){    //출판사검색
                select="publisher";
            }else if(choice.equals("3")){  // 학과명
                select="department_id";
                searchWord=getDeptNum(searchWord);
            }
            System.out.println(searchWord);

            if(s_id.equals("root")){
                sql = "SELECT count(*) from donation where "+select+" like '%"+ searchWord.trim() +"%' order by d_number desc ";
                pstmt = conn.prepareStatement(sql);
            }else{
                sql = "SELECT count(*) from donation WHERE s_id=? and "+select+" LIKE '%"+searchWord.trim()+"%' order by d_number desc";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, s_id);
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

    public String getDeptName(int deptNum){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String deptName=null;

        String sql = "select * from department where department_id=?";

      try {
            conn = getConnection();
            pstmt=conn.prepareStatement(sql);
            pstmt.setInt(1, deptNum);
            rs=pstmt.executeQuery();
            if(rs.next()){
                deptName=rs.getString("d_name");
            }

        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }

        return deptName;
    }

    public String getDeptNum(String deptName){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String deptNum=null;

        String sql = "select * from department where d_name like '%"+deptName.trim()+"%' limit 1";

      try {
            conn = getConnection();
            pstmt=conn.prepareStatement(sql);
            rs=pstmt.executeQuery();
            if(rs.next()){
                deptNum=rs.getString("department_id");
            }

        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }

        return deptNum;
    }



    public void donationInsert(String s_id, String book_name, int book_num, String writer, String publisher, int dept, String date, String p_date, String status){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        String sql = "insert into donation (s_id, book_name, book_num, writer, publisher, date, department_id, p_date, status) values(?,?,?,?,?,?,?,?,?)";

        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, s_id);
            pstmt.setString(2, book_name);
            pstmt.setInt(3, book_num);
            pstmt.setString(4, writer);
            pstmt.setString(5, publisher);
            pstmt.setString(6, date);
            pstmt.setInt(7, dept);
            pstmt.setString(8, p_date);
            pstmt.setString(9, status);
            pstmt.executeUpdate();
            
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }

    }

    public void donationStatusUpdate(String d_number, String status){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String id="";
        String sql = "update donation set status=? WHERE d_number=?;";
        String sql2 = "select * from donation where d_number=?";
        
        String donation = "select * from donation_check where s_id=?";
        String donation2 = "update donation_check set r_increase=r_increase+1 where s_id=?";
        String donation3 = "update donation_check set r_aval=r_aval+1 where s_id=?";
        String donation4 = "update donation_check set r_increase=0 where s_id=?";

        try {
            conn = getConnection();
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, status);
            pstmt.setString(2, d_number);
            pstmt.executeUpdate();

            pstmt=conn.prepareStatement(sql2);
            pstmt.setString(1, d_number);
            rs=pstmt.executeQuery();
            if(rs.next()){
                id = rs.getString("s_id");
            }

            pstmt=conn.prepareStatement(donation2);
            pstmt.setString(1, id);
            pstmt.executeUpdate();

            pstmt=conn.prepareStatement(donation);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            if(rs.next()){
                int check = rs.getInt("r_increase");
                if(check==3){
                    pstmt=conn.prepareStatement(donation3);
                    pstmt.setString(1, id);
                    pstmt.executeUpdate();
                    
                    pstmt=conn.prepareStatement(donation4);
                    pstmt.setString(1, id);
                    pstmt.executeUpdate();

                }
            }
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
        
    }
}
