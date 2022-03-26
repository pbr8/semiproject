package woodong.user;

import java.util.*;

public class UserDTO {
	
	public UserDTO() {}
	
	public UserDTO(int user_idx, String user_id, String user_pwd, String user_name, String user_resident_num,
			String user_nickname, String user_email, String user_addr, Date user_joindate) {
		super();
		this.user_idx = user_idx;
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.user_name = user_name;
		this.user_resident_num = user_resident_num;
		this.user_nickname = user_nickname;
		this.user_email = user_email;
		this.user_addr = user_addr;
		this.user_joindate = user_joindate;
	}

	private int user_idx;
	private String user_id;
	private String user_pwd;
	private String user_name;
	private String user_resident_num;
	private String user_nickname;
	private String user_email;
	private String user_addr;  
	private Date user_joindate;
	
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pwd() {
		return user_pwd;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_resident_num() {
		return user_resident_num;
	}
	public void setUser_resident_num(String user_resident_num) {
		this.user_resident_num = user_resident_num;
	}
	public String getUser_nickname() {
		return user_nickname;
	}
	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_addr() {
		return user_addr;
	}
	public void setUser_addr(String user_addr) {
		this.user_addr = user_addr;
	}
	public Date getUser_joindate() {
		return user_joindate;
	}
	public void setUser_joindate(Date user_joindate) {
		this.user_joindate = user_joindate;
	}
	
}
