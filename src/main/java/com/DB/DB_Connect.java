package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;

import com.mysql.cj.jdbc.Driver;

public class DB_Connect {
	private static Connection conn;

	public static Connection getConn()

	{
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore", "root", "raj@123");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return conn;

	}
}
