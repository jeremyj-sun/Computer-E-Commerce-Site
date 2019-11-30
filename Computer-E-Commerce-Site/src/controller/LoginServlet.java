package controller;

import java.io.IOException;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import filereader.fileReader;
import user.User;
import user.UserService;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
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
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username, password;
		username = request.getParameter("username");
		password = request.getParameter("password");
		UserService userservice = new UserService();
		User user = userservice.login(username,password);
		
		if (user==null) {
			System.out.println("Incorrect Username or Password. Try Again.");
			response.sendRedirect("login.jsp");
		}
		else {
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			RequestDispatcher dispatcher = request.getRequestDispatcher("success.jsp");
			dispatcher.forward(request, response);
		}
	}

}
