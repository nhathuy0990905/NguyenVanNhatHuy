package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	public Connection cn;
	public void KetNoi() throws Exception{
		String hostName = "DESKTOP-4H2CDN2\\SQLEXPRESS";
		String database = "WebBanHang";
		String userName = "sa";
		String password = "123";
		
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		cn = DriverManager.getConnection("jdbc:sqlserver://"+hostName+":1433;databaseName="+database+";user="+userName+";password="+password);
	}
	public static void main(String[] args) throws Exception {
		DBConnect  c = new DBConnect();
		c.KetNoi();
		System.out.println("ok");
	}

}
