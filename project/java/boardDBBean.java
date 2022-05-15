package project.java.book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

	//board 목록
	public List<boardDataBean> getBoard(int start, int end)
             throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<boardDataBean> boardList=null;
        try {
            conn = getConnection();
            
            pstmt = conn.prepareStatement("select * from board limit ?,? ");
            pstmt.setInt(1, start-1);
			pstmt.setInt(2, end);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                boardList = new ArrayList<boardDataBean>(end);
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
}