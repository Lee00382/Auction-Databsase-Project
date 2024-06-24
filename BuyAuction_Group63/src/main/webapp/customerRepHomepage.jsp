<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Rep Home</title>
<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/dark.min.css">
</head>
<body>
	<button onclick="window.location.href='homepage.jsp';">Return to Homepage</button><br>
	<button onclick="window.location.href='logout.jsp';">Logout</button><br>

	<h2>Customer Representative Page</h2>
	<ul>
	<li><a href="answerQuestions.jsp">Reply to User Questions</a></li>	
	<li><a href="manageUsers.jsp">Manage User Accounts</a></li>	
	<li><a href="manageAuctionsCustomerRep.jsp">Remove Auctions</a></li>	
	<li><a href="logout.jsp">Logout</a></li>
	</ul>
</body>
</html>