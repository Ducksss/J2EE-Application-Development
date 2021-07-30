package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class RecieptDB {

	// Insertion
	public boolean insertReciept(int user_id, double totalPrice) {
		try {
			Connection conn = DatabaseConnection.getConnection();

			// instead of editing directly, use ? to prevent injection attacks
			String insertSQL = "INSERT INTO sp_shop.reciepts(user_id, total_price) VALUES (?, ?)";

			/// executing to DB - Statement to check if an account exist before it
			PreparedStatement pstmt = conn.prepareStatement(insertSQL);

			pstmt.setInt(1, user_id);
			pstmt.setString(2, String.format("%.2f", totalPrice));

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

	// Retrieval
	public int getRecieptID(int sessUserID) {
		try {
			int reciept_id = 0;

			Connection conn = DatabaseConnection.getConnection();
			String retrivalSQL = "SELECT * FROM sp_shop.reciepts where user_id = ? ORDER BY reciept_id desc;";
			PreparedStatement pstmt = conn.prepareStatement(retrivalSQL);

			pstmt.setInt(1, sessUserID);

			ResultSet rs = pstmt.executeQuery();

			boolean isFirst = true;
			if (rs.next() && isFirst) {
				reciept_id = rs.getInt("reciept_id");
				isFirst = false;
			}
			return reciept_id;
		} catch (Exception e) {
			return 0;
		}
	}
}
