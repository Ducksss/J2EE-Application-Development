package model;

import java.sql.*;
import java.util.*;

public class ProductDB {

	public int retriveStockQuantity(int product_id) {
		try {
			Connection conn = DatabaseConnection.getConnection();

			// instead of editing directly, use ? to prevent injection attacks
			String sql = "SELECT * FROM sp_shop.products where product_id = ?;";

			/// executing to DB - Statement to check if an account exist before it
			PreparedStatement pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, product_id);

			ResultSet rs = pstmt.executeQuery();
			conn.close();

			if (rs.next()) {
				return rs.getInt("stock_quantity");
			} else {
				return 0;
			}
		} catch (Exception e) {
			return 0;
		}
	}

	public boolean updateStockQuantity(int stockQuantity, int productID) {
		try {
			Connection conn = DatabaseConnection.getConnection();

			// instead of editing directly, use ? to prevent injection attacks
			String sql = "UPDATE sp_shop.products SET stock_quantity = ? where product_id = ?";

			/// executing to DB - Statement to check if an account exist before it
			PreparedStatement pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, stockQuantity);
			pstmt.setInt(2, productID);


			int count = pstmt.executeUpdate();
			conn.close();

			if (count > 0 ) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			return false;
		}
	}

	public boolean deleteProduct(int product_id) {
		try {
			Connection conn = DatabaseConnection.getConnection();

			// instead of editing directly, use ? to prevent injection attacks
			String sql = "DELETE FROM sp_shop.products WHERE product_id = ?";

			/// executing to DB - Statement to check if an account exist before it
			PreparedStatement pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, product_id);

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
