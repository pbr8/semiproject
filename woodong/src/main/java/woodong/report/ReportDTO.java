package woodong.report;

import java.sql.*;

public class ReportDTO {
private int bbs_report_idx;
private int bbs_idx;
private int user_idx;
private String bbs_report_content;
private Date bbs_report_reportdate;

public ReportDTO() {
	// TODO Auto-generated constructor stub
}

public ReportDTO(int bbs_report_idx, int bbs_idx, int user_idx, String bbs_report_content,
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


}
