package com.pack1.utility;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	Connection con;
	public Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con =DriverManager.getConnection("JDBC:mysql://localhost:3306/db01","root","root");
			
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return con;
	}
}
