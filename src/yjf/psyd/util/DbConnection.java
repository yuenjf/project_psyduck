package yjf.psyd.util;

import java.sql.*;

public class DbConnection {
	// mysql数据库驱动
	private static String DRIVER = "com.mysql.cj.jdbc.Driver";
	// 数据库地址
	private static String URL = "jdbc:mysql://127.0.0.1:3306/psyduck?serverTimezone=GMT%2B8";
	// 数据库名称
	private static String USERNAME = "root";
	// 数据库密码
	private static String PASSWORD = "123456";

	// 获取链接
	public static Connection getConnection() {
		// 定义一个conn变量，不能定义为static的类型的 否则全局共享
		Connection conn = null;
		try {
			// 加载驱动
			Class.forName(DRIVER);
			try {
				// 获取链接
				conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			} catch (SQLException e) {
				System.out.println("数据库链接失败");
				e.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			System.out.println("数据库链接失败");
			e.printStackTrace();
		}
		return conn;
	}

	// 关闭链接
	public static void closeDB(Connection conn, PreparedStatement ps, ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		if (ps != null) {
			try {
				ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}