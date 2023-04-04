package common;

import java.beans.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.Servlet;
import javax.servlet.ServletContext;

public class JDBConnect {
	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;
	
	//기본적인 DB연결구조
	public JDBConnect() {
		//jdbc driver load
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			//DB connect!
			String url="jdbc:oracle:thin:@localhost:1521:xe";
			//jdbc:oracle:thin:@DB IP:port Num:Serial Num
			String id = "jmlee";
			String pw = "1234";
			con=DriverManager.getConnection(url,id,pw);
			System.out.println("DB 연결(기본)");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public JDBConnect(String driver,String url, String id, String pw) {
		try {
			Class.forName(driver);
			//db connect
			con=DriverManager.getConnection(url,id,pw);
			System.out.println("DB연결 매개변수 인자");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public JDBConnect(ServletContext application) {
		//jdbc driver load
		try {
			String driver = application.getInitParameter("OracleDriver");
			//DB connect!
			String url=application.getInitParameter("OracleUrl");
			//jdbc:oracle:thin:@DB IP:port Num:Serial Num
			String id = application.getInitParameter("OracleId");
			String pw = application.getInitParameter("OraclePw");
			con=DriverManager.getConnection(url,id,pw);
			System.out.println("DB연결 초기화 매개변수");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void close() {
			try {
				if(con!=null)con.close();
				System.out.println("DB 연결 해제");
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
}




