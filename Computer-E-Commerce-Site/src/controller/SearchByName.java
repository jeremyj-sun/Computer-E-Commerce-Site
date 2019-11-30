package controller;

import java.io.IOException;
import java.sql.DriverManager;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import filereader.fileReader;
import user.Product;
import user.ProductService;

import java.sql.*;
/**
 * Servlet implementation class SearchByName
 */
@WebServlet("/searchByName")
public class SearchByName extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		try {
			Class.forName("com.mysql.jdbc.Driver");
		}catch (Exception exc) {
			exc.printStackTrace();
		}
	}   
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList <String> products = new ArrayList <String> ();
		String name = request.getParameter("name");
		ArrayList<Product> productDetails = (new ProductService()).searchProductsByName(name);
		for(Product p:productDetails) {
			products.add
			(p.getBrand() + " " 
					+ name+ " $" 
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
