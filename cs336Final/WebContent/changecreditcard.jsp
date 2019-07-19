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

Change My CreditCard
<br>
	<form method="post" action="creditcardchangeaction.jsp">
	<table>
	<tr>
	 
	<td>Card Number</td><td><input type="text" name="cardnumber"></td>
	</tr>
	<tr>
	<td>Expiration Date</td><td><input type="date" name="expirationdate"></td>
	</tr>
	</tr>
	<td>Card Holder</td><td><input type = "text" name = "cardholder"></td>
	</tr>
	</tr>
	<td>CVV</td><td><input type = "text" name = "cvv"></td>
	</table>
	<input type="submit" value="submit">
	</form>
<br>
</body>
</html>