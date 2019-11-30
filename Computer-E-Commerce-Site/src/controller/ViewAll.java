package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import user.Product;
import user.ProductService;

/**
 * Servlet implementation class ViewAll
 */
@WebServlet("/viewAll")
public class ViewAll extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch (Exception exc) {
			exc.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ArrayList <String> products = new ArrayList <String> ();
		ArrayList <Product> productDetails = (new ProductService()).viewAll();
		for(Product p:productDetails) {
			products.add
			(p.getBrand() + " " 
					+ p.getName()+ " $" 
					+ p.getPrice() + " Rating: "
					+ p.getRating());
		}
		
		try {
			request.setAttribute("products", products);
			HttpSession session = request.getSession();
			session.setAttribute("productDetails", productDetails);
			RequestDispatcher dispatcher = request.getRequestDispatcher("results.jsp");
			dispatcher.forward(request, response);
		} catch (Exception exc) {
			exc.printStackTrace();
		}
	}

}
