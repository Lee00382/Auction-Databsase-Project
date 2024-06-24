<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Page</title>
<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/dark.min.css">
</head>
<body>
	<button onclick="window.location.href='homepage.jsp';">Return to Homepage</button><br>
	<button onclick="window.location.href='logout.jsp';">Logout</button><br>

	
	<h2>Admin Page Options</h2>
	<ul>
	<li><a href="createRepAccount.jsp">Create Customer Representative Account</a></li>
	<li><a href="manageCustomerRep.jsp">Manage Customer Representative Account</a></li>
	<li><a href="generateSalesReport.jsp">Sales Report</a></li>
	<li><a href="logout.jsp">Log out</a></li>
	</ul>
</body>
</html>
