package filereader;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class fileReader {
	private String sql;
	static public String databaseUrl;
	static public String databaseUsername;
	static public String databasePassword;
	public ResultSet readFile (String sql) throws SQLException {
		this.sql=sql;
		Connection connection = DriverManager.getConnection(databaseUrl, databaseUsername, databasePassword);
		Statement statement = connection.createStatement();
		ResultSet results = statement.executeQuery(sql);
		return results;
	}
	
	public void update(String sql) throws SQLException {
		this.sql=sql;
		Connection connection = DriverManager.getConnection(databaseUrl, databaseUsername, databasePassword);
		Statement statement = connection.createStatement();
		statement.executeUpdate(sql);
	}
}
