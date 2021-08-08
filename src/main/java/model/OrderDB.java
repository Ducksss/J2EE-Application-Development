package model;

import java.sql.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import reciept.Reciept;
import orders.OrderManagement;

public class OrderDB {

	// Retrieval
	public ArrayList<OrderManagement> getAdminOrderInformation() {
		try {
			ArrayList<OrderManagement> OrderManagement = new ArrayList<OrderManagement>();

			Connection conn = DatabaseConnection.getConnection();

			String sqlStr = "SELECT DISTINCT reciept_id, product_id FROM sp_shop.orders;";
			PreparedStatement pstmt = conn.prepareStatement(sqlStr);

			ResultSet rs = pstmt.executeQuery(sqlStr);

			while (rs.next()) {
				int reciept_id = rs.getInt("reciept_id");
				int product_id = rs.getInt("product_id");

				sqlStr = "SELECT DISTINCT *, count(*) as quantity FROM sp_shop.orders orders, sp_shop.products products, sp_shop.users users, sp_shop.reciepts reciepts where orders.reciept_id = ? and orders.product_id = ? and orders.product_id = products.product_id and users.user_id = orders.user_id and reciepts.reciept_id = orders.reciept_id group by orders.reciept_id;";

				pstmt = conn.prepareStatement(sqlStr);
				pstmt.setInt(1, reciept_id);
				pstmt.setInt(2, product_id);

				ResultSet rs2 = pstmt.executeQuery();

				while (rs2.next()) {
					OrderManagement.add(new OrderManagement(rs2.getString("reciept_id"), rs2.getString("email"),
							rs2.getString("product_title"), rs2.getString("cost_price"), rs2.getString("retail_price"),
							rs2.getString("created_at"), rs2.getString("quantity")));
				}
			}

			return OrderManagement;
		} catch (Exception e) {
			return null;
		}
	}

	// Insertion
	public boolean insertOrder(int userID, int productID, int recieptID,double d) {
		try {
			Connection conn = DatabaseConnection.getConnection();

			// instead of editing directly, use ? to prevent injection attacks
			String insertSQL = "INSERT INTO sp_shop.orders(user_id, product_id, reciept_id, price_at_order) VALUES (?, ?, ?, ?)";

			/// executing to DB - Statement to check if an account exist before it
			PreparedStatement pstmt = conn.prepareStatement(insertSQL);

			pstmt.setInt(1, userID);
			pstmt.setInt(2, productID);
			pstmt.setInt(3, recieptID);
			pstmt.setDouble(4, d);
			int count = pstmt.executeUpdate();
			conn.close();

			if (count > 0) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			return false;
		}
	}
}
