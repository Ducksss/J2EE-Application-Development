package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import reciept.Reciept;

public class RecieptDB {

	// Retrieval
	public int getRecieptID(int userID) {
		try {
			int reciept_id = 0;

			Connection conn = DatabaseConnection.getConnection();
			String retrivalSQL = "SELECT * FROM sp_shop.reciepts where user_id = ? ORDER BY reciept_id desc;";
			PreparedStatement pstmt = conn.prepareStatement(retrivalSQL);

			pstmt.setInt(1, userID);

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

	// Retrieval
	public ArrayList<Reciept> getCustomerRecieptInformation(int user_id, int reciept_id) {
		try {
			ArrayList<Reciept> Reciept = new ArrayList<Reciept>();

			Connection conn = DatabaseConnection.getConnection();

			String sqlStr = "SELECT *, COUNT('product_id') as tally FROM sp_shop.orders orders, sp_shop.products products where orders.user_id = ? and orders.reciept_id = ? and orders.product_id = products.product_id group by orders.product_id;";
			PreparedStatement pstmt = conn.prepareStatement(sqlStr);

			pstmt.setInt(1, user_id);
			pstmt.setInt(2, reciept_id);

			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				Reciept.add(new Reciept(rs.getString("product_title"), rs.getString("brief_description"),
						rs.getInt("tally"), (rs.getDouble("retail_price") * rs.getInt("tally"))));
			}

			return Reciept;
		} catch (Exception e) {
			return null;
		}
	}

	// Insertion
	public boolean insertReciept(int userID, double totalPrice) {
		try {
			Connection conn = DatabaseConnection.getConnection();

			// instead of editing directly, use ? to prevent injection attacks
			String insertSQL = "INSERT INTO sp_shop.reciepts(user_id, total_price) VALUES (?, ?)";

			/// executing to DB - Statement to check if an account exist before it
			PreparedStatement pstmt = conn.prepareStatement(insertSQL);

			pstmt.setInt(1, userID);
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
}
