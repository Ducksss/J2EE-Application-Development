package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import reciept.Reciept;
import users.*;

public class UserDB {
	public boolean findDuplicateUser(String email) {
		try {
			Connection conn = DatabaseConnection.getConnection();

			String sqlStr = "SELECT * FROM sp_shop.users WHERE email = ?";
			PreparedStatement pstmt = conn.prepareStatement(sqlStr);

			pstmt.setString(1, email);

			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			return false;
		}
	}

	public boolean insertUser(String name, String email, String hashed, String address, String contactNumber) {
		try {
			Connection conn = DatabaseConnection.getConnection();

			// if the email is not associated with an account!
			String insertSQL = "INSERT INTO sp_shop.users (username, email, password, address, contact_number) VALUES (?, ?, ?, ?, ?)";
			PreparedStatement pstat = conn.prepareStatement(insertSQL);
			pstat.setString(1, name);
			pstat.setString(2, email);
			pstat.setString(3, hashed);
			pstat.setString(4, address);
			pstat.setString(5, contactNumber);

			int count = pstat.executeUpdate();

			if (count > 0) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			return false;
		}
	}

	public boolean verifyUser(String email) {
		try {
			Connection conn = DatabaseConnection.getConnection();

			String sql = "SELECT * FROM sp_shop.users WHERE email = ?";

			// executing to DB
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			return false;
		}
	}

	public User retriveUserInformation(String email) {
		try {
			Connection conn = DatabaseConnection.getConnection();

			String sql = "SELECT * FROM sp_shop.users WHERE email = ?";

			// executing to DB
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			ResultSet rs = pstmt.executeQuery();

			return new User(rs.getInt("user_id"), rs.getString("type"), rs.getString("username"),
					rs.getString("email"));
		} catch (Exception e) {
			return null;
		}
	}
}
