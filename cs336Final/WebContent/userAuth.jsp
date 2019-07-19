<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<!--Import some libraries that have classes that we need -->
<%@ page import="java.io.*,java.util.*,java.sql.*,java.util.Date,java.text.SimpleDateFormat,java.text.DateFormat"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<script>
function loginerror()
{
	alert ( "Incorrect Login or Password, Try Again." );
    var redirect = "login.jsp";
    window.location.href = redirect;
}
function loginsucess1()
{
	alert ( "Welcome!" );
    var redirect = "home.jsp";
	window.location.href = redirect;}


function loginsucess2()
{
	alert ( "Welcome Admin!" );
	
    var redirect = "home.jsp";
	window.location.href = redirect;}


function loginsucess3()
{
	
	alert ( "Welcome Customer Rep!" );
    var redirect = "home.jsp";
	window.location.href = redirect;}
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
		
		String newusername = request.getParameter("username");
		String newpassword = request.getParameter("password");
		String str = "SELECT * FROM User WHERE username = ? AND password = ?";
		PreparedStatement ps1 = con.prepareStatement(str);
		ps1.setString(1, newusername);
		ps1.setString(2, newpassword);
		DateFormat datedate = new SimpleDateFormat("yyyy/MM/dd");
		Date date1 = new Date();
		ResultSet result = ps1.executeQuery();
		int admin=0;
		result.next();
		admin = result.getInt("isadmin");
		result = ps1.executeQuery();
		if(result.next() == false){
			out.print("Login Failed!");
		%>
		<script>
			loginerror();
		</script>
		<%
		}
		else{
			session.setAttribute("user", newusername);
			session.setAttribute("sessdate", datedate.format(date1));
			session.setAttribute("isAdmin", admin);
			if(admin==1){
				%>
				<script>
					loginsucess2();
				</script>
				<%	
			}
			else if(admin==2){
				%>
				<script>
					loginsucess3();
				</script>
				<%	
			}
			else{
		session.setAttribute("user", newusername);
		%>
		<script>
			loginsucess1();
		</script>
		<%		}
		}
		

	} catch (Exception ex) {
		out.print(ex);
		out.print("insert failed");
	}
%>

</body>
</html>