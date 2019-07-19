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
<script>
function redirect()
{
    var redirect = "forum_ans.jsp";
    window.location.href = redirect;
}
</script>
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
		String myusername = (String) session.getAttribute("user");
		
		
		String message = request.getParameter("message");
		String mid = request.getParameter("mid").toString();
		
		
		String str = "UPDATE Forum SET answer = ?, answerby = ? WHERE messageid = ?";
		PreparedStatement ps2 = con.prepareStatement(str);
		
		ps2.setString(1, message);
		
		ps2.setString(2, myusername);
		
	
	    
		
		ps2.setString(3, mid);
		ps2.executeUpdate();
	
		
		    
	
	} catch (Exception ex) {
		out.print(ex);
		out.print("insert failed");
	}
%>
  <script>
  redirect();
  </script>
</body>
</html>