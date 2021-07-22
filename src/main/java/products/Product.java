package products;

public class Product {
	private String productTitle;
	private double costPrice;
	private double retailPrice;
	private double stockQuantity;

	public Product(String productTitle, double costPrice, double retailPrice, double stockQuantity) {
		this.productTitle = productTitle;
		this.costPrice = costPrice;
		this.retailPrice = retailPrice;
		this.stockQuantity = stockQuantity;
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