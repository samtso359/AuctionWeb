<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Your Account</title>
</head>
<body>
<a href=/cs336Final/home.jsp>Home</a> 
<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();
		String myusername = (String) session.getAttribute("user");
		//out.println(myusername);

		//Populate SQL statement with an actual query. It returns a single number. The number of beers in the DB.
		
		
		
		
		
		String str = "SELECT * FROM Item WHERE seller = ?";
		PreparedStatement ps1 = con.prepareStatement(str);
		ps1.setString(1, myusername);
		ResultSet result = ps1.executeQuery();
		
		
		

		%>










<h1>My Account</h1>
<h2>My info</h2>

	<h4>Username:</h4> <%out.print((String) session.getAttribute("user")); %>    

	<h4>My Address:</h4>  <a href=/cs336Final/changeaddress.jsp>Change your address</a>
	<%
	String addressidquery = "SELECT * FROM User WHERE username = ? and addressid IS NOT NULL";
	PreparedStatement getaddressid = con.prepareStatement(addressidquery);
	getaddressid.setString(1, myusername);
	ResultSet addressidresult = getaddressid.executeQuery();

	if(addressidresult.next() == false){
		%>
		<br>
		<%
		out.print("No Address Connected to this account");
	}
	else if (addressidresult.getInt(1) >= 0){
		out.print(addressidresult.getString(1));
		String addressquery = "SELECT * FROM Address WHERE addressid = ?";
		PreparedStatement getaddress = con.prepareStatement(addressquery);
		%>
		<br>
		<%
		getaddress.setInt(1, Integer.parseInt(addressidresult.getString(1)));
		ResultSet addressresult = getaddress.executeQuery();
		addressresult.next();
		out.print(addressresult.getInt(2));
		out.print(" ");
		out.print(addressresult.getString(3));
		out.print(", ");
		out.print(addressresult.getString(4));
		out.print(", ");
		out.print(addressresult.getString(5));
		out.print(", ");
		out.print(addressresult.getString(6));

	}
	else{
		%>
		<br>
		<%
		out.print("No Address Connected to this account");
	}
	%>

	<h4>My CreditCard:</h4>
	<a href=/cs336Final/changecreditcard.jsp>Change your Credit Card</a>
	
	<h3>Selling:</h3>
	<table border = "1">
		<tr>
			<th>ItemID</th>
			<th>Name</th>
			<th>Category</th>
			<th>Condition</th>
			<th>Description</th>
		</tr>
		<%
		while(result.next() != false){
		%>
		<tr>
			<td><%out.print(result.getString("itemid"));%></td>
			<td><%out.print(result.getString("name"));%></td>
			<td><%out.print(result.getString("category"));%></td>
			<td><%out.print(result.getString("conditions"));%></td>
			<td><%out.print(result.getString("description")); %></td>
		</tr>
		<%
		}
		%> </table>
		
		
		
		
		
		
		
		<h3>Alerts:</h3>
		<%
		str = "SELECT * FROM Alert WHERE username = ?";
		ps1 = con.prepareStatement(str);
		ps1.setString(1, myusername);
		result = ps1.executeQuery(); %>
	<table border = "1">
		<tr>
			<th>Alertid</th>
			<th>Name</th>
			<th>Item Name</th>
			<th>Status</th>
			<th>Condition</th>
			<th>Price</th>
		</tr>
		
		
		
		<%
		while(result.next() != false){
		%>
		<tr>
			<td><%out.print(result.getString("alertid"));%></td>
			<td><%out.print(result.getString("name"));%></td>
			<td><%out.print(result.getString("itemname"));%></td>
			<td><%out.print(result.getString("status"));%></td>
			<td><%out.print(result.getString("conditions")); %></td>
			<td><%out.print(result.getString("price")); %></td>
			
		</tr>
		<%
		}
		%> </table>
		
		
		
		
		<h3>Buying:</h3>
		<%
		str = "SELECT * FROM History WHERE username = ?";
		ps1 = con.prepareStatement(str);
		ps1.setString(1, myusername);
		result = ps1.executeQuery(); 
		while (result.next() == true){
			int itembuying = result.getInt("itemid");
			out.print(itembuying);
		}
		%>
	<table border = "1">
		<tr>
			<th></th>
			<th>Name</th>
			<th>Item Name</th>
			<th>Status</th>
			<th>Condition</th>
			<th>Price</th>
		</tr>
		
		
		
		<%
		while(result.next() != false){
		%>
		<tr>
			<td><%out.print(result.getString("alertid"));%></td>
			<td><%out.print(result.getString("name"));%></td>
			<td><%out.print(result.getString("itemname"));%></td>
			<td><%out.print(result.getString("status"));%></td>
			<td><%out.print(result.getString("conditions")); %></td>
			<td><%out.print(result.getString("price")); %></td>
			
		</tr>
		<%
		}
		%> </table>
		
		
		
		
		
		
		
				<%
	} catch (Exception ex) {
		out.print(ex);
		out.print("Search failed");
	}
%>


</body>
</html>