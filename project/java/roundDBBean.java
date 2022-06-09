package project.java.book;

import java.sql.*;
import java.util.*;
import javax.naming.*;
import javax.sql.DataSource;
import javax.swing.plaf.synth.SynthStyleFactory;

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

    public String getRoundStartDate(String r_info){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql ="select start_date from round where r_info=?";
        String start_date = "";
 
      try {
            conn = getConnection();
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, r_info);
            rs = pstmt.executeQuery();

            if (rs.next()) {
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

    public String getRoundEndDate(String r_info){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql ="select end_date from round where r_info=?";
        String end_date = "";
 
      try {
            conn = getConnection();
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, r_info);
            rs = pstmt.executeQuery();

            if (rs.next()) {
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

    public List<roundDataBean>getSearchList(int start, int end, String r_info){ //검색기능
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<roundDataBean> articleList=null;
 
        String sql = "";
 
      try {
            conn = getConnection();
            if(r_info.equals("all")){
                sql="select * from round order by r_info desc limit ?,? ";
                pstmt=conn.prepareStatement(sql);
                pstmt.setInt(1, start-1);
                pstmt.setInt(2, end);
            }else{
                sql="select * from round where r_info=? order by r_info desc limit ?,?";
                pstmt=conn.prepareStatement(sql);
                pstmt.setString(1, r_info);
                pstmt.setInt(2, start-1);
                pstmt.setInt(3, end);
            }
            
            rs = pstmt.executeQuery();
 
            if (rs.next()) {
                articleList = new ArrayList<roundDataBean>();
                do{
                    roundDataBean article= new roundDataBean();
                    article.setR_info(rs.getInt("r_info"));
                    article.setStart_date(rs.getTimestamp("start_date"));
                    article.setEnd_date(rs.getTimestamp("end_date"));
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

    public String getRoundNum(){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String r_info = "";

        String sql = "select max(r_info) from round";

        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            if(rs.next()){
                r_info=rs.getString(1);
            }
 
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
        return r_info;
    }

    public void setDateUpdate(String r_info, String end_date){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "UPDATE round SET end_date=? WHERE r_info=?";


        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, end_date);
            pstmt.setString(2, r_info);
            pstmt.executeUpdate();
 
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
    }

    public void roundInsert(String r_info, String start_date, String end_date){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "insert into round(r_info, start_date, end_date, status) values(?,?,?,?)";

        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, r_info);
            pstmt.setString(2, start_date);
            pstmt.setString(3, end_date);
            pstmt.setString(4, "T");
            pstmt.executeUpdate();
 
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
    }

    public void reservationDraw(String r_info){ // 당첨자 추첨
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        PreparedStatement pstmt2 = null;
        ResultSet rs2 = null;
        int s_idCnt = 0;
        int bookCnt = 0;    
        int bookId = 0;
        int cnt=0;
        String book_name = "";
        String winId = "";
        String loseId = "";
        Random rn = new Random();
        List<String> ids = new ArrayList<String>();

        System.out.println("진입했습니다.");
        String sql = "select DISTINCT(b_id) from reservation where r_info=? and status=?";


        try {
            System.out.println("pstmt실행");
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, r_info);
            pstmt.setString(2, "P");
            rs=pstmt.executeQuery();

            while(rs.next()){
                System.out.println("예약 정보");
                bookId = rs.getInt(1);
                s_idCnt=reservationIdCount(bookId, r_info);
                bookCnt=reservationBookCount(bookId);
                System.out.println("r_info : "+r_info);
                System.out.println("b_id : "+bookId);
                System.out.println("신청자 수 : "+s_idCnt+"명");
                System.out.println("책 재고 : "+bookCnt);
                if (s_idCnt<=bookCnt){
                    sql="select DISTINCT(s_id)from reservation where b_id=? and r_info=?";
                    pstmt2=conn.prepareStatement(sql);
                    pstmt2.setInt(1, bookId);
                    pstmt2.setString(2, r_info);
                    rs2=pstmt2.executeQuery();
                    while(rs2.next()){
                        winId = rs2.getString(1);
                        book_name = getB_idForBookName(bookId);
                        reservationWinIdUpdate(bookId, winId, "T");
                        System.out.println("1..처리중.. : " + book_name);
                    }
                    bookStockUpdate(book_name, s_idCnt);
                    System.out.println("신청자보다 재고가 많아서 바로 처리됨 : "+bookId);
                }else{
                    System.out.println("신청자보다 재고가 적어서 처리중 : "+bookId);
                    sql="select * from reservation where b_id=? and r_info=?";
                    pstmt2=conn.prepareStatement(sql);
                    pstmt2.setInt(1, bookId);
                    pstmt2.setString(2, r_info);
                    rs2=pstmt2.executeQuery();

                    while(rs2.next()){
                        ids.add(rs2.getString("s_id"));
                    }
                    System.out.println("-----------------------------");
                    System.out.println("리스트에 id 추가 완료");
                    System.out.println(ids);
                    for(int i=0; i < bookCnt; i++){
                        cnt = 0;
                        winId = ids.get(rn.nextInt(ids.size()));
                        System.out.println("추첨중.... : "+winId);
                        for(int j=0; j < ids.size(); j++){
                            if(ids.get(j).equals(winId)){
                                cnt++;
                            }
                        }
                        for(int j=0; j < cnt; j++){
                            ids.remove(winId);
                        }
                        System.out.println("삭제완료.... : "+winId);
                        reservationWinIdUpdate(bookId, winId, "T");
                    }
                    book_name = getB_idForBookName(bookId);
                    bookStockUpdate(book_name, s_idCnt);
                    System.out.println(ids);
                    System.out.println("-----------------------------");
                    System.out.println("예약 횟수 반환중.....");
                    for(int i=0; i < ids.size(); i++){
                        cnt = 1;
                        loseId = ids.get(i);
                        reservationWinIdUpdate(bookId, loseId, "F");
                        donationCheckReturn(loseId, cnt);
                    }
                    System.out.println("반환 완료.");
                }
                System.out.println("여긴 옴?");
            }
            roundStatusUpdate(r_info, "F");

 
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }

    }

    public int reservationIdCount(int b_id, String r_info){ // 해당 게시판 책의 신청자 수
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int s_idCnt = 0;

        String sql = "select count(DISTINCT(s_id)) from reservation where b_id=? and status=? and r_info=?";


        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, b_id);
            pstmt.setString(2, "P");
            pstmt.setString(3, r_info);
            rs=pstmt.executeQuery();

            if(rs.next()){
                s_idCnt=rs.getInt(1);
            }

 
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
        return s_idCnt;
    }

    public int reservationBookCount(int b_id){ // 해당 게시판 책의 재고량
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int bookCnt = 0;

        String sql = "select count(board.book_name) from board, donation where board.b_id=? and board.book_name=donation.book_name and donation.status=?";

        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, b_id);
            pstmt.setString(2, "P");
            rs=pstmt.executeQuery();
            

            if(rs.next()){
                bookCnt=rs.getInt(1);
            }

 
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
        return bookCnt;
    }

    public String getB_idForBookName(int b_id){ // 게시판 번호를 통해 책 이름 반환
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String book_name = "";

        String sql = "select book_name from board where b_id=?";

        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, b_id);
            rs=pstmt.executeQuery();

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

    public void bookStockUpdate(String book_name, int s_idCnt){ // 책 재고 감소
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "update donation set status='T' where status='P' and book_name=? limit ?";

        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, book_name);
            pstmt.setInt(2, s_idCnt);
            pstmt.executeUpdate();

        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
    }

    public void reservationWinIdUpdate(int b_id, String Winid, String status){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "update reservation set status=? where s_id=? and b_id=?";

        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, status);
            pstmt.setString(2, Winid);
            pstmt.setInt(3, b_id);
            pstmt.executeUpdate();
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
    }

    public void donationCheckReturn(String s_id, int cnt){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "update donation_check set r_aval=r_aval+"+cnt+" where s_id=?";

        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, s_id);
            pstmt.executeUpdate();
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
    }

    public void roundStatusUpdate(String r_info, String status){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "update round set status=? where r_info=?";

        try {
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, status);
            pstmt.setString(2, r_info);
            pstmt.executeUpdate();
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
    }
    
    public String getRoundStatus(String r_info){
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs= null;
        String status="";
        String sql = "select * from round where r_info=?";

        try{
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, r_info);
            rs=pstmt.executeQuery();
            if(rs.next()){
                status = rs.getString("status");
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
