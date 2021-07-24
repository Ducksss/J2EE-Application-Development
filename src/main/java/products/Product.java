package products;

public class Product {
	private int productID;
	private String productTitle;
	private double costPrice;
	private double retailPrice;
	private double stockQuantity;

	public Product(int productID, String productTitle, double costPrice, double retailPrice, double stockQuantity) {
		this.productID = productID;
		this.productTitle = productTitle;
		this.costPrice = costPrice;
		this.retailPrice = retailPrice;
		this.stockQuantity = stockQuantity;
	}
	
	public int getProductID() {
		return productID;
	}

	public void setProductID(int productID) {
		this.productID = productID;
	}

	public String getProductTitle() {
		return productTitle;
	}

	public void setProductTitle(String productTitle) {
		this.productTitle = productTitle;
	}

	public double getCostPrice() {
		return costPrice;
	}

	public void setCostPrice(double costPrice) {
		this.costPrice = costPrice;
	}

	public double getRetailPrice() {
		return retailPrice;
	}

	public void setRetailPrice(double retailPrice) {
		this.retailPrice = retailPrice;
	}

	public double getStockQuantity() {
		return stockQuantity;
	}

	public void setStockQuantity(double stockQuantity) {
		this.stockQuantity = stockQuantity;
	}

}