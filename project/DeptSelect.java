package project;

import java.sql.*;
import java.util.*;
import javax.naming.*;
import javax.sql.DataSource;

public class DeptSelect {

    private Connection getConnection() throws Exception {
        Context initCtx = new InitialContext();
        Context envCtx = (Context) initCtx.lookup("java:comp/env");
        DataSource ds = (DataSource)envCtx.lookup("jdbc/ysu_project");
        return ds.getConnection();
    }

    public ArrayList<Integer> getDept(int num) throws Exception{
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        ArrayList<Integer> deptId= new ArrayList<Integer>();
        int id = 0;
        String sql = "select * from department";

        try {
            conn = getConnection();
            
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while(rs.next()){
                id = rs.getInt("department_id");
                deptId.add(id);
            }
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }

        return deptId;
    } 

    public String dbtest() throws Exception{
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "select * from department";
        String name= "안됨";

        try {
            conn = getConnection();
            
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            name="됨";

            while(rs.next()){
                name = rs.getString("d_name");
            }
        } catch(Exception ex) {
            ex.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch(SQLException ex) {}
            if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
            if (conn != null) try { conn.close(); } catch(SQLException ex) {}
        }

        return name;
    } 
    public String test(){
        return "test1";
    }
}
