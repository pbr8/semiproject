package woodong.product;
import java.sql.*;
public class ProductDTO {
	
	private int product_idx;
	private String product_subject;
	private String product_tel;
	private String product_category;
	private int product_price;
	private String product_content;
	private int product_readnum;
	private Date product_writedate;
	private int product_state;
	private String product_img;
	private int user_idx;
	private String user_name;
	private String user_nickname;	//hmj 03-21 15:02 추가
	private String user_addr;		//hmj 03-21 15:02 추가
	
	
	public ProductDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public ProductDTO(int product_idx, int product_price, String user_nickname, String user_addr, String product_img) {
		super();
		this.product_idx = product_idx;
		this.product_price = product_price;
		this.product_img = product_img;
		this.user_nickname = user_nickname;
		this.user_addr = user_addr;
	}
	
	

	public ProductDTO(int product_idx, String product_subject, String product_tel, String product_category,
			int product_price, String product_content, int product_readnum, Date product_writedate, int product_state,
			String product_img, int user_idx) {
		
		this.product_idx = product_idx;
		this.product_subject = product_subject;
		this.product_tel = product_tel;
		this.product_category = product_category;
		this.product_price = product_price;
		this.product_content = product_content;
		this.product_readnum = product_readnum;
		this.product_writedate = product_writedate;
		this.product_state = product_state;
		this.user_idx = user_idx;
		this.product_img = product_img;
	}
	
	public ProductDTO(int product_idx, String product_subject, String product_tel, String product_category,
			int product_price, String product_content, int product_readnum, Date product_writedate, int product_state,
			String product_img, int user_idx, String user_name, String user_nickname, String user_addr) {
		
		this.product_idx = product_idx;
		this.product_subject = product_subject;
		this.product_tel = product_tel;
		this.product_category = product_category;
		this.product_price = product_price;
		this.product_content = product_content;
		this.product_readnum = product_readnum;
		this.product_writedate = product_writedate;
		this.product_state = product_state;
		this.product_img = product_img;
		this.user_idx = user_idx;
		this.user_name = user_name;
		this.user_nickname = user_nickname;
		this.user_addr = user_addr;
	}


	public int getProduct_idx() {
		return product_idx;
	}


	public void setProduct_idx(int product_idx) {
		this.product_idx = product_idx;
	}


	public String getProduct_subject() {
		return product_subject;
	}


	public void setProduct_subject(String product_subject) {
		this.product_subject = product_subject;
	}


	public String getProduct_tel() {
		return product_tel;
	}


	public void setProduct_tel(String product_tel) {
		this.product_tel = product_tel;
	}


	public String getProduct_category() {
		return product_category;
	}


	public void setProduct_category(String product_category) {
		this.product_category = product_category;
	}


	public int getProduct_price() {
		return product_price;
	}


	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}


	public String getProduct_content() {
		return product_content;
	}


	public void setProduct_content(String product_content) {
		this.product_content = product_content;
	}


	public int getProduct_readnum() {
		return product_readnum;
	}


	public void setProduct_readnum(int product_readnum) {
		this.product_readnum = product_readnum;
	}


	public Date getProduct_writedate() {
		return product_writedate;
	}


	public void setProduct_writedate(Date product_writedate) {
		this.product_writedate = product_writedate;
	}


	public int getProduct_state() {
		return product_state;
	}


	public void setProduct_state(int product_state) {
		this.product_state = product_state;
	}
	
	public String getProduct_img() {
		return product_img;
	}

	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}


	public int getUser_idx() {
		return user_idx;
	}


	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
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


	public String getUser_addr() {
		return user_addr;
	}


	public void setUser_addr(String user_addr) {
		this.user_addr = user_addr;
	}

	
}
