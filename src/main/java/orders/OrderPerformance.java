package orders;

public class OrderPerformance {
	private String productTitle;
	private int totalAmount;

	public OrderPerformance() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OrderPerformance(String productTitle, int totalAmount) {
		super();
		this.productTitle = productTitle;
		this.totalAmount = totalAmount;
	}

	public String getProductTitle() {
		return productTitle;
	}

	public void setProductTitle(String productTitle) {
		this.productTitle = productTitle;
	}

	public int getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(int totalAmount) {
		this.totalAmount = totalAmount;
	}
	
}
