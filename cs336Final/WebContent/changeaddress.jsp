<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Address Form</title>
</head>
<body>
<a href=/cs336Final/home.jsp>Home</a> 
Change My Address
<br>
	<form method="post" action="addresschangeaction.jsp">
	<table>
	<tr>
	 
	<td>House Number</td><td><input type="text" name="housenumber"></td>
	</tr>
	<tr>
	<td>Street</td><td><input type="text" name="street"></td>
	</tr>
	</tr>
	<td>State</td><td><input type = "text" name = "state"></td>
	</tr>
	</tr>
	<td>Zipcode</td><td><input type = "text" name = "zipcode"></td>
	</tr>
	</tr>
	<td>Country</td><td><input type = "text" name = "country"></td>
	</table>
	<input type="submit" value="submit">
	</form>
<br>
</body>
</html>