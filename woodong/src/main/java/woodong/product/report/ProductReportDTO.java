package woodong.product.report;

import java.sql.*;

public class ProductReportDTO {
	private int p_report_idx;
	private int product_idx;
	private int user_idx;
	private String product_report_content;
	java.sql.Date product_report_reportdate;
	private String product_subject;		//hmj 0322
	private String user_name;			//hmj 0322
	private String user_nickname;	//
			

	public ProductReportDTO() {
		// TODO Auto-generated constructor stub
	}

	public ProductReportDTO(int p_report_idx, int product_idx, int user_idx, String product_report_content,
			Date product_report_reportdate) {
		super();
		this.p_report_idx = p_report_idx;
		this.product_idx = product_idx;
		this.user_idx = user_idx;
		this.product_report_content = product_report_content;
		this.product_report_reportdate = product_report_reportdate;
	}
	
	public ProductReportDTO(int p_report_idx, int product_idx, int user_idx, String product_report_content,
			Date product_report_reportdate, String product_subject, String user_name, String user_nickname) {
		super();
		this.p_report_idx = p_report_idx;
		this.product_idx = product_idx;
		this.user_idx = user_idx;
		this.product_report_content = product_report_content;
		this.product_report_reportdate = product_report_reportdate;
		this.product_subject = product_subject;
		this.user_name = user_name;
		this.user_nickname = user_nickname;
	}

	public String getProduct_subject() {
		return product_subject;
	}

	public void setProduct_subject(String product_subject) {
		this.product_subject = product_subject;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public int getP_report_idx() {
		return p_report_idx;
	}

	public void setP_report_idx(int p_report_idx) {
		this.p_report_idx = p_report_idx;
	}

	public int getProduct_idx() {
		return product_idx;
	}

	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}

	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}

	public String getProduct_report_content() {
		return product_report_content;
	}

	public void setProduct_report_content(String product_report_content) {
		this.product_report_content = product_report_content;
	}

	public java.sql.Date getProduct_report_reportdate() {
		return product_report_reportdate;
	}

	public void setProduct_report_reportdate(java.sql.Date product_report_reportdate) {
		this.product_report_reportdate = product_report_reportdate;
	}

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}
	
	
	
}
