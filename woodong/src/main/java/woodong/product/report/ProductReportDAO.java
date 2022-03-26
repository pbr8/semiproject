package woodong.product.report;
import java.sql.*;
import java.util.*;

import woodong.bbs.BbsDTO;
public class ProductReportDAO {

	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	public ProductReportDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public int addReport(int pidx,int uidx,String rcontent) {
		try {
			conn=woodong.db.WoodongDB.getConn();
			
			String sql="select user_idx from sp_p_report where product_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, pidx);
			rs=ps.executeQuery();
			int count=0;
			if(!rs.next()) {
				sql="insert into sp_p_report values(sp_product_report_seq.nextval,?,?,?,sysdate)";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, pidx);
				ps.setInt(2, uidx);
				ps.setString(3, rcontent);
				count=ps.executeUpdate();
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
	
	
	
	/**물품 신고 전체 출력&검색 메서드*/
	public List<ProductReportDTO> productReportList(int cp, int ls, String selectVal, String searchVal) {
		try {
			
			conn = woodong.db.WoodongDB.getConn();
			
			int start = (cp - 1) * ls + 1;
			int end = cp * ls;
			
			String sql = "";
			
			if(selectVal==null) {
				sql = "select * from ( "
						+ "select rownum as rnum, a.* from ( "
						+ "select * "
						+ "from sp_p_report pr  "
						+ "left join sp_product sp on pr.product_idx = sp.product_idx  "
						+ "left join sp_user su on su.user_idx = pr.user_idx "
						+ "order by pr.p_report_idx desc) a) b  "
						+ "where rnum >= ? and rnum <= ? ";
				
				ps = conn.prepareStatement(sql);
				ps.setInt(1, start);
				ps.setInt(2, end);
			}else{
				if(selectVal.equals("product_idx")) {
					sql = "select * "
							+ "from sp_user su, sp_p_report pr, sp_product sp "
							+ "where su.user_idx = pr.user_idx and pr.product_idx = sp.product_idx and sp.product_idx = ?";
				}else {
					sql = "select * "
							+ "from sp_user su, sp_p_report pr, sp_product sp "
							+ "where su.user_idx = pr.user_idx and pr.product_idx = sp.product_idx and user_name = ?";
				}
				ps = conn.prepareStatement(sql);
				ps.setString(1, searchVal);
			}
			rs = ps.executeQuery();
				
			List<ProductReportDTO> list = new ArrayList<ProductReportDTO>();
			if(rs.next()) {
				do {
					int p_report_idx = rs.getInt("p_report_idx");
					int product_idx = rs.getInt("product_idx");
					int user_idx = rs.getInt("user_idx");
					String product_report_content = rs.getString("product_report_content");
					java.sql.Date product_report_reportdate = rs.getDate("product_report_reportdate");
					String product_subject = rs.getString("product_subject");
					String user_name = rs.getString("user_name");
					String user_nickname = rs.getString("user_nickname");
				
					list.add(new ProductReportDTO(p_report_idx, product_idx, user_idx, product_report_content, product_report_reportdate, product_subject, user_name, user_nickname));
					
				}while(rs.next());
				return list;
			}
			return null;
				
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}finally {
				try {
					if(rs != null) rs.close();
					if(ps != null) ps.close();
					if(conn != null) conn.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
	}
	
	/**등록된 신고글 수 구하는 메소드*/
	public int getTotalCnt() {
		try {
			conn = woodong.db.WoodongDB.getConn();
			String sql = "select count(*) from sp_p_report";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			rs.next();
			int count = rs.getInt(1);
			return count == 0 ? 1: count;
			
			
		} catch (Exception e) {
			e.printStackTrace();
			return 1;
		}finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) ps.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	/**선택한 회원 삭제*/
	public int bbs_report_delete(String[] ck_idx) {
		try {
			conn = woodong.db.WoodongDB.getConn();
			
			int count = 0;
			for(String idx : ck_idx) {
				String sql = "delete from sp_p_report where p_report_idx = ?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, idx);
				count += ps.executeUpdate();
			}
			return count;
			
		} catch (Exception e) {
			e.printStackTrace();
			return-1;
		}finally {
			try {
				if(ps != null) ps.close();
				if(conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
}


















