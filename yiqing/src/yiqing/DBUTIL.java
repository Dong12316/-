package yiqing;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class DBUTIL {
	public Connection lin(String s) throws SQLException {
		Connection con=null;
		String driverName = "com.mysql.cj.jdbc.Driver";
		String dbURL = "jdbc:mysql://localhost:3306/yiqing1?&useSSL=false&serverTimezone=UTC&useUnicode=yes&characterEncoding=utf8";
		String userName = "root";
		String userPwd = "root";
		try {
			Class.forName(driverName);
			System.out.println("加载驱动成功！");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("加载驱动失败！");
		}
		try {
			con = DriverManager.getConnection(dbURL, userName, userPwd);
			System.out.println(s+"连接数据库成功！");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.print("mysql连接失败！");
		}
		return con;
	}
}