<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BuyMe Sign Up!</title>
</head>
<body>

Sign Up
<br>
	<form method="post" action="newUser.jsp">
	<table>
	<tr>
	
	<!-- <td>userid</td><td><input type= "text" name ="userid"></td>
	<tr> -->   
	<td>Username</td><td><input type="text" name="username"></td>
	</tr>
	<tr>
	<td>Password</td><td><input type="password" name="password"></td>
	</tr>
	</tr>
	<td>Email</td><td><input type = "text" name = "email"></td>
	</table>
	<input type="submit" value="submit">
	</form>
<br>
</body>
</html>