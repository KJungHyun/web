package t_ch13.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDBBean {
	
    private static BoardDBBean instance = new BoardDBBean();
    //.jsp페이지에서 DB연동빈인 BoardDBBean클래스의 메소드에 접근시 필요
    public static BoardDBBean getInstance() {
        return instance;
    }
    
    private BoardDBBean() {}
    
    //커넥션풀로부터 Connection객체를 얻어냄
    private Connection getConnection() throws Exception {
        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource)envCtx.lookup("jdbc/ysu");
        return ds.getConnection();
    }
 
    //board테이블에 글을 추가(inset문)<=writePro.jsp페이지에서 사용
    public void insertArticle(BoardDataBean article) 
            throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
		ResultSet rs = null;
        ResultSet crs = null;

		int num=article.getNum();
		int ref=article.getRef();
		int re_step=article.getRe_step();
		int re_level=article.getRe_level();
		int number=0;
        String sql="";

        try {
            conn = getConnection();

            pstmt = conn.prepareStatement("select max(num) from t_board");
			rs = pstmt.executeQuery();
			
			if (rs.next())
		      number=rs.getInt(1)+1;
		    else
		      number=1; 
		   
		    if (num!=0) {  
		      sql="update t_board set re_step=re_step+1 ";
		      sql += "where ref= ? and re_step> ?";
              pstmt = conn.prepareStatement(sql);
              pstmt.setInt(1, ref);
			  pstmt.setInt(2, re_step);
			  pstmt.executeUpdate();
			  re_step=re_step+1;
			  re_level=re_level+1;
		     }else{
		  	  ref=number;
			  re_step=0;
			  re_level=0;
		     }	 
            // 쿼리를 작성
            sql = "insert into t_board(id,subject,reg_date,";
		    sql+="ref,re_step,re_level,content,ip) values(?,?,?,?,?,?,?,?)";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, article.getId());
            pstmt.setString(2, article.getSubject());
			pstmt.setTimestamp(3, article.getReg_date());
            pstmt.setInt(4, ref);
            pstmt.setInt(5, re_step);
            pstmt.setInt(6, re_level);
			pstmt.setString(7, article.getContent());
			pstmt.setString(8, article.getIp());
            pstmt.executeUpdate();

            pstmt=conn.prepareStatement("select * from t_board order by num desc LIMIT 1");
            rs=pstmt.executeQuery();

            if(rs.next()){
                sql="select * from t_cafe_member where id=?";

                pstmt=conn.prepareStatement(sql);
                pstmt.setString(1, rs.getString("id"));
                crs = pstmt.executeQuery();

                if(crs.next()){
                    String grade = crs.getString("grade");
                    if (grade.equals("Admin") || grade.equals("Manager") ) {
                        sql="insert into t_board_notice (num, id, notice) values(?,?,?)";
                        pstmt=conn.prepareStatement(sql);
                        pstmt.setInt(1, rs.getInt("num"));
                        pstmt.setString(2, article.getId());
                        pstmt.setString(3, article.getNotice());
                        pstmt.executeUpdate();
                    }
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
    
    //board테이블에 저장된 전체글의 수를 얻어냄(select문)<=list.jsp에서 사용
	public int getArticleCount()
             throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        int x=0;

        try {
            conn = getConnection();
            
            pstmt = conn.prepareStatement("select count(*) from t_board");
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

    public int getArticleUserCount(String id)
             throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        int x=0;

        try {
            conn = getConnection();
            
            pstmt = conn.prepareStatement("select count(*) from t_board where id=?");
            pstmt.setString(1, id);
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

    public int getArticleNoticeCount(String id)
             throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        int x=0;

        try {
            conn = getConnection();
            
            pstmt = conn.prepareStatement("select count(*) from t_board_notice where notice=?");
            pstmt.setString(1, "T");
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

	//글의 목록(복수개의 글)을 가져옴(select문) <=list.jsp에서 사용
	public List<BoardDataBean> getArticles(int start, int end)
             throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<BoardDataBean> articleList=null;
        try {
            conn = getConnection();
            
            pstmt = conn.prepareStatement(
            	"select * from t_board order by ref desc, re_step asc limit ?,? ");
            pstmt.setInt(1, start-1);
			pstmt.setInt(2, end);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                articleList = new ArrayList<BoardDataBean>(end);
                do{
                  BoardDataBean article= new BoardDataBean();
				  article.setNum(rs.getInt("num"));
				  article.setId(rs.getString("id"));
                  article.setSubject(rs.getString("subject"));
			      article.setReg_date(rs.getTimestamp("reg_date"));
				  article.setReadcount(rs.getInt("readcount"));
                  article.setRef(rs.getInt("ref"));
                  article.setRe_step(rs.getInt("re_step"));
				  article.setRe_level(rs.getInt("re_level"));
                  article.setContent(rs.getString("content"));
			      article.setIp(rs.getString("ip")); 
				  
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

    public List<BoardDataBean> getArticles(int start, int end, String id)
             throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        List<BoardDataBean> articleList=null;
        try {
            conn = getConnection();
            
            pstmt = conn.prepareStatement(
            	"select * from t_board where id=? order by ref desc, re_step asc limit ?,?");
            pstmt.setString(1, id);
            pstmt.setInt(2, start-1);
			pstmt.setInt(3, end);
            
            rs = pstmt.executeQuery();

            if (rs.next()) {
                articleList = new ArrayList<BoardDataBean>(end);
                do{
                  BoardDataBean article= new BoardDataBean();
				  article.setNum(rs.getInt("num"));
				  article.setId(rs.getString("id"));
                  article.setSubject(rs.getString("subject"));
			      article.setReg_date(rs.getTimestamp("reg_date"));
				  article.setReadcount(rs.getInt("readcount"));
                  article.setRef(rs.getInt("ref"));
                  article.setRe_step(rs.getInt("re_step"));
				  article.setRe_level(rs.getInt("re_level"));
                  article.setContent(rs.getString("content"));
			      article.setIp(rs.getString("ip")); 
				  
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
 
	//글의 내용을 보기(1개의 글)(select문)<=content.jsp페이지에서 사용
	public BoardDataBean getArticle(int num)
            throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        BoardDataBean article=null;
        try {
            conn = getConnection();

            pstmt = conn.prepareStatement(
            	"update t_board set readcount=readcount+1 where num = ?");
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

            pstmt = conn.prepareStatement(
            	"select * from t_board where num = ?");
            pstmt.setInt(1, num);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                article = new BoardDataBean();
                article.setNum(rs.getInt("num"));
				article.setId(rs.getString("id"));
                article.setSubject(rs.getString("subject"));
			    article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadcount(rs.getInt("readcount"));
                article.setRef(rs.getInt("ref"));
                article.setRe_step(rs.getInt("re_step"));
				article.setRe_level(rs.getInt("re_level"));
                article.setContent(rs.getString("content"));
			    article.setIp(rs.getString("ip"));
			}
            
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
		return article;
    }
    
	//글 수정폼에서 사용할 글의 내용(1개의 글)(select문)<=updateForm.jsp에서 사용
    public BoardDataBean updateGetArticle(int num)
          throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        BoardDataBean article=null;
        try {
            conn = getConnection();

            pstmt = conn.prepareStatement(
            	"select * from t_board where num = ?");
            pstmt.setInt(1, num);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                article = new BoardDataBean();
                article.setNum(rs.getInt("num"));
				article.setId(rs.getString("id"));
                article.setSubject(rs.getString("subject"));
			    article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadcount(rs.getInt("readcount"));
                article.setRef(rs.getInt("ref"));
                article.setRe_step(rs.getInt("re_step"));
				article.setRe_level(rs.getInt("re_level"));
                article.setContent(rs.getString("content"));
			    article.setIp(rs.getString("ip"));     
			}

            pstmt = conn.prepareStatement(
            	"select * from t_board_notice where num = ?");
            pstmt.setInt(1, num);
            rs = pstmt.executeQuery();
            if(rs.next()){
                article.setNotice("notice");
            }

        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
		return article;
    }

    //글 수정처리에서 사용(update문)<=updatePro.jsp에서 사용
    public int updateArticle(BoardDataBean article)
          throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs= null;

        String dbid="";
        String sql="";
		int x=-1;
        try {
            conn = getConnection();
            
			pstmt = conn.prepareStatement(
            	"select id from t_board where num = ?");
            pstmt.setInt(1, article.getNum());
            rs = pstmt.executeQuery();
            
			if(rs.next()){
			  dbid= rs.getString("id"); 
			  if(dbid.equals(article.getId())){
                sql="update t_board set subject=?";
			    sql+=",content=? where num=?";
                pstmt = conn.prepareStatement(sql);

                pstmt.setString(1, article.getSubject());
                pstmt.setString(2, article.getContent());
			    pstmt.setInt(3, article.getNum());
                pstmt.executeUpdate();

                sql="update t_board_notice set notice=? where num=?";
                pstmt=conn.prepareStatement(sql);
                pstmt.setString(1, article.getNotice());
                pstmt.setInt(2, article.getNum());
                pstmt.executeUpdate();

				x= 1;
			  }else{
				x= 0;
			  }
			}

            String notice=article.getNotice();
            sql="update t_board_notice set notice=? where num=?";
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, article.getNotice());
            pstmt.setInt(2, article.getNum());
            pstmt.executeUpdate();
            
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }
		return x;
    }
    
    //글삭제처리시 사용(delete문)<=deletePro.jsp페이지에서 사용
    public int deleteArticle(int num, String id)
        throws Exception {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs= null;
        String dbid="";
        int x=-1;
        try {
			conn = getConnection();

            pstmt = conn.prepareStatement(
            	"select id from t_board where num = ?");
            pstmt.setInt(1, num);
            rs = pstmt.executeQuery();
            
			if(rs.next()){
				dbid= rs.getString("id"); 
				if(dbid.equals(id) || id.equals("root")){
					pstmt = conn.prepareStatement(
            	      "delete from t_board where num=?");
                    pstmt.setInt(1, num);
                    pstmt.executeUpdate();
					x= 1; //글삭제 성공
				}else
					x= 0; //비밀번호 틀림
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

}