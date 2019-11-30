<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
<h1><font color="blue" face="Arial">Welcome to Jeremy's Computers</font></h1>
<p>Please enter your username and password, or register below. </p>
<form action="login" method="post"> 
	<br> Username: <input type="text" name="username">
	<br> Password: <input type="password" name="password">
	<br> <input type="submit" value="Login"> 
</form>
<br><a href="register.jsp">Register</a>
</body>
</html>