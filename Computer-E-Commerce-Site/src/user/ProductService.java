package user;

import java.sql.ResultSet;
import java.util.ArrayList;

import filereader.fileReader;

public class ProductService {
	public ArrayList<Product> searchProductsByBrand(String brand) {
		ArrayList <Product> productDetails = new ArrayList <Product>();

		String sql = "select * from products where brand = '" + brand + "'";
		fileReader read = new fileReader ();
		try {
			ResultSet results = read.readFile(sql);
			while (results.next()) {
				String description = results.getString("description");
				int id = results.getInt("id");
				double price = results.getDouble("price");
				String rating = results.getString("rating");
				String name = results.getString("name");
				String image = results.getString("image");
				
				Product product = new Product();
				product.setName(name);
				product.setBrand(brand);
				product.setDescription(description);
				product.setId(id);
				product.setPrice(price);
				product.setRating(rating);
				product.setImage(image);
				productDetails.add(product);
				
			}
			
			return productDetails;
		} catch (Exception exc) {
			exc.printStackTrace();
			return null;
		}

	}
	public ArrayList<Product> searchProductsByName(String name){
		ArrayList <Product> productDetails = new ArrayList <>();
		fileReader read = new fileReader ();
		String sql = "select * from products where name = '" + name + "'";
		try {
			ResultSet results = read.readFile(sql);
			while (results.next()) {
				String description = results.getString("description");
				int id = results.getInt("id");
				double price = results.getDouble("price");
				String rating = results.getString("rating");
				String brand = results.getString("brand");
				String image = results.getString("image");
				
				Product product = new Product();
				product.setName(name);
				product.setBrand(brand);
				product.setDescription(description);
				product.setId(id);
				product.setPrice(price);
				product.setRating(rating);
				product.setImage(image);
				productDetails.add(product);
			}
			return productDetails;
			
		}catch (Exception exc) {
			exc.printStackTrace();
			return null;
		}
	}
	public ArrayList<Product> viewAll(){
		ArrayList <Product> productDetails = new ArrayList <>();
		fileReader read = new fileReader();
		String sql= "select * from products";
		try {
			ResultSet results = read.readFile(sql);
			while (results.next()) {
				String description = results.getString("description");
				int id = results.getInt("id");
				double price = results.getDouble("price");
				String rating = results.getString("rating");
				String brand = results.getString("brand");
				String name = results.getString("name");
				String image = results.getString("image");

				Product product = new Product();
				product.setName(name);
				product.setBrand(brand);
				product.setDescription(description);
				product.setId(id);
				product.setPrice(price);
				product.setRating(rating);
				product.setImage(image);
				productDetails.add(product);
			}
			return productDetails;
			
		}catch  (Exception exc) {
			exc.printStackTrace();
			return null;
		}
	}
}
