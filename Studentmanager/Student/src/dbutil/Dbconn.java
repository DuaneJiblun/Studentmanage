package dbutil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Dbconn {

	private Connection conn;
	/*public  Connection getConnection() throws SQLException{
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/123?useUnicode=true&characterEncoding=utf8&serverTimezone=Asia/Shanghai","root","yy20021220");
		} catch (ClassNotFoundException e) {
			System.out.println("�Ҳ������񣡣�");
			e.printStackTrace();
		}
		return conn;
	}*/
	public Connection getConnection() throws SQLException {
		Connection conn = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // ���Լ��� MySQL JDBC ��������
			if (!DriverManager.getDrivers().hasMoreElements()) {
				throw new SQLException("MySQL JDBC ��������δ���سɹ�");
			}
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/student?useUnicode=true&characterEncoding=utf8&serverTimezone=Asia/Shanghai", "root", "1234567890");
		} catch (ClassNotFoundException e) {
			System.out.println("�Ҳ������񣡣�");
			throw new SQLException("���ݿ�����δ�ҵ�", e); // �׳� SQLException �쳣֪ͨ������
		}
		return conn;
	}


	public void closeAll(Connection conn,Statement stat,ResultSet rs){
		if(rs!=null){
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				if(stat!=null){
					try {
						stat.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}finally{
						if(conn!=null){
							try {
								conn.close();
							} catch (SQLException e) {
								e.printStackTrace();
							}
						}
					}
				}
			}
		}
	}

}
