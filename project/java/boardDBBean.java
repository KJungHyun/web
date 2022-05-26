package project.java.book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class boardDBBean{
    private static boardDBBean instance = new boardDBBean();

    public static boardDBBean getInstance(){
        return instance;
    }
    
    private boardDBBean(){}

    private Connection getConnection() throws Exception {   //커넥션풀
        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource)envCtx.lookup("jdbc/ysu_project");
        return ds.getConnection();
    }

   //board테이블 카운팅
	public int getBoardCount(String choice, String searchWord)
             throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        int x=0;
        String sql = "select count(*) from board";
        String sqlWord = "";
        
        if(choice.equals("1")){  //제목검색
            sqlWord=" WHERE book_name LIKE '%"+searchWord.trim()+"%'";
        }else if(choice.equals("2")){    //출판사검색
            sqlWord=", book WHERE board.book_name=book.book_name and publisher like'%"+searchWord.trim()+"%'";
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

    //검색기능
    public List<boardDataBean>getBoardSearch(int start, int end, String choice, String searchWord){ 
       Connection conn = null;
       PreparedStatement pstmt = null;
       ResultSet rs = null;
       List<boardDataBean> boardList=null;

       String sql = "SELECT * FROM board";
       String sqlWord = "";
       if(choice.equals("1")){  //제목검색
           sqlWord=" WHERE book_name LIKE '%"+searchWord.trim()+"%' limit ?,?";
       }else if(choice.equals("2")){    //출판사검색
           sqlWord=", book WHERE board.book_name=book.book_name and publisher like'%"+searchWord.trim()+"%' limit ?,?";
       }
       sql = sql + sqlWord;
      
     try {
           conn = getConnection();
           
           pstmt = conn.prepareStatement(sql);
           pstmt.setInt(1, start-1);
           pstmt.setInt(2, end);
           rs = pstmt.executeQuery();

           if (rs.next()) {
               boardList = new ArrayList<boardDataBean>();
               do{
                  boardDataBean board= new boardDataBean();
				  board.setB_id(rs.getInt("b_id"));
                  board.setBook_name(rs.getString("book_name"));

                  boardList.add(board);
			    }while(rs.next());
			}
       } catch(Exception ex) {
           ex.printStackTrace();
       } finally {
           if (rs != null) try { rs.close(); } catch(SQLException ex) {}
           if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
           if (conn != null) try { conn.close(); } catch(SQLException ex) {}
       }
		return boardList;
   }

   public int getBoardDeptCount(int dept){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int cnt = 0;
        
        String sql = "select count(*) from board, book where board.book_name=book.book_name and book.department_id=?";
        try {
            conn = getConnection();
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, dept);
            rs = pstmt.executeQuery();

            if(rs.next()){
                cnt=rs.getInt(1);
            }
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
        return cnt;
   }

   public List<boardDataBean>getBoardDeptSearch(int start, int end, int dept){ 
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    List<boardDataBean> boardList=null;

    String sql = "select b_id, board.book_name from board, book where board.book_name=book.book_name and book.department_id=? limit ?,?";
   
  try {
        conn = getConnection();
        
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, dept);
        pstmt.setInt(2, start-1);
        pstmt.setInt(3, end);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            boardList = new ArrayList<boardDataBean>();
            do{
               boardDataBean board= new boardDataBean();
               board.setB_id(rs.getInt("b_id"));
               board.setBook_name(rs.getString("book_name"));

               boardList.add(board);
             }while(rs.next());
         }
    } catch(Exception ex) {
        ex.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch(SQLException ex) {}
        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
    }
     return boardList;
}

   public bookDataBean getBoardDetail(String book_name)
             throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        bookDataBean book=new bookDataBean();

        String sql ="select * from book where book_name=?";
        try {
            conn = getConnection();
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, book_name);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                book.setBook_name(rs.getString("book_name"));
                book.setWriter(rs.getString("writer"));
                book.setPublisher(rs.getString("publisher"));
			    book.setDate(rs.getTimestamp("date"));
				book.setDepartment_id(rs.getInt("department_id"));
			}
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
		return book;
    }

    public boolean getBookCheck(String book_name)
             throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        boolean check = false;

        String sql ="select * from board where book_name=?";
        try {
            conn = getConnection();
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, book_name);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                check=true;
			}
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
		return check;
    }

    //board테이블에 책추가
    public void insertBoard(String book_name)
        throws Exception {
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            
            String sql = "insert into board(book_name) values(?)";

            try{
                conn = getConnection();
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, book_name);

                pstmt.executeUpdate();
            } catch(Exception ex) {
                ex.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch(SQLException ex) {}
                if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
                if (conn != null) try { conn.close(); } catch(SQLException ex) {}
            }
    }

    //board테이블 책삭제
    public void deleteBoard(String book_name)
        throws Exception {
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs= null;
            
            String sql = "delete from board where book_name=?";
            try{
                conn = getConnection();
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1,book_name);
                
                pstmt.executeUpdate();
            } catch(Exception ex) {
                ex.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch(SQLException ex) {}
                if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
                if (conn != null) try { conn.close(); } catch(SQLException ex) {}
            }
    }

    public int getBookCount(String book_name) throws Exception{
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs= null;
        int cnt = 0;

        String sql = "select count(*) from donation where status=? and book_name=?";
        

        try{
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "T");
            pstmt.setString(2,book_name);
            
            rs = pstmt.executeQuery();

            if (rs.next()) {
                cnt = rs.getInt(1);
             }
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }

        return cnt;
    }

    public int getRound() throws Exception{
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs= null;
        int round=0;

        String sql = "";
        

        try{
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }

        return 1;
    }

    public int getResCount(int b_id, int r_info) throws Exception{
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs= null;
        int cnt = 0;

        String sql = "select count(DISTINCT(s_id)) from reservation where b_id=? and r_info=? and status=?;";
        

        try{
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, b_id);
            pstmt.setInt(2, r_info);
            pstmt.setString(3, "F");
            
            rs = pstmt.executeQuery();

            if (rs.next()) {
                cnt = rs.getInt(1);
             }
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }

        return cnt;
    }

    public int getDonationCount(String id){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs= null;
        int cnt=0;
        String donation_count = "select * from donation_check where s_id=?";

        try{
            conn = getConnection();
            pstmt = conn.prepareStatement(donation_count);
            pstmt.setString(1, id);
            rs=pstmt.executeQuery();
            if(rs.next()){
                cnt = rs.getInt("r_aval");
            }
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }

        return cnt;
    }

    public ArrayList<String> getReservationList(String id, int r_info){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs= null;
        ArrayList<String> bookList= new ArrayList<>();

        String sql = "select * from board where b_id=?";
        String reservation = "select * from reservation where s_id=? and r_info=?";

        try{
            conn = getConnection();
            pstmt = conn.prepareStatement(reservation);
            pstmt.setString(1, id);
            pstmt.setInt(2, r_info);
            rs=pstmt.executeQuery();
            while(rs.next()){
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1,rs.getInt("b_id"));
                rs=pstmt.executeQuery();
                if(rs.next()){
                    bookList.add(rs.getString("book_name"));
                }
            }
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }

        return bookList;
    }

    public boolean getDonationCheck(String id){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs= null;
        boolean check = false;
        String donation_check = "select * from donation_check where s_id=?";

        try{
            conn = getConnection();
            pstmt = conn.prepareStatement(donation_check);
            pstmt.setString(1, id);
            rs=pstmt.executeQuery();
            if(rs.next()){
                int r_aval = rs.getInt("r_aval");

                if (r_aval!=0 && r_aval>0){
                    check=true;
                }
            }
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }

        return check;
    }

    public void reservationInsert(String id, int b_id, int r_info) throws Exception{
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs= null;
        String status = "F";
        String sql = "insert into reservation (s_id, b_id, status, r_info) values(?,?,?,?)";

        try{
            conn = getConnection();
            boolean check = getDonationCheck(id);
            if(check){
                String update_sql = "update donation_check set r_aval=r_aval-1 where s_id=?";
                pstmt=conn.prepareStatement(update_sql);
                pstmt.setString(1, id);
                pstmt.executeUpdate();

                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, id);
                pstmt.setInt(2,b_id);
                pstmt.setString(3, status);
                pstmt.setInt(4, r_info);
                pstmt.executeUpdate();
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