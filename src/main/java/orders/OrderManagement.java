package orders;

public class OrderManagement {
	private String orderID;
	private String email;
	private String productTitle;
	private String costPrice;
	private String retailPrice;
	private String createdAt;
	private String quantity;
	private String address;
	private String postalCode;
	private String unitNumber;
	private String contactNumber;
	
	public OrderManagement() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OrderManagement(String orderID, String email, String productTitle, String costPrice, String retailPrice,
			String createdAt, String quantity, String address, String postalCode, String unitNumber,
			String contactNumber) {
		super();
		this.orderID = orderID;
		this.email = email;
		this.productTitle = productTitle;
		this.costPrice = costPrice;
		this.retailPrice = retailPrice;
		this.createdAt = createdAt;
		this.quantity = quantity;
		this.address = address;
		this.postalCode = postalCode;
		this.unitNumber = unitNumber;
		this.contactNumber = contactNumber;
	}

	public String getOrderID() {
		return orderID;
	}

	public void setOrderID(String orderID) {
		this.orderID = orderID;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getProductTitle() {
		return productTitle;
	}

	public void setProductTitle(String productTitle) {
		this.productTitle = productTitle;
	}

	public String getCostPrice() {
		return costPrice;
	}

	public void setCostPrice(String costPrice) {
		this.costPrice = costPrice;
	}

	public String getRetailPrice() {
		return retailPrice;
	}

	public void setRetailPrice(String retailPrice) {
		this.retailPrice = retailPrice;
	}

	public String getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public String getUnitNumber() {
		return unitNumber;
	}

	public void setUnitNumber(String unitNumber) {
		this.unitNumber = unitNumber;
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

}