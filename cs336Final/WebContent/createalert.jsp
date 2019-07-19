<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>

</head>
<body style="background-color:#f5f5f5">
<h1>Create an Alert!</h1>
<a href=/cs336Final/home.jsp>Home</a> 
	<form method="post" action="newalert.jsp" style = "border: 1px solid rgba(118,118,118,0.1);
	">
	<h2>Alert Information Form:</h2>
	<table>
	<tr>    
	<td>Alert Name:</td><td><input type="text" name="name"></td>
	</tr>
	<tr>    
	<td>Item Name:</td><td><input type="text" name="itemname"></td>
	</tr>
	<tr>    
	<td>Conditions:</td><td><input type="text" name="conditions"></td>
	</tr>
	<tr>    
	<td>Maximum Price:</td><td><input type="text" name="price"></td>
	</tr>
	</table>
	<br>
	<input type="submit" value="Create Alert">
	</form>
</body>
</html>
