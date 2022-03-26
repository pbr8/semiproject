package woodong.heart;

import java.sql.*;

public class HeartDAO {

private Connection conn;
private PreparedStatement ps;
private ResultSet rs;

public HeartDAO() {
	// TODO Auto-generated constructor stub
}
public int heartCount(int bbs_idx) {
	try {
		conn=woodong.db.WoodongDB.getConn();
		String sql="select count(*) from sp_bbs_heart where bbs_idx=?";
		ps=conn.prepareStatement(sql);
		ps.setInt(1, bbs_idx);
		rs=ps.executeQuery();
		int count=0;
		if(rs.next()) {
			count=rs.getInt(1);
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
public int addHeart(int bbs_idx,int user_idx) {
	try {
		conn=woodong.db.WoodongDB.getConn();
		String sql="select user_idx from sp_bbs_heart where bbs_idx=?";
		ps=conn.prepareStatement(sql);
		ps.setInt(1, bbs_idx);
		rs=ps.executeQuery();
		int count=0;
		if(!rs.next()) {
			sql="insert into sp_bbs_heart values(sp_bbs_heart_bbs_heart_idx.nextval,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, bbs_idx);
			ps.setInt(2, user_idx);
			count=ps.executeUpdate();
		}
		return count;
	}catch(Exception e) {
		e.printStackTrace();
		return -1;
	}finally {
		try {
			if(rs!=null)ps.close();
			if(ps!=null)rs.close();
			if(conn!=null)conn.close();
		}catch(Exception e2) {}
	}
}
}
