package connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class OracleConnection {
	static Connection con;
	
	//define and initialize database driver
	private static final String DB_DRIVER = "oracle.jdbc.driver.OracleDriver";
	//private static final String DB_DRIVER = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	
	//define and initialize database url
	private static final String DB_CONNECTION = "jdbc:oracle:thin:@localhost:1521:xe";
	//private static final String DB_CONNECTION = "jdbc:sqlserver://nuggeteyewear.database.windows.net:1433;database=NuggetEyewear;user=POKEMON@nuggeteyewear;password=Nugget123;encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;";
	
	//define and initialize database user
	private static final String DB_USER = "POKEMON";
	
	//define and initialize database password
	private static final String DB_PASSWORD = "system";
	
	public static Connection getConnection() {
	
		try {
			//1. load the driver
			Class.forName(DB_DRIVER);
			
			try {
				//2. create connection
				con = DriverManager.getConnection(DB_CONNECTION,DB_USER,DB_PASSWORD);
				//con = DriverManager.getConnection(DB_CONNECTION);
				System.out.println("Connected");
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}		
		return con;
	}
}
