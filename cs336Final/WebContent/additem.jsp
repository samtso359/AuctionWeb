<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.SimpleDateFormat,java.util.Date"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Added Item</title>
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
		String sessiondate = (String) session.getAttribute("sessdate");
		Date curr = new SimpleDateFormat("yyyy/MM/dd").parse(sessiondate);
		String newname = request.getParameter("itemname");
		String newcondition = request.getParameter("itemcondition");
		String newcategory = request.getParameter("category");
		String newdescription = request.getParameter("description");
		int startingprice = Integer.parseInt(request.getParameter("startprice"));
		int minprice = Integer.parseInt(request.getParameter("minprice"));
		int minbidincrement = Integer.parseInt(request.getParameter("minbid"));
		String datebiddingbegins = request.getParameter("datebegin");
		Date date1 = new SimpleDateFormat("yyyy-MM-dd").parse(datebiddingbegins);
		String datebiddingends = request.getParameter("dateend");
		Date date2 = new SimpleDateFormat("yyyy-MM-dd").parse(datebiddingends);
		if(date1.compareTo(date2)>=0){
			%>
			<script>
			alert ( "Date begin cannot be after or equal to Date End" );
			var redirect = "createitem.jsp";
			window.location.href = redirect;
			</script>
			<%
			return;
		}
		if(curr.compareTo(date1) > 0){
			%>
			<script>
			alert ( "Date begin cannot be after the current date" );
			var redirect = "createitem.jsp";
			window.location.href = redirect;
			</script>
			<%
		}
		if(curr.compareTo(date2) > 0){
			%>
			<script>
			alert ( "Date End cannot be after the current date" );
			var redirect = "createitem.jsp";
			window.location.href = redirect;
			</script>
			<%
		}
		String seller = username;
		String str = "INSERT INTO Item(name, conditions, category, description, seller, bidid) VALUES (?,?,?,?,?,?)";
		String str2 = "INSERT INTO BidInfo(startingprice, minprice, minbidincrement, datebiddingbegins, datebiddingends) VALUES(?,?,?,?,?)";
		String str3 = "SELECT LAST_INSERT_ID()";
		PreparedStatement ps1 = con.prepareStatement(str);
		PreparedStatement ps2 = con.prepareStatement(str2);
		Statement st = con.createStatement();
	    ResultSet rs;
	    
		ps1.setString(1, newname);
		ps1.setString(2, newcondition);
		ps1.setString(3, newcategory);
		ps1.setString(4, newdescription);
		ps1.setString(5, seller);
		ps2.setInt(1, startingprice);
		ps2.setInt(2, minprice);
		java.sql.Date date3 = new java.sql.Date(date1.getTime());
		java.sql.Date date4 = new java.sql.Date(date2.getTime());

		ps2.setDate(4, date3);
		ps2.setInt(3, minbidincrement);
		ps2.setDate(5, date4);
		ps2.executeUpdate();
		rs = st.executeQuery("SELECT LAST_INSERT_ID()");
		rs.next();
		String hi = rs.getString(1);
		int bidid = Integer.parseInt(hi);
		ps1.setInt(6, bidid);
		ps1.executeUpdate();
		
		//think of adding Bidid as part of item and removing seller of since item has seller already
		%>
		<h3>Item has been added.</h3>
		<a href = /cs336Final/checkitem.jsp>Check out all the items you are currently selling and bidding on.</a>
	<%
	} catch (Exception ex) {
		out.print(ex);
		%>
		<script>
		//alert ( "All fields must be filled out!" );
		//var redirect = "createitem.jsp";
		//window.location.href = redirect;
	</script>	
		<%
	}
%>

</body>
</html>