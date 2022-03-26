package woodong.bbs.report;
import java.sql.*;
public class BbsReportDTO {
	
	private int bbs_report_idx;
	private int bbs_idx;
	private int user_idx;
	private String bbs_report_content;
	private Date bbs_report_reportdate;
	private String bbs_subject;		//	hmj 03-21 23:49 추가
	private String user_name;		//	hmj 03-21 23:49 추가
	private String user_nickname;	//
	

	public BbsReportDTO() {
		// TODO Auto-generated constructor stub
	}

	public BbsReportDTO(int bbs_report_idx, int bbs_idx, int user_idx, String bbs_report_content,
			Date bbs_report_reportdate, String bbs_subject, String user_name, String user_nickname) {
		super();
		this.bbs_report_idx = bbs_report_idx;
		this.bbs_idx = bbs_idx;
		this.user_idx = user_idx;
		this.bbs_report_content = bbs_report_content;
		this.bbs_report_reportdate = bbs_report_reportdate;
		this.bbs_subject = bbs_subject;
		this.user_name = user_name;
		this.user_nickname = user_nickname;
	}
	


	public BbsReportDTO(int bbs_report_idx, int bbs_idx, int user_idx, String bbs_report_content,
			Date bbs_report_reportdate) {
		super();
		this.bbs_report_idx = bbs_report_idx;
		this.bbs_idx = bbs_idx;
		this.user_idx = user_idx;
		this.bbs_report_content = bbs_report_content;
		this.bbs_report_reportdate = bbs_report_reportdate;
	}

	public int getBbs_report_idx() {
		return bbs_report_idx;
	}

	public void setBbs_report_idx(int bbs_report_idx) {
		this.bbs_report_idx = bbs_report_idx;
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

	public String getBbs_report_content() {
		return bbs_report_content;
	}

	public void setBbs_report_content(String bbs_report_content) {
		this.bbs_report_content = bbs_report_content;
	}

	public Date getBbs_report_reportdate() {
		return bbs_report_reportdate;
	}

	public void setBbs_report_reportdate(Date bbs_report_reportdate) {
		this.bbs_report_reportdate = bbs_report_reportdate;
	}
	
	public String getBbs_subject() {
		return bbs_subject;
	}

	public void setBbs_subject(String bbs_subject) {
		this.bbs_subject = bbs_subject;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	
}
