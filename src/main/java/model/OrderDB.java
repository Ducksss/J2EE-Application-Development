package model;

import java.sql.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import reciept.Reciept;
import orders.OrderManagement;
import orders.OrderPerformance;

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

				sqlStr = "SELECT DISTINCT *, count(*) as quantity, orders.address as orderAddress, orders.postal_code as postalCode, orders.unit_address as unitAddresses , orders.created_at as timeOfPurchase, contact_number as ContactNumber FROM sp_shop.orders orders, sp_shop.products products, sp_shop.users users, sp_shop.reciepts reciepts where orders.reciept_id = ? and orders.product_id = ? and orders.product_id = products.product_id and users.user_id = orders.user_id and reciepts.reciept_id = orders.reciept_id group by orders.reciept_id;";

				pstmt = conn.prepareStatement(sqlStr);
				pstmt.setInt(1, reciept_id);
				pstmt.setInt(2, product_id);

				ResultSet rs2 = pstmt.executeQuery();

				while (rs2.next()) {
					OrderManagement.add(new OrderManagement(rs2.getString("reciept_id"), rs2.getString("email"),
							rs2.getString("product_title"), rs2.getString("cost_price"), rs2.getString("retail_price"),
							rs2.getString("created_at"), rs2.getString("quantity"), rs2.getString("orderAddress"),
							rs2.getString("postalCode"), rs2.getString("unitAddresses"), rs2.getString("ContactNumber")));
				}
			}

			return OrderManagement;
		} catch (Exception e) {
			return null;
		}
	}

	public ArrayList<OrderPerformance> getProductPerformance() {
		try {
			ArrayList<OrderPerformance> OrderPerformance = new ArrayList<OrderPerformance>();

			Connection conn = DatabaseConnection.getConnection();

			String sqlStr = "SELECT orders.product_id, products.product_title, COUNT(*) as tally FROM sp_shop.orders orders, sp_shop.products products where products.product_id = orders.product_id GROUP BY orders.product_id ORDER BY tally desc;";
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sqlStr);

			while (rs.next()) {
				OrderPerformance.add(new OrderPerformance(rs.getString("product_title"), rs.getInt("tally")));
			}

			return OrderPerformance;
		} catch (Exception e) {
			System.out.print("ERROR!");
			return null;
		}
	}

	// Insertion
	public boolean insertOrder(int userID, int productID, int recieptID, double price_at_order, String address,
			String postal_code, String unit_address) {
		try {
			Connection conn = DatabaseConnection.getConnection();

			if (unit_address.equals("")) {
				unit_address = null;
			}

			// instead of editing directly, use ? to prevent injection attacks
			String insertSQL = "INSERT INTO sp_shop.orders(user_id, product_id, reciept_id, price_at_order, address, postal_code, unit_address) VALUES (?, ?, ?, ?, ?, ?, ?)";

			/// executing to DB - Statement to check if an account exist before it
			PreparedStatement pstmt = conn.prepareStatement(insertSQL);

			pstmt.setInt(1, userID);
			pstmt.setInt(2, productID);
			pstmt.setInt(3, recieptID);
			pstmt.setDouble(4, price_at_order);
			pstmt.setString(5, address);
			pstmt.setString(6, postal_code);
			pstmt.setString(7, unit_address);

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
