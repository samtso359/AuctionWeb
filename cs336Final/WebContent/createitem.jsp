<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sell Item!</title>

</head>
<body style="background-color:#f5f5f5">
<a href=/cs336Final/home.jsp>Home</a> 
<h1>Sell an Item!</h1>
	<form method="post" action="additem.jsp" style = "border: 1px solid rgba(118,118,118,0.1);
	">
	<h2>Item Information Form:</h2>
	<table>
	<tr>    
	<td>Name:</td><td><input type="text" name="itemname"></td>
	</tr>
	<tr>    
	<td>Condition:</td>
	<td><input type="radio" name="itemcondition" value ="Mint">Mint
	<input type="radio" name="itemcondition" value = "Moderately Used">Moderately Used
	<input type="radio" name="itemcondition" value = "Heavily Used">Heavily Used
	<input type="radio" name="itemcondition" value = "Poor">Poor
	</td>
	</tr>
	<tr>    
	<td>Category:</td>
	<td>
	<input type="radio" name="category" value = "CPU">CPU
	<input type="radio" name="category" value = "GPU">GPU
	<input type="radio" name="category" value = "Keyboard">Keyboard
	<input type="radio" name="category" value = "Mouse">Mouse
	<input type="radio" name="category" value = "Monitor">Monitor
	</td>
	</tr>
	<tr>    
	<td>Description:</td><td><input type="text" name="description"></td>
	</tr>
	<tr>    
	<td>Starting Price:</td><td><input type="text" name="startprice"></td>
	</tr>
	<tr>    
	<td>Minimum Price:</td><td><input type="text" name="minprice"></td>
	</tr>
	<tr>    
	<td>Minimum Bid Increment:</td><td><input type="text" name="minbid"></td>
	</tr>
	<tr>    
	<td>Date Bidding Begins:</td><td><input type="date" name="datebegin"></td>
	</tr>
	<tr>    
	<td>Date Bidding Ends:</td><td><input type="date" name="dateend"></td>
	</tr>
	</table>
	<br>
	<input type="submit" value="Sell!">
	</form>
</body>
</html>
