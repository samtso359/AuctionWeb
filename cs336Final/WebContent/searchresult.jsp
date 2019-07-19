<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	try {

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement
		Statement stmt = con.createStatement();

		//Populate SQL statement with an actual query. It returns a single number. The number of beers in the DB.
		
		String itemname = request.getParameter("itemname");
		String itemcategory = request.getParameter("itemcategory");
		String str = "SELECT * FROM Item WHERE name = ?";
		String str2 = "SELECT * FROM BidInfo WHERE bidid = ?";
		PreparedStatement ps1 = con.prepareStatement(str);
		PreparedStatement ps2 = con.prepareStatement(str2);
		ResultSet rs;
		if(itemname.equals("") == false){
			ps1.setString(1,itemname);
		}
		else{
			
			str = "SELECT * FROM Item WHERE category = ?";
			ps1 = con.prepareStatement(str);
			ps1.setString(1,itemcategory);
		}
		ResultSet result = ps1.executeQuery();
		%>
		<h3>Bid on an Item!:</h3>
		<form method="post" action="biditem.jsp">
		<table>
		<tr>    
		<td>ItemID:</td><td><input type="text" name="itemid"></td>
		<td>Bid Amount:</td><td><input type="text" name="bidamount"></td>
		<td>UpperLimit:</td><td><input type="text" name="upperlimit"></td>
		<td>AutoBid Increment:</td><td><input type="text" name="autobidincrement"></td>
		<td>
		</tr>
		</table>
		<input type="submit" value="submit">
		</form>
		<h2>Search Results By "
		<%
		if(itemname.equals("") == false){
			out.print(itemname);
		}
		else{
			out.print(itemcategory);
		}
		%> " :</h2>
		<table border="1">
		<tr>
			<th>ItemID</th>
			<th>Seller</th>
			<th>Name</th>
			<th>Category</th>
			<th>Condition</th>
			<th>Description</th>
			<th>Starting Price</th>
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
			<td><%out.print(result.getString("seller"));%></td>
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
		<td>$<%out.print(rs.getString("minbidincrement"));%></td>
		<td>$<%out.print(rs.getString("currentbidprice"));%></td>
		<td><%out.print(rs.getString("datebiddingbegins"));%></td>
		<td><%out.print(rs.getString("datebiddingends"));%></td>
		<tr>
		<br>
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