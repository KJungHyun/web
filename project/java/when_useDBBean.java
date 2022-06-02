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

    public List<when_useDataBean>getUsedList(String year, String grade, String semester) throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<when_useDataBean> articleList=null;
        try{
        conn = getConnection();
        String sql = "SELECT * FROM when_use WHERE use_date = ? and grade = ? and semester = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, year);
        pstmt.setString(2, grade);
        pstmt.setString(3, semester);

        rs = pstmt.executeQuery();

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


if (s_idCnt<=bookCnt){
    sql="select DISTINCT(s_id)from reservation where b_id=? and r_info=?";
    pstmt=conn.prepareStatement(sql);
    pstmt.setInt(1, bookId);
    pstmt.setString(2, r_info);
    rs=pstmt.executeQuery();
    while(rs.next()){
        winId = rs.getString(1);
        book_name = getB_idForBookName(bookId);
        reservationWinIdUpdate(bookId, winId, "T");
        System.out.println("1..처리중.. : " + book_name);
    }
    bookStockUpdate(book_name, s_idCnt);
    System.out.println("신청자보다 재고가 많아서 바로 처리됨 : "+bookId);
}else{
    System.out.println("신청자보다 재고가 적어서 처리중 : "+bookId);
    sql="select * from reservation where b_id=? and r_info=?";
    pstmt=conn.prepareStatement(sql);
    pstmt.setInt(1, bookId);
    pstmt.setString(2, r_info);
    rs=pstmt.executeQuery();

    while(rs.next()){
        ids.add(rs.getString("s_id"));
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