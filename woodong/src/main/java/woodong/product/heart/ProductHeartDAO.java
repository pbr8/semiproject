package woodong.product.heart;

import java.sql.*;

public class ProductHeartDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public ProductHeartDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public int zzimCount(int pidx) {
		try {
			conn=woodong.db.WoodongDB.getConn();
			String sql="select count(*) from sp_p_heart where product_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, pidx);
			rs=ps.executeQuery();
			int count=0;
			if(rs.next()) {
				count=rs.getInt(1);
			}
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
	}
	/**찜 하기*/
	public int addZzim(int pidx, int uidx) {
		try {
			boolean result=didZzim(pidx, uidx);
			int count=0;
			if(!result) {
				conn=woodong.db.WoodongDB.getConn();
				String sql="insert into sp_p_heart values(SP_PRODUCT_HEART_SEQ.nextval,?,?)";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, pidx);
				ps.setInt(2, uidx);
				count=ps.executeUpdate();
			}
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	// **찜리스트 삭제*/
	public int jjim_list_delete(String[] sel, int uidx) {
		try {
			conn = woodong.db.WoodongDB.getConn();

			int count = 0;
			for (int i = 0; i < sel.length; i++) {
				String sql = "delete from sp_p_heart where product_idx =? and user_idx =?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, sel[i]);
				ps.setInt(2, uidx);
				count += ps.executeUpdate();
			}
			return count;
		} catch (Exception e) {
			return -1;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
		
	/**찜 여부*/
	public boolean didZzim(int pidx, int uidx) {
		try {
			conn=woodong.db.WoodongDB.getConn();
			String sql="select * from sp_p_heart where product_idx=? and user_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, pidx);
			ps.setInt(2, uidx);
			rs=ps.executeQuery();
			return rs.next();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	/**찜 취소*/
	public int cancleZzim(int pidx, int uidx) {
		try {
			conn=woodong.db.WoodongDB.getConn();
			String sql="delete from sp_p_heart where product_idx=? and user_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, pidx);
			ps.setInt(2, uidx);
			int count=ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
}
