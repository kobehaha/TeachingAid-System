package com.cpp.homework.dbc;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {

	private static final String DBDRIVER = "com.mysql.jdbc.Driver";
	private static final String DBURL = "jdbc:mysql://localhost:3306/homework";
	private static final String DBUSER = "root";
	private static final String DBPASSWORD = "ST1995";
//	private static final String DBURL = "jdbc:mysql://113.251.218.213:3306/homework";
//	private static final String DBUSER = "root";
//	private static final String DBPASSWORD = "";
	
	private Connection conn = null;
	
	public DatabaseConnection() throws Exception
	{
		try {
			getClass().forName(DBDRIVER);
			this.conn = DriverManager.getConnection(DBURL, DBUSER, DBPASSWORD);     //杩炴帴homework鏁版嵁搴�
		} catch (Exception e) {
			throw e;
		}
	}
	
	public Connection getConnection()
	{
		return this.conn;
	}
	
	public void close() throws Exception
	{
		if (this.conn != null) {
			try {
				this.conn.close();
			} catch (Exception e) {
				throw e;
			}
		}
	}
}
