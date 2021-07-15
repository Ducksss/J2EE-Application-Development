package model;

import java.sql.*;

public class DatabaseConnection {
	public static Connection getConnection() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		String connURL = "jdbc:mysql://localhost/school?user=adminuser&password=password&serverTimezone=UTC";
		Connection conn = DriverManager.getConnection(connURL);

		return conn;
	}
}
