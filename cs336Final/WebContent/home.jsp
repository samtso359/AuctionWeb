<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<script>

</script>
</head>
<body style="background-color:#f5f5f5">

<h1>BuyMe!</h1>

<%  String temp = session.getAttribute("isAdmin").toString(); 
	int mode = Integer.parseInt(temp);
	%>
    
<p>
<a href=/cs336Final/createitem.jsp>Sell an Item</a> |
<a href=/cs336Final/createalert.jsp>Create an Alert</a> |
<a href=/cs336Final/checkitem.jsp>Check the items you're currently selling!</a>
<a href=/cs336Final/transaction.jsp>Check your purchase history!</a>
<a href=/cs336Final/profile.jsp>Profile</a> |
<% if(mode==0){%>
<a href=/cs336Final/forum.jsp>Question Forum</a>
<%}
else{ %>
<a href=/cs336Final/forum_ans.jsp>Go to Forum</a>
<%} %>

</p>
	<form method="post" action="searchresult.jsp" style = "border: 1px solid rgba(118,118,118,0.1);
	">
	<h2>Search for and Buy an Item!</h2>
	<table>
	<tr>    
	<td>Item Name:</td><td><input type="text" name="itemname"></td>
	</tr>
	<tr>
	<td>OR</td>
	</tr>
	<tr>
	<td>Type in a Category From:</td>
	</tr>
	<tr>
	<td><input type="radio" name="itemcategory" value = "CPU">CPU
	<input type="radio" name="itemcategory" value = "GPU">GPU
	<input type="radio" name="itemcategory" value = "Keyboard">Keyboard
	<input type="radio" name="itemcategory" value = "Mouse">Mouse
	<input type="radio" name="itemcategory" value = "Monitor">Monitor</td>
	</tr>
	</table>
	<br>
	<input type="submit" value="submit">
	</form>
</body>
</html>