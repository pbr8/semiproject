package woodong.heart;

public class HeartDTO {
	
	private int bbs_heart_idx;
	private int bbs_idx;
	private int user_idx;
	
	public HeartDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public HeartDTO(int bbs_heart_idx, int bbs_idx, int user_idx) {
		super();
		this.bbs_heart_idx = bbs_heart_idx;
		this.bbs_idx = bbs_idx;
		this.user_idx = user_idx;
	}
	public int getBbs_heart_idx() {
		return bbs_heart_idx;
	}
	public void setBbs_heart_idx(int bbs_heart_idx) {
		this.bbs_heart_idx = bbs_heart_idx;
	}
	public int getBbs_idx() {
		return bbs_idx;
	}
	public void setBbs_idx(int bbs_idx) {
		this.bbs_idx = bbs_idx;
	}
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	
	
	
}
