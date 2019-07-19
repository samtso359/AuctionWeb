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
	<%try{

		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Create a SQL statement

		//Populate SQL statement with an actual query. It returns a single number. The number of beers in the DB.
		String username = (String) session.getAttribute("user");
		int itemid = Integer.parseInt(request.getParameter("itemid"));
		int bidamount = Integer.parseInt(request.getParameter("bidamount"));
		int upperlimit = Integer.parseInt(request.getParameter("upperlimit"));
		int autobidincrement = Integer.parseInt(request.getParameter("autobidincrement"));
		String updatebid = "UPDATE Bidson SET bidamount = ?";
		String check = "SELECT * FROM Bidson WHERE itemid = ?";
		String str = "INSERT INTO Bidson(username, itemid, bidamount, upperlimit, autobidincrement) VALUES (?,?,?,?,?)";
		String str2 = "INSERT INTO History(username, itemid, bidamount, upperlimit, autobidincrement) VALUES (?,?,?,?,?)";
		PreparedStatement ps1 = con.prepareStatement(str);
		PreparedStatement ps2 = con.prepareStatement(str2);
		PreparedStatement bidsonexists = con.prepareStatement(check);
		PreparedStatement updatebidson = con.prepareStatement(updatebid);
		bidsonexists.setInt(1,itemid);
		ResultSet exists = bidsonexists.executeQuery();
		if(exists.next() == false){
		ps1.setString(1, username);
		ps1.setInt(2, itemid);
		ps1.setInt(3, bidamount);
		ps1.setInt(4, upperlimit);
		ps1.setInt(5, autobidincrement);
		ps1.executeUpdate();
		}
		else{
		updatebidson.setInt(1,bidamount);
		updatebidson.executeUpdate();	
		}
		ps2.setString(1, username);
		ps2.setInt(2, itemid);
		ps2.setInt(3, bidamount);
		ps2.setInt(4, upperlimit);
		ps2.setInt(5, autobidincrement);
		ps2.executeUpdate();
		String str3 = "SELECT * FROM Item WHERE itemid = ?";
		PreparedStatement ps3 = con.prepareStatement(str3);
		ps3.setInt(1, itemid);
		ResultSet rs = ps3.executeQuery();
		rs.next();
		String str4 = "UPDATE BidInfo SET currentbidprice = ?,currhighbidname = ? WHERE bidid = ?";
		PreparedStatement ps4 = con.prepareStatement(str4);
		ps4.setInt(1, bidamount);
		ps4.setString(2,username);
		ps4.setInt(3, Integer.parseInt(rs.getString(3)));
		ps4.executeUpdate();
		
		%>
		<h3>Bid has been added</h3>
		<a href = /cs336Final/checkitem.jsp>Check out all the items you are currently selling and bidding on.</a>
	<%
	} catch (Exception ex) {
		%>
		<script>
		alert("A field has not been filled out");
		var redirect = "createitem.jsp";
	    window.location.href = redirect;
	    </script>
	  	<%	
	}
	
%>

</body>
</html>