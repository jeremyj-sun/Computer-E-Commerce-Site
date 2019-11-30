<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.ArrayList" import="user.Product"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search results</title>
</head>
<body>
<% 
ArrayList <String> products = (ArrayList<String>) request.getAttribute("products");
ArrayList <Product> productDetails = (ArrayList<Product>) session.getAttribute("productDetails");
%>
<%for (int i = 0; i < products.size(); i++) { %>
	
<a href="/WebApplication/viewProduct?ID=<%=i%>" >
<%out.println(products.get(i)); %>
</a>
<br>
<%
}
%>
<%if (products.size() == 0){
	out.println("No products matched your search.");
%>
<button onclick="window.location.href='success.jsp'"> Try Again </button>
<%
}
%>
</body>
</html>