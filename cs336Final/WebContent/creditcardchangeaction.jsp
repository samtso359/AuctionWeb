
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
		
		
		// int newuserid = Integer.parseInt(request.getParameter("userid"));
		
		
		String newcardnumber = request.getParameter("cardnumber");
		String newexpirationdate = request.getParameter("expirationdate");
		String newcardholder = request.getParameter("cardholder");
		String newcvv = request.getParameter("cvv");
		
		String str = "SELECT * FROM CreditCard WHERE cardnumber = ?";
		PreparedStatement ps1 = con.prepareStatement(str);
		ps1.setString(1, newcardnumber);
		//ps1.setString(2, newexpirationdate);
		//ps1.setString(3, newcardholder);
		//ps1.setString(4, newcvv);
		
		ResultSet result = ps1.executeQuery();
		if(result.next() == true){
			out.print("The credit card is already in use!");
		}
		else{
		str = "INSERT INTO CreditCard(cardnumber, expirationdate, cardholder, cvv)"+ "VALUES (?,?,?,?)";
		PreparedStatement ps2 = con.prepareStatement(str);
		// ps2.setInt(1, newuserid);
		ps2.setString(1, newcardnumber);
		ps2.setString(2, newexpirationdate);
		ps2.setString(3, newcardholder);
		ps2.setString(4, newcvv);
		ps2.executeUpdate();

		
		
		
		Statement st = con.createStatement();
		String str3 = "UPDATE User SET addressid = ? WHERE username = ?";
		PreparedStatement ps3 = con.prepareStatement(str3);
		String myusername = (String) session.getAttribute("user");
		ResultSet rs;
		rs = st.executeQuery("SELECT LAST_INSERT_ID()");
		rs.next();
		String hi = rs.getString(1);
		int lastaddressid = Integer.parseInt(hi);
		ps3.setString(1, newcardnumber);
		ps3.setString(2, myusername);
		ps3.executeUpdate();
			//redirect to login page
			out.print("Address has been changed");
			
		}
		//Run the query against the DB
		/*
		ResultSet result = stmt.executeQuery(str);
		
		//Start parsing out the result of the query. Don't forget this statement. It opens up the result set.
		result.next();
		//Parse out the result of the query
		int countBeers = result.getInt("cnt");

		//Populate SQL statement with an actual query. It returns a single number. The number of beers in the DB.
		str = "SELECT COUNT(*) as cnt FROM bars";
		//Run the query against the DB
		result = stmt.executeQuery(str);
		//Start parsing out the result of the query. Don't forget this statement. It opens up the result set.
		result.next();
		//Parse out the result of the query
		int countBars = result.getInt("cnt");

		//Get parameters from the HTML form at the HelloWorld.jsp
		String newBar = request.getParameter("bar");
		String newBeer = request.getParameter("beer");
		float price = Float.valueOf(request.getParameter("price"));


		//Make an insert statement for the Sells table:
		String insert = "INSERT INTO sells(bar, beer, price)"
				+ "VALUES (?, ?, ?)";
		//Create a Prepared SQL statement allowing you to introduce the parameters of the query
		PreparedStatement ps = con.prepareStatement(insert);

		//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
		ps.setString(1, newBar);
		ps.setString(2, newBeer);
		ps.setFloat(3, price);
		//Run the query against the DB
		ps.executeUpdate();

		//Check counts once again (the same as the above)
		str = "SELECT COUNT(*) as cnt FROM beers";
		result = stmt.executeQuery(str);
		result.next();
		System.out.println("Here I am!");
		int countBeersN = result.getInt("cnt");
		System.out.println(countBeersN);
		str = "SELECT COUNT(*) as cnt FROM bars";
		result = stmt.executeQuery(str);
		result.next();
		int countBarsN = result.getInt("cnt");

		//Close the connection. Don't forget to do it, otherwise you're keeping the resources of the server allocated.
		con.close();

		//Compare counts of the beers and bars before INSERT on Sells and after to figure out whether there is a bar and a beer stub records inserted by a trigger. 
		int updateBeer = (countBeers != countBeersN) ? 1 : 0;
		int updateBar = (countBars != countBarsN) ? 1 : 0;
		;
		System.out.println(updateBeer + "   " + updateBar);
		if (updateBeer > 0) {
			//Create a dynamic HTML form for beer update if needed. The form is not going to show up if the beer specified at index.jsp already exists in the database.
			out.print("Beer " + newBeer + " details: <br>");
			out.print("<form method=\"post\" action=\"newBeerDetails.jsp\">"
					+ "<table> <tr>	<td>Manf</td><td><input type=\"text\" name=\"manufacturer\"></td>   	</tr>"
					+ "</table> <br>");
		}

		if (updateBar > 0) {
			//Create a dynamic HTML form for bar update if needed. The form is not going to show up if the bar  specified at HelloWorld.jsp already exists in the database..
			//The form goes inside the HTML table too make alignment of the elements prettier.
			//See show.jsp for clear notation of the HTML table and HelloWorld.jsp for clear notation of the HTML form
			out.print("Bar " + newBar + " details: <br>");
			out.print("<table> <tr>	<td>Address</td><td><input type=\"text\" name=\"addr\"></td>   	</tr>"
					+ " 	<tr>  	<td>License</td><td><input type=\"text\" name=\"license\"></td> 	</tr>"
					+ "	<tr>  	<td>City</td><td><input type=\"text\" name=\"city\"></td> 	</tr>"
					+ "	<tr>  	<td>Phone</td><td><input type=\"text\" name=\"phone\"></td> 	</tr>"
					+ "</table> <br> <input type=\"submit\" value=\"submit\">"
					+
					//use hidden inputs to pass the new beer and new bar keys as well as requiresUpdate flags to the update page.
					"<input type=\"hidden\" name=\"bar\" value=\""
					+ newBar
					+ "\"/>"
					+ "<input type=\"hidden\" name=\"beer\" value=\""
					+ newBeer
					+ "\"/>"
					+ "<input type=\"hidden\" name=\"ubar\" value=\""
					+ Integer.toString(updateBar)
					+ "\"/>"
					+ "<input type=\"hidden\" name=\"ubeer\" value=\""
					+ Integer.toString(updateBeer) + "\"/>" + "</form>");
		}
	*/
	} catch (Exception ex) {
		out.print(ex);
		out.print("failed");
	}
%>

</body>
</html>