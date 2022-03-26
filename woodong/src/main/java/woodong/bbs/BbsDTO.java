package woodong.bbs;
import java.sql.*;
public class BbsDTO {
	
	private int bbs_idx;
	private String bbs_subject;
	private String bbs_content;
	private int bbs_readnum;
	private Date bbs_writedate;
	private int bbs_ref;
	private int bbs_lev;
	private int bbs_step;
	private int bbs_admin;
	private int user_idx;
	private String user_nickname;	//hmj 03-21 22:49 추가
	private String user_addr;
	private String user_name;
	

	public BbsDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public BbsDTO(int bbs_idx, String bbs_subject, String bbs_content, int bbs_readnum, Date bbs_writedate, int bbs_ref,
			int bbs_lev, int bbs_step, int bbs_admin, int user_idx) {
		this.bbs_idx = bbs_idx;
		this.bbs_subject = bbs_subject;
		this.bbs_content = bbs_content;
		this.bbs_readnum = bbs_readnum;
		this.bbs_writedate = bbs_writedate;
		this.bbs_ref = bbs_ref;
		this.bbs_lev = bbs_lev;
		this.bbs_step = bbs_step;
		this.bbs_admin = bbs_admin;
		this.user_idx = user_idx;
	}
	
	public BbsDTO(int bbs_idx, String bbs_subject, String bbs_content, int bbs_readnum, Date bbs_writedate, int bbs_ref,
			int bbs_lev, int bbs_step, int bbs_admin, int user_idx, String user_nickname, String user_addr,
			String user_name) {
		super();
		this.bbs_idx = bbs_idx;
		this.bbs_subject = bbs_subject;
		this.bbs_content = bbs_content;
		this.bbs_readnum = bbs_readnum;
		this.bbs_writedate = bbs_writedate;
		this.bbs_ref = bbs_ref;
		this.bbs_lev = bbs_lev;
		this.bbs_step = bbs_step;
		this.bbs_admin = bbs_admin;
		this.user_idx = user_idx;
		this.user_nickname = user_nickname;
		this.user_addr = user_addr;
		this.user_name = user_name;
	}
	
	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	public BbsDTO(int bbs_idx, String bbs_subject, String bbs_content, int bbs_readnum, Date bbs_writedate, int bbs_ref,
			int bbs_lev, int bbs_step, int bbs_admin, int user_idx, String user_nickname) {
		super();
		this.bbs_idx = bbs_idx;
		this.bbs_subject = bbs_subject;
		this.bbs_content = bbs_content;
		this.bbs_readnum = bbs_readnum;
		this.bbs_writedate = bbs_writedate;
		this.bbs_ref = bbs_ref;
		this.bbs_lev = bbs_lev;
		this.bbs_step = bbs_step;
		this.bbs_admin = bbs_admin;
		this.user_idx = user_idx;
		this.user_nickname = user_nickname;
	}

	public int getBbs_idx() {
		return bbs_idx;
	}

	public void setBbs_idx(int bbs_idx) {
		this.bbs_idx = bbs_idx;
	}

	public String getBbs_subject() {
		return bbs_subject;
	}

	public void setBbs_subject(String bbs_subject) {
		this.bbs_subject = bbs_subject;
	}

	public String getBbs_content() {
		return bbs_content;
	}

	public void setBbs_content(String bbs_content) {
		this.bbs_content = bbs_content;
	}

	public int getBbs_readnum() {
		return bbs_readnum;
	}

	public void setBbs_readnum(int bbs_readnum) {
		this.bbs_readnum = bbs_readnum;
	}

	public Date getBbs_writedate() {
		return bbs_writedate;
	}

	public void setBbs_writedate(Date bbs_writedate) {
		this.bbs_writedate = bbs_writedate;
	}

	public int getBbs_ref() {
		return bbs_ref;
	}

	public void setBbs_ref(int bbs_ref) {
		this.bbs_ref = bbs_ref;
	}

	public int getBbs_lev() {
		return bbs_lev;
	}

	public void setBbs_lev(int bbs_lev) {
		this.bbs_lev = bbs_lev;
	}

	public int getBbs_step() {
		return bbs_step;
	}

	public void setBbs_step(int bbs_step) {
		this.bbs_step = bbs_step;
	}

	public int getBbs_admin() {
		return bbs_admin;
	}

	public void setBbs_admin(int bbs_admin) {
		this.bbs_admin = bbs_admin;
	}

	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}

	public String getUser_addr() {
		return user_addr;
	}

	public void setUser_addr(String user_addr) {
		this.user_addr = user_addr;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	
	
	
}
