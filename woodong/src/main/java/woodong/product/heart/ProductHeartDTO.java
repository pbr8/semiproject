package woodong.product.heart;

public class ProductHeartDTO {

	private int p_heart_idx;
	private int product_idx;
	private int user_idx;
	
	public ProductHeartDTO() {
		super();
	}

	public ProductHeartDTO(int p_heart_idx, int product_idx, int user_idx) {
		super();
		this.p_heart_idx = p_heart_idx;
		this.product_idx = product_idx;
		this.user_idx = user_idx;
	}

	public int getP_heart_idx() {
		return p_heart_idx;
	}

	public void setP_heart_idx(int p_heart_idx) {
		this.p_heart_idx = p_heart_idx;
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
	
}
