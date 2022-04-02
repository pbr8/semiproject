package woodong.bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import woodong.product.ProductDTO;

public class BbsDAO {
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	public BbsDAO() {
		// TODO Auto-generated constructor stub
	}
	
	/**게시글 전체 출력 메서드*/
	public List<BbsDTO> bbsList(int cp, int ls, String selectVal, String searchVal) {
	      try {
	         
	         conn = woodong.db.WoodongDB.getConn();
	         
	         int start = (cp - 1) * ls + 1;
	         int end = cp * ls;
	         
	         String sql = "";
	         if(searchVal==null) {
	        	 
	            sql = "select * from ("
	                  + "select rownum as rnum, a.* from ("
	                  + "select * from sp_bbs ss left join sp_user su on ss.user_idx = su.user_idx "
	                  + "order by ss.bbs_admin desc, ss.bbs_ref desc, ss.bbs_step asc) a) b "
	                  + "where rnum >= ? and rnum <= ?";
	            
	            ps = conn.prepareStatement(sql);
	            ps.setInt(1, start);
	            ps.setInt(2, end);
	         }else {
	            if(selectVal.equals("bbs_idx")) {
	               sql = "select * "
	                     + "from sp_user su, sp_bbs ss "
	                     + "where su.user_idx = ss.user_idx and ss.bbs_idx = ? ";
	               
	               ps = conn.prepareStatement(sql);
	               ps.setString(1, searchVal);
	            }else {
	               sql = "select * from ("
	               		+ "select rownum as rnum, a.* from ("
	               		+ "select * from sp_bbs ss left join sp_user su on ss.user_idx = su.user_idx "
	               		+ "where su.user_nickname like '%"+searchVal+"%') a) b "
	               		+ "where rnum >= ? and rnum <= ?";
	               
	               ps = conn.prepareStatement(sql);
		           ps.setInt(1, start);
		           ps.setInt(2, end);
	            }
	         }
	         
	         rs = ps.executeQuery();
	            
	         List<BbsDTO> list = new ArrayList<BbsDTO>();
	         
	         if(rs.next()) {
	            do {
	            	
	               int bbs_idx = rs.getInt("bbs_idx");
	               String bbs_subject = rs.getString("bbs_subject");
	               String bbs_content = rs.getString("bbs_content");
	               int bbs_readnum = rs.getInt("bbs_readnum");
	               java.sql.Date bbs_writedate = rs.getDate("bbs_writedate");
	               int bbs_ref = rs.getInt("bbs_ref");
	               int bbs_lev = rs.getInt("bbs_lev");
	               int bbs_step = rs.getInt("bbs_step");
	               int bbs_admin = rs.getInt("bbs_admin");
	               int user_idx = rs.getInt("user_idx");
	               String user_nickname = rs.getString("user_nickname");
	            
	               
	               list.add(new BbsDTO(bbs_idx, bbs_subject, bbs_content, bbs_readnum, bbs_writedate, bbs_ref, bbs_lev, bbs_step, bbs_admin, user_idx, user_nickname));
	               
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
	
	/**검색 메서드*/
	
	/**등록된 판매 글 수 구하는 메소드*/
	public int getTotalCnt(String selectVal, String searchVal) {
		try {
			conn = woodong.db.WoodongDB.getConn();
			
			String sql = "";
			if(searchVal==null) {
				sql = "select count(*) from sp_bbs";
				ps = conn.prepareStatement(sql);
			}else {
				if(selectVal.equals("bbs_idx")) {
		               sql = "select count(*) "
		                     + "from sp_user su, sp_bbs ss "
		                     + "where su.user_idx = ss.user_idx and ss.bbs_idx = ? ";
		               
		               ps = conn.prepareStatement(sql);
		               ps.setString(1, searchVal);
		            }else {
		               sql = "select count(*) "
		                     + "from sp_user su, sp_bbs ss "
		                     + "where su.user_idx = ss.user_idx and su.user_nickname like '%"+searchVal+"%'";
		               
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
	
	/**게시글 삭제*/
	public int bbs_delete(String[] ck_idx) {
		try {
			conn = woodong.db.WoodongDB.getConn();
			
			int count = 0;
			for(String idx : ck_idx) {
				String sql = "delete from sp_bbs where bbs_idx = ?";
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
			
	/**게시글 상세 메서드*/
	public BbsDTO bbs_report_detail(String getBbs_idx) {
		try {
			conn = woodong.db.WoodongDB.getConn();
			
			String sql = "select * "
					+ "from sp_user su, sp_bbs bs "
					+ "where su.user_idx = bs.user_idx and bs.bbs_idx = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, getBbs_idx);
			rs = ps.executeQuery();
			BbsDTO dto = null;
			if(rs.next()) {
					
				int bbs_idx = rs.getInt("bbs_idx");
				String bbs_subject = rs.getString("bbs_subject");
				String bbs_content = rs.getString("bbs_content");
				int bbs_readnum = rs.getInt("bbs_readnum");
				java.sql.Date bbs_writedate = rs.getDate("bbs_writedate");
				int bbs_ref = rs.getInt("bbs_ref");
				int bbs_lev = rs.getInt("bbs_lev");
				int bbs_step = rs.getInt("bbs_step");
				int bbs_admin = rs.getInt("bbs_admin");
				int user_idx = rs.getInt("user_idx");
				String user_addr = rs.getString("user_addr");
				String user_name = rs.getString("user_name");
				String user_nickname = rs.getString("user_nickname");
				
				dto = new BbsDTO(bbs_idx, bbs_subject, bbs_content, bbs_readnum, bbs_writedate, bbs_ref, bbs_lev, bbs_step, bbs_admin, user_idx, user_nickname, user_addr, user_name);
			
			}
			return dto;
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
	
	/**좋아요 개수*/
	public int bbs_heart(String bbs_idx) {
		try {
			conn = woodong.db.WoodongDB.getConn();
			String sql = "select count(*) from sp_bbs_heart where bbs_idx = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, bbs_idx);
			rs = ps.executeQuery();
			
			rs.next();
			int count = rs.getInt(1);
			return count;
			
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
	
	/**ref 마지막 값 구하기 메서드*/ 
	public int getMaxRef() {
		try {
			
			String sql = "select max(bbs_ref) from sp_bbs";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			int ref = 0;
			if(rs.next()) {
				ref = rs.getInt(1);
			}
			return ref;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				//conn은 bbsWrite()로 돌아가면 써야 하기 때문에 닫으면 안 됨
				
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	/**글쓰기 관련 메서드*/
	public int adminBbsWrite(BbsDTO dto) {
		try {
			
			conn = woodong.db.WoodongDB.getConn();
			
			//conn을 호출하고 getMaxRef()를 호출하면 getMaxRef()에서 따로 conn을 호출 안 해도 사용 가능!
			int maxref = getMaxRef();
			
			String sql = "insert into sp_bbs values(sp_bbs_idx_seq.nextval, ?, ?, 0, sysdate, ?, 0 ,0 , 1, 1)";		//마지막에 관리자 user_idx값 집어넣기
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getBbs_subject());
			ps.setString(2, dto.getBbs_content());
			ps.setInt(3, maxref + 1);
			
			int count = ps.executeUpdate();
			return count;
			
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null) ps.close();
				if(conn!=null) ps.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	//글쓰기 메서드
		public int localbbsWrite(BbsDTO dto,int user_idx) {
			try {
				conn=woodong.db.WoodongDB.getConn();
				int maxref=localgetMaxRef();
				String sql="insert into sp_bbs values(sp_bbs_idx_seq.nextval,?,?,0,sysdate,?,0,0,0,?)";
				ps=conn.prepareStatement(sql);
				ps.setString(1, dto.getBbs_subject());
				ps.setString(2, dto.getBbs_content()==null?" ":dto.getBbs_content());
				ps.setInt(3, maxref+1);
				ps.setInt(4, user_idx);
				int count=ps.executeUpdate();
				return count;
			}catch(Exception e) {
				e.printStackTrace();
				return -1;
			}finally {
				try {
					if(ps!=null)ps.close();
					if(conn!=null)conn.close();
				}catch(Exception e2) {}
			}
		}
			
	//ref 마지막 구하는 메서드
		public int localgetMaxRef() {
			try {
				String sql="select max(bbs_ref) from sp_bbs";
				ps=conn.prepareStatement(sql);
				rs=ps.executeQuery();
				int ref=0;
				if(rs.next()) {
					ref=rs.getInt(1);
				}
				return ref;
			}catch(Exception e) {
				e.printStackTrace();
				return 0;
			}finally {
				try {
					if(rs!=null)rs.close();
					if(ps!=null)ps.close();
				}catch(Exception e2) {}
			}
		}
		//글쓰기 메서드
		public int bbsWrite(BbsDTO dto) {
			try {
				conn=woodong.db.WoodongDB.getConn();
				int maxref=localgetMaxRef();
				String sql="insert into sp_bbs values(sp_bbs_idx_seq.nextval,?,?,0,sysdate,?,0,0,0,2)";
				ps=conn.prepareStatement(sql);
				ps.setString(1, dto.getBbs_subject());
				ps.setString(2, dto.getBbs_content());
				ps.setInt(3, maxref+1);
				int count=ps.executeUpdate();
				return count;
			}catch(Exception e) {
				e.printStackTrace();
				return -1;
			}finally {
				try {
					if(ps!=null)ps.close();
					if(conn!=null)conn.close();
				}catch(Exception e2) {}
			}
		}
		//step 수정 메서드
		public void localUpdateStep(int ref,int step) {
			try {
				String sql="update sp_bbs set bbs_step=bbs_step+1 where bbs_ref=? and bbs_step>=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, ref);
				ps.setInt(2, step);
				ps.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(ps!=null)ps.close();
				}catch(Exception e2) {}
			}
		}
		//답변글 쓰는 메서드
		public int localBbsReWriter(BbsDTO dto,int user_idx) {
			try {
				conn=woodong.db.WoodongDB.getConn();
				localUpdateStep(dto.getBbs_ref(),dto.getBbs_step()+1);
				String sql="insert into sp_bbs values(sp_bbs_idx_seq.nextval,?,?,0,sysdate,?,?,?,0,?)";
				ps=conn.prepareStatement(sql);
				ps.setString(1, dto.getBbs_subject());
				ps.setString(2, dto.getBbs_content()==null?" ":dto.getBbs_content());
				ps.setInt(3, dto.getBbs_ref());
				ps.setInt(4, dto.getBbs_lev()+1);
				ps.setInt(5, dto.getBbs_step()+1);
				ps.setInt(6, user_idx);
				int count=ps.executeUpdate();
				return count;
			}catch(Exception e) {
				e.printStackTrace();
				return 0;
			}finally {
				try {
					if(ps!=null)ps.close();
					if(conn!=null)conn.close();
				}catch(Exception e2) {}
			}
		}
		//총 게시글 구하는 메서드
		public int localgetTotalCnt() {
			try {
				conn=woodong.db.WoodongDB.getConn();
				String sql="select count (*) from sp_bbs";
				ps=conn.prepareStatement(sql);
				rs=ps.executeQuery();
				rs.next();
				int count=rs.getInt(1);
				return count==0?1:count;
			}catch(Exception e) {
				e.printStackTrace();
				return 1;
			}finally {
				try {
					if(rs!=null)rs.close();
					if(ps!=null)ps.close();
					if(conn!=null)conn.close();
				}catch(Exception e2) {}
			}
		}
//		//목록 메소드
//		public ArrayList<BbsDTO> localbbsList(int cp,int ls,String selectVal,String searchVal){
//			try {
//				conn=woodong.db.WoodongDB.getConn();
//				
//				 int start=(cp-1)*ls+1;
//				 int end=cp*ls;
//				 
//				 String sql="";
//				 
//				 if(selectVal==null) {
//					 sql="select * from ("
//						 		+ "select rownum as rnum,a.* from ("
//						 		+ "select * from sp_bbs order by bbs_admin desc, bbs_ref desc, bbs_step asc) a) b where rnum>=? and rnum<=?";
//					 ps=conn.prepareStatement(sql);
//					 ps.setInt(1, start);
//					 ps.setInt(2, end);
//				 }else {
//					 sql = "select * from sp_bbs bs,sp_user su where su.user_idx=bs.useridx and su."+selectVal+"=?";
//					 ps=conn.prepareStatement(sql);
//					 ps.setString(1, searchVal);
//				 }
//				
//				 
//				 rs=ps.executeQuery();
//				 
//				 ArrayList<BbsDTO> arr=new ArrayList<BbsDTO>();
//				 while(rs.next()) {
//					 int idx=rs.getInt("bbs_idx");
//					 String subject=rs.getString("bbs_subject");
//					 String content=rs.getString("bbs_content");
//					 int readnum=rs.getInt("bbs_readnum");
//					 java.sql.Date writedate=rs.getDate("bbs_writedate");
//					 int ref=rs.getInt("bbs_ref");
//					 int lev=rs.getInt("bbs_lev");
//					 int step=rs.getInt("bbs_step");
//					 int admin=rs.getInt("bbs_admin");
//					 int user_idx=rs.getInt("user_idx");
//					 
//					 BbsDTO dto=new BbsDTO(idx, subject, content, readnum, writedate, ref, lev, step, admin, user_idx);
//					 arr.add(dto);
//				 }
//				 return arr;
//			}catch(Exception e) {
//				e.printStackTrace();
//				return null;
//			}finally {
//				try {
//					if(rs!=null)rs.close();
//					if(ps!=null)ps.close();
//					if(conn!=null)conn.close();
//				}catch(Exception e2) {}
//			}
//		}
		//본문(content) 보기 메서드
		public BbsDTO bbsContent(int idx) {
			try {
				conn=woodong.db.WoodongDB.getConn();
				String sql="select * from sp_bbs where bbs_idx=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, idx);
				rs=ps.executeQuery();
				BbsDTO dto=null;
				if(rs.next()) {
					String subject=rs.getString("bbs_subject");
					String content=rs.getString("bbs_content");
					int readnum=rs.getInt("bbs_readnum");
					java.sql.Date writedate=rs.getDate("bbs_writedate");
					int ref=rs.getInt("bbs_ref");
					int lev=rs.getInt("bbs_lev");
					int step=rs.getInt("bbs_step");
					int admin=rs.getInt("bbs_admin");
					int user_idx=rs.getInt("user_idx");
					
					dto=new BbsDTO(idx, subject, content, readnum, writedate, ref, lev, step, admin, user_idx);	
				}
				return dto;
			}catch (Exception e) {
				e.printStackTrace();
				return null;
			}finally {
				try {
					if(rs!=null)rs.close();
					if(ps!=null)ps.close();
					if(conn!=null)conn.close();
				}catch(Exception e2) {}
			}
		}
		//게시글 삭제 메서드
		public int bbsDelete(BbsDTO dto) {
			try {
				conn=woodong.db.WoodongDB.getConn();
				String sql="delete from sp_bbs where bbs_idx=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, dto.getBbs_idx());
				int count=ps.executeUpdate();
				return count;
			}catch(Exception e) {
				e.printStackTrace();
				return -1;
			}finally {
				try {
					if(ps!=null)ps.close();
					if(conn!=null)conn.close();
				}catch(Exception e2) {}
			}
		}
		//게시글 수정 메서드
		public int bbsUpdate(BbsDTO dto) {
			try {
				conn=woodong.db.WoodongDB.getConn();
				String sql="update sp_bbs set bbs_subject=?, bbs_content=? where bbs_idx=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, dto.getBbs_subject());
				ps.setString(2, dto.getBbs_content()==null?" ":dto.getBbs_content());
				ps.setInt(3, dto.getBbs_idx());
				int count=ps.executeUpdate();
				return count;
			}catch(Exception e) {
				e.printStackTrace();
				return -1;
			}finally {
				try {
					if(ps!=null)ps.close();
					if(conn!=null)conn.close();
				}catch(Exception e2) {}
			}
		}
		//조회수 메서드
		public int bbsReadNum(BbsDTO dto) {
			try {
				conn=woodong.db.WoodongDB.getConn();
				String sql="update sp_bbs set bbs_readnum=? where bbs_idx=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, dto.getBbs_readnum()+1);
				ps.setInt(2, dto.getBbs_idx());
				int count=ps.executeUpdate();
				return count;
			}catch(Exception e) {
				e.printStackTrace();
				return -1;
			}finally {
				try {
					if(ps!=null)ps.close();
					if(conn!=null)conn.close();
				}catch(Exception e2) {}
			}
		}
		//인기글 메서드
		public ArrayList<BbsDTO> readnumList(){
			try {
				conn=woodong.db.WoodongDB.getConn();
				String sql="select * from ("
				 		+ "select rownum as rnum,a.* from ("
				 		+ "select * from sp_bbs order by bbs_readnum desc) a) b where rnum>=1 and rnum<=5";
					ps=conn.prepareStatement(sql);
					rs=ps.executeQuery();
					 ArrayList<BbsDTO> arr=new ArrayList<BbsDTO>();
					while(rs.next()) {
					 int idx=rs.getInt("bbs_idx");
					 String subject=rs.getString("bbs_subject");
					 String content=rs.getString("bbs_content");
					 int readnum=rs.getInt("bbs_readnum");
					 java.sql.Date writedate=rs.getDate("bbs_writedate");
					 int ref=rs.getInt("bbs_ref");
					 int lev=rs.getInt("bbs_lev");
					 int step=rs.getInt("bbs_step");
					 int admin=rs.getInt("bbs_admin");
					 int user_idx=rs.getInt("user_idx");
					 
					 BbsDTO dto=new BbsDTO(idx, subject, content, readnum, writedate, ref, lev, step, admin, user_idx);
					 arr.add(dto);
				 }
				 return arr;
			}catch(Exception e) {
				e.printStackTrace();
				return null;
			}finally {
				try {
					if(rs!=null)rs.close();
					if(ps!=null)ps.close();
					if(conn!=null)conn.close();
				}catch(Exception e2) {}
			}
		}
	
}









