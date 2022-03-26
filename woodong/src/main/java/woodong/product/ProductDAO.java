package woodong.product;

import java.sql.*;


import java.util.ArrayList;
import java.util.List;
import java.io.*;
import com.oreilly.servlet.multipart.*;
import java.util.*;

public class ProductDAO {
	
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	public ProductDAO() {
		// TODO Auto-generated constructor stub
	}
	
	//물품 게시글 전체 출력&검색 출력
	public List<ProductDTO> productList(int cp, int ls, String selectVal, String searchVal){
		try {
			
		conn = woodong.db.WoodongDB.getConn();
		
		int start = (cp - 1) * ls + 1;
		int end = cp * ls;
		
		String sql = "";
		if(selectVal==null) {
			sql = "select * from "
					+ "(select rownum as rnum, a.* from "
					+ "(select sp.product_idx , sp.product_subject , "
					+ "sp.product_writedate,  "
					+ "sp.product_tel, sp.product_category, "
					+ "sp.product_price, sp.product_content, sp.product_readnum, sp.product_state, sp.user_idx, "
					+ "sp.product_img, su.user_name, su.user_nickname , su.user_addr  "
					+ "from sp_product sp "
					+ "left join sp_user su on sp.user_idx = su.user_idx order by sp.product_idx desc) a) b "
					+ "where rnum >= ? and rnum <= ?";
			
			ps = conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
		}else {
			if(selectVal.equals("user_nickname")) {
				sql = "select * from sp_user su, sp_product sp where su.user_idx = sp.user_idx and su.user_nickname = ?";
				
			}else {
				sql = "select * from sp_user su, sp_product sp where su.user_idx = sp.user_idx and sp.product_idx = ?";
			}
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, searchVal);
		}
		
		rs = ps.executeQuery();
			
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		if(rs.next()) {
			do {
				
				int product_idx = rs.getInt("product_idx");
				String product_subject = rs.getString("product_subject");
				String product_tel = rs.getString("product_tel");
				String product_category = rs.getString("product_category");
				int product_price = rs.getInt("product_price");
				String product_content = rs.getString("product_content");
				int product_readnum = rs.getInt("product_readnum");
				java.sql.Date writedate = rs.getDate("product_writedate");
				int product_state = rs.getInt("product_state");
				String product_img = rs.getString("product_img");
				int user_idx = rs.getInt("user_idx");
				String user_name = rs.getString("user_name");
				String user_nickname = rs.getString("user_nickname");
				String user_addr = rs.getString("user_addr");
				
				list.add(new ProductDTO(
						product_idx, product_subject, product_tel, product_category, product_price, product_content, product_readnum, writedate, product_state, 
						product_img, user_idx, user_name, user_nickname, user_addr));
				
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
	
	/**등록된 판매 글 수 구하는 메소드*/
	public int getTotalCnt() {
		try {
			conn = woodong.db.WoodongDB.getConn();
			String sql = "select count(*) from sp_product";
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
	
	/**물품 삭제 메서드*/
	public int product_delete(String[] ck_idx) {
		try {
			conn = woodong.db.WoodongDB.getConn();
			
			int count = 0;
			for(String idx : ck_idx) {
				String sql = "delete from sp_product where product_idx = ?";
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
	
	
	/**물품 상세 메서드*/
	public List<ProductDTO> product_report_detail(String product_idx) {
		try {
			conn = woodong.db.WoodongDB.getConn();
			
			String sql = "select * "
					+ "from sp_product sp, sp_user su "
					+ "where sp.user_idx = su.user_idx "
					+ "and product_idx = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, product_idx);
			rs = ps.executeQuery();
			
			List<ProductDTO> list = new ArrayList<ProductDTO>();
			
			if(rs.next()) {
				do {
					ProductDTO dto = new ProductDTO();
					dto.setProduct_idx(rs.getInt("product_idx")); 
					dto.setProduct_subject(rs.getString("product_subject")); 
					dto.setProduct_tel(rs.getString("product_tel")); 
					dto.setProduct_category(rs.getString("product_category")); 
					dto.setProduct_price(rs.getInt("product_price")); 
					dto.setProduct_content(rs.getString("product_content"));
					dto.setProduct_readnum(rs.getInt("product_readnum"));
					dto.setProduct_state(rs.getInt("product_state"));
					dto.setProduct_img(rs.getString("product_img"));
					dto.setUser_idx(rs.getInt("user_idx"));
					dto.setUser_nickname(rs.getString("user_nickname"));
					dto.setUser_name(rs.getString("user_name"));
					dto.setUser_addr(rs.getString("user_addr"));
					dto.setProduct_writedate(rs.getDate("product_writedate"));
					
					list.add(dto);
				}while(rs.next());
				return list;
			}else {
				return null;
			}
			
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
	
	/**찜 개수*/
	public int product_heart(String product_idx) {
		try {
			conn = woodong.db.WoodongDB.getConn();
			String sql = "select count(*) from sp_p_heart where product_idx = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, product_idx);
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
	
	/**user_idx가 가장 최근에 올린 판매글의 product_idx 추출*/
	public int mostRecentProductByUidx(int uidx) {
		try {
			conn=woodong.db.WoodongDB.getConn();
			String sql="select max(product_idx) from sp_product where user_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, uidx);
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
	
	/**판매 등록*/
	   public int productUpload(ProductDTO pdto) {
	      try {
	         conn=woodong.db.WoodongDB.getConn();
	         if(pdto.getProduct_img()==null) {
	            String sql="insert into sp_product values(sp_product_idx_seq.nextval,?,?,?,?,?,0,sysdate,1,?,'imgnone.jpg')";
	            ps=conn.prepareStatement(sql);
	            ps.setString(1, pdto.getProduct_subject());
	            ps.setString(2, pdto.getProduct_tel());
	            ps.setString(3, pdto.getProduct_category());
	            ps.setInt(4, pdto.getProduct_price());
	            ps.setString(5, pdto.getProduct_content());
	            ps.setInt(6, pdto.getUser_idx());
	         }else {
	            String sql="insert into sp_product values(sp_product_idx_seq.nextval,?,?,?,?,?,0,sysdate,1,?,?)";
	            ps=conn.prepareStatement(sql);
	            ps.setString(1, pdto.getProduct_subject());
	            ps.setString(2, pdto.getProduct_tel());
	            ps.setString(3, pdto.getProduct_category());
	            ps.setInt(4, pdto.getProduct_price());
	            ps.setString(5, pdto.getProduct_content());
	            ps.setInt(6, pdto.getUser_idx());
	            ps.setString(7, pdto.getProduct_img());
	         }
	         
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
	
	/**카테고리 리스트*/
	public ArrayList<ProductDTO> productList(String pCategory, int cp, int listSize){
		try {
			int start=(cp-1)*listSize+1;
			int end=cp*listSize;
			
			conn=woodong.db.WoodongDB.getConn();
			String sql="";
			if(pCategory.equals("전체")) {
				sql="select * from "
					+ "(select rownum as rnum, a.* from "
					+ "(select product_idx, product_img, product_subject, product_price, user_nickname, product_state "
					+ "from sp_product, sp_user "
					+ "where sp_product.user_idx=sp_user.user_idx "
					+ "order by product_state desc, product_idx desc) a order by product_state desc) b "
					+ "where rnum between ? and ?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, start);
				ps.setInt(2, end);
			}else {
				sql="select * from "
					+ "(select rownum as rnum, a.* from "
					+ "(select product_idx, product_img, product_subject, product_price, user_nickname, product_state "
					+ "from sp_product, sp_user "
					+ "where sp_product.user_idx=sp_user.user_idx and product_category=? "
					+ "order by product_state desc, product_idx desc) a order by product_state desc) b "
					+ "where rnum between ? and ?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, pCategory);
				ps.setInt(2, start);
				ps.setInt(3, end);
			}
			rs=ps.executeQuery();
			ArrayList<ProductDTO> arr=new ArrayList<ProductDTO>();
			while(rs.next()) {
				ProductDTO pdto=new ProductDTO();
				pdto.setProduct_idx(rs.getInt("product_idx"));
				pdto.setProduct_img(rs.getString("product_img"));
				pdto.setProduct_subject(rs.getString("product_subject"));
				pdto.setProduct_price(rs.getInt("product_price"));
				pdto.setUser_nickname(rs.getString("user_nickname"));
				pdto.setProduct_state(rs.getInt("product_state"));
				
				arr.add(pdto);
			}
			return arr;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
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
	
	/**상품 정보*/
	public ProductDTO productInfo(int pidx) {
		try {
			conn=woodong.db.WoodongDB.getConn();
			String sql="select sp_product.*, user_nickname, user_addr "
						+ "from sp_product left join sp_user "
						+ "on sp_product.user_idx=sp_user.user_idx "
						+ "where product_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, pidx);
			rs=ps.executeQuery();
			ProductDTO pdto=new ProductDTO();
			if(rs.next()) {
				pdto.setProduct_idx(rs.getInt("product_idx"));
				pdto.setProduct_subject(rs.getString("product_subject"));
				pdto.setProduct_tel(rs.getString("product_tel"));
				pdto.setProduct_category(rs.getString("product_category"));
				pdto.setProduct_price(rs.getInt("product_price"));
				pdto.setProduct_content(rs.getString("product_content"));
				pdto.setProduct_readnum(rs.getInt("product_readnum"));
				pdto.setProduct_writedate(rs.getDate("product_writedate"));
				pdto.setProduct_state(rs.getInt("product_state"));
				pdto.setUser_idx(rs.getInt("user_idx"));
				pdto.setProduct_img(rs.getString("product_img"));
				pdto.setUser_nickname(rs.getString("user_nickname"));
				pdto.setUser_addr(rs.getString("user_addr"));
				
			}
			return pdto;
					
		} catch (Exception e) {
			e.printStackTrace();
			return null;
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
	
	/**같은 판매자의 다른 상품 리스트*/
	public ArrayList<ProductDTO> ssopList(int seller_uidx, int pidx){
		try {
			
			conn=woodong.db.WoodongDB.getConn();
			String sql="select * from sp_product where user_idx=? and product_state=1 and product_idx<>?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, seller_uidx);
			ps.setInt(2, pidx);
			rs=ps.executeQuery();
			
			ArrayList<ProductDTO> arr=new ArrayList<ProductDTO>();
			while(rs.next()) {
				ProductDTO pdto=new ProductDTO();
				pdto.setProduct_idx(rs.getInt("product_idx"));
				pdto.setProduct_img(rs.getString("product_img"));
				pdto.setProduct_subject(rs.getString("product_subject"));
				
				arr.add(pdto);
			}
			return arr;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
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
	
	/**연관 상품 리스트*/
	public ArrayList<ProductDTO> lpList(String category,int pidx){
		try {
			
			conn=woodong.db.WoodongDB.getConn();
			String sql="select * from sp_product where product_category=? and product_state=1 and product_idx<>?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, category);
			ps.setInt(2, pidx);
			
			rs=ps.executeQuery();
			
			ArrayList<ProductDTO> arr=new ArrayList<ProductDTO>();
			while(rs.next()) {
				ProductDTO pdto=new ProductDTO();
				pdto.setProduct_idx(rs.getInt("product_idx"));
				pdto.setProduct_img(rs.getString("product_img"));
				pdto.setProduct_subject(rs.getString("product_subject"));
				
				arr.add(pdto);
			}
			return arr;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
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
	
	/**조회수 증가*/
	public void addProductInfoReadNum(int pidx) {
		try {
			conn=woodong.db.WoodongDB.getConn();
			String sql="update sp_product set product_readnum=product_readnum+1 where product_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, pidx);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	/**지난 시간*/
	public int passedTime(int pidx) {
		try {
			conn=woodong.db.WoodongDB.getConn();
			String sql="select round((sysdate-product_writedate)*24,0) "
					+ "from sp_product "
					+ "where product_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, pidx);
			rs=ps.executeQuery();
			int ptime=0;
			if(rs.next()) {
				ptime=rs.getInt(1);
			}
			return ptime;
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
	
	/**카테고리 리스트 총 판매글 수*/
	public int getTotalCnt(String pCategory) {
		try {
			conn=woodong.db.WoodongDB.getConn();
			String sql="select count(*) from sp_product where product_category=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, pCategory);
			rs=ps.executeQuery();
			rs.next();
			return rs.getInt(1)==0?1:rs.getInt(1);
			
		} catch (Exception e) {
			e.printStackTrace();
			return 1;
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
	
	/**내가 판매 중인 물품 총 갯수*/
	public int getMyTotalCnt(int uidx) {
		try {
			conn=woodong.db.WoodongDB.getConn();
			String sql="select count(*) from sp_product where user_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, uidx);
			rs=ps.executeQuery();
			rs.next();
			return rs.getInt(1)==0?1:rs.getInt(1);
			
		} catch (Exception e) {
			e.printStackTrace();
			return 1;
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
	
	/**판매 정보 수정*/
	public int productUpdate(ProductDTO pdto, String preimgName) {
		try {
			conn=woodong.db.WoodongDB.getConn();
			String sql="";
			if(pdto.getProduct_img()==null||pdto.getProduct_img().equals("")) {
				sql="update sp_product set product_subject=?, product_tel=?, product_category=?, product_price=?, product_content=? where product_idx=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, pdto.getProduct_subject());
				ps.setString(2, pdto.getProduct_tel());
				ps.setString(3, pdto.getProduct_category());
				ps.setInt(4, pdto.getProduct_price());
				ps.setString(5, pdto.getProduct_content());
				ps.setInt(6, pdto.getProduct_idx());
			}else {
				productInfoImgDelete(preimgName);
				sql="update sp_product set product_subject=?, product_tel=?, product_category=?, product_price=?, product_content=?, product_img=? where product_idx=?";
				ps=conn.prepareStatement(sql);
				ps.setString(1, pdto.getProduct_subject());
				ps.setString(2, pdto.getProduct_tel());
				ps.setString(3, pdto.getProduct_category());
				ps.setInt(4, pdto.getProduct_price());
				ps.setString(5, pdto.getProduct_content());
				ps.setString(6, pdto.getProduct_img());
				ps.setInt(7, pdto.getProduct_idx());
			}
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
	
	/**판매글 삭제시 저장된 이미지 파일 삭제*/
	public void productInfoImgDelete(String pimg) {
		String savepath="D:\\personalsemi\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\woodong\\product\\img\\productImg";
		File f=new File(savepath+"\\"+pimg);
		if(f.exists()) {
			f.delete();
		}
	}
	
	/**판매글 삭제*/
	public int productInfoDelete(int pidx) {
		try {
			conn=woodong.db.WoodongDB.getConn();
			String sql="delete from sp_product where product_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, pidx);
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
	
	public int soldout(int uidx, int pidx) {
		try {
			conn=woodong.db.WoodongDB.getConn();
			String sql="update sp_product set product_state=0 where product_idx=? and user_idx=?";
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
	
	public ArrayList<String> savedImgNames(){
		try {
			conn=woodong.db.WoodongDB.getConn();
			String sql="select product_img from sp_product";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			ArrayList<String> arr=new ArrayList<String>();
			if(rs.next()) {
				do {
					arr.add(rs.getString(1));
				}while(rs.next());
			}
			return arr;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
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
	
	/**키워드 검색 결과 리스트*/
	   public ArrayList<ProductDTO> main_Product_Search(String searchWord) {
	         
	         try {
	            conn = woodong.db.WoodongDB.getConn();
	            String sql = "select * from sp_product, sp_user where sp_product.user_idx=sp_user.user_idx and product_subject like ?";

	            ps = conn.prepareStatement(sql);
	            ps.setString(1, "%" + searchWord + "%");
	            rs = ps.executeQuery();
	               
	            
	            ArrayList<ProductDTO> search = new ArrayList<ProductDTO>();
	            
	            while (rs.next()) {
	               ProductDTO dto = new ProductDTO();
	               dto.setProduct_idx(rs.getInt("product_idx"));
	            dto.setProduct_img(rs.getString("product_img"));
	            dto.setProduct_subject(rs.getString("product_subject"));
	            dto.setProduct_price(rs.getInt("product_price"));
	            dto.setUser_nickname(rs.getString("user_nickname"));
	            dto.setProduct_state(rs.getInt("product_state"));
	            
	            search.add(dto);
	            }
	            return search;
	         } catch (Exception e) {
	            e.printStackTrace();
	            return null;
	         } finally {
	            try {
	               if (rs != null)
	                  rs.close();
	               if (ps != null)
	                  ps.close();
	               if (conn != null)
	                  conn.close();
	            } catch (Exception e) {
	               // TODO: handle exception
	            }
	         }

	      }
	
	/** 마이 페이지 찜목록 출력 메소드 */
	public ProductDTO[] my_Page_Zzim_List(int uidx) {
		try {

			conn = woodong.db.WoodongDB.getConn();

			String sql = "select * from " + "(select product_idx, product_img, user_nickname, user_addr, product_price "
					+ "from sp_product spp, sp_user spu "
					+ "where spp.user_idx=spu.user_idx) a, (select product_idx from sp_p_heart where user_idx=?) b "
					+ "where a.product_idx=b.product_idx ";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, uidx);
			rs = ps.executeQuery();

			Vector<ProductDTO> arr = new Vector<ProductDTO>();
			while (rs.next()) {
				int product_idx = rs.getInt("product_idx");
				String product_img = rs.getString("product_img");
				String user_nickname = rs.getString("user_nickname");
				String user_addr = rs.getString("user_addr");
				int product_price = rs.getInt("product_price");

				ProductDTO dto = new ProductDTO(product_idx, product_price, user_nickname, user_addr, product_img);
				arr.add(dto);
			}
			ProductDTO dtos[] = new ProductDTO[arr.size()];
			arr.copyInto(dtos);

			return dtos;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
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
	
	/** 판매 선택 삭제 */
	public int sell_list_delete(String[] sel) {
		try {
			conn = woodong.db.WoodongDB.getConn();

			int count = 0;
			for (int i = 0; i < sel.length; i++) {
				String sql = "delete from sp_product where product_idx =?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, sel[i]);
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
	
	/** 판매 완료 */
	public ProductDTO[] my_Page_Product_List_Stop(int uidx) {
		try {

			conn = woodong.db.WoodongDB.getConn();

			String sql = "select product_img, product_idx, product_price, user_addr, user_nickname "
					+ "from sp_product, sp_user " + "where sp_product.user_idx=sp_user.user_idx "
					+ "and sp_user.user_idx=? and product_state=0";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, uidx);
			rs = ps.executeQuery();

			Vector<ProductDTO> arr = new Vector<ProductDTO>();
			while (rs.next()) {
				String product_img = rs.getString("product_img");
				int product_idx = rs.getInt("product_idx");
				String user_nickname = rs.getString("user_nickname");
				String user_addr = rs.getString("user_addr");
				int product_price = rs.getInt("product_price");

				ProductDTO dto = new ProductDTO(product_idx, product_price, user_nickname, user_addr, product_img);
				arr.add(dto);
			}
			ProductDTO dtos[] = new ProductDTO[arr.size()];
			arr.copyInto(dtos);

			return dtos;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
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
	
	/** 마이 페이지 판매 목록 출력 */
	public ProductDTO[] my_Page_Product_List(int uidx) {
		try {

			conn = woodong.db.WoodongDB.getConn();

			String sql = "select product_img,product_idx, product_price, user_addr, user_nickname "
					+ "from sp_product, sp_user " + "where sp_product.user_idx=sp_user.user_idx "
					+ "and sp_user.user_idx=? and product_state=1";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, uidx);
			rs = ps.executeQuery();

			Vector<ProductDTO> arr = new Vector<ProductDTO>();
			while (rs.next()) {
				String product_img = rs.getString("product_img");
				int product_idx = rs.getInt("product_idx");
				String user_nickname = rs.getString("user_nickname");
				String user_addr = rs.getString("user_addr");
				int product_price = rs.getInt("product_price");

				ProductDTO dto = new ProductDTO(product_idx, product_price, user_nickname, user_addr, product_img);
				arr.add(dto);
			}
			ProductDTO dtos[] = new ProductDTO[arr.size()];
			arr.copyInto(dtos);

			return dtos;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
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
	
	/** 메인 화면 인기 물품 목록 */
	public ArrayList<ProductDTO> mainHotList() {
		try {
			conn = woodong.db.WoodongDB.getConn();
			String sql = "select * from " + "(select rownum as r_num, a.* from "
					+ "(select product_idx,product_img, product_subject, product_price, user_nickname "
					+ "from sp_product, sp_user " + "where sp_product.user_idx = sp_user.user_idx "
					+ "order by product_readnum desc) a) b " + "where r_num <= 8";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			ArrayList<ProductDTO> arr = new ArrayList<>();
			while (rs.next()) {
				ProductDTO dto = new ProductDTO();
				dto.setProduct_idx(rs.getInt("product_idx"));
				dto.setProduct_img(rs.getString("product_img"));
				dto.setProduct_subject(rs.getString("product_subject"));
				dto.setProduct_price(rs.getInt("product_price"));
				dto.setUser_nickname(rs.getString("user_nickname"));
				
				arr.add(dto);
			}
			return arr;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
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
	
	public ArrayList<ProductDTO> subView(){
		try {
			conn=woodong.db.WoodongDB.getConn();
			String sql="select * from sp_product,sp_user where sp_product.user_idx=sp_user.user_idx order by sp_product.product_readnum desc";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			ArrayList<ProductDTO> arr=new ArrayList<ProductDTO>();
			while(rs.next()) {
				ProductDTO dto=new ProductDTO();
				dto.setProduct_img(rs.getString("product_img"));
				dto.setProduct_subject(rs.getString("product_subject"));
				dto.setProduct_price(rs.getInt("product_price"));
				dto.setUser_nickname(rs.getString("user_nickname"));
				
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
	
	public ArrayList<ProductDTO> samesellerListPage(int uidx){
		try {
			conn=woodong.db.WoodongDB.getConn();
			String sql="select * from sp_product, sp_user where sp_product.user_idx=sp_user.user_idx and sp_product.user_idx=? order by product_state desc";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, uidx);
			rs=ps.executeQuery();
			ArrayList<ProductDTO> arr=new ArrayList<ProductDTO>();
			while(rs.next()) {
				ProductDTO pdto=new ProductDTO();
				pdto.setProduct_idx(rs.getInt("product_idx"));
				pdto.setProduct_subject(rs.getString("product_subject"));
				pdto.setProduct_price(rs.getInt("product_price"));
				pdto.setUser_nickname(rs.getString("user_nickname"));
				pdto.setProduct_state(rs.getInt("product_state"));
				pdto.setProduct_img(rs.getString("product_img"));
				
				arr.add(pdto);
			}
			return arr;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
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
	
}




















