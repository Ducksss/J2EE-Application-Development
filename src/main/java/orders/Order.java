package orders;

public class Order {
	private int orderID;
	private int userID;
	private int productID;
	private int recieptID;
	private int status;
	private String created_at;

	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Order(int orderID, int userID, int productID, int recieptID, int status, String created_at) {
		super();
		this.orderID = orderID;
		this.userID = userID;
		this.productID = productID;
		this.recieptID = recieptID;
		this.status = status;
		this.created_at = created_at;
	}

	public int getOrderID() {
		return orderID;
	}

	public void setOrderID(int orderID) {
		this.orderID = orderID;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public int getProductID() {
		return productID;
	}

	public void setProductID(int productID) {
		this.productID = productID;
	}

	public int getRecieptID() {
		return recieptID;
	}

	public void setRecieptID(int recieptID) {
		this.recieptID = recieptID;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getCreated_at() {
		return created_at;
	}

	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
}
