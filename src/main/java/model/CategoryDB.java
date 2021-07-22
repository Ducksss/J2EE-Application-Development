package model;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class CategoryDB {
	
	public boolean deleteCategory(int category_id) {
		try {
			Connection conn = DatabaseConnection.getConnection();

			// instead of editing directly, use ? to prevent injection attacks
			String sql = "DELETE FROM sp_shop.category WHERE category_id = ?";

			/// executing to DB - Statement to check if an account exist before it
			PreparedStatement pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, category_id);
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
