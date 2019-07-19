<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Forum</title>
<script>

</script>
</head>
<body style="background-color:#f5f5f5">
<%      
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		
		Statement stmt = con.createStatement();
		String str = "SELECT * FROM Forum";
		PreparedStatement ps1 = con.prepareStatement(str);
		ResultSet result = ps1.executeQuery();
		%>
		
<h1>BuyMe!</h1>
<p>
	<a href=/cs336Final/home.jsp>Back to home page</a> 

</p>
<table border= "1">
		<tr>
			<th>Questions</th>
			<th></th>
			<th>Answer</th>
			<th></th>
		</tr>
		<%
		while(result.next() != false){
		%>
		<tr>
		<td><%out.print(result.getString("message"));%></td>
		
		<td><%out.print("Post by: "+result.getString("username"));%></td>
		<% if(result.getString("answer")== null){ %>
			<td><%out.print("No answer available");%></td>
		<% }
		else{ %>
			<td><%out.print("Answer: "+result.getString("answer"));%></td>
			<td><%out.print("By "+result.getString("answerby"));%></td>
		<%} %>
		
		</tr>
	
		<% 
		}%>
		</table>
		
	<!--  <form method="post" action="forum.jsp" style = "border: 1px solid rgba(118,118,118,0.1);
	">
	<h2>Post a question!</h2>
	<table>
	<tr>    
	
	<textarea name="paragraph_text" cols="88" rows="10" id="paragraph_text"></textarea>
	
	</tr>


	
	</table>
	<br>
	<input type="submit" value="submit">
	</form>
-->
	
		<div class="container">
		<div class="row">
		<div class="text-center col-md-4 col-md-offset-4">
		  	<div class="panel panel-primary">
				<div class="panel-heading">
				  <h3 class="panel-title">Post a question</h3>
				</div>
				<div class="panel-body text-center">
		  		<form action="forum_action.jsp" method="POST" class="form-horizontal" >
		  			
		  			
		  			<textarea class="form-control" placeholder="Message" cols="88" rows="10" name="message"></textarea>
		  			<input type="submit" class="btn btn-default" value="submit">
		  		</form>
		  		</div>
	  		</div>
	  		</div>
	    </div>
	</div>
	
</body>
</html>