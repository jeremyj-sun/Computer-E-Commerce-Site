<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.ArrayList" import="user.Product"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product Description</title>
</head>
<body>
<% String description = (String) request.getAttribute("description");
String image = (String) request.getAttribute("image");
%>

<img src="/WebApplication/Images/<%=image%>" height="100" width="100">
<br>
<% out.println(description);%>


</body>
</html>