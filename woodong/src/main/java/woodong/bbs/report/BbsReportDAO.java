package woodong.bbs.report;
import java.sql.*;
import java.util.*;

import woodong.bbs.BbsDTO;
public class BbsReportDAO {

	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	public BbsReportDAO() {
		// TODO Auto-generated constructor stub
	}
	
	/**게시글 신고 전체 출력 메서드 and 검색한 신고글 출력*/
	   public List<BbsReportDTO> bbsReportList(int cp, int ls, String selectVal, String searchVal) {
	      try {
	         
	         conn = woodong.db.WoodongDB.getConn();
	         
	         int start = (cp - 1) * ls + 1;
	         int end = cp * ls;
	         String sql = "";
	         
	         if(searchVal==null) {
	            sql = "select * from ( "
	                  + "select rownum as rnum, a.* from ( "
	                  + "select * "
	                  + "from sp_bbs_report br  "
	                  + "left join sp_bbs bs on br.bbs_idx = bs.bbs_idx  "
	                  + "left join sp_user su on su.user_idx = br.user_idx "
	                  + "order by br.bbs_report_idx desc) a) b  "
	                  + "where rnum >= ? and rnum <= ? ";
	            
	            ps = conn.prepareStatement(sql);
	            ps.setInt(1, start);
	            ps.setInt(2, end);
	         }else {
	            if(selectVal.equals("bbs_idx")) {
	               sql = "select *  "
	                     + "from sp_user su, sp_bbs_report br, sp_bbs bs "
	                     + "where su.user_idx = br.user_idx and br.bbs_idx = bs.bbs_idx and bs.bbs_idx = ?";
	               
	               ps = conn.prepareStatement(sql);
	               ps.setString(1, searchVal);
	            }else {
	               sql = "select * from ( "
	 	                  + "select rownum as rnum, a.* from ( "
		                  + "select * "
		                  + "from sp_bbs_report br  "
		                  + "left join sp_bbs bs on br.bbs_idx = bs.bbs_idx  "
		                  + "left join sp_user su on su.user_idx = br.user_idx "
		                  + "where su.user_name like '%"+searchVal+"%') a) b  "
		                  + "where rnum >= ? and rnum <= ? ";
	               
	               ps = conn.prepareStatement(sql);
		           ps.setInt(1, start);
		           ps.setInt(2, end);
	            }
	         }

	         rs = ps.executeQuery();
	            
	         List<BbsReportDTO> list = new ArrayList<BbsReportDTO>();
	         if(rs.next()) {
	            do {
	               int bbs_report_idx = rs.getInt("bbs_report_idx");
	               int bbs_idx = rs.getInt("bbs_idx");
	               int user_idx = rs.getInt("user_idx");
	               String bbs_report_content = rs.getString("bbs_report_content");
	               java.sql.Date bbs_report_reportdate = rs.getDate("bbs_report_reportdate");
	               String bbs_subject = rs.getString("bbs_subject");
	               String user_name = rs.getString("user_name");
	               String user_nickname = rs.getString("user_nickname");
	               
	               list.add(new BbsReportDTO(bbs_report_idx, bbs_idx, user_idx, bbs_report_content, bbs_report_reportdate, bbs_subject, user_name, user_nickname));
	               
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
	public int getTotalCnt(String selectVal, String searchVal) {
		try {
			conn = woodong.db.WoodongDB.getConn();
			
			String sql = "";
			if(searchVal==null) {
				sql = "select count(*) from sp_bbs_report";
				ps = conn.prepareStatement(sql);
			}else {
				if(selectVal.equals("bbs_idx")) {
		               sql = "select count(*)  "
		                     + "from sp_user su, sp_bbs_report br, sp_bbs bs "
		                     + "where su.user_idx = br.user_idx and br.bbs_idx = bs.bbs_idx and bs.bbs_idx = ?";
		               
		               ps = conn.prepareStatement(sql);
		               ps.setString(1, searchVal);
		            }else {
		               sql = "select count(*) "
		                     + "from sp_user su, sp_bbs_report br, sp_bbs bs "
		                     + "where su.user_idx = br.user_idx and br.bbs_idx = bs.bbs_idx and su.user_name like '%"+searchVal+"%'";
		               ps = conn.prepareStatement(sql);
		            }
			}
			
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
				String sql = "delete from sp_bbs_report where bbs_report_idx = ?";
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


















