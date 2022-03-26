package woodong.user;

import java.sql.*;

import java.util.ArrayList;
import java.util.*;

public class UserDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public UserDAO() {}
	
	/**유저 아이디로 유저idx 구하기*/
	public int findUserIdxByUserId(String userid) {
		try {
			conn=woodong.db.WoodongDB.getConn();
			String sql="select user_idx from sp_user where user_id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs=ps.executeQuery();
			int user_idx=0;
			if(rs.next()) {
				user_idx=rs.getInt("user_idx");
			}
			
			return user_idx;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
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
	
	/**유저 아이디로 유저 정보 구하기*/
	public UserDTO findUserInfoByUserId(String userid) {
		try {
			conn=woodong.db.WoodongDB.getConn();
			String sql="select * from sp_user where user_id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs=ps.executeQuery();
			
			UserDTO udto=new UserDTO();
			if(rs.next()) {
				udto.setUser_idx(rs.getInt("user_idx"));
				udto.setUser_id(userid);
				udto.setUser_pwd(rs.getString("user_pwd"));
				udto.setUser_name(rs.getString("user_name"));
				udto.setUser_resident_num(rs.getString("user_resident_num"));
				udto.setUser_nickname(rs.getString("user_nickname"));
				udto.setUser_email(rs.getString("user_email"));
				udto.setUser_addr(rs.getString("user_addr"));
				udto.setUser_joindate(rs.getDate("user_joindate"));
			}
			
			return udto;
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
	
	
	
	
	/**회원 가입 메서드*/
	
	public int userJoin(UserDTO dto,String addr2,String email2) {
		try {
			conn=woodong.db.WoodongDB.getConn();
			String sql="insert into sp_user values(user_idx_seq.nextval,?,?,?,?,?,?,?,sysdate)";
			ps=conn.prepareStatement(sql);
			String user_addr=dto.getUser_addr()+" "+addr2;
			String user_email=dto.getUser_email()+email2;
			
			
			ps.setString(1, dto.getUser_id());
			ps.setString(2, dto.getUser_pwd());
			ps.setString(3, dto.getUser_name());
			ps.setString(4, dto.getUser_resident_num());
			ps.setString(5, dto.getUser_nickname());
			ps.setString(6, user_email);
			ps.setString(7, user_addr);
			int count=ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
	}
	
	/**아이디 중복 검사 메서드*/
	
	public boolean user_IdCheck(String user_id) {
		try {
			conn=woodong.db.WoodongDB.getConn();
			String sql="select user_id from sp_user where user_id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, user_id);
			rs=ps.executeQuery();
			return rs.next();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();	
			} catch (Exception e2) {
				e2.printStackTrace();
			}

		}
	}
	
	/*별명 중복 검사 메서드**/
	
	public boolean user_NicknameCheck(String user_nickname) {
		try {
			conn=woodong.db.WoodongDB.getConn();
			String sql="select user_nickname from sp_user where user_nickname=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, user_nickname);
			rs=ps.executeQuery();
			return rs.next();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();	
			} catch (Exception e2) {
				e2.printStackTrace();
			}

		}
	}
	
	/*로그인 확인 메서드**/
	
	public boolean loginCheck(String user_id,String user_pwd) {
		try {
			conn=woodong.db.WoodongDB.getConn();
			String sql="select user_pwd from sp_user where user_id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, user_id);
			rs=ps.executeQuery();
			boolean result=false;
			
			if(rs.next()) {
				String pwd=rs.getString(1);
				if(pwd.equals(user_pwd)) {
					result=true;
				}
			}
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	/*유저 이름 가져오기 메서드**/
	
	public String getUserName(String user_id) {
		try {
			conn=woodong.db.WoodongDB.getConn();
			String sql="select user_name from sp_user where user_id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, user_id);
			rs=ps.executeQuery();
			rs.next();
			return rs.getString(1);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	
	/*아이디 찾기 메서드**/
	
	public String findUserId(String user_name,String user_resident_num,String user_email) {
		try {
			conn=woodong.db.WoodongDB.getConn();
			String sql="select user_name,user_resident_num,user_email,user_id from sp_user where user_resident_num=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, user_resident_num);
			rs=ps.executeQuery();
			String user_id="";
			while(rs.next()) {
				String name=rs.getString("user_name");
				String resident_num=rs.getString("user_resident_num");
				String email=rs.getString("user_email");
				String id=rs.getString("user_id");
				
				if(user_name.equals(name)&&user_resident_num.equals(resident_num)&&user_email.equals(email)) {
					user_id=id;
				}
			}
			return user_id;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();	
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	/*비밀번호 찾기 메서드**/
	public boolean findUserPassword(String user_name,String user_resident_num,String user_email,String user_id) {
		try {
			conn=woodong.db.WoodongDB.getConn();
			String sql="select user_name,user_resident_num,user_email,user_id from sp_user where user_id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, user_id);
			rs=ps.executeQuery();
			boolean result=false;
			while(rs.next()) {
				String name=rs.getString("user_name");
				String resident_num=rs.getString("user_resident_num");
				String email=rs.getString("user_email");
				String id=rs.getString("user_id");
				
				if(user_name.equals(name)&&user_resident_num.equals(resident_num)&&user_email.equals(email)&&user_id.equals(id)) {
					result=true;
				}
			}
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();	
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	/*비밀번호 변경 메서드**/
	
	public int changeUserPassword(String newpwd,String newpwd_check,String user_id) {
		try {
			conn=woodong.db.WoodongDB.getConn();
			String sql="select user_pwd from sp_user where user_id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, user_id);
			rs=ps.executeQuery();
			int result=0;
			while(rs.next()) {
			String pwd=rs.getString("user_pwd");
			System.out.println(pwd);
			if(pwd.equals(newpwd)) {
				result=1;
			}else if(!(newpwd.equals(newpwd_check))) {
				result=2;
			}else if(newpwd.equals(newpwd_check)) {
				String sql2="update sp_user set user_pwd='"+newpwd+"' where user_id='"+user_id+"'";
				ps=conn.prepareStatement(sql2);
				ps.executeUpdate();
				result=3;
			}}
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();	
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	/**내 정보 보기 메서드*/
	public ArrayList<UserDTO> getUserInfo(String sid){
		try {
			conn=woodong.db.WoodongDB.getConn();
			String sql="select * from sp_user where user_id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, sid);
			rs=ps.executeQuery();
			ArrayList<UserDTO> arr=new ArrayList<UserDTO>();
			while(rs.next()) {
				int idx=rs.getInt("user_idx");
				String id=rs.getString("user_id");
				String pwd=rs.getString("user_pwd");
				String name=rs.getString("user_name");
				String resident_num=rs.getString("user_resident_num");
				String nickname=rs.getString("user_nickname");
				String email=rs.getString("user_email");
				String addr=rs.getString("user_addr");
				java.sql.Date joindate=rs.getDate("user_joindate");
				
				UserDTO dto=new UserDTO(idx, id, pwd, name, resident_num, nickname, email, addr, joindate);
				arr.add(dto);
			}
			return arr;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
		
	/**내정보*/
	public int changeUserInfo(String user_nickname,String user_addr,String user_addr2,String user_id) {
		try {
			conn=woodong.db.WoodongDB.getConn();
			String sql="update sp_user set user_nickname=?,user_addr=? where user_id=?";
			ps=conn.prepareStatement(sql);
			String addr=user_addr+" "+user_addr2;
			ps.setString(1, user_nickname);
			ps.setString(2, addr);
			ps.setString(3, user_id);
			int count=ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	//모든 회원 출력&검색 회원 출력
		public List<UserDTO> userList(int cp, int ls, String select_value, String searchVal) {
			try {
				
				conn = woodong.db.WoodongDB.getConn();
				
				int start = (cp - 1) * ls + 1;
				int end = cp * ls;
				
				String sql = "";
				if(select_value==null) {
					sql = "select * from "
							+ "(select rownum as rnum, a.* from "
							+ "(select * from sp_user order by user_idx desc) a) b "
							+ "where rnum >= ? and rnum <= ?";
					
					ps = conn.prepareStatement(sql);
					ps.setInt(1, start);
					ps.setInt(2, end);
				}else {
					sql = "select * from sp_user where "+select_value+" = ?";
					
					ps = conn.prepareStatement(sql);
					ps.setString(1, searchVal);
				}
				
				
				
				rs = ps.executeQuery();
				
				List<UserDTO> list = new ArrayList<UserDTO>();
				if(rs.next()) {
					do {
						int user_idx = rs.getInt("user_idx");
						String user_id = rs.getString("user_id");
						String user_pwd = rs.getString("user_pwd");
						String user_name = rs.getString("user_name");
						String user_resident_num = rs.getString("user_resident_num");
						String user_nickname = rs.getString("user_nickname");
						String user_email = rs.getString("user_email");
						String user_addr = rs.getString("user_addr");
						java.sql.Date user_joindate = rs.getDate("user_joindate");
						
						list.add(new UserDTO(user_idx, user_id, user_pwd, user_name, user_resident_num, user_nickname, user_email, user_addr, user_joindate));
						
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
		
		/**회원 상세 정보 출력*/
		public UserDTO user_nickname_search(String nickname) {
			
			try {
				conn = woodong.db.WoodongDB.getConn();
				
				String sql = "select * from sp_user where user_nickname = ?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, nickname);
				rs = ps.executeQuery();
				
				UserDTO dto = null;
				while(rs.next()) {
					int user_idx = rs.getInt("user_idx");
					String user_id = rs.getString("user_id");
					String user_pwd = rs.getString("user_pwd");
					String user_name = rs.getString("user_name");
					String user_resident_num = rs.getString("user_resident_num");
					String user_nickname = rs.getString("user_nickname");
					String user_email = rs.getString("user_email");
					String user_addr = rs.getString("user_addr");
					java.sql.Date user_joindate = rs.getDate("user_joindate");
					
					dto = new UserDTO(user_idx, user_id, user_pwd, user_name, user_resident_num, user_nickname, user_email, user_addr, user_joindate);
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
		
		//선택한 회원 삭제
		public int user_delete(List<String> list_nickname) {
			try {
				conn = woodong.db.WoodongDB.getConn();
				
				int count = 0;
				for(String nickname : list_nickname) {
					String sql = "delete from sp_user where user_nickname = ?";
					ps = conn.prepareStatement(sql);
					ps.setString(1, nickname);
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
		
		//등록된 회원의 수 구하는 메소드
		public int getTotalCnt() {
			try {
				conn = woodong.db.WoodongDB.getConn();
				String sql = "select count(*) from sp_user";
				ps = conn.prepareStatement(sql);
				rs = ps.executeQuery();
				
				//count는 무조건 값을 반환하기 때문에 데이터가 없으면 0을 반환, 그래서 조건을 줘야 함
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
		
		public UserDTO findUserInfoByUserIdx(int uidx) {
			try {
				conn=woodong.db.WoodongDB.getConn();
				String sql="select * from sp_user where user_idx=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, uidx);
				rs=ps.executeQuery();
				
				UserDTO udto=new UserDTO();
				if(rs.next()) {
					udto.setUser_idx(rs.getInt("user_idx"));
					udto.setUser_id(rs.getString("user_id"));
					udto.setUser_pwd(rs.getString("user_pwd"));
					udto.setUser_name(rs.getString("user_name"));
					udto.setUser_resident_num(rs.getString("user_resident_num"));
					udto.setUser_nickname(rs.getString("user_nickname"));
					udto.setUser_email(rs.getString("user_email"));
					udto.setUser_addr(rs.getString("user_addr"));
					udto.setUser_joindate(rs.getDate("user_joindate"));
				}
				
				return udto;
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