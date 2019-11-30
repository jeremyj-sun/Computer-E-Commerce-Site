<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="user.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Successful!</title>
</head>
<body>
Login Successful!
<%
User user = (User) session.getAttribute("user");
%>

Hello <%=user.getFirstname()%> <%=user.getLastname()%>! <br>
Welcome to Jeremy's Computers! 
<br>

<p>
<form action="viewAll" method="post">
	<input type="submit" value="View All">
</form>
</p>

<p>
<b> Search by brand: </b>
<form action="searchByBrand" method="post">
	<input type="radio" name="brand" value="HP"> HP <br>
	<input type="radio" name="brand" value="Acer"> Acer <br>
	<input type="radio" name="brand" value="Apple"> Apple <br>
	<input type="radio" name="brand" value="Lenovo"> Lenovo <br>
	<input type="radio" name="brand" value="Dell"> Dell <br>
	<input type="submit" value="Search">
</form>
</p>

<p> 
<b> Search by name: </b>
<form action="searchByName" method="post">
	<input type="search" name="name">
	<input type="submit" value="Search">
</form>
</p>

</body>
</html>