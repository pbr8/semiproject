package woodong.report;


import java.sql.*;

public class ReportDAO {

private Connection conn;
private PreparedStatement ps;
private ResultSet rs;

public ReportDAO() {
	// TODO Auto-generated constructor stub
}
public int addReport(int bbs_idx,int user_idx,String rcontent) {
	try {
		conn=woodong.db.WoodongDB.getConn();
		
		String sql="select user_idx from sp_bbs_report where bbs_idx=?";
		ps=conn.prepareCall(sql);
		ps.setInt(1, bbs_idx);
		rs=ps.executeQuery();
		int count=0;
		if(!rs.next()) {
			sql="insert into sp_bbs_report values(sp_bbs_report_bbs_report_idx.nextval,?,?,?,sysdate)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, bbs_idx);
			ps.setInt(2, user_idx);
			ps.setString(3, rcontent);
			count=ps.executeUpdate();
		}
		return count;
	}catch(Exception e) {
		e.printStackTrace();
		return -1;
	}finally {
		try {
			if(rs!=null)rs.close();
			if(ps!=null)ps.close();
			if(conn!=null)conn.close();
		}catch(Exception e2) {}
	}
}
}
