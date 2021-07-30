package reciept;

public class Reciept {
	private String productTitle;
	private String briefDescription;
	private int quantity;
	private double total;

	public Reciept() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Reciept(String productTitle, String briefDescription, int quantity, double total) {
		super();
		this.productTitle = productTitle;
		this.briefDescription = briefDescription;
		this.quantity = quantity;
		this.total = total;
	}

	public String getProductTitle() {
		return productTitle;
	}

	public void setProductTitle(String productTitle) {
		this.productTitle = productTitle;
	}

	public String getBriefDescription() {
		return briefDescription;
	}

	public void setBriefDescription(String briefDescription) {
		this.briefDescription = briefDescription;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}
}
