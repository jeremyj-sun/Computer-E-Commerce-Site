package user;

import java.sql.ResultSet;
import java.sql.SQLException;

import filereader.fileReader;

public class UserService {
	public User login (String username, String password) {
		String sql = "select * from customers "
				+ "where username = '" + username 
				+ "' and pass_word = '" + password +"'";
		fileReader read = new fileReader ();
		try {
			ResultSet results = read.readFile(sql);
			if (results.next()) {
				User user = new User ();
				user.setFirstname(results.getString("firstname"));
				user.setLastname(results.getString("lastname"));
				user.setUsername(username);
				return user;
			}
			else {
				return null;
			}
		}catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	public boolean register(String firstname, String lastname, String username, String password, String confirmPassword) {
		String sql = "select * from customers where username = '" + username + "'";
		fileReader read = new fileReader();
		try {
			ResultSet results = read.readFile(sql);
			if (confirmPassword.equals(password) && results.next()==false) {
				String update = "insert into customers values (null, '"
						+ firstname + "' ,'"+ lastname + "' ,'"+ username +"' ,'"+ password +"')";
				read.update(update);
				return true;
			}
			return false;
		} catch (Exception exc) {
			exc.printStackTrace();
			return false;
		}
	}
}
