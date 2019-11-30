package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import filereader.fileReader;
import user.User;
import user.UserService;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig servletConfig) throws ServletException{
		try {
			super.init(servletConfig);
			ServletContext context = getServletContext();
			fileReader.databaseUrl = context.getInitParameter("databaseUrl");
			fileReader.databaseUsername = context.getInitParameter("databaseUsername");
			fileReader.databasePassword = context.getInitParameter("databasePassword");			
			System.out.println(fileReader.databaseUrl);
			System.out.println(fileReader.databaseUsername);
			System.out.println(fileReader.databasePassword);
			Class.forName("com.mysql.jdbc.Driver");
		}catch (Exception exc) {
			exc.printStackTrace();
		}
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String firstname, lastname, username, password, confirmPassword;
		firstname=request.getParameter("firstname");
		lastname=request.getParameter("lastname");
		username=request.getParameter("username");
		password=request.getParameter("password");
		confirmPassword=request.getParameter("confirmPassword");
		UserService userService = new UserService ();
		
		if (userService.register(firstname, lastname, username, password, confirmPassword)) {
			System.out.println("Registration Successful");
			response.sendRedirect("login.jsp");
		}
		else {
			System.out.println("Try Again");
			response.sendRedirect("register.jsp");
		}
	}

}
