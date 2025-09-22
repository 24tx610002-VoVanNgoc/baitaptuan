package ltweb.configs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBConnect {

	private final String serverName = "DESKTOP-RU9RM92";
	private final String dbName = "LTWEBTUXA";
	private final String portNumber = "1433";
	private final String instance = ""; // nếu SQL Server là instance mặc định thì để trống

	public Connection getConnection() throws Exception {
		String url = "jdbc:sqlserver://" + serverName;

		if (instance != null && !instance.trim().isEmpty()) {
			url += "\\" + instance;
		}
		url += ":" + portNumber + ";" + "databaseName=" + dbName + ";" + "integratedSecurity=true;" // Windows
																									// Authentication
				+ "encrypt=true;trustServerCertificate=true";

		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		return DriverManager.getConnection(url);
	}

	public static void main(String[] args) {
		try {
			// connnect to database 'testdb'
			Connection conn = new DBConnect().getConnection();
			// crate statement
			PreparedStatement stmt = conn
					.prepareStatement("INSERT INTO GiaoVien(id, name, address) " + "VALUES (?, ?,  ?)");
			stmt.setInt(1, 3);
			stmt.setString(2, "Ngoc2");
			stmt.setString(3, "HCM2");
			// insert ‘GiaoVien'
			stmt.executeUpdate();
			stmt = conn.prepareStatement("SELECT * FROM GiaoVien");
			// get data from table ‘GiaoVien'
			ResultSet rs = stmt.executeQuery();
			// show data
			while (rs.next()) {
				System.out.println(rs.getInt("id") + "  " + rs.getString("name") + " " + rs.getString("address"));
			}
			conn.close(); // close connection

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
