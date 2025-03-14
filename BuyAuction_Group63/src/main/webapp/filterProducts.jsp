<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="buyme.ApplicationDB" %>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Filter Items</title>
<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/dark.min.css">
</head>
<body>
	<button onclick="window.location.href='account.jsp';">Return to Homepage</button><br>

	<b> Search the list of items by various criteria </b>
	<br><b> Items in * are required </b><br><br>
	<form method="post" action="filterProductsHandler.jsp">
	<label for="category">*Category</label> <select name="category"
				id="category" required>
				<option value="" disabled selected hidden="true">Select
					category</option>
				<option value="Mechanical Watches">Mechanical Watches</option>
				<option value="Automatic Watches">Automatic Watches</option>
				<option value="Solar Watches">Solar Watches</option>
				<option value="Smart Watches">Smart Watches</option>
			</select> <br>
		<table>
		<tr>
				<td>Brand:</td>
				<td><input type="text" name="brand"></td>
			</tr>
			<tr>
				<td>Color:</td>
				<td><input type="text" name="color"></td>
			</tr>
			<tr>
				<td>Gender:</td>
				<td><input type="text" name="gender"></td>
			</tr>
			<tr>
				<td>Seller:</td>
				<td><input type="text" name="seller"></td>
			</tr>
			<tr>
				<td>Price less than:</td>
				<td><input type="text" name="price"></td>
			</tr>
		</table>
		<label for="status">*status</label> <select name="status"
				id="status" required >
				<option value="" disabled selected hidden="true">Select
					category</option>
				<option value="open">open</option>
				<option value="close">closed</option>
				<option value="both">both</option>
				
			</select> <br>
		<input type="submit" value="Search">
	</form>
</body>
</html>