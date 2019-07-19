<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Check Items</title>
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

		//Populate SQL statement with an actual query. It returns a single number. The number of beers in the DB.
		String username = (String) session.getAttribute("user");
		String str = "SELECT * FROM Item WHERE seller = ?";
		String str6 = "SELECT * FROM Item WHERE itemid = ?";
		String str5 = "SELECT * FROM Bidson WHERE username = ?";
		String str2 = "SELECT * FROM BidInfo WHERE bidid = ?";
		String str3 = "SELECT * FROM Bidson WHERE itemid = ?";
		PreparedStatement ps1 = con.prepareStatement(str);
		PreparedStatement ps2 = con.prepareStatement(str2);
		PreparedStatement ps3 = con.prepareStatement(str3);
		PreparedStatement ps5 = con.prepareStatement(str5);
		PreparedStatement ps6 = con.prepareStatement(str6);
		ps1.setString(1, username);
		ResultSet result = ps1.executeQuery();
		ResultSet rs;
		ResultSet rs2;
		ResultSet rs3;
		ResultSet rs4;
		%>
		<h2>Items Selling:</h2>
		<table border = "1">
		<tr>
			<th>ItemID</th>
			<th>Name</th>
			<th>Category</th>
			<th>Condition</th>
			<th>Description</th>
			<th>Starting Price</th>
			<th>Minimum Price (Hidden to Others)</th>
			<th>Minimum Bid Increment</th>
			<th>Current Bid Price</th>
			<th>Date Bidding Begins</th>
			<th>Date Bidding Ends</th>
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
		<%
		ps2.setString(1, result.getString("bidid"));
		rs = ps2.executeQuery();
		rs.next();
		%>
		<td>$<%out.print(rs.getString("startingprice"));%></td>
		<td>$<%out.print(rs.getString("minprice"));%></td>
		<td>$<%out.print(rs.getString("minbidincrement"));%></td>
		<td>$<%out.print(rs.getString("currentbidprice"));%></td>
		<td><%out.print(rs.getString("datebiddingbegins"));%></td>
		<td><%out.print(rs.getString("datebiddingends"));%></td>
		<tr>
		<br>
		<%
		}
		ps5.setString(1,username);
		rs2 = ps5.executeQuery();
		%> </table>	
		<h2>Items Bidding On:</h2>
		<table border = "1">
		<tr>
			<th>ItemID</th>
			<th>Name</th>
			<th>Category</th>
			<th>Condition</th>
			<th>Description</th>
			<th>Starting Price</th>
			<th>Minimum Bid Increment</th>
			<th>Current Bid Price</th>
			<th>Date Bidding Begins</th>
			<th>Date Bidding Ends</th>
			<th>Your Bid Amount</th>
			<th>UpperLimit</th>
			<th>AutoBid Increment</th> 
		</tr>
		<%
		while(rs2.next() != false){
		ps6.setInt(1, Integer.parseInt(rs2.getString(2)));
		ResultSet rs123 = ps6.executeQuery();
		rs123.next();
		ps2.setInt(1, Integer.parseInt(rs123.getString(3)));
		ResultSet rs1234 = ps2.executeQuery();
		rs1234.next();
		
		%>
		<tr>
			<td><%out.print(rs123.getString("itemid"));%></td>
			<td><%out.print(rs123.getString("name"));%></td>
			<td><%out.print(rs123.getString("category"));%></td>
			<td><%out.print(rs123.getString("conditions"));%></td>
			<td><%out.print(rs123.getString("description")); %></td>
		<%
		ps3.setInt(1, Integer.parseInt(rs123.getString(2)));
		rs4 = ps3.executeQuery();
		rs4.next();
		%>
		<td>$<%out.print(rs1234.getString("startingprice"));%></td>
		<td>$<%out.print(rs1234.getString("minbidincrement"));%></td>
		<td>$<%out.print(rs1234.getString("currentbidprice"));%></td>
		<td><%out.print(rs1234.getString("datebiddingbegins"));%></td>
		<td><%out.print(rs1234.getString("datebiddingends"));%></td>
		<td><%out.print(rs4.getString("bidamount")); %></td>
		<td><%out.print(rs4.getString("upperlimit")); %></td>
		<td><%out.print(rs4.getString("autobidincrement")); %></td>
		</tr>
		<%
		}
	} catch (Exception ex) {
		out.print(ex);
		out.print("Search failed");
	}
%>

</body>
</html>