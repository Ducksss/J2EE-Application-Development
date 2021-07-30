package model;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class OrderDB {
	// Insertion
	public boolean insertOrder(int user_id, int productID, int recieptID) {
		try {
			Connection conn = DatabaseConnection.getConnection();

			// instead of editing directly, use ? to prevent injection attacks
			String insertSQL = "INSERT INTO sp_shop.orders(user_id, product_id, reciept_id) VALUES (?, ?, ?)";

			/// executing to DB - Statement to check if an account exist before it
			PreparedStatement pstmt = conn.prepareStatement(insertSQL);

			pstmt.setInt(1, user_id);
			pstmt.setInt(2, productID);
			pstmt.setInt(3, recieptID);

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
